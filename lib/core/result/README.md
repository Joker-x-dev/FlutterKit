# API 请求处理器

`RequestHelper` 是一个链式网络请求辅助类，用于统一处理请求生命周期（loading、toast、错误提示）并返回数据或完整响应。

## 主要功能

1. 统一的请求状态处理
   - 请求开始（start）
   - 请求成功（execute / response）
   - 请求错误（error / toast / dialog）

2. 自动的错误处理
   - 支持错误 Toast 提示
   - 支持错误对话框
   - 支持自定义错误信息
   - 网络异常捕获
   - 业务错误处理

3. 类型安全
   - 泛型支持
   - 基于 `BaseResponse` 的响应封装

4. 加载状态管理
   - 自动显示/隐藏加载对话框
   - 可配置是否显示加载对话框
   - 统一的加载对话框样式

## 使用方法

### 推荐用法

从 Repository 获取请求并链式配置：

```dart
await RequestHelper.repository<Goods>(
  Get.find<GoodsRepository>().getGoodsInfo(1),
)
  .loading(true)
  .toast(true)
  .execute()
  .then((data) {
    // 处理成功数据
  })
  .catchError((e) {
    // 错误已被自动提示，可在此处做额外处理
  });
```

默认不显示 loading 与 toast，按需调用 `.loading(true)` / `.toast(true)` 开启。

### 返回完整响应

如果需要完整的 `BaseResponse`，使用 `.response()`：

```dart
final response = await RequestHelper.repository<Goods>(
  Get.find<GoodsRepository>().getGoodsInfo(1),
)
  .loading(true)
  .response();

if (response.isSucceeded) {
  // 处理 response.data
}
```

### 完整配置

```dart
await RequestHelper.repository<Goods>(
  Get.find<GoodsRepository>().getGoodsInfo(1),
)
  .loading(true)
  .toast(true)
  .dialog(false)
  .errorMsg('获取数据失败，请稍后重试')
  .start(() {
    // 请求开始前的回调
  })
  .error((message, error) {
    // 自定义错误处理
  })
  .execute();
```

## 注意事项

1. 错误处理
   - `.toast(true)` 失败时自动弹出 Toast
   - `.dialog(true)` 失败时自动弹出对话框
   - `.errorMsg(...)` 可自定义失败提示文本
   - 业务错误码通过 `BaseResponse.isSucceeded` 判断

2. 类型安全
   - 需要确保请求返回类型为 `BaseResponse<T>`
   - 泛型 `T` 应与 API 返回的数据类型匹配

3. 生命周期
   - `.start(...)` 在请求发起前调用
   - `.execute()` 成功时返回 `BaseResponse.data`
   - `.response()` 成功时返回完整 `BaseResponse`
   - 失败时抛出异常，可由外层 `catchError` 捕获

4. 加载对话框
   - `.loading(true)` 时请求期间显示 loading
   - 请求结束后自动关闭
   - 加载对话框不可手动关闭，避免用户误操作

## 最佳实践

1. 在 Logic 中使用：

```dart
class MyLogic extends BaseNetworkLogic<Goods> {
  @override
  Future<BaseResponse<Goods>>? get apiRequest =>
      Get.find<GoodsRepository>().getGoodsInfo(1);

  @override
  void onReady() {
    loadData();
  }
}
```

2. 自定义错误处理：

```dart
await RequestHelper.repository<Goods>(
  Get.find<GoodsRepository>().getGoodsInfo(1),
)
  .loading(true)
  .toast(true)
  .error((message, error) {
    logError(error);
  })
  .execute();
```

## 与 Retrofit 配合使用

`RequestHelper` 接收的是 `Future<BaseResponse<T>>`，因此数据源实现只需返回 `BaseResponse<T>` 即可：

```dart
@RestApi(baseUrl: 'data')
abstract class MyNetworkDataSourceImpl implements MyNetworkDataSource {
  factory MyNetworkDataSourceImpl(Dio dio, {String baseUrl}) =
      _MyNetworkDataSourceImpl;

  @GET('/list')
  Future<BaseResponse<MyData>> getData();
}
```

上层通过 Repository 调用：

```dart
class MyRepository {
  final MyNetworkDataSource _dataSource;

  MyRepository({MyNetworkDataSource? dataSource})
      : _dataSource = dataSource ?? Get.find<MyNetworkDataSource>();

  Future<BaseResponse<MyData>> getData() => _dataSource.getData();
}
```

## 错误码处理

成功状态由 `BaseResponse.isSucceeded` 判断：

```dart
final response = await RequestHelper.repository<MyData>(
  Get.find<MyRepository>().getData(),
).response();

if (response.isSucceeded) {
  final data = response.data;
  if (data != null) {
    // 处理数据
  } else {
    // 处理空数据情况
  }
}
```
