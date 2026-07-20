# UI 组件

`core/ui/` 只放跨模块可复用的 UI 能力，例如 LoadingDialog、响应式辅助、Preview 注解和商品展示组件。模块专用卡片、业务区块留在 Feature `widgets/`；不要为了一个页面的私有布局上升到 core。

## LoadingDialog

```dart
/// 一次性操作期间展示全局 Loading，并确保结束时关闭。
Future<void> submit() async {
  LoadingDialog.show();
  try {
    // 执行异步提交。
    await repository.submit();
  } finally {
    // 成功、失败和取消路径均关闭 Loading，避免遮罩残留。
    LoadingDialog.hide();
  }
}
```

页面首次网络加载使用 `BaseNetworkView`，不应以全局 LoadingDialog 替代内容态。组件通过数据和回调进行通信，不能 `Get.find` 某个页面 Logic；需要主题时使用 `AppTheme.of(context)`。

## 关联阅读

- [Widget Preview](../扩展/widget-preview.md)
- [屏幕适配](../扩展/screen-adapt.md)
- [BaseDialog](./base-dialog.md)
