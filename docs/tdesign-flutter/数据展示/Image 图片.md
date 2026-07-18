# Image 图片

> 用于展示效果，主要为上下左右居中裁切、拉伸、平铺等方式。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/image)
> 归档时间：2026-07-16T07:37:59.655Z

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
          child: TDText(
            '裁剪',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.clip,
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
          child: TDText(
            '拉伸',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TDTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TDImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TDImageType.stretch,
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
          child: TDText(
            '适应高',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitHeight,
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
          child: TDText(
            '适应宽',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitWidth,
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
          child: TDText(
            '方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.square,
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
          child: TDText(
            '圆角方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '圆形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TDImageType.circle,
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
          child: TDText(
            '裁剪',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.clip,
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
          child: TDText(
            '拉伸',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TDTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TDImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TDImageType.stretch,
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
          child: TDText(
            '适应高',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitHeight,
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
          child: TDText(
            '适应宽',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitWidth,
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
          child: TDText(
            '方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.square,
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
          child: TDText(
            '圆角方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '圆形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TDImageType.circle,
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
          child: TDText(
            '裁剪',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.clip,
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
          child: TDText(
            '拉伸',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TDTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TDImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TDImageType.stretch,
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
          child: TDText(
            '适应高',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitHeight,
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
          child: TDText(
            '适应宽',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitWidth,
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
          child: TDText(
            '方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.square,
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
          child: TDText(
            '圆角方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '圆形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TDImageType.circle,
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
          child: TDText(
            '裁剪',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.clip,
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
          child: TDText(
            '拉伸',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TDTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TDImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TDImageType.stretch,
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
          child: TDText(
            '适应高',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitHeight,
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
          child: TDText(
            '适应宽',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitWidth,
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
          child: TDText(
            '方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.square,
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
          child: TDText(
            '圆角方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '圆形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TDImageType.circle,
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
          child: TDText(
            '裁剪',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.clip,
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
          child: TDText(
            '拉伸',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TDTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TDImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TDImageType.stretch,
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
          child: TDText(
            '适应高',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitHeight,
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
          child: TDText(
            '适应宽',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitWidth,
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
          child: TDText(
            '方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.square,
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
          child: TDText(
            '圆角方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '圆形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TDImageType.circle,
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
          child: TDText(
            '裁剪',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.clip,
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
          child: TDText(
            '拉伸',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          color: TDTheme.of(context).bgColorContainerHover,
          width: 121,
          height: 72,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              TDImage(
                assetUrl: 'assets/img/image.png',
                width: 121,
                height: 50,
                type: TDImageType.stretch,
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
          child: TDText(
            '适应高',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 89,
          height: 72,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitHeight,
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
          child: TDText(
            '适应宽',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
          width: 72,
          height: 89,
          color: TDTheme.of(context).bgColorContainerHover,
          child: const TDImage(
            assetUrl: 'assets/img/image.png',
            type: TDImageType.fitWidth,
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
          child: TDText(
            '方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.square,
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
          child: TDText(
            '圆角方形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '圆形',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          assetUrl: 'assets/img/image.png',
          width: 72,
          height: 72,
          type: TDImageType.circle,
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
          child: TDText(
            '加载默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TDIcons.ellipsis,
                  size: 22,
                  color: TDTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '加载自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TDCircleIndicator(
                      color: TDTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TDCircleIndicator(
        //         color: TDTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          imgUrl: 'error',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        TDImage(
          imgUrl: 'error',
          errorWidget: TDText(
            '加载失败',
            forceVerticalCenter: true,
            font: TDTheme.of(context).fontBodyExtraSmall,
          ),
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '加载默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TDIcons.ellipsis,
                  size: 22,
                  color: TDTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '加载自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TDCircleIndicator(
                      color: TDTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TDCircleIndicator(
        //         color: TDTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          imgUrl: 'error',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        TDImage(
          imgUrl: 'error',
          errorWidget: TDText(
            '加载失败',
            forceVerticalCenter: true,
            font: TDTheme.of(context).fontBodyExtraSmall,
          ),
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '加载默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TDIcons.ellipsis,
                  size: 22,
                  color: TDTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '加载自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TDCircleIndicator(
                      color: TDTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TDCircleIndicator(
        //         color: TDTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          imgUrl: 'error',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        TDImage(
          imgUrl: 'error',
          errorWidget: TDText(
            '加载失败',
            forceVerticalCenter: true,
            font: TDTheme.of(context).fontBodyExtraSmall,
          ),
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '加载默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: Icon(
                  TDIcons.ellipsis,
                  size: 22,
                  color: TDTheme.of(context).textColorPlaceholder,
                ))),

        /// @tips 实际组件写法如下：上面仅为加载展示
        // const TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '加载自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        Container(
            height: 72,
            width: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(TDTheme.of(context).radiusDefault)),
            child: Container(
                alignment: Alignment.center,
                color: TDTheme.of(context).bgColorContainerHover,
                child: RotationTransition(
                    turns: animation,
                    alignment: Alignment.center,
                    child: TDCircleIndicator(
                      color: TDTheme.of(context).brandNormalColor,
                      size: 18,
                      lineWidth: 3,
                    )))),
        // 实际组件写法如下：上面仅为加载展示
        // TDImage(
        //   imgUrl:
        //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        //   loadingWidget: RotationTransition(
        //       turns: animation,
        //       alignment: Alignment.center,
        //       child: TDCircleIndicator(
        //         color: TDTheme.of(context).brandNormalColor,
        //         size: 18,
        //         lineWidth: 3,
        //       )),
        //   type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败默认提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        const TDImage(
          imgUrl: 'error',
          type: TDImageType.roundedSquare,
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
          child: TDText(
            '失败自定义提示',
            font: TDTheme.of(context).fontBodyMedium,
          ),
        ),
        TDImage(
          imgUrl: 'error',
          errorWidget: TDText(
            '加载失败',
            forceVerticalCenter: true,
            font: TDTheme.of(context).fontBodyExtraSmall,
          ),
          type: TDImageType.roundedSquare,
        ),
      ],
    );
  }
```

## API

1. [TDImage](#tdimage)

#### TDImage

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| alignment |  | Alignment.center |  |
| assetUrl | String? | - | 本地素材地址 |
| cacheHeight |  | - |  |
| cacheWidth |  | - |  |
| centerSlice |  | - |  |
| color |  | - |  |
| colorBlendMode |  | - |  |
| errorBuilder |  | - |  |
| errorWidget | Widget? | - | 失败自定义提示 |
| excludeFromSemantics |  | false |  |
| filterQuality |  | FilterQuality.low |  |
| fit | BoxFit? | - | 适配样式 |
| frameBuilder | ImageFrameBuilder? | - | 以下系统Image属性，释义请参考系统[Image]中注释 |
| gaplessPlayback |  | false |  |
| height | double? | - | 自定义高 |
| imageFile | File? | - | 图片文件路径 |
| imgUrl | String? | - | 图片地址 |
| isAntiAlias |  | false |  |
| key |  | - |  |
| loadingBuilder |  | - |  |
| loadingWidget | Widget? | - | 加载自定义提示 |
| matchTextDirection |  | false |  |
| opacity |  | - |  |
| repeat |  | ImageRepeat.noRepeat |  |
| semanticLabel |  | - |  |
| type | TDImageType | TDImageType.roundedSquare | 图片类型 |
| width | double? | - | 自定义宽 |

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
