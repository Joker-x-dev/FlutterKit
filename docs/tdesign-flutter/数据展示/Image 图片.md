# Image 图片

> 用于展示效果，主要为上下左右居中裁切、拉伸、平铺等方式。

> 来源：[Image 图片](https://tdesign.tencent.com/flutter/components/image)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_image_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_image_page.dart)

#### 1 组件类型

```
  Widget _imageClip(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '裁剪',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.clip,
        ),
      ],
    );
  }
```


```
  Widget _imageStretch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '拉伸',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TImageType.stretch,
              ),
            ],
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitHeight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应高',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitHeight,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitWidth(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应宽',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitWidth,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.square,
        ),
      ],
    );
  }
```


```
  Widget _imageRoundedSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆角方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.roundedSquare,
          width: 72,
          height: 72,
        ),
      ],
    );
  }
```


```
  Widget _imageCircle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TImageType.circle,
        ),
      ],
    );
  }
```


```
  Widget _imageClip(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '裁剪',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.clip,
        ),
      ],
    );
  }
```


```
  Widget _imageStretch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '拉伸',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TImageType.stretch,
              ),
            ],
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitHeight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应高',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitHeight,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitWidth(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应宽',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitWidth,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.square,
        ),
      ],
    );
  }
```


```
  Widget _imageRoundedSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆角方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.roundedSquare,
          width: 72,
          height: 72,
        ),
      ],
    );
  }
```


```
  Widget _imageCircle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TImageType.circle,
        ),
      ],
    );
  }
```


```
  Widget _imageClip(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '裁剪',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.clip,
        ),
      ],
    );
  }
```


```
  Widget _imageStretch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '拉伸',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TImageType.stretch,
              ),
            ],
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitHeight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应高',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitHeight,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitWidth(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应宽',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitWidth,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.square,
        ),
      ],
    );
  }
```


```
  Widget _imageRoundedSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆角方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.roundedSquare,
          width: 72,
          height: 72,
        ),
      ],
    );
  }
```


```
  Widget _imageCircle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TImageType.circle,
        ),
      ],
    );
  }
```


```
  Widget _imageClip(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '裁剪',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.clip,
        ),
      ],
    );
  }
```


```
  Widget _imageStretch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '拉伸',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TImageType.stretch,
              ),
            ],
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitHeight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应高',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitHeight,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitWidth(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应宽',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitWidth,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.square,
        ),
      ],
    );
  }
```


```
  Widget _imageRoundedSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆角方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.roundedSquare,
          width: 72,
          height: 72,
        ),
      ],
    );
  }
```


```
  Widget _imageCircle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TImageType.circle,
        ),
      ],
    );
  }
```


```
  Widget _imageClip(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '裁剪',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.clip,
        ),
      ],
    );
  }
```


```
  Widget _imageStretch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '拉伸',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TImageType.stretch,
              ),
            ],
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitHeight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应高',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitHeight,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitWidth(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应宽',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitWidth,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.square,
        ),
      ],
    );
  }
```


```
  Widget _imageRoundedSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆角方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.roundedSquare,
          width: 72,
          height: 72,
        ),
      ],
    );
  }
```


```
  Widget _imageCircle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TImageType.circle,
        ),
      ],
    );
  }
```


```
  Widget _imageClip(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '裁剪',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.clip,
        ),
      ],
    );
  }
```


```
  Widget _imageStretch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '拉伸',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TImageType.stretch,
              ),
            ],
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitHeight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应高',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitHeight,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageFitWidth(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '适应宽',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TTheme.of(context).bgColorContainerHover,
          child: const TImage(
            assetUrl: 'assets/img/image.png',
            type: TImageType.fitWidth,
          ),
        ),
      ],
    );
  }
```


```
  Widget _imageSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.square,
        ),
      ],
    );
  }
```


```
  Widget _imageRoundedSquare(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆角方形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          type: TImageType.roundedSquare,
          width: 72,
          height: 72,
        ),
      ],
    );
  }
```


```
  Widget _imageCircle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '圆形',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TImageType.circle,
        ),
      ],
    );
  }
```

#### 1 组件状态

```
  Widget _loadingDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TIcons.ellipsis,
                  size: 22,
                  color: TTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _loadingCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TCircleIndicator(
                      color: TTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TCircleIndicator(
        //         color: TTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _failDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          imgUrl: 'error',
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```


```
  Widget _failCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        TImage(
          imgUrl: 'error',
          errorWidget: TText(
            '加载失败',
            forceVerticalCenter: true,
            font: TTheme.of(context).fontBodyExtraSmall,
          ),
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```


```
  Widget _loadingDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TIcons.ellipsis,
                  size: 22,
                  color: TTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _loadingCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TCircleIndicator(
                      color: TTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TCircleIndicator(
        //         color: TTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _failDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          imgUrl: 'error',
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```


```
  Widget _failCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        TImage(
          imgUrl: 'error',
          errorWidget: TText(
            '加载失败',
            forceVerticalCenter: true,
            font: TTheme.of(context).fontBodyExtraSmall,
          ),
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```


```
  Widget _loadingDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TIcons.ellipsis,
                  size: 22,
                  color: TTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _loadingCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TCircleIndicator(
                      color: TTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TCircleIndicator(
        //         color: TTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _failDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          imgUrl: 'error',
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```


```
  Widget _failCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        TImage(
          imgUrl: 'error',
          errorWidget: TText(
            '加载失败',
            forceVerticalCenter: true,
            font: TTheme.of(context).fontBodyExtraSmall,
          ),
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```


```
  Widget _loadingDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TIcons.ellipsis,
                  size: 22,
                  color: TTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _loadingCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '加载自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TCircleIndicator(
                      color: TTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TCircleIndicator(
        //         color: TTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TImageType.roundedSquare,
        // ),
      ],
    );
  }
```


```
  Widget _failDefault(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败默认提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        const TImage(
          imgUrl: 'error',
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```


```
  Widget _failCustom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TText(
            '失败自定义提示',
            font: TTheme.of(context).fontBodyMedium,
          ),
        ),
        TImage(
          imgUrl: 'error',
          errorWidget: TText(
            '加载失败',
            forceVerticalCenter: true,
            font: TTheme.of(context).fontBodyExtraSmall,
          ),
          type: TImageType.roundedSquare,
        ),
      ],
    );
  }
```

## API

1. [TImage](#timage)
2. [TImageType](#timagetype)

#### TImage

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| alignment | AlignmentGeometry | Alignment.center | - |
| assetUrl | String? | - | 本地素材地址 |
| cacheHeight | int? | - | - |
| cacheWidth | int? | - | - |
| centerSlice | Rect? | - | - |
| color | Color? | - | - |
| colorBlendMode | BlendMode? | - | - |
| errorBuilder | ImageErrorWidgetBuilder? | - | - |
| errorWidget | Widget? | - | 失败自定义提示 |
| excludeFromSemantics | bool | false | - |
| filterQuality | FilterQuality | FilterQuality.low | - |
| fit | BoxFit? | - | 适配样式 |
| frameBuilder | ImageFrameBuilder? | - | 以下系统Image属性，释义请参考系统`Image`中注释 |
| gaplessPlayback | bool | false | - |
| height | double? | - | 自定义高 |
| imageFile | File? | - | 图片文件路径 |
| imgUrl | String? | - | 图片地址 |
| isAntiAlias | bool | false | - |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| loadingBuilder | ImageLoadingBuilder? | - | - |
| loadingWidget | Widget? | - | 加载自定义提示 |
| matchTextDirection | bool | false | - |
| opacity | Animation? | - | - |
| repeat | ImageRepeat | ImageRepeat.noRepeat | - |
| semanticLabel | String? | - | - |
| type | TImageType | TImageType.roundedSquare | 图片类型 |
| width | double? | - | 自定义宽 |

#### TImageType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| clip | 裁剪 |
| fitHeight | 适应高 |
| fitWidth | 适应宽 |
| stretch | 拉伸 |
| square | 方形, |
| roundedSquare | 圆角方形 |
| circle | 圆形 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

当需要对图像内容进行陈列、展示，以便用户快速了解图像信息时使用。

#### 组件搭配使用

###### 可使用[宫格](https://tdesign.tencent.com/flutter/components/grid)、[单元格](<Cell 单元格.md>)承载图片，作为某种功能、某类信息的入口。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-2.png)

---

###### 图片与[下拉刷新](<../反馈/PullDownRefresh 下拉刷新.md>)组合使用，用于图片瀑布流时的内容更新。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-3.png)

#### 推荐/慎用示例

###### 当图片仅为展示，不具备预览功能时，应避免图片尺寸过小，从而影响图像信息的浏览和获取。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
