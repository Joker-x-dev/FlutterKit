# 数据层

`lib/core/data/` 的职责是向 Logic 提供统一、业务语义化的数据入口。上层只依赖 Repository；Repository 根据业务组合网络 DataSource、数据库 DataSource 或本地存储 DataSource。View 不进入数据层，Logic 也不直接 import 具体 DataSource 实现。

## 介绍

数据层用 Repository 作为唯一业务入口。上层无需知道数据来自 Retrofit、sqflite 还是键值存储，也不需要知道数据源实现类的创建方式；这些变化收敛在 Repository 内部。Repository 以当前项目的 `GoodsRepository`、`DemoRepository` 和各种 `*StoreRepository` 为实际实现，而不是额外的空抽象层。

## 模块职责

```text
Feature View
  → Feature Logic
    → core/data/Repository
      → core/network / core/database / core/datastore DataSource
        → Dio / sqflite / StorageUtil
```

Repository 并不等同于“给每个 DataSource 再写一层空转发”。它的价值在于固定业务入口、允许构造函数注入 fake、隐藏实现细节，并在一个业务需要多数据源或缓存策略时成为唯一的组合位置。

## 使用示例

### Logic 调用 Repository

文件：`lib/feature/demo/logics/network_demo_logic.dart`

```dart
/// 网络详情 Logic 通过 Repository 获取商品，而非直接引用 Retrofit 实现。
class NetworkDemoLogic extends BaseNetworkLogic<Goods> {
  /// 页面自己的商品状态。
  final NetworkDemoState networkDemoState = NetworkDemoState();

  @override
  Future<BaseResponse<Goods>> Function()? get apiRequest =>
      // 父类保留请求函数，在首次加载和重试时重复调用。
      () => GoodsRepository().getGoodsInfo(1);

  @override
  void requestOk(Goods data) {
    // Repository 返回的业务实体写入页面状态。
    networkDemoState.goods.value = data;
  }
}
```

### 商品仓库

文件：`lib/core/data/repository/goods_repository.dart`

```dart
/// 商品数据仓库，向业务 Logic 隐藏 Retrofit 数据源实现。
class GoodsRepository {
  /// 依赖接口而不是实现，便于测试替换。
  final GoodsNetworkDataSource _dataSource;

  /// 创建商品仓库。
  GoodsRepository({GoodsNetworkDataSource? dataSource})
      // 正式运行使用 DioProvider 创建的 Retrofit 实现。
      : _dataSource =
            dataSource ?? GoodsNetworkDataSourceImpl(DioProvider().dio);

  /// 查询商品分页数据。
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) {
    return _dataSource.getGoodsPage(request);
  }

  /// 查询指定商品详情。
  Future<BaseResponse<Goods>> getGoodsInfo(int id) {
    return _dataSource.getGoodsInfo(id);
  }
}
```

`NetworkListDemoLogic` 只创建 `GoodsSearchRequest(page:, size:)` 并调用 `GoodsRepository.getGoodsPage()`；网络 URL、HTTP method、Dio 和 Retrofit 生成类均不会进入 Demo Logic。

## 三类仓库

| 数据来源 | 当前仓库示例 | 下层依赖 | 上层返回 |
| --- | --- | --- | --- |
| 网络 | `GoodsRepository`、`AuthRepository`、`UserRepository` | Network DataSource | `Future<BaseResponse<T>>` |
| 数据库 | `DemoRepository` | `DemoLocalDataSource` | Entity、列表、主键、`void` |
| 键值存储 | `TokenStoreRepository`、`AccountStoreRepository`、`ThemeStoreRepository`、`UserInfoStoreRepository` | Store DataSource | 业务值、`void` |

网络仓库返回统一响应包装，交由 [RequestHelper](./result.md) 或网络父类处理；数据库和存储仓库直接返回业务结果，不应伪造 `BaseResponse`。

## 当前 Repository 对照

| Repository | 下层 DataSource | 对上职责 |
| --- | --- | --- |
| `GoodsRepository` | `GoodsNetworkDataSource` | 商品详情与商品分页 |
| `AuthRepository` | `AuthNetworkDataSource` | 认证网络请求 |
| `UserRepository` | `UserNetworkDataSource` | 用户网络请求 |
| `DemoRepository` | `DemoLocalDataSource` | Demo 表 CRUD |
| `TokenStoreRepository` | `TokenStoreDataSource` | Token 保存、恢复、清理 |
| `AccountStoreRepository` | `AccountStoreDataSource` | 账号密码读写 |
| `AuthStoreRepository` | `AuthStoreDataSource` | 认证信息持久化 |
| `UserInfoStoreRepository` | `UserInfoStoreDataSource` | 用户 JSON 缓存 |
| `LocaleStoreRepository` | `LocaleStoreDataSource` | 语言标签持久化 |
| `ThemeStoreRepository` | `ThemeStoreDataSource` | 主题颜色与模式持久化 |

仓库文件均位于 `lib/core/data/repository/`。新增业务数据时应先检查表中是否已有合适领域仓库，避免同一份数据被不同 Repository 各自维护。

## 数据源组合

一个 Repository 可以聚合网络、数据库和存储来源；组合策略必须位于 Repository，而不能分散在多个 Logic。例如“先读用户缓存、再请求远端并回写缓存”的策略应新增明确的 Repository 方法和测试。当前仓库中，网络、数据库和存储的实际入口分别是 `GoodsRepository`、`DemoRepository`、`UserInfoStoreRepository` 等；没有实现的组合仓库不在文档中伪造为可直接使用的 API。

## 如何新增仓库

1. 明确数据属于网络、数据库、存储或多来源组合，并先定义下层 DataSource 契约。
2. 在 `core/data/repository/` 新建 `<domain>_repository.dart`，构造函数接收可选或必需的抽象数据源。
3. 对外使用 `getGoodsInfo`、`saveUserInfo` 这类业务名，避免暴露 `get`、`post`、表名、key。
4. Logic 只改为依赖 Repository；Feature 不引入具体 DataSource 实现。
5. 为构造注入的 fake 编写 Repository 单测，验证转发和组合策略。

## Preview Data 的边界

`core/data/preview/` 放跨页面、跨组件可用的稳定预览实体，例如 `goods_preview_data.dart`。单个页面专用的静态状态留在该页面 State 或相邻文件；不要以“预览数据”名义把 Feature 私有内容搬进 core。

## 注意事项

- Repository 不能返回 `Widget`、操作 `Obx` 或调用 Toast；这些职责属于上层 Logic / View。
- DataSource 实现变化时，保持 Repository 对外方法稳定，避免 Feature 被底层技术替换牵连。
- Repository 默认构造正式实现是项目现状；测试优先经构造参数注入 fake，而非在测试中替换全局 Dio。

## 关联阅读

- [网络请求](./network.md)
- [数据库](./database.md)
- [本地存储](./datastore.md)
- [数据模型](./model.md)
