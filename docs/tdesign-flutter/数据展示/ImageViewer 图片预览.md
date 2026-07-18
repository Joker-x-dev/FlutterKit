# ImageViewer 图片预览

> 用于图片内容的缩略展示与查看。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/image-viewer)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_image_viewer_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_image_viewer_page.dart)

#### 1 组件类型

基础图片预览

```
  Widget _basicImageViewer(BuildContext context) {
    return TDButton(
      type: TDButtonType.ghost,
      theme: TDButtonTheme.primary,
      isBlock: true,
      size: TDButtonSize.large,
      text: '基础图片预览',
      onTap: () {
        TDImageViewer.showImageViewer(context: context, images: images);
      },
    );
  }
```

带操作图片预览

```
  Widget _actionImageViewer(BuildContext context) {
    return TDButton(
      type: TDButtonType.ghost,
      theme: TDButtonTheme.primary,
      isBlock: true,
      size: TDButtonSize.large,
      text: '带操作图片预览',
      onTap: () {
        TDImageViewer.showImageViewer(
          context: context,
          images: images,
          showIndex: true,
          deleteBtn: true,
        );
      },
    );
  }
```

## API

1. [TDImageViewerWidget](#tdimageviewerwidget)
2. [TDImageViewer](#tdimageviewer)

#### TDImageViewerWidget

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| autoplay | bool? | - | 图片轮播是否自动播放 |
| bgColor | Color? | - | 背景色 |
| closeBtn | bool? | - | 是否展示关闭按钮 |
| defaultIndex | int? | - | 默认预览图片所在的下标 |
| deleteBtn | bool? | - | 是否显示删除操作 |
| duration | int? | - | 自动播放间隔 |
| height | double? | - | 图片高度 |
| iconColor | Color? | - | 图标颜色 |
| ignoreDeleteError | bool? | false | 是否忽略单张图片删除错误提示 |
| images | List | - | 图片数组 |
| indexStyle | TextStyle? | - | 页码样式 |
| key |  | - |  |
| labels | List? | - | 图片描述 |
| labelStyle | TextStyle? | - | label文字样式 |
| leftItemBuilder | LeftItemBuilder? | - | 左侧自定义操作 |
| loop | bool? | - | 图片是否循环 |
| navBarBgColor | Color? | - | 导航栏背景色 |
| onClose | OnClose? | - | 关闭点击 |
| onDelete | OnDelete? | - | 删除点击 |
| onIndexChange | OnIndexChange? | - | 预览图片切换回调 |
| onLongPress | OnLongPress? | - | 长按图片 |
| onTap | OnImageTap? | - | 点击图片 |
| rightItemBuilder | RightItemBuilder? | - | 右侧自定义操作 |
| showIndex | bool? | - | 是否显示页码 |
| width | double? | - | 图片宽度 |

#### TDImageViewer

##### 静态方法

| 名称 | 返回类型 | 说明 |
| --- | --- | --- |
| `showImageViewer` | `void` | 显示图片预览。 |

###### `showImageViewer`

显示图片预览。

```dart
static void showImageViewer({
  required BuildContext context,
  required List<dynamic> images,
  List<String>? labels,
  bool? closeBtn = true,
  bool? deleteBtn = false,
  bool? showIndex = false,
  bool? loop = false,
  bool? autoplay = false,
  int? duration,
  Color? bgColor,
  Color? navBarBgColor,
  Color? iconColor,
  TextStyle? labelStyle,
  TextStyle? indexStyle,
  Color? modalBarrierColor,
  bool? barrierDismissible,
  int? defaultIndex,
  double? width,
  double? height,
  OnIndexChange? onIndexChange,
  OnClose? onClose,
  OnDelete? onDelete,
  bool? ignoreDeleteError,
  OnImageTap? onTap,
  OnLongPress? onLongPress,
  LeftItemBuilder? leftItemBuilder,
  RightItemBuilder? rightItemBuilder,
});
```

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当需要对展示的图片进行快速查看，以及在查看时存在放大、缩小、删除等操作诉求时使用。

#### 组件搭配使用

###### 图片预览与[图片](<Image 图片.md>)组合使用，通过图片作为缩略图，点击后进行图片预览。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image-viewer/image-viewer-1.png)

---

###### 当使用带删除操作的图片预览组件时，可与[动作面板](<../反馈/ActionSheet 动作面板.md>)组合使用，对删除操作进行二次确认。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image-viewer/image-viewer-2.png)

#### 推荐/慎用示例

###### 在可点击进入详情的卡片入口中，不建议针对图片添加图片预览能力。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image-viewer/image-viewer-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [图片](<Image 图片.md>) | 当需要对图像内容进行陈列、展示，以便用户快速了解图像信息时使用。 |
