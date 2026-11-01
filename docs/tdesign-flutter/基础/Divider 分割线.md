# Divider 分割线

> 用于分隔内容区域，区分信息的层次。

> 来源：[Divider 分割线](https://tdesign.tencent.com/flutter/components/divider)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 组件类型

**水平分割线**

```dart
TDivider()
```

**垂直分割线**

```dart
TDivider(
  layout: TDividerLayout.vertical,
)
```

**带文字的分割线**

```dart
TDivider(
  child: const Text('分割文字'),
)
```

## TDivider

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget? | - | 分割线上的文字或组件，text 与 widget 合并为 child | 否 |
| dashed | bool | false | 是否为虚线 | 否 |
| layout | TDividerLayout | TDividerLayout.horizontal | 布局方向，horizontal 为水平，vertical 为垂直 | 否 |
| align | TDividerAlign | TDividerAlign.center | 文字对齐方式，仅 layout 为 horizontal 时生效 | 否 |
| space | double? | - | 线与文字之间的间距 | 否 |
| color | Color? | - | 分割线颜色 | 否 |
| thickness | double? | - | 分割线粗细 | 否 |

## TDividerLayout

| 枚举值 | 说明 |
| --- | --- |
| horizontal | 水平分割线 |
| vertical | 垂直分割线 |

## TDividerAlign

| 枚举值 | 说明 |
| --- | --- |
| start | 文字靠左 |
| center | 文字居中 |
| end | 文字靠右 |

## 何时使用

需要在内容之间创建视觉分隔时使用，常用于表单、卡片、列表等场景中。

## 相似组件

- [Cell 单元格](<../数据展示/Cell 单元格.md>)：单元格之间自带分隔线。
- [Collapse 折叠面板](<../数据展示/Collapse 折叠面板.md>)：面板之间自带分隔线。