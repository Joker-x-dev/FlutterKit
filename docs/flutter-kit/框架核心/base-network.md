# 网络父类

`BaseNetworkLogic<T>`、`BaseNetworkState` 与 `BaseNetworkView<T>` 位于 `lib/core/base/base_network/`。这组父类把一次页面级请求的四种展示状态统一为 `loading`、`error`、`emptyData` 和 `dataSuccess`，适合详情、配置、单个表单初始化等场景。

## 状态机与请求链路

```text
initData()
  → loadData()
  → RequestHelper.repository(apiRequest())
  → start(beforeRequest) → toast → error → execute
  ├─ 成功：setStatusSuccess() → requestOk(data)
  └─ 失败：记录格式化错误 → setStatusError() → onRequestError()

BaseNetworkView.commonView()
  → Obx 监听 uiState
  → loading / error / emptyData / dataSuccess
```

失败页与空页由 `TDEmpty` 统一提供重新加载操作；默认有 `FadeThroughTransition` 状态切换动画。

## BaseNetworkState API

| 参数或字段 | 默认值 | 说明 |
| --- | --- | --- |
| `uiState` | `NetState.loading` | 当前网络展示状态，使用 `Rx` 自动驱动 View |
| `requestErrorToast` | `true` | `RequestHelper` 失败时是否显示 Toast |
| `firstLoad` | `true` | 初次 `initData()` 是否自动执行请求 |
| `requestSetStatus` | `true` | 每次请求前是否先置为 loading；列表/刷新会关闭它 |
| `NetState.loading` | — | 展示 `TDLoading` |
| `NetState.error` | — | 展示错误缺省页与重试按钮 |
| `NetState.emptyData` | — | 展示空数据缺省页 |
| `NetState.dataSuccess` | — | 调用 `bodyContent()` |

## BaseNetworkLogic API

| 重写点或方法 | 调用时机 | 作用 |
| --- | --- | --- |
| `apiRequest` | `loadData()` | 返回 `Future<BaseResponse<T>>` 的请求函数；`null` 表示没有请求 |
| `beforeRequest()` | 请求开始 | 准备请求参数或局部状态 |
| `requestOk(T data)` | 请求成功 | 保存业务数据、必要时调用 `setStatusEmpty()` |
| `requestError()` | 默认失败处理 | 无参数的简化失败钩子 |
| `onRequestError(message, error)` | 请求失败 | 获取格式化错误与原始异常；默认调用 `requestError()` |
| `loadData()` | 手动加载或首屏加载 | 执行 `RequestHelper` 链路 |
| `setStatusLoad/Error/Success/Empty()` | 业务决定状态时 | 显式切换 `uiState` |

## BaseNetworkView API

| 重写点 | 默认行为 | 用途 |
| --- | --- | --- |
| `bodyContent(T controller)` | 必须实现 | `dataSuccess` 时的内容 |
| `loadWidget()` | 大号 `TDLoading` | 自定义加载页 |
| `emptyWidget()` | 默认空数据 `TDEmpty` | 自定义空数据页 |
| `failWidget(T controller)` | 默认错误 `TDEmpty` | 自定义错误页 |
| `showAnimation` | `true` | 关闭状态切换动画 |

## 基于 NetworkDemo 的完整示例

```dart
/// 商品详情页面的展示状态。
class NetworkDemoState {
  /// 请求成功后保存商品；初始值为空，避免 View 在加载中访问空对象。
  final Rxn<Goods> goods = Rxn<Goods>();
}

/// 单条商品详情请求 Logic。
class NetworkDemoLogic extends BaseNetworkLogic<Goods> {
  /// 页面展示状态。
  final NetworkDemoState state = NetworkDemoState();

  /// BaseNetworkLogic 在 initData 中调用该请求。
  @override
  Future<BaseResponse<Goods>> Function()? get apiRequest =>
      () => GoodsRepository().getGoodsInfo(1);

  /// 请求成功后写入 State；父类随后会让页面进入 dataSuccess。
  @override
  void requestOk(Goods data) {
    state.goods.value = data;
  }
}

/// 商品详情 View，只描述成功状态下的布局。
class NetworkDemoView extends BaseNetworkView<NetworkDemoLogic> {
  NetworkDemoView({super.key, super.logic});

  @override
  String? get navTitle => '网络请求';

  @override
  Widget bodyContent(NetworkDemoLogic controller) {
    return Obx(() {
      // 仅在 dataSuccess 后读取数据；业务可按自身约束处理空值。
      final Goods goods = controller.state.goods.value!;
      return GoodsDetailContent(goods: goods);
    });
  }
}
```

## 空数据与重试

接口成功但业务列表为空时，Logic 应明确调用 `setStatusEmpty()`；不要把空数据当成网络异常。失败页内置的操作按钮会依次执行 `controller.loadData()` 与 `controller.setStatusLoad()`，因此无需在 View 中再实现一次重试逻辑。

## 注意事项

- `apiRequest` 返回的是函数，不是已执行的 Future，确保每次重试都会产生新请求。
- `requestOk()` 的调用发生在 `setStatusSuccess()` 之后；若需要展示空页面，在 `requestOk()` 中调用 `setStatusEmpty()` 覆盖成功状态。
- 列表和刷新页面不应直接继承此 View 来手写 `EasyRefresh`，应使用 [BaseList](./base-list.md) 或 [BaseRefresh](./base-refresh.md)。

## 关联阅读

- [网络请求](./network.md)
- [结果处理](./result.md)
- [BaseList](./base-list.md)
