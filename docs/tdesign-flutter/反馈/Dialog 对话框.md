# Dialog 对话框

> 模态对话框，用于确认操作、展示重要信息或收集用户输入。

> 来源：[Dialog 对话框](https://tdesign.tencent.com/flutter/components/dialog)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 确认对话框

```dart
// 单确认操作
Future<bool?> showConfirmDialog(BuildContext context) {
  return TDialog.show<bool>(
    context,
    dialog: const TConfirmDialog(
      title: '操作确认',
      content: '确认继续？',
      buttonText: '继续',
    ),
  );
}

// 多操作对话框
Future<Object?> showDialog(BuildContext context) {
  return TDialog.show<Object>(
    context,
    dialog: TDialog(
      title: const Text('删除确认'),
      content: const Text('删除后无法恢复，确认删除？'),
      actions: const [
        TDialogAction(child: Text('取消'), result: false),
        TDialogAction(child: Text('删除'), result: true, role: TDialogActionRole.destructive),
      ],
    ),
  );
}
```

### 带关闭按钮

```dart
TDialog(
  title: const Text('提示'),
  content: const Text('这是一条提示信息'),
  showCloseButton: true,
  closeButtonResult: false,
)
```

## TDialog

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| title | Widget? | - | 标题槽位，title 与 content 至少提供一个 | 否 |
| content | Widget? | - | 内容槽位 | 否 |
| actions | List<TDialogAction> | const <TDialogAction>[] | 操作列表；一到两个操作横向排列，更多纵向排列 | 否 |
| actionsWidget | Widget? | - | 完全自定义操作区，使用后 actions 必须为空 | 否 |
| actionsPadding | EdgeInsetsGeometry? | - | 操作区内边距 | 否 |
| actionSpacing | double? | - | 操作之间的间距 | 否 |
| showCloseButton | bool | false | 是否显示右上角关闭按钮 | 否 |
| closeButtonResult | Object? | - | 点击关闭按钮的返回值 | 否 |
| semanticLabel | String? | - | 无障碍语义标签 | 否 |

## TDialog.show

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文 | 是 |
| dialog | Widget | - | 要放入模态路由的弹窗内容 | 是 |
| barrierDismissible | bool | false | 点击蒙层是否关闭 | 否 |
| barrierResult | T? | - | 蒙层关闭时的返回值 | 否 |
| barrierColor | Color? | - | 蒙层颜色，为空时使用 Colors.black54 | 否 |
| useRootNavigator | bool | true | 是否将弹窗推入根 Navigator | 否 |
| useSafeArea | bool | true | 是否使用 SafeArea 避让系统区域 | 否 |

## TDialogAction

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget | - | 操作按钮内容 |
| result | Object? | - | 点击后返回的结果 | 否 |
| role | TDialogActionRole? | - | 操作角色（primary/destructive/secondary） |
| disabled | bool | false | 是否禁用 | 否 |

## TDialogActionRole

| 枚举值 | 说明 |
| --- | --- |
| primary | 主要操作 |
| destructive | 危险操作 |
| secondary | 次要操作 |

## TConfirmDialog

单确认操作的便捷组件。

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| title | String | - | 标题 |
| content | String | - | 内容 |
| buttonText | String | - | 确认按钮文字 |
| confirmCallback | VoidCallback? | - | 确认回调（已废弃，建议使用 TDialog.show 返回 Future） |

## 何时使用

用于需要用户确认的操作、重要信息提示或收集用户输入的场景。

## 相似组件

- [Toast 轻提示](<../反馈/Toast 轻提示.md>)：轻量级提示，无需用户确认。
- [ActionSheet 动作面板](<../反馈/ActionSheet 动作面板.md>)：底部弹出的操作面板。