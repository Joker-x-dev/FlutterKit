# Badge 徽标

> 用于告知用户，该区域的状态变化或者待处理任务的数量。

> 来源：[Badge 徽标](https://tdesign.tencent.com/flutter/components/badge)
> 归档时间：2026-10-30T16:00:00+08:00

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
          TText(
            '消息',
            font: TTheme.of(context).fontBodyLarge,
          ),
          const Positioned(
            child: TBadge(TBadgeType.redPoint),
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
          Icon(TIcons.notification),
          Positioned(
            child: TBadge(TBadgeType.redPoint),
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
          TButton(
            width: 80,
            height: 48,
            text: '按钮',
            size: TButtonSize.large,
            type: TButtonType.fill,
          ),
          Positioned(
            child: TBadge(TBadgeType.redPoint),
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
          TText('消息', font: TTheme.of(context).fontBodyLarge),
          Positioned(
            child: TBadge(TBadgeType.message, count: num.toString()),
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
          const Icon(TIcons.notification),
          Positioned(
            child: TBadge(TBadgeType.message, count: num.toString()),
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
          const TButton(
            width: 80,
            height: 48,
            text: '按钮',
            size: TButtonSize.large,
          ),
          Positioned(
            child: TBadge(TBadgeType.message, count: num.toString()),
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
            child: const Icon(TIcons.notification),
            decoration: BoxDecoration(
                color: TTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          Positioned(
            child: TBadge(TBadgeType.message, count: num.toString()),
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
            child: const Icon(TIcons.notification),
            decoration: BoxDecoration(
                color: TTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          const Positioned(
            child: TBadge(TBadgeType.message, count: '0'),
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
            child: const Icon(TIcons.notification),
            decoration: BoxDecoration(
                color: TTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          const Positioned(
            // 不显示 0
            child: TBadge(TBadgeType.message, count: '0', showZero: false),
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
          const Icon(TIcons.notification),
          Positioned(
            child: TBadge(TBadgeType.message, count: num.toString()),
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
          const Icon(TIcons.notification),
          Positioned(
            child: TBadge(
              TBadgeType.square,
              border: TBadgeBorder.small,
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
            child: const Icon(TIcons.shop),
            decoration: BoxDecoration(
                color: TTheme.of(context).bgColorComponent,
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            height: 48,
            width: 48,
          ),
          const Positioned(
            child: TBadge(TBadgeType.bubble, count: '领积分'),
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
        TCell(title: '单行标题'),
        TBadge(TBadgeType.subscript, message: 'NEW'),
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
          const TAvatar(size: TAvatarSize.large, type: TAvatarType.icon),
          Positioned(
            child: TBadge(TBadgeType.message,
                size: TBadgeSize.large, count: num.toString()),
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
          const TAvatar(size: TAvatarSize.medium, type: TAvatarType.icon),
          Positioned(
            child: TBadge(TBadgeType.message, count: num.toString()),
            left: 36,
            bottom: 36,
          )
        ],
      ),
    );
  }
```

## API

1. [TBadge](#tbadge)
2. [TBadgeType](#tbadgetype)
3. [TBadgeBorder](#tbadgeborder)
4. [TBadgeSize](#tbadgesize)

#### TBadge

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| type | TBadgeType | - | 红点样式 |
| border | TBadgeBorder | TBadgeBorder.large | 红点圆角大小 |
| color | Color? | - | 红点颜色 |
| count | String? | - | 红点数量 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| maxCount | String? | '99' | 最大红点数量 |
| message | String? | - | 消息内容 |
| padding | EdgeInsetsGeometry? | - | 角标自定义padding |
| showZero | bool | true | 值为0是否显示 |
| size | TBadgeSize | TBadgeSize.small | 红点尺寸 |
| textColor | Color? | - | 文字颜色 |
| widthLarge | double | 32 | 角标大三角形宽 |
| widthSmall | double | 12 | 角标小三角形宽 |

#### TBadgeType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| redPoint | 红点样式 |
| message | 消息样式 |
| bubble | 气泡样式 |
| square | 方形样式 |
| subscript | 角标样式 |

#### TBadgeBorder

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| large | 大圆角 8px |
| small | 小圆角 2px |

#### TBadgeSize

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| large | 宽 20px |
| small | 宽 16px |

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
