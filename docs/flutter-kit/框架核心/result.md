# 结果处理

`RequestHelper<T>` 位于 `lib/core/result/request_helper.dart`。它接收 Repository 返回的 `Future<BaseResponse<T>>`，把请求开始回调、可选 Loading、Toast / Dialog 错误反馈与错误回调放进同一条链路。它适合“由当前 Logic 手动控制状态的一次请求”；完整页面的四态加载仍由 `BaseNetworkLogic` 管理。

## 介绍

结果处理模块统一请求成功、业务失败、网络异常和可选提示行为，减少每个 Logic 重复写相同的响应判断。当前主要服务 `Future<BaseResponse<T>>` 的网络请求；数据库和键值存储直接返回业务结果，不进入 RequestHelper。

## 使用方式

```text
repository(Future<BaseResponse<T>>)
  → start / loading / toast / dialog / error 配置
  → execute() / response()
  ├─ 成功：返回 data 或完整 BaseResponse
  └─ 失败：error 回调 → 可选 Toast / Dialog → Future 错误

execute()  → 返回 Future<T?>
response() → 返回 Future<BaseResponse<T>>
```

`BaseResponse.isSucceeded` 由 `code == AppConfig.successCode` 判断。网络异常与业务失败都由 RequestHelper 统一触发错误回调与可选反馈，调用方在链尾承接 Future 错误即可。

## API

| 方法 | 参数 | 默认值 | 返回 | 作用 |
| --- | --- | --- | --- | --- |
| `repository<T>` | `Future<BaseResponse<T>> promise` | — | `RequestHelper<T>` | 创建一条不可复用的请求辅助对象 |
| `start` | `VoidCallback?` | `null` | `RequestHelper<T>` | 请求开始、Loading 展示前回调 |
| `loading` | `bool show` | `false` | `RequestHelper<T>` | 自动显示和关闭 `LoadingDialog` |
| `toast` | `bool show` | `false` | `RequestHelper<T>` | 失败时自动 Toast |
| `dialog` | `bool show` | `false` | `RequestHelper<T>` | 失败时自动 Dialog |
| `errorMsg` | `String? msg` | `null` | `RequestHelper<T>` | 覆盖业务失败与提示使用的文本 |
| `error` | `(String, dynamic) → void` | `null` | `RequestHelper<T>` | 取得格式化 message 和原始 error |
| `execute` | — | — | `Future<T?>` | 返回 `BaseResponse.data` |
| `response` | — | — | `Future<BaseResponse<T>>` | 返回完整响应，包括 `code`、`message`、`data` |

## 错误行为

`error()` 接收已处理的错误文案与原始异常对象，可用于更新页面状态或记录业务日志。它不会吞掉异常：`execute()` 和 `response()` 失败后仍以 Future 错误完成。

- `.toast(true)` / `.dialog(true)` 只负责自动反馈，不能替代 `catchError()`。
- `loading(true)` 的 Loading 会在请求结束后自动关闭，调用方无需手动关闭。

独立页面像 NetworkRequestDemo 一样在链尾使用 `catchError()` 承接错误；`BaseNetworkLogic` 则利用异常切换页面错误状态。

## 网络请求示例

当前 `NetworkRequestDemoLogic.request()` 同时保留按钮 loading、商品数据和错误文案，因此不启用 `RequestHelper.loading(true)`，避免全局弹窗与页面按钮状态重复。错误回调先保存 RequestHelper 已格式化的文案，外层再兜底捕获所有 `Object`，覆盖内部业务失败 `_BusinessFailure` 与其他未预期错误。

```dart
RequestHelper.repository<Goods>(_goodsRepository.getGoodsInfo(1))
    // 接收统一格式化后的错误文案。
    .error((message, error) { /* 更新错误展示状态 */ })
    // 执行请求并取得 BaseResponse.data。
    .execute()
    // 处理成功数据。
    .then((data) { /* 保存页面结果 */ })
    // RequestHelper 已处理错误提示；承接 rethrow。
    .catchError((error) { /* 结束当前错误链 */ })
    // 成功或失败后恢复页面 loading。
    .whenComplete(() { /* 恢复交互状态 */ });
```

`execute()` 返回 `Future<T?>`，成功数据可能为空；`error()` 不会吞掉异常，独立页面需要像 README 推荐用法一样在链尾使用 `catchError()` 明确承接。完整字段更新和 loading 管理请查看 `NetworkRequestDemoLogic`。

## Loading、Toast 与 Dialog

适用于不需要页面局部 loading 的一次性操作。调用 `.loading(true)` 后，RequestHelper 自动展示并关闭全局 Loading；不要同时维护同一操作的页面 loading，也不要手动调用 `LoadingDialog.hide()`。

```dart
RequestHelper.repository<Goods>(_goodsRepository.getGoodsInfo(1))
    // 请求期间自动显示和关闭全局 Loading。
    .loading(true)
    // 失败时自动展示 Toast。
    .toast(true)
    // 需要对话框反馈时使用；通常与 Toast 二选一。
    // .dialog(true)
    // 需要统一替换失败文案时设置。
    // .errorMsg('获取数据失败，请稍后重试')
    .execute()
    // 处理成功结果。
    .then((data) { /* 处理结果 */ })
    // 自动反馈完成后承接 Future 错误。
    .catchError((error) { /* 处理额外业务 */ });
```

`toast` 和 `dialog` 均为 `false` 默认值；当前实现允许两者同时开启，但同一失败同时出现两个反馈通常没有必要，业务页面应明确选择一种。`start()` 仅用于请求前的轻量准备，不应再用它维护与 `loading(true)` 重复的 loading 状态。

## `execute()` 与 `response()`

```dart
/// 只需要业务实体时使用 execute。
Future<Goods?> loadGoods() {
  return RequestHelper.repository<Goods>(
    GoodsRepository().getGoodsInfo(1),
  ).execute();
}

/// 需要读取完整业务 code、message 或 data 时使用 response。
Future<BaseResponse<Goods>> loadGoodsResponse() {
  return RequestHelper.repository<Goods>(
    GoodsRepository().getGoodsInfo(1),
  ).response();
}
```

注意：`response()` 只在 `isSucceeded == true` 时返回完整响应；失败响应仍会触发错误回调并抛异常，不是用于绕开失败处理的 API。

## 使用提示

- 首屏详情、错误页、空数据和重试：使用 `BaseNetworkLogic` / `BaseNetworkView`。
- 分页与下拉加载：使用 `BaseListLogic`。
- 局部提交、删除、手动网络 Demo：使用 RequestHelper。
- 本地数据库和存储操作不返回 `BaseResponse<T>`，不应强套 RequestHelper。

## 关联阅读

- [网络请求](./network.md)
- [BaseNetwork](./base-network.md)
- [NetworkRequestDemoLogic](../业务功能/logic.md)
