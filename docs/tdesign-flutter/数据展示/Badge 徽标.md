# Badge 徽标

> 用于告知用户，该区域的状态变化或者待处理任务的数量。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/badge)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_badge_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_badge_page.dart)

#### 1 组件类型

红点徽标

```
  Widget _buildRedPointMessageBadge(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 24,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          TDText(
            '消息',
            font: TDTheme.of(context).fontBodyLarge,
          ),
          const Positioned(
            child: TDBadge(TDBadgeType.redPoint),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```


```
  Widget _buildRedPointIconBadge(BuildContext context) {
    return const SizedBox(
      width: 27,
      height: 27,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Icon(TDIcons.notification),
          Positioned(
            child: TDBadge(TDBadgeType.redPoint),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```


```
  Widget _buildRedPointButtonBadge(BuildContext context) {
    return const SizedBox(
      width: 83,
      height: 48,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          TDButton(
            width: 80,
            height: 48,
            text: '按钮',
            size: TDButtonSize.large,
            type: TDButtonType.fill,
          ),
          Positioned(
            child: TDBadge(TDBadgeType.redPoint),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```

数字徽标

```
  Widget _buildMessageNumberBadge(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 36,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          TDText('消息', font: TDTheme.of(context).fontBodyLarge),
          Positioned(
            child: TDBadge(TDBadgeType.message, count: num.toString()),
            left: 28,
            bottom: 18,
          )
        ],
      ),
    );
  }
```


```
  Widget _buildIconNumberBadge(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 36,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const Icon(TDIcons.notification),
          Positioned(
            child: TDBadge(TDBadgeType.message, count: num.toString()),
            left: 18,
            bottom: 18,
          )
        ],
      ),
    );
  }
```


```
  Widget _buildButtonNumberBadge(BuildContext context) {
    return SizedBox(
      width: 86,
      height: 54,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const TDButton(
            width: 80,
            height: 48,
            text: '按钮',
            size: TDButtonSize.large,
          ),
          Positioned(
            child: TDBadge(TDBadgeType.message, count: num.toString()),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```

自定义徽标

```
  Widget _buildCustomBadgeShowingNumber(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 56,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            child: const Icon(TDIcons.notification),
            decoration: BoxDecoration(
                color: TDTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          Positioned(
            child: TDBadge(TDBadgeType.message, count: num.toString()),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```


```
  Widget _buildCustomBadgeShowingNumberZero(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 56,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            child: const Icon(TDIcons.notification),
            decoration: BoxDecoration(
                color: TDTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          const Positioned(
            child: TDBadge(TDBadgeType.message, count: '0'),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```


```
  Widget _buildCustomBadgeWithoutShowingNumberZero(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 56,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            child: const Icon(TDIcons.notification),
            decoration: BoxDecoration(
                color: TDTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          const Positioned(
            // 不显示 0
            child: TDBadge(TDBadgeType.message, count: '0', showZero: false),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```

#### 1 组件样式

圆形徽标

```
  Widget _buildCircleBadge(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 34,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const Icon(TDIcons.notification),
          Positioned(
            child: TDBadge(TDBadgeType.message, count: num.toString()),
            left: 18,
            bottom: 18,
          )
        ],
      ),
    );
  }
```

方形徽标

```
  Widget _buildSquareBadge(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 34,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const Icon(TDIcons.notification),
          Positioned(
            child: TDBadge(
              TDBadgeType.square,
              border: TDBadgeBorder.small,
              count: num.toString(),
            ),
            left: 20,
            bottom: 18,
          )
        ],
      ),
    );
  }
```

气泡徽标

```
  Widget _buildBubbleBadge(BuildContext context) {
    return SizedBox(
      width: 67,
      height: 56,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            child: const Icon(TDIcons.shop),
            decoration: BoxDecoration(
                color: TDTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          const Positioned(
            child: TDBadge(TDBadgeType.bubble, count: '领积分'),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }
```

角标

```
  Widget _buildSubscriptBadge(BuildContext context) {
    return const Stack(
      alignment: Alignment.topRight,
      children: [
        TDCell(title: '单行标题'),
        TDBadge(TDBadgeType.subscript, message: 'NEW'),
      ],
    );
  }
```

#### 1 组件尺寸

Large

```
  Widget _buildLargeBadge(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 68,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const TDAvatar(size: TDAvatarSize.large, type: TDAvatarType.icon),
          Positioned(
            child: TDBadge(TDBadgeType.message,
                size: TDBadgeSize.large, count: num.toString()),
            left: 48,
            bottom: 48,
          )
        ],
      ),
    );
  }
```

Medium

```
  Widget _buildMediumBadge(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 54,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const TDAvatar(size: TDAvatarSize.medium, type: TDAvatarType.icon),
          Positioned(
            child: TDBadge(TDBadgeType.message, count: num.toString()),
            left: 36,
            bottom: 36,
          )
        ],
      ),
    );
  }
```

## API

1. [TDBadge](#tdbadge)

#### TDBadge

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| border | TDBadgeBorder | TDBadgeBorder.large | 红点圆角大小 |
| color | Color? | - | 红点颜色 |
| count | String? | - | 红点数量 |
| key |  | - |  |
| maxCount | String? | '99' | 最大红点数量 |
| message | String? | - | 消息内容 |
| padding | EdgeInsetsGeometry? | - | 角标自定义padding |
| showZero | bool | true | 值为0是否显示 |
| size | TDBadgeSize | TDBadgeSize.small | 红点尺寸 |
| textColor | Color? | - | 文字颜色 |
| type | TDBadgeType | type | 红点样式 |
| widthLarge | double | 32 | 角标大三角形宽 |
| widthSmall | double | 12 | 角标小三角形宽 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当需要展示特定对象的状态变化或承载运营性质提示时使用。

#### 组件搭配使用

###### 徽标与[选项卡](<../导航/Tabs 选项卡.md>)、[底部标签栏](<../导航/TabBar 标签栏.md>)组合使用，置于文字段的右上方，用于展示状态信息或营销信息。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-2.png)

---

###### 徽标与[头像](<Avatar 头像.md>)组合使用，可作为消息提示或数量提示。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-3.png)

#### 常见用法

###### 当用户只需要关注是否有消息，而无需关注消息数量时，可使用红点型徽标；当提示的信息需要精确显示数量时，应使用带数字的徽标。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-5.png)

#### 推荐/慎用示例

###### 建议根据场景和信息类型定义最长字数，不宜出现过长的情况。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [标签](<Tag 标签.md>) | 当需要展示内容本身的属性、状态、类别、营销情况时作为纯展示使用；或者当大量的内容数据需要根据类型进行选择筛选时使用。 |
