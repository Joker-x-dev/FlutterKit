# Loading 加载

> 用于表示页面或操作的加载状态，给予用户反馈的同时减缓等待的焦虑感，由一个或一组反馈动效组成。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/loading)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_loading_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_loading_page.dart)

#### 1 组件类型

纯图标

```
  Widget _buildPureIconLoading(BuildContext context) {
    return Row(
      // spacing: 36,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.circle,
        ),
        const SizedBox(width: 36),
        const TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.activity,
        ),
        const SizedBox(width: 36),
        TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.point,
          iconColor: TDTheme.of(context).brandNormalColor,
        ),
      ],
    );
  }
```

图标加文字横向

```
  Widget _buildTextIconHorizontalLoading(BuildContext context) {
    return const Row(
      // spacing: 36,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.circle,
          text: '加载中…',
          axis: Axis.horizontal,
        ),
        const SizedBox(width: 36),
        TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.activity,
          text: '加载中…',
          axis: Axis.horizontal,
        ),
      ],
    );
  }
```

图标加文字竖向

```
  Widget _buildTextIconVerticalLoading(BuildContext context) {
    return const Row(
      // spacing: 36,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.circle,
          text: '加载中…',
          axis: Axis.vertical,
        ),
        SizedBox(width: 36),
        TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.activity,
          text: '加载中…',
          axis: Axis.vertical,
        ),
      ],
    );
  }
```

纯文字

```
  Widget _buildPureTextLoading(BuildContext context) {
    return Row(
      // spacing: 36,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TDLoading(
          size: TDLoadingSize.small,
          text: '加载中…',
        ),
        const SizedBox(width: 36),
        TDLoading(
          size: TDLoadingSize.small,
          text: '加载失败',
          textColor: TDTheme.of(context).textColorPlaceholder,
        ),
        const SizedBox(width: 36),
        TDLoading(
          size: TDLoadingSize.small,
          text: '加载失败',
          refreshWidget: GestureDetector(
            child: TDText(
              '刷新',
              font: TDTheme.of(context).fontBodySmall,
              textColor: TDTheme.of(context).brandNormalColor,
            ),
            onTap: () {
              TDToast.showText('刷新', context: context);
            },
          ),
        ),
      ],
    );
  }
```

#### 1 组件尺寸

大尺寸

```
  Widget _buildLargeLoading(BuildContext context) {
    return const TDLoading(
      size: TDLoadingSize.large,
      icon: TDLoadingIcon.circle,
      text: '加载中…',
      axis: Axis.horizontal,
    );
  }
```

中尺寸

```
  Widget _buildMediumLoading(BuildContext context) {
    return const TDLoading(
      size: TDLoadingSize.medium,
      icon: TDLoadingIcon.circle,
      text: '加载中…',
      axis: Axis.horizontal,
    );
  }
```

小尺寸

```
  Widget _buildSmallLoading(BuildContext context) {
    return const TDLoading(
      size: TDLoadingSize.small,
      icon: TDLoadingIcon.circle,
      text: '加载中…',
      axis: Axis.horizontal,
    );
  }
```

#### 1 加载速度

调整加载速度

```
  Widget _buildCustomSpeedLoading(BuildContext context) {
    return Column(
      // spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TDLoading(
          size: TDLoadingSize.small,
          icon: TDLoadingIcon.circle,
          axis: Axis.horizontal,
          text: '加载中…',
          duration: _currentSliderValue.round(),
        ),
        const SizedBox(height: 16),
        TDSlider(
          value: _currentSliderValue,
          sliderThemeData: TDSliderThemeData(
            context: context,
            max: 2000,
            min: -20,
            divisions: 100,
            showThumbValue: true,
            scaleFormatter: (value) => value.toInt().toString(),
          ),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        )
      ],
    );
  }
```

## API

1. [TDLoading](#tdloading)

#### TDLoading

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| axis | Axis | Axis.vertical | 文案和图标相对方向 |
| customIcon | Widget? | - | 自定义图标，优先级高于icon |
| duration | int | 2000 | 一次刷新的时间，控制动画速度 |
| icon | TDLoadingIcon? | TDLoadingIcon.circle | 图标，支持圆形、点状、菊花状 |
| iconColor | Color? | - | 图标颜色 |
| key |  | - |  |
| refreshWidget | Widget? | - | 失败刷新组件 |
| size | TDLoadingSize | - | 尺寸 |
| text | String? | - | 文案 |
| textColor | Color? | - | 文案颜色 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当打开新页面或操作完成后，等待加载时使用。

#### 与页面布局相关

###### 当展示整个页面、或模块的加载进度时，通常放置在页面、模块的正中间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-2.png)

#### 组件搭配使用

###### 在信息流页面中，可结合下拉刷新使用，对未展示出来的最新内容进行加载。

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-3.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-4.png)

#### 推荐/慎用示例

###### 当加载时间较长，尤其是超过10秒的场景中，推荐使用进度条，向用户明确展示当前任务的进展，避免等待时间过长带来焦急的负面体验。

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [下拉刷新](<PullDownRefresh 下拉刷新.md>) | 当需要对页面信息进行整体刷新或加载更多同类信息时使用。 |
