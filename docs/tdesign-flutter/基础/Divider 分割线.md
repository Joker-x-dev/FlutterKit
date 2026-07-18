# Divider 分割线

> 用于分割、组织、细化有一定逻辑的组织元素内容和页面结构。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/divider)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_divider_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_divider_page.dart)

#### 1 组件类型

水平分割线

```
  Widget _verticalDivider(BuildContext context) {
    return Container(
      height: 20,
      alignment: Alignment.center,
      child: const TDDivider(),
    );
  }
```

带文字水平分割线

```
  Widget _verticalTextDivider(BuildContext context) {
    return const Wrap(
      runSpacing: 20,
      children: [
        TDDivider(
          text: '文字信息',
          alignment: TextAlignment.left,
        ),
        TDDivider(
          text: '文字信息',
          alignment: TextAlignment.center,
        ),
        TDDivider(
          text: '文字信息',
          alignment: TextAlignment.right,
        ),
      ],
    );
  }
```

垂直分割

```
  Widget _horizontalTextDivider(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TDText(
            '文字信息',
            textColor: TDTheme.of(context).textColorPlaceholder,
          ),
          const TDDivider(
            width: 0.5,
            height: 12,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          TDText('文字信息', textColor: TDTheme.of(context).textColorPlaceholder),
          const TDDivider(
            width: 0.5,
            height: 12,
            margin: EdgeInsets.symmetric(horizontal: 8),
            isDashed: true,
            direction: Axis.vertical,
          ),
          TDText('文字信息', textColor: TDTheme.of(context).textColorPlaceholder),
        ],
      ),
    );
  }
```

#### 1 组件状态

虚线样式

```
  Widget _dashedDivider(BuildContext context) {
    return const Wrap(
      runSpacing: 20,
      children: [
        TDDivider(
          isDashed: true,
        ),
        TDDivider(
          text: '文字信息',
          alignment: TextAlignment.left,
          isDashed: true,
        ),
        TDDivider(
          text: '文字信息',
          alignment: TextAlignment.center,
          isDashed: true,
        ),
        TDDivider(
          text: '文字信息',
          alignment: TextAlignment.right,
          isDashed: true,
        ),
      ],
    );
  }
```

## API

1. [TDDivider](#tddivider)

#### TDDivider

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| alignment | TextAlignment | TextAlignment.center | 文字位置 |
| color | Color? | - | 线条颜色 |
| direction | Axis | Axis.horizontal | 方向，竖直虚线必须传 |
| gapPadding | EdgeInsetsGeometry? | - | 线条和中间文本之间的填充 |
| height | double | 0.5 | 高度，横向线条使用 |
| hideLine | bool | false | 隐藏线条，使用纯文本分割 |
| isDashed | bool | false | 是否为虚线 |
| key |  | - |  |
| margin | EdgeInsetsGeometry? | - | 外部填充 |
| text | String? | - | 文本字符串，使用默认样式 |
| textStyle | TextStyle? | - | 自定义文本样式 |
| widget | Widget? | - | 中间控件，可自定义样式 |
| width | double? | - | 宽度，需要竖向线条时使用 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

为了区分内容与内容之间的分组、层级关系时可使用。

#### 与页面布局相关

###### 通栏分割线：横向贯穿整个页面，一般为了区分更加独立性的内容信息，让信息分隔的更明显，更加独立性。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-1.png)

---

###### 内嵌分割线：一般会在左侧或者右侧预留缺口，目的来区分统一模块下的相关内容，目的是为了让用户浏览大量相关内容时，更加高效。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-2.png)

---

###### 组合分割线：通栏分割线与内嵌分割线组合布局。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-3.png)

#### 推荐/慎用示例

###### 当有明显的留白或副标题已经对内容起到分割作用时，要避免过度使用分割线导致的视觉干扰。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
