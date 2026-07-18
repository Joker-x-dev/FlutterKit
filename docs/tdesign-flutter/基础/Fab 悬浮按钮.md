# Fab 悬浮按钮

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/fab)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_fab_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_fab_page.dart)

#### 1 组件类型

Icon Fab 纯图标悬浮按钮

```
  Widget _buildPureIconFab(BuildContext context) {
    return _buildRowDemo([
      const TDFab(
        theme: TDFabTheme.primary,
      )
    ]);
  }
```

Icon Fab with Text 图标加文字悬浮按钮

```
  Widget _buildTextFab(BuildContext context) {
    return _buildRowDemo([
      const TDFab(
        theme: TDFabTheme.primary,
        text: 'Floating',
      )
    ]);
  }
```

#### 1 组件状态

Fab Theme 悬浮按钮主题

```
  Widget _buildThemeFab(BuildContext context) {
    return _buildRowDemoWidthDescription([
      {
        'component': const TDFab(
          theme: TDFabTheme.primary,
        ),
        'desc': 'Primary'
      },
      {
        'component': const TDFab(
          theme: TDFabTheme.defaultTheme,
        ),
        'desc': 'Default'
      },
      {
        'component': const TDFab(
          theme: TDFabTheme.light,
        ),
        'desc': 'Light'
      },
      {
        'component': const TDFab(
          theme: TDFabTheme.danger,
        ),
        'desc': 'Danger'
      },
    ]);
  }
```

Fab Shape 悬浮按钮形状

```
  Widget _buildShapeFab(BuildContext context) {
    return _buildRowDemoWidthDescription([
      {
        'component': const TDFab(
          theme: TDFabTheme.primary,
          shape: TDFabShape.circle,
        ),
        'desc': 'Circle'
      },
      {
        'component': const TDFab(
          theme: TDFabTheme.primary,
          shape: TDFabShape.square,
        ),
        'desc': 'Square'
      },
    ]);
  }
```

Fab Size 悬浮按钮尺寸

```
  Widget _buildSizeFab(BuildContext context) {
    return _buildRowDemoWidthDescription([
      {
        'component': const TDFab(
          theme: TDFabTheme.primary,
          size: TDFabSize.large,
        ),
        'desc': 'Large'
      },
      {
        'component': const TDFab(
          theme: TDFabTheme.primary,
          size: TDFabSize.medium,
        ),
        'desc': 'Medium'
      },
      {
        'component': const TDFab(
          theme: TDFabTheme.primary,
          size: TDFabSize.small,
        ),
        'desc': 'Small'
      },
      {
        'component': const TDFab(
          theme: TDFabTheme.primary,
          size: TDFabSize.extraSmall,
        ),
        'desc': 'extraSmall'
      },
    ]);
  }
```

## API

1. [TDFab](#tdfab)

#### TDFab

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| icon | Icon? | - | 图标 |
| key |  | - |  |
| onClick | VoidCallback? | - | 点击事件 |
| shape | TDFabShape | TDFabShape.circle | 形状 |
| size | TDFabSize | TDFabSize.large | 大小 |
| text | String? | - | 文本 |
| theme | TDFabTheme | TDFabTheme.defaultTheme | 主题 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当某个操作为全局操作，且为用户高频/业务强推的操作时可使用。

#### 与页面布局相关

###### 为了避免遮挡页面中重要内容，通常将悬浮按钮放置于页面右下角，当页面中没有底部标签栏时，也可以考虑放置于中下位置。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-2.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-3.png)

#### 组件搭配使用

###### 悬浮按钮与[动作面板](<../反馈/ActionSheet 动作面板.md>)组合使用，当触发悬浮按钮涉及的任务通过若干种方式达成，可以用动态面板来承载这若干种方式的操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-4.png)

#### 推荐/慎用示例

###### 通常情况下页面中建议只使用一个悬浮按钮；若页面以地图、看板为主要场景，需要出现多个悬浮按钮时，建议通过样式区分主次、层级关系。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 图标加文字悬浮按钮上的字数建议精简，控制在2-4个字左右，避免遮挡过多页面内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [按钮](<Button 按钮.md>) | 当前流程的结束或新流程的开启需要用户点击触发时使用。 |
| [返回顶部](<../导航/BackTop 返回顶部.md>) | 当页面内容过长，用户有快速返回到页面顶部的诉求时使用。 |
