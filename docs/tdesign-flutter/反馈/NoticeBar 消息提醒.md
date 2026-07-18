# NoticeBar 消息提醒

> 在导航栏下方，用于给用户显示提示消息。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/notice-bar)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_notice-bar_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_notice-bar_page.dart)

#### 1 组件类型

纯文字的公告栏

```
Widget _textNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条普通的通知信息',
  );
}
```

可滚动的公告栏

```
Widget _scrollNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '提示文字描述提示文字描述提示文字描述提示文字描述提示文字',
    marquee: true,
    speed: 50,
  );
}
```


```
Widget _scrollIconNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '提示文字描述提示文字描述提示文字描述提示文字描述提示文字',
    speed: 50,
    prefixIcon: TDIcons.sound,
    marquee: true,
  );
}
```

带图标的公告栏

```
Widget _iconNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条普通的通知信息',
    prefixIcon: TDIcons.error_circle_filled,
  );
}
```

带关闭的公告栏

```
Widget _closeNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条普通的通知信息',
    prefixIcon: TDIcons.error_circle_filled,
    suffixIcon: TDIcons.close,
  );
}
```

带入口的公告栏

```
Widget _entranceNoticeBar1(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条普通的通知信息',
    prefixIcon: TDIcons.error_circle_filled,
    right: TDButton(
      text: '文字按钮',
      type: TDButtonType.text,
      theme: TDButtonTheme.primary,
      size: TDButtonSize.extraSmall,
      height: 22,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    ),
  );
}
```


```
Widget _entranceNoticeBar2(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条普通的通知信息',
    prefixIcon: TDIcons.error_circle_filled,
    suffixIcon: TDIcons.chevron_right,
  );
}
```

自定义样式的公告栏

```
Widget _customNoticeBar(BuildContext context) {
  return TDNoticeBar(
    content: '这是一条普通的通知信息',
    prefixIcon: TDIcons.notification,
    suffixIcon: TDIcons.chevron_right,
    style: TDNoticeBarStyle.generateTheme(context, theme: TDNoticeBarTheme.info)
      ..backgroundColor = TDTheme.of(context).bgColorComponent,
  );
}
```

#### 1 组件状态

普通通知

```
Widget _normalNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条普通的通知信息',
    prefixIcon: TDIcons.error_circle_filled,
    theme: TDNoticeBarTheme.info,
  );
}
```

成功通知

```
Widget _successNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条成功的通知信息',
    prefixIcon: TDIcons.check_circle_filled,
    theme: TDNoticeBarTheme.success,
  );
}
```

警示通知

```
Widget _warningNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条警示的通知信息',
    prefixIcon: TDIcons.error_circle_filled,
    theme: TDNoticeBarTheme.warning,
  );
}
```

错误通知

```
Widget _errorNoticeBar(BuildContext context) {
  return const TDNoticeBar(
    content: '这是一条错误的通知信息',
    prefixIcon: TDIcons.error_circle_filled,
    theme: TDNoticeBarTheme.error,
  );
}
```

#### 1 组件样式

卡片顶部

```
Widget _cardNoticeBar(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: TDNoticeBarStyle.generateTheme(context).backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0d000000),
          blurRadius: 8,
          spreadRadius: 2,
          offset: Offset(0, 2),
        ),
        BoxShadow(
          color: Color(0x0f000000),
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 8),
        ),
        BoxShadow(
          color: Color(0x1a000000),
          blurRadius: 5,
          spreadRadius: -3,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          width: size.width - 32,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          clipBehavior: Clip.hardEdge,
          child: const TDNoticeBar(
            content: '这是一条普通的通知信息',
            prefixIcon: TDIcons.error_circle_filled,
            suffixIcon: TDIcons.chevron_right,
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: TDTheme.of(context).bgColorContainer,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        )
      ],
    ),
  );
}
```

## API

1. [TDNoticeBar](#tdnoticebar)
2. [TDNoticeBarStyle](#tdnoticebarstyle)

#### TDNoticeBar

##### 简介

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| content | dynamic | - | 文本内容（字符串或字符串数组等） |
| context | dynamic | - | 文本内容（请使用content属性） |
| direction | Axis? | Axis.horizontal | 滚动方向 |
| height | double | 22 | 文字高度 (当使用prefixIcon或suffixIcon时，icon大小值等于该属性） |
| interval | int? | 3000 | 步进滚动间隔时间（毫秒） |
| key |  | - |  |
| left | Widget? | - | 左侧内容（自定义左侧内容，优先级高于prefixIcon） |
| marquee | bool? | false | 跑马灯效果 |
| maxLines | int? | 1 | 文本行数（仅静态有效） |
| onTap | ValueChanged? | - | 点击事件 |
| prefixIcon | IconData? | - | 左侧图标 |
| right | Widget? | - | 右侧内容（自定义右侧内容，优先级高于suffixIcon） |
| speed | double? | 50 | 滚动速度 |
| style | TDNoticeBarStyle? | - | 公告栏样式 [TDNoticeBarStyle] |
| suffixIcon | IconData? | - | 右侧图标 |
| theme | TDNoticeBarTheme? | TDNoticeBarTheme.info | 主题 |

#### TDNoticeBarStyle

##### 简介

公告栏样式

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 公告栏背景色 |
| context | BuildContext? | - | 上下文 |
| leftIconColor | Color? | - | 公告栏左侧图标颜色 |
| padding | EdgeInsetsGeometry? | - | 公告栏内边距 |
| rightIconColor | Color? | - | 公告栏右侧图标颜色 |
| textStyle | TextStyle? | - | 公告栏内容样式 |

##### 工厂构造方法

| 名称 | 说明 |
| --- | --- |
| TDNoticeBarStyle.generateTheme | 根据主题生成样式 |

## 设计指南

1. [何时使用](#何时使用)
2. [页面布局相关](#页面布局相关)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当需要对用户进行较明显的反馈或提示，需要用户关注时使用，一段时间后不会自动消失，通常是自动触发

#### 页面布局相关

###### 公告栏位于页面或模块的顶部，让用户能够快速关注到重要信息

![](https://tdesign.gtimg.com/site/design/mobile-guide/notice-bar/notice-bar-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/notice-bar/notice-bar-2.png)

#### 常见用法

###### 经常用于系统状态的通知，如警示或错误信息的展示，告知用户具体的系统状态、出现原因、和解决方式

![](https://tdesign.gtimg.com/site/design/mobile-guide/notice-bar/notice-bar-3.png)

---

###### 展示当前场景的重要公告，这类公告通常比较重要，需要用户务必关注

![](https://tdesign.gtimg.com/site/design/mobile-guide/notice-bar/notice-bar-4.gif)

---

###### 在营销场景，经常用于广告或促销信息的展示，提高用户转化率

![](https://tdesign.gtimg.com/site/design/mobile-guide/notice-bar/notice-bar-5.png)

---

###### 当需要同时展示多条公告时，通常使用可滚动的公告栏，依次展示多条公告信息

![](https://tdesign.gtimg.com/site/design/mobile-guide/notice-bar/notice-bar-6.gif)

#### 推荐/慎用示例

###### 可以同时展示多个公告栏，但不建议超过2个，过多的公告栏会占用过多屏幕空间、分散用户的注意力

![](https://tdesign.gtimg.com/site/design/mobile-guide/notice-bar/notice-bar-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [消息通知](<Message 全局提示.md>) | 当需要对用户进行较轻量的反馈或提示，可以自动消失或通过点击关闭，通常由用户触发。 |
| [轻提示](<Toast 轻提示.md>) | 当需要对用户进行轻量反馈或提示，且不需要用户进行操作时使用，轻提示会在一段时间后自动消失。 |
