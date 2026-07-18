# Link 链接

> 文字超链接用于跳转一个新页面，如当前项目跳转，友情链接等。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/link)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_link_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_link_page.dart)

#### 1 组件类型

基础文字链接

```
  Widget _basicTypeBasic(BuildContext context) {
    return Container(
        height: 48,
        color: TDTheme.of(context).bgColorContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildLinksWithType(TDLinkType.basic),
        ));
  }
```

下划线文字链接

```
  Widget _withUnderline(BuildContext context) {
    return Container(
        height: 48,
        color: TDTheme.of(context).bgColorContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildLinksWithType(TDLinkType.withUnderline),
        ));
  }
```

前置图标文字链接

```
  Widget _withPrefixIcon(BuildContext context) {
    return Container(
        height: 48,
        color: TDTheme.of(context).bgColorContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildLinksWithType(TDLinkType.withPrefixIcon),
        ));
  }
```

后置图标文字链接

```
  Widget _withSuffixIcon(BuildContext context) {
    return Container(
        height: 48,
        color: TDTheme.of(context).bgColorContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildLinksWithType(TDLinkType.withSuffixIcon),
        ));
  }
```

#### 1 组件状态

不同主题

```
  Widget _buildLinkStats(BuildContext context) {
    return _buildLinkWithStyles(TDLinkState.normal);
  }
```

禁用状态

```
  Widget _buildDisabledLinkStats(BuildContext context) {
    return _buildLinkWithStyles(TDLinkState.disabled);
  }
```

#### 1 组件样式

链接尺寸

```
  Widget _buildLinkSizes(BuildContext context) {
    return Container(
        height: 48,
        color: TDTheme.of(context).bgColorContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildLinkWithSizeAndStyle(TDLinkStyle.primary, TDLinkSize.small),
            _buildLinkWithSizeAndStyle(TDLinkStyle.primary, TDLinkSize.medium),
            _buildLinkWithSizeAndStyle(TDLinkStyle.primary, TDLinkSize.large),
          ],
        ));
  }
```

## API

1. [TDLink](#tdlink)

#### TDLink

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| color | Color? | - | link 文本的颜色，如果不设置则根据状态和风格进行计算 |
| fontSize | double? | - | link 文本的字体大小，如果不设置则根据状态和风格进行计算 |
| iconSize | double? | - | link icon 大小，如果不设置则根据状态和风格进行计算 |
| key |  | - |  |
| label | String | - | link 展示的文本 |
| leftGapWithIcon | double? | - | 前置icon和文本之间的间隔，如果不设置则根据状态和风格进行计算 |
| linkClick | LinkClick? | - | link 被点击之后所采取的动作，会将uri当做参数传入到该方法当中 |
| prefixIcon | Icon? | - | 前置 icon |
| rightGapWithIcon | double? | - | 后置icon和文本之间的间隔，如果不设置则根据状态和风格进行计算 |
| size | TDLinkSize | TDLinkSize.medium | link 大小 |
| state | TDLinkState | TDLinkState.normal | link 状态 |
| style | TDLinkStyle | TDLinkStyle.defaultStyle | link 风格 |
| suffixIcon | Icon? | - | 后置 icon |
| type | TDLinkType | TDLinkType.basic | link 类型 |
| uri | Uri? | - | link 跳转的uri |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当需要跳转至外链时使用。

#### 组件搭配使用

###### 链接与[消息通知](<../反馈/Message 全局提示.md>)、[公告栏](<../反馈/NoticeBar 消息提醒.md>)组合使用，在进行消息通知与提示的同时，提供解决方案或详情的跳转入口。

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-2.png)

#### 推荐/慎用示例

###### 在同一段文本中如使用多个链接，需要利用纯文本字符等将其区隔开。

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [按钮](<Button 按钮.md>) | 当前流程的结束或新流程的开启需要用户点击触发时使用。 |
