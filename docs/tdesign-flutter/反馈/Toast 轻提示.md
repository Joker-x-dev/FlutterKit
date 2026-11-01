# Toast 轻提示

> 轻量级反馈提示，用于展示操作结果或简短信息，自动消失。

> 来源：[Toast 轻提示](https://tdesign.tencent.com/flutter/components/toast)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 普通提示

```dart
// 显示后自动消失
TToast.show(
  context: context,
  text: '操作成功',
  duration: const Duration(seconds: 2),
);

// 带图标
TToast.show(
  context: context,
  text: '加载完成',
  icon: TIcons.check,
);
```

### 加载提示

```dart
// 持续加载提示
String loadingId = TToast.showLoading(
  context: context,
  text: '处理中...',
  duration: Duration.zero, // 不自动消失
  overlay: const TOverlayConfig(preventScrollThrough: true),
);

// 任务完成后关闭
TToast.dismissToast(loadingId);
```

### 成功/失败提示

```dart
TToast.showSuccess(context: context, text: '保存成功');
TToast.showError(context: context, text: '保存失败');
```

## TToast.show

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文（需位于 Navigator 子树中） | 是 |
| text | String | - | 提示文案 | 是 |
| duration | Duration | Duration(seconds: 2) | 显示时长，Duration.zero 表示不自动消失 | 否 |
| icon | Widget? | - | 提示图标 |
| overlay | TOverlayConfig? | - | 遮罩配置 |
| toastId | String? | - | 提示 ID，用于后续关闭；匿名提示会复用 ID |

## TToast.showLoading

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文 | 是 |
| text | String | - | 加载文案 |
| duration | Duration | Duration.zero | 默认不自动消失 |
| overlay | TOverlayConfig? | - | 遮罩配置 |

**返回值**：String（toastId），用于后续通过 TToast.dismissToast(id) 关闭。

## TOverlayConfig

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| preventScrollThrough | bool | false | 是否拦截底部滚动 |
| barrierColor | Color? | - | 遮罩颜色 |
| barrierDismissible | bool | true | 点击遮罩是否关闭 |

## 何时使用

用于短暂的操作反馈（成功/失败/加载中），不需要用户交互的场景。长时间提示建议使用 [Message 全局提示](<../反馈/Message 全局提示.md>)。

## 相似组件

- [Message 全局提示](<../反馈/Message 全局提示.md>)：可带操作按钮的持久提示。
- [Dialog 对话框](<../反馈/Dialog 对话框.md>)：需要用户确认时使用。