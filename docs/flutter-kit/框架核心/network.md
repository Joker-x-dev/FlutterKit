# 网络请求

网络模块位于 `lib/core/network/`，由 `DioProvider`、HTTP 拦截器、调试拦截器和按业务域拆分的 DataSource 构成。它只负责协议、接口与传输错误；Feature 通过 `core/data` 的 Repository 访问网络，不能直接在 View 或 Logic 创建 Dio 和 Retrofit 实现。

## 介绍

网络请求模块统一管理接口调用与拦截器配置，对外由 DataSource 提供业务协议。业务层不直接依赖 `core/network`：Logic 通过数据层的 Repository 发起请求，Repository 再依赖 DataSource。这样替换底层客户端、调整 URL 或补充缓存策略时，不会扩散到 Feature。

## 模块结构

```text
core/network/
├── provider/dio_provider.dart              # Dio 单例和基础配置
├── interceptor/interceptor.dart            # HTTP 与业务状态码拦截
├── debug/network_debug_tools.dart           # Debug 模式网络面板与日志
├── exception/error_exception.dart           # 网络错误转换
└── datasource/<domain>/
    ├── <domain>_network_data_source.dart    # 业务接口契约
    └── <domain>_network_data_source_impl.dart # Retrofit 声明与生成类
```

## DioProvider（网络客户端）

文件：`lib/core/network/provider/dio_provider.dart`

| 配置 | 当前值 / 来源 | 含义 |
| --- | --- | --- |
| 单例 | `DioProvider()` | 整个应用复用同一 Dio |
| `baseUrl` | `Env.baseUrl` | 环境配置提供的接口根地址 |
| 连接超时 | 10 秒 | `connectTimeout` |
| 接收超时 | 10 秒 | `receiveTimeout` |
| 请求头 | JSON Content-Type、Accept | 默认 JSON 协议 |
| 拦截器 | `HttpInterceptor`、`NetworkDebugTools.interceptors` | 正常错误处理与 Debug 调试 |

```dart
/// 创建项目唯一的 Dio 配置。
static Dio _createDio() {
  return Dio()
    // 先处理 HTTP 与业务状态码。
    ..interceptors.add(HttpInterceptor())
    // Debug 模式追加 Alice、PrettyDioLogger；Release 返回空列表。
    ..interceptors.addAll(NetworkDebugTools.interceptors)
    ..options = BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
}
```

## 拦截器

### HTTP 与业务错误拦截

`HttpInterceptor` 对 HTTP 非 200 响应和响应 JSON 内的业务错误码调用 `handler.reject(DioException(...))`。这意味着 Retrofit Future 会以异常完成，随后由 `RequestHelper`、`BaseNetworkLogic` 或业务 `try / catch` 统一处理。业务成功码来自 `AppConfig.successCode`。

文件：`lib/core/network/interceptor/interceptor.dart`

```dart
/// 响应拦截：正常结果继续传递，异常结果转换为 DioException。
@override
void onResponse(
  Response<dynamic> response,
  ResponseInterceptorHandler handler,
) {
  // 同时检查 HTTP 状态和业务 code。
  final BaseError? error = _handleResponse(response);
  if (error != null) {
    LogUtil.e('错误代码: ${error.code}, 错误信息: ${error.message}');
    handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: error,
      ),
    );
    return;
  }
  handler.next(response);
}
```

`_handleResponse()` 对 `statusCode != 200` 使用 `CustomErrorHandler` 转换；对 Map 响应读取业务 code，非 `AppConfig.successCode` 同样视为错误。401 已预留认证失效处理位置，但当前代码不在拦截器内直接跳转登录页。

### Debug 日志与网络面板

Debug 模式下 `NetworkDebugTools` 注入 Alice 与 `PrettyDioLogger`；Release 返回空拦截器列表，调试工具不参与正式请求。`NetworkDebugTools.initialize()` 必须在 `GetMaterialApp` 构建前由启动过程调用。

## 数据源接口与实现

### 商品 DataSource 接口

文件：`lib/core/network/datasource/goods/goods_network_data_source.dart`

```dart
/// 商品网络接口契约。
abstract class GoodsNetworkDataSource {
  /// POST 分页查询，参数是明确的请求模型。
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  );

  /// GET 查询商品详情，id 通过 Query 传递。
  Future<BaseResponse<Goods>> getGoodsInfo(int id);
}
```

### 商品 Retrofit 实现

文件：`lib/core/network/datasource/goods/goods_network_data_source_impl.dart`

```dart
/// 商品 Retrofit 数据源声明；具体实现由 build_runner 生成。
@RestApi(baseUrl: 'goods/info')
abstract class GoodsNetworkDataSourceImpl implements GoodsNetworkDataSource {
  /// 传入共享 Dio，baseUrl 可由 Retrofit 生成类覆盖。
  factory GoodsNetworkDataSourceImpl(Dio dio, {String baseUrl}) =
      _GoodsNetworkDataSourceImpl;

  /// 商品分页接口，request 序列化为 HTTP Body。
  @POST('/page')
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    @Body() GoodsSearchRequest request,
  );

  /// 商品详情接口，id 序列化为 URL Query。
  @GET('/info')
  Future<BaseResponse<Goods>> getGoodsInfo(@Query('id') int id);
}
```

`part 'goods_network_data_source_impl.g.dart'` 对应生成文件，不能手工编辑。变更 `@RestApi`、HTTP 注解、参数、返回模型或 `@JsonSerializable` 模型后运行 build_runner。

## 仓库示例

文件：`lib/core/data/repository/goods_repository.dart`

```dart
/// 商品仓库是网络模块对 Feature 暴露的唯一入口。
class GoodsRepository {
  /// 面向接口的依赖，便于单测传入 fake 数据源。
  final GoodsNetworkDataSource _dataSource;

  /// 默认创建 Retrofit 数据源；测试可传入自定义 DataSource。
  GoodsRepository({GoodsNetworkDataSource? dataSource})
      : _dataSource =
            dataSource ?? GoodsNetworkDataSourceImpl(DioProvider().dio);

  /// 转发分页业务请求，不向上层暴露 HTTP 注解与 URL。
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) => _dataSource.getGoodsPage(request);

  /// 转发商品详情请求。
  Future<BaseResponse<Goods>> getGoodsInfo(int id) =>
      _dataSource.getGoodsInfo(id);
}
```

## Logic 使用示例

```dart
/// 网络详情 Logic 只依赖仓库，并将请求交给网络父类。
class NetworkDemoLogic extends BaseNetworkLogic<Goods> {
  /// 页面自己的展示状态。
  final NetworkDemoState networkDemoState = NetworkDemoState();

  @override
  Future<BaseResponse<Goods>> Function()? get apiRequest =>
      // 父类在 initData / 重试时调用这个函数创建新请求。
      () => GoodsRepository().getGoodsInfo(1);

  @override
  void requestOk(Goods data) {
    // 成功数据写入 State，View 通过 Obx 订阅。
    networkDemoState.goods.value = data;
  }
}
```

### 分页 POST 使用示例

文件：`lib/feature/demo/logics/network_list_demo_logic.dart`

```dart
/// 分页列表 Logic 将父类页码转换为明确请求模型。
class NetworkListDemoLogic extends BaseListLogic<Goods> {
  @override
  void onInit() {
    // 父类生成 pageParams 前设置单页大小。
    listState.pageSize = 15;
    super.onInit();
  }

  @override
  Future<BaseResponse<BaseListResponse<Goods>>> Function()? get apiRequest =>
      () => GoodsRepository().getGoodsPage(
        // Retrofit 的 @Body 接收 GoodsSearchRequest。
        GoodsSearchRequest(
          page: listState.currentPage,
          size: listState.pageSize,
        ),
      );
}
```

## 与数据层的关系

- 网络模块负责客户端、拦截器和 DataSource，不向 Feature 直接暴露调用入口。
- Repository 负责对上提供 `getGoodsInfo`、`getGoodsPage` 这类业务方法。
- Logic 根据页面形态选择 BaseNetwork、BaseList、BaseRefresh 或 RequestHelper，不能直接发 Dio 请求。

## 如何新增接口

1. 在 `core/model/request`、`entity`、`response` 定义明确参数与响应模型。
2. 在 `core/network/datasource/<domain>/` 定义 DataSource 抽象契约。
3. 新增 Retrofit 实现声明，并使用共享 `DioProvider().dio`。
4. 在 `core/data/repository/` 新增或扩展业务 Repository。
5. 根据页面类型在 Logic 使用 RequestHelper、BaseNetwork、BaseList 或 BaseRefresh。
6. 执行 `dart run build_runner build --delete-conflicting-outputs` 并补充测试。

## 注意事项

- Feature 不直接调用 `DioProvider` 或 Retrofit 实现；网络模块不直接操作页面状态。
- 不要用 HTTP 200 判断业务成功，业务码由拦截器和 `BaseResponse.isSucceeded` 统一判断。
- 日志不能记录 token、密码和敏感个人数据，即使只在 Debug 模式也要审查输出。

## 关联阅读

- [数据层](./data.md)
- [结果处理](./result.md)
- [BaseNetwork](./base-network.md)
