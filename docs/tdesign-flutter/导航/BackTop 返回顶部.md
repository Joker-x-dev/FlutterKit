# BackTop 返回顶部

> 用于当页面过长往下滑动时，帮助用户快速回到页面顶部。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/back-top)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_backtop_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_backtop_page.dart)

#### 1 组件类型

圆形返回顶部

```
  Widget _buildCircleBackTop(BuildContext context) {
    return getCustomButton(context, '圆形返回顶部', () {
      setState(() {
        showBackTop = true;
        if (controller.hasClients) {
          controller.jumpTo(500);
        }
        style = TDBackTopStyle.circle;
      });
    });
  }
```

半圆形返回顶部

```
  Widget _buildHalfCircleBackTop(BuildContext context) {
    return Column(
      children: [
        getCustomButton(context, '半圆形返回顶部', () {
          setState(() {
            showBackTop = true;
            if (controller.hasClients) {
              controller.jumpTo(500);
            }
            style = TDBackTopStyle.halfCircle;
          });
        }),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: Wrap(
            spacing: 16,
            runSpacing: 24,
            children: List.generate(6, (_) => getDemoBox(context)),
          ),
        )
      ],
    );
  }
```

## API

1. [TDBackTop](#tdbacktop)

#### TDBackTop

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| controller | ScrollController? | - | 页面滚动的控制器 |
| key |  | - |  |
| onClick | VoidCallback? | - | 按钮点击事件 |
| showText | bool | false | 是否展示文字 |
| style | TDBackTopStyle | TDBackTopStyle.circle | 样式，圆形和半圆 |
| theme | TDBackTopTheme | TDBackTopTheme.light | 主题 |

## 设计指南

1. [何时使用](#何时使用)
2. [页面布局相关](#页面布局相关)
3. [常见用法](#常见用法)
4. [相似组件](#相似组件)

#### 何时使用

当页面内容过长，用户有快速返回到页面顶部的诉求时使用

#### 页面布局相关

###### 常驻于页面的右下角，方便用户随时点击返回

![](https://tdesign.gtimg.com/site/design/mobile-guide/back-top/back-top-1.png)

---

#### 常见用法

###### 当用户滚动页面时，为了不影响到用户对内容的浏览体验，建议可将返回顶部按钮最小化或像右侧收起，当用户停止滚动时，再完全显示按钮

![](https://tdesign.gtimg.com/site/design/mobile-guide/back-top/back-top-2.gif)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [悬浮按钮](<../基础/Fab 悬浮按钮.md>) | 当某个操作为全局操作，且为用户高频/业务强推的操作时可使用。 |
