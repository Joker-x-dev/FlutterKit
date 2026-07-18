# Message 全局提示

> 用于轻量级反馈或提示，不会打断用户操作。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/message)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_message_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_message_page.dart)

#### 1 组件类型

纯文字的通知

```
  Widget _buildPlainTextMessage(BuildContext context) {
    return TDButton(
      isBlock: true,
      text: '纯文字的通知',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        TDMessage.showMessage(
          context: context,
          content: _commonContent,
          visible: true,
          icon: false,
          theme: MessageTheme.info,
          duration: 3000,
          onDurationEnd: () {
            print('message end');
          },
        );
      },
    );
  }
```

带图标的通知

```
  Widget _buildIconTextMessage(BuildContext context) {
    return TDButton(
        isBlock: true,
        text: '带图标的通知',
        size: TDButtonSize.large,
        type: TDButtonType.outline,
        theme: TDButtonTheme.primary,
        onTap: () {
          TDMessage.showMessage(
            context: context,
            content: _commonContent,
            visible: true,
            icon: true,
            theme: MessageTheme.info,
            duration: 3000,
          );
        });
  }
```

带关闭的通知

```
  Widget _buildMessageWithCloseButton(BuildContext context) {
    return TDButton(
        isBlock: true,
        text: '带关闭的通知',
        size: TDButtonSize.large,
        type: TDButtonType.outline,
        theme: TDButtonTheme.primary,
        onTap: () {
          TDMessage.showMessage(
            context: context,
            visible: true,
            icon: true,
            content: _commonContent,
            theme: MessageTheme.info,
            duration: 300000,
            closeBtn: true,
            link: MessageLink(name: '按钮', uri: Uri.parse('www.example.com')),
            onCloseBtnClick: () {
              print('Close button clicked!');
            },
          );
        });
  }
```

可滚动的通知

```
  Widget _buildRollingMessage(BuildContext context) {
    return TDButton(
        isBlock: true,
        text: '可滚动的通知',
        size: TDButtonSize.large,
        type: TDButtonType.outline,
        theme: TDButtonTheme.primary,
        onTap: () {
          TDMessage.showMessage(
              context: context,
              visible: true,
              icon: false,
              marquee: MessageMarquee(speed: 5000, loop: 1, delay: 300),
              content: longContent,
              theme: MessageTheme.info,
              duration: 8000,
              onCloseBtnClick: () {
                print('Close button clicked!');
              });
        });
  }
```

带按钮的通知

```
  Widget _buildLinkMessage(BuildContext context) {
    return TDButton(
        isBlock: true,
        text: '带按钮的通知',
        size: TDButtonSize.large,
        type: TDButtonType.outline,
        theme: TDButtonTheme.primary,
        onTap: () {
          TDMessage.showMessage(
              context: context,
              visible: true,
              icon: true,
              content: _commonContent,
              theme: MessageTheme.info,
              duration: 3000,
              link: MessageLink(
                name: '按钮',
                uri: Uri.parse('https://tdesign.tencent.com/'),
              ),
              onLinkClick: () {
                print('link clicked!');
              });
        });
  }
```

#### 1 组件状态

普通通知

```
  Widget _buildInfoMessage(BuildContext context) {
    return TDButton(
      isBlock: true,
      text: '普通通知',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        TDMessage.showMessage(
          context: context,
          visible: true,
          icon: true,
          content: _commonContent,
          theme: MessageTheme.info,
          duration: 3000,
        );
      },
    );
  }
```

成功通知

```
  Widget _buildSuccessMessage(BuildContext context) {
    return TDButton(
      isBlock: true,
      text: '成功通知',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        TDMessage.showMessage(
          context: context,
          visible: true,
          icon: true,
          content: _commonContent,
          theme: MessageTheme.success,
          duration: 3000,
        );
      },
    );
  }
```

警示通知

```
  Widget _buildWarningMessage(BuildContext context) {
    return TDButton(
        isBlock: true,
        text: '警示通知',
        size: TDButtonSize.large,
        type: TDButtonType.outline,
        theme: TDButtonTheme.primary,
        onTap: () {
          TDMessage.showMessage(
            context: context,
            visible: true,
            icon: true,
            content: _commonContent,
            theme: MessageTheme.warning,
            duration: 3000,
          );
        });
  }
```

错误通知

```
  Widget _buildErrorMessage(BuildContext context) {
    return TDButton(
        isBlock: true,
        text: '错误通知',
        size: TDButtonSize.large,
        type: TDButtonType.outline,
        theme: TDButtonTheme.primary,
        onTap: () {
          TDMessage.showMessage(
            context: context,
            visible: true,
            icon: true,
            content: _commonContent,
            theme: MessageTheme.error,
            duration: 3000,
          );
        });
  }
```

## API

1. [MessageLink](#messagelink)
2. [MessageMarquee](#messagemarquee)
3. [TDMessage](#tdmessage)

#### MessageLink

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| color | Color? | - | 颜色 |
| name | String | - | 名称 |
| uri | Uri? | - | 资源链接 |

#### MessageMarquee

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| delay | int? | - | 延迟时间(毫秒) |
| loop | int? | - | 循环次数 |
| speed | int? | - | 速度 |

#### TDMessage

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| closeBtn | dynamic | - | 关闭按钮 |
| content | String? | - | 通知内容 |
| duration | int? | 3000 | 消息内置计时器 |
| icon | dynamic | true | 自定义消息前面的图标 |
| key |  | - |  |
| link | dynamic | - | 链接名称 |
| marquee | MessageMarquee? | - | 跑马灯效果 |
| offset | List? | - | 相对于 placement 的偏移量 |
| onCloseBtnClick | VoidCallback? | - | 点击关闭按钮触发 |
| onDurationEnd | VoidCallback? | - | 计时结束后触发 |
| onLinkClick | VoidCallback? | - | 点击链接文本时触发 |
| theme | MessageTheme? | MessageTheme.info | 消息组件风格 info/success/warning/error |
| visible | bool? | true | 是否显示 |

##### 静态方法

| 名称 | 返回类型 | 说明 |
| --- | --- | --- |
| `showMessage` | `void` | 显示全局消息。 |

###### `showMessage`

显示全局消息。

```dart
static void showMessage({
  required BuildContext context,
  String? content,
  bool? visible,
  int? duration,
  dynamic closeBtn,
  dynamic icon,
  dynamic link,
  MessageMarquee? marquee,
  List<double>? offset,
  MessageTheme? theme,
  VoidCallback? onCloseBtnClick,
  VoidCallback? onDurationEnd,
  VoidCallback? onLinkClick,
});
```

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当需要对用户进行较轻量的反馈或提示，可以自动消失或通过点击关闭，通常由用户触发。

#### 与页面布局相关

###### 通知通常出现在页面顶部，叠加在页面的上层，可在一段时间后自动消失、或用户点击关闭。

![](https://tdesign.gtimg.com/site/design/mobile-guide/message/message-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/message/message-2.png)

#### 推荐/慎用示例

###### 当需要在通知栏中展示按钮时，不建议超过1个。若需要使用更多按钮，建议使用其它交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/message/message-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 消息通知是一种相对轻量、短时的反馈方式，尽量避免在页面中同时堆叠多个消息通知，用户可能会来不及关注它们。

![](https://tdesign.gtimg.com/site/design/mobile-guide/message/message-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [轻提示](<Toast 轻提示.md>) | 当需要对用户进行轻量反馈或提示，且不需要用户进行操作时使用，轻提示会在一段时间后自动消失。 |
| [公告栏](<NoticeBar 消息提醒.md>) | 当需要对用户进行较明显的反馈或提示，需要用户关注时使用，一段时间后不会自动消失，通常是自动触发。 |
