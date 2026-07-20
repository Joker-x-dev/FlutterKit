# 刷新父类

`BaseRefreshLogic<T>`、`BaseRefreshState` 与 `BaseRefreshView<T>` 位于 `lib/core/base/base_refresh/`。它针对「一份数据、可手动刷新」的场景：例如详情、个人资料和远端配置。它不维护页码、不追加列表，也不会在刷新时把整页重新切换到 loading。

## 与 BaseList 的区别

| 对比项 | BaseRefresh | BaseList |
| --- | --- | --- |
| 内容形态 | 一个详情或由多个 Widget 构成的页面 | 同类型可分页数据项 |
| 刷新操作 | 仅下拉刷新 | 下拉刷新与上拉加载 |
| 子类入口 | `pageContent()` | `itemWidget()` |
| 页码与无更多 | 不维护 | 父类维护 `currentPage`、`noMoreData` |
| 请求时整页状态 | `requestSetStatus: false` | `requestSetStatus: false` |

## API

| 成员 | 默认值 | 说明 |
| --- | --- | --- |
| `refreshState` | `BaseRefreshState` | `networkState` 的具体类型 getter |
| `easyRefreshController` | `controlFinishLoad: true` | EasyRefresh 控制器 |
| `refresh()` | `loadData()` | 下拉动作执行的一次新请求 |
| `pageContent(T controller)` | 必须实现 | 返回页面内容 Widget 列表 |

`BaseRefreshState` 将 `requestSetStatus` 设为 `false`，使下拉时保留已显示内容，由 EasyRefresh Header 表达刷新进行中状态。网络失败行为仍遵循 `BaseNetworkLogic`：失败页只会在当前页面没有保留成功状态时使用。

## 基于 BaseRefreshDemo 的完整示例

```dart
/// 可刷新的商品详情状态。
class BaseRefreshDemoState {
  /// 当前详情；请求成功后替换，页面通过 Obx 刷新内容。
  final Rxn<Goods> goods = Rxn<Goods>();
}

/// 商品详情刷新 Logic。
class BaseRefreshDemoLogic extends BaseRefreshLogic<Goods> {
  /// 详情页状态。
  final BaseRefreshDemoState state = BaseRefreshDemoState();

  @override
  Future<BaseResponse<Goods>> Function()? get apiRequest =>
      // 每次下拉都创建一条新的详情请求。
      () => GoodsRepository().getGoodsInfo(1);

  @override
  void requestOk(Goods data) {
    // 写入新数据后，已显示页面不会闪回全屏 loading。
    state.goods.value = data;
  }
}

/// 可下拉刷新的详情页。
class BaseRefreshDemoView extends BaseRefreshView<BaseRefreshDemoLogic> {
  BaseRefreshDemoView({super.key, super.logic});

  @override
  String? get navTitle => '下拉刷新';

  @override
  List<Widget> pageContent(BaseRefreshDemoLogic controller) {
    final Goods goods = controller.state.goods.value!;
    // BaseRefreshView 将列表包装为可滚动的 EasyRefresh 内容。
    return [GoodsDetailContent(goods: goods)];
  }
}
```

## 自定义内容与失败处理

`pageContent()` 返回的是 Widget 列表，父类通过项目的 `toListView()` 扩展构造可滚动内容。因此详情内容应返回多个独立区块，而不是自行嵌套竞争滚动手势的 `ListView`。需要自定义 header、padding 或内容承载方式时，重写 `bodyContent()`，仍复用 `refreshState.easyRefreshController` 与 `refresh()`。

## 注意事项

- 对于空数据需要显式调用 `setStatusEmpty()`，不要返回空数组来期待自动切空页。
- 预览应注入 Logic、写入 Preview Data 后 `setStatusSuccess()`，避免触发 `apiRequest`。
- 刷新接口有提交语义或需要防重时，在 Logic 内增加业务锁；不要在 View 禁用手势来规避重复请求。

## 关联阅读

- [BaseNetwork](./base-network.md)
- [BaseList](./base-list.md)
- [网络请求](./network.md)
