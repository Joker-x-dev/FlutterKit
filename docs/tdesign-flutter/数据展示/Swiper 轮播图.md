# Swiper 轮播图

> 来源：[Swiper 轮播图](https://tdesign.tencent.com/flutter/components/swiper)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
```

### 代码演示

[td_swiper_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_swiper_page.dart)

#### 1 组件类型

点状(dots)

```
  Widget _buildDotsSwiper(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemCount: 6,
      loop: true,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: TSwiperPagination.dots,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

点条状(dots-bar)

```
  Widget _buildDotsBarSwiper(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemCount: 6,
      loop: true,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: TSwiperPagination.dotsBar,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

分式(fraction)

```
  Widget _buildFractionSwiper(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemCount: 6,
      loop: true,
      scrollDirection: Axis.vertical,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: TSwiperPagination.fraction,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

切换按钮(controls)

```
  Widget _buildControlsSwiper(BuildContext context) {
    return Swiper(
      // autoplay: true,
      itemCount: 6,
      loop: false,
      pagination: const SwiperPagination(
        alignment: Alignment.center,
        builder: TSwiperPagination.controls,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

卡片式(cards)

```
  Widget _buildCardsSwiper(BuildContext context) {
    return Swiper(
      viewportFraction: 0.75,
      outer: true,
      autoplay: true,
      itemCount: 6,
      loop: true,
      transformer: TPageTransformer.margin(),
      pagination: const SwiperPagination(
        alignment: Alignment.center,
        builder: TSwiperPagination.dots,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

卡片式(cards)-scale:0.8

```
  Widget _buildScaleCardsSwiper(BuildContext context) {
    return Swiper(
      viewportFraction: 0.75,
      outer: true,
      autoplay: true,
      itemCount: 6,
      loop: true,
      transformer: TPageTransformer.scaleAndFade(),
      pagination: const SwiperPagination(
        alignment: Alignment.center,
        builder: TSwiperPagination.dots,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

#### 1 组件样式

内部

```
  Widget _buildDotsSwiper(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemCount: 6,
      loop: true,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: TSwiperPagination.dots,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

外部

```
  Widget _buildOuterDotsSwiper(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemCount: 6,
      loop: true,
      outer: true,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: TSwiperPagination.dots,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

右边(竖向)

```
  Widget _buildRightDotsSwiper(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemCount: 6,
      loop: true,
      scrollDirection: Axis.vertical,
      pagination: const SwiperPagination(
        alignment: Alignment.centerRight,
        builder: TSwiperPagination.dots,
      ),
      itemBuilder: (BuildContext context, int index) {
        return const TImage(
          assetUrl: 'assets/img/image.png',
        );
      },
    );
  }
```

## API

1. [TSwiperPagination](#tswiperpagination)
2. [TPageTransformer](#tpagetransformer)

#### TSwiperPagination

##### 简介

TDesign风格的Swiper指示器样式，与flutter_swiper的Swiper结合使用

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| alignment | Alignment? | - | 当 scrollDirection== Axis.horizontal 时，默认Alignment.bottomCenter 当 scrollDirection== Axis.vertical 时，默认Alignment.centerRight |
| builder | SwiperPlugin | TSwiperPagination.dots | 具体样式 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| margin | EdgeInsetsGeometry | const EdgeInsets.all(10.0) | 指示器和container之间的距离 |

##### 静态成员

| 名称 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| controls | SwiperPlugin | - | 箭头样式 |
| dots | SwiperPlugin | - | 圆点样式 |
| dotsBar | SwiperPlugin | - | 圆角矩形 + 圆点样式 默认宽度20，高度6 |
| fraction | SwiperPlugin | - | 数字样式 |

#### TPageTransformer

##### 简介

TD默认PageTransformer

##### 工厂构造方法

###### TPageTransformer.margin

普通margin的卡片式

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| margin | double? | 6.0 | 左右间隔 |

###### TPageTransformer.scaleAndFade

缩放或透明的卡片式

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| fade | double? | 1 | 淡化比例 |
| scale | double? | 0.8 | 缩放比例 |

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| fade | double? | - | 淡化比例 |
| margin | double? | - | 左右间隔 |
| scale | double? | - | 缩放比例 |

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

当需要承载一组banner或一组图片时使用。

#### 常见用法

###### 用于放置营销活动或承载平台广告等具有时效性的内容入口。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swiper/swiper-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/swiper/swiper-2.png)

---

###### 在图文详情页场景，用于当图片数量大于1时的折叠展示。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swiper/swiper-3.png)

#### 推荐/慎用示例

###### 索引项需要跟数据项小标题保持一致。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swiper/swiper-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
