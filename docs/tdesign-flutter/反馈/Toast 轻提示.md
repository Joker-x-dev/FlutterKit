# Toast 轻提示

> 用于轻量级反馈或提示，不会打断用户操作。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/toast)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_toast_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_toast_page.dart)

#### 1 组件类型

纯文字

```
  Widget _textToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showText('轻提示文字内容', context: context);
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '纯文字',
    );
  }
```

多行文字

```
  Widget _multipleToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showText('最多一行展示十个汉字宽度限制最多不超过三行文字', context: context);
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '多行文字',
    );
  }
```

带横向图标

```
  Widget _horizontalIconToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showIconText(
          '带横向图标',
          icon: TDIcons.check_circle,
          context: context,
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '带横向图标',
    );
  }
```

带竖向图标

```
  Widget _verticalIconToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showIconText(
          '带竖向图标',
          icon: TDIcons.check_circle,
          direction: IconTextDirection.vertical,
          context: context,
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '带竖向图标',
    );
  }
```

加载状态

```
  Widget _loadingToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showLoading(context: context);
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '加载状态',
    );
  }
```

加载状态自定义

```
  Widget _loadingCustomToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showLoading(
          context: context,
          customWidget: Container(
            width: 50,
            height: 20,
            child: const TDText('自定义加载'),
            color: TDTheme.of(context).brandColor1,
          ),
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '加载状态',
    );
  }
```

加载状态(无文字)

```
  Widget _loadingWithoutTextToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showLoadingWithoutText(context: context);
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '加载状态（无文案）',
    );
  }
```

停止加载

```
  Widget _dismissLoadingToast(BuildContext context) {
    return const TDButton(
      onTap: TDToast.dismissLoading,
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '停止加载',
    );
  }
```

自定义纯文字

```
  Widget _textCustomToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showText(
          '自定义纯文字',
          context: context,
          customWidget: Container(
            width: 50,
            height: 20,
            child: const TDText('自定义纯文字'),
            color: TDTheme.of(context).brandClickColor,
          ),
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '纯文字',
    );
  }
```

#### 1 组件状态

成功提示

```
  Widget _successToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showSuccess('成功文案', context: context);
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '成功提示',
    );
  }
```

成功提示(竖向)

```
  Widget _successVerticalToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showSuccess(
          '成功文案',
          direction: IconTextDirection.vertical,
          context: context,
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '成功提示(竖向)',
    );
  }
```

警告提示

```
  Widget _warningToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showWarning(
          '警告文案',
          direction: IconTextDirection.horizontal,
          context: context,
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '警告提示',
    );
  }
```

警告提示(竖向)

```
  Widget _warningVerticalToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showWarning(
          '警告文案',
          direction: IconTextDirection.vertical,
          context: context,
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '警告提示(竖向)',
    );
  }
```

失败提示

```
  Widget _failToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showFail(
          '失败文案',
          direction: IconTextDirection.horizontal,
          context: context,
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '失败提示',
    );
  }
```

失败提示(竖向)

```
  Widget _failVerticalToast(BuildContext context) {
    return TDButton(
      onTap: () {
        TDToast.showFail(
          '失败文案',
          direction: IconTextDirection.vertical,
          context: context,
        );
      },
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      isBlock: true,
      text: '失败提示(竖向)',
    );
  }
```

## API

1. [TDToast](#tdtoast)

#### TDToast

##### 静态方法

| 名称 | 返回类型 | 说明 |
| --- | --- | --- |
| `dismissAll` | `void` | 关闭所有Toast。 |
| `dismissLoading` | `void` | 关闭加载Toast（向后兼容）。 |
| `dismissToast` | `void` | 关闭指定的Toast。 |
| `showFail` | `String` | 失败提示Toast。 |
| `showIconText` | `String` | 带图标的Toast。 |
| `showLoading` | `String` | 带文案的加载Toast。 |
| `showLoadingWithoutText` | `String` | 不带文案的加载Toast。 |
| `showSuccess` | `String` | 成功提示Toast。 |
| `showText` | `String` | 普通文本Toast。 |
| `showWarning` | `String` | 警告Toast。 |

###### `dismissAll`

关闭所有Toast。

```dart
static void dismissAll();
```

###### `dismissLoading`

关闭加载Toast（向后兼容）。

```dart
static void dismissLoading();
```

###### `dismissToast`

关闭指定的Toast。

```dart
static void dismissToast(String toastId);
```

###### `showFail`

失败提示Toast。

```dart
static String showFail(
  String? text, {
  IconTextDirection direction = IconTextDirection.horizontal,
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 3000),
  bool? preventTap,
  Color? backgroundColor,
  int? maxLines,
  TextStyle? textStyle,
  double? iconSize,
  Color? iconColor,
  String? toastId,
});
```

###### `showIconText`

带图标的Toast。

```dart
static String showIconText(
  String? text, {
  IconData? icon,
  IconTextDirection direction = IconTextDirection.horizontal,
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 3000),
  bool? preventTap,
  Color? backgroundColor,
  int? maxLines,
  TextStyle? textStyle,
  double? iconSize,
  Color? iconColor,
  String? toastId,
});
```

###### `showLoading`

带文案的加载Toast。

```dart
static String showLoading({
  required BuildContext context,
  String? text,
  Duration duration = const Duration(seconds: 99999999),
  bool? preventTap,
  Widget? customWidget,
  Color? backgroundColor,
  TextStyle? textStyle,
  double? iconSize,
  Color? iconColor,
  String? toastId,
});
```

###### `showLoadingWithoutText`

不带文案的加载Toast。

```dart
static String showLoadingWithoutText({
  required BuildContext context,
  Duration duration = const Duration(seconds: 99999999),
  bool? preventTap,
  Color? backgroundColor,
  double? iconSize,
  Color? iconColor,
  String? toastId,
});
```

###### `showSuccess`

成功提示Toast。

```dart
static String showSuccess(
  String? text, {
  IconTextDirection direction = IconTextDirection.horizontal,
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 3000),
  bool? preventTap,
  Color? backgroundColor,
  int? maxLines,
  TextStyle? textStyle,
  double? iconSize,
  Color? iconColor,
  String? toastId,
});
```

###### `showText`

普通文本Toast。

```dart
static String showText(
  String? text, {
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 3000),
  int? maxLines,
  BoxConstraints? constraints,
  bool? preventTap,
  Widget? customWidget,
  Color? backgroundColor,
  TextStyle? textStyle,
  String? toastId,
});
```

###### `showWarning`

警告Toast。

```dart
static String showWarning(
  String? text, {
  IconTextDirection direction = IconTextDirection.horizontal,
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 3000),
  bool? preventTap,
  Color? backgroundColor,
  int? maxLines,
  TextStyle? textStyle,
  double? iconSize,
  Color? iconColor,
  String? toastId,
});
```

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

当需要对用户进行轻量反馈或提示，且不需要用户进行操作时使用，轻提示会在一段时间后自动消失。

#### 与页面布局相关

###### 轻提示通常放置在页面正中间，一段时间后自动消失。

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-1.png)

#### 组件搭配使用

###### 轻提示经常和加载搭配使用，在页面内进行某项操作后，用作加载反馈。

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-2.png)

#### 推荐/慎用示例

###### 轻提示的文案内容通常不超过30个字，确保用户有充足的时间进行阅读，若需要提示较长的文本内容，建议使用其它交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
