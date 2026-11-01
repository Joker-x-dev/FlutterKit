# Cell 单元格

> 一行内容/功能的垂直排列方式。一行项目左侧为主要内容展示区域，右侧可增加更多操作内容。

> 来源：[Cell 单元格](https://tdesign.tencent.com/flutter/components/cell)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_cell_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_cell_page.dart)

#### 1 组件类型

单行单元格

```
Widget _buildSimple(BuildContext context) {
  // 可统一修改样式
  var style = TCellStyle(context: context);
  return TCellGroup(
    style: style,
    cells: [
      // 可单独修改样式
      TCell(
        arrow: true,
        title: '单行标题',
        style: TCellStyle.cellStyle(context),
      ),
      TCell(
        arrow: true,
        title: '单行标题',
        required: true,
        onClick: (cell) {
          print('单行标题');
        },
        onLongPress: (cell) {
          print('onLongPress 单行标题');
        },
      ),
      const TCell(
        arrow: true,
        title: '单行标题',
        noteWidget: TBadge(TBadgeType.message, count: '8'),
      ),
      const TCell(
        arrow: false,
        title: '单行标题',
        rightIconWidget: TSwitch(isOn: true),
      ),
      const TCell(
        arrow: true,
        title: '单行标题',
        note: '辅助信息',
      ),
      const TCell(
        arrow: true,
        title: '单行标题',
        leftIcon: TIcons.lock_on,
      ),
      const TCell(arrow: false, title: '单行标题'),
    ],
  );
}
```

多行单元格

```
Widget _buildDesSimple(BuildContext context) {
  return const TCellGroup(
    cells: [
      TCell(arrow: true, title: '单行标题', description: '一段很长很长的内容文字'),
      TCell(
          arrow: true,
          title: '单行标题',
          description: '一段很长很长的内容文字',
          required: true),
      TCell(
          arrow: true,
          title: '单行标题',
          description: '一段很长很长的内容文字',
          noteWidget: TBadge(TBadgeType.message, count: '8')),
      TCell(
          arrow: false,
          title: '单行标题',
          description: '一段很长很长的内容文字',
          rightIconWidget: TSwitch(isOn: true)),
      TCell(
          arrow: true, title: '单行标题', description: '一段很长很长的内容文字', note: '辅助信息'),
      TCell(
          arrow: true,
          title: '单行标题',
          description: '一段很长很长的内容文字一段很长很长的内容文字一段很长很长的内',
          leftIcon: TIcons.lock_on),
      TCell(
          arrow: false,
          title: '单行标题',
          description: '一段很长很长的内容文字一段很长很长的内容文字一段很长很长的内'),
      TCell(
          arrow: false,
          title: '多行高度不定，长文本自动换行，该选项的描述是一段很长的内容',
          description: '一段很长很长的内容文字一段很长很长的内容文字一段很长很长的内'),
      TCell(
        arrow: true,
        title: '多行带头像',
        description: '一段很长很长的内容文字一段很长很长的内容文字一段很长很长的内容',
        image: AssetImage('assets/img/t_avatar_1.png'),
      ),
      // NetworkImage('https://tdesign.gtimg.com/mobile/demos/avatar1.png')),
      TCell(
        arrow: true,
        title: '多行带图片',
        description: '一段很长很长的内容文字',
        image: AssetImage('assets/img/image.png'),
        imageCircle: 8,
      ),
    ],
  );
}
```

#### 1 组件样式

卡片单元格

```
Widget _buildCard(BuildContext context) {
  return const TCellGroup(
    theme: TCellGroupTheme.cardTheme,
    cells: [
      TCell(arrow: true, title: '单行标题'),
      TCell(arrow: true, title: '单行标题', required: true),
      TCell(arrow: true, title: '单行标题'),
    ],
  );
}
```

## API

1. [TCell](#tcell)
2. [TCellGroup](#tcellgroup)
3. [TCellStyle](#tcellstyle)
4. [TCellGroupTheme](#tcellgrouptheme)
5. [TCellAlign](#tcellalign)
6. [CellBuilder](#cellbuilder)
7. [TCellClick](#tcellclick)

#### TCell

##### 简介

单元格组件

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| align | TCellAlign? | TCellAlign.middle | 内容的对齐方式，默认居中对齐。可选项：top/middle/bottom |
| arrow | bool? | false | 是否显示右侧箭头 |
| bordered | bool? | true | 是否显示下边框，仅在TCellGroup组件下起作用 |
| description | String? | - | 下方内容描述文字 |
| descriptionWidget | Widget? | - | 下方内容描述组件 |
| disabled | bool? | false | 禁用 |
| height | double? | - | 高度 |
| hover | bool? | true | 是否开启点击反馈 |
| image | ImageProvider? | - | 主图 |
| imageCircle | double? | 50 | 主图圆角，默认50（圆形） |
| imageSize | double? | - | 主图尺寸 |
| imageWidget | Widget? | - | 主图组件 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| leftIcon | IconData? | - | 左侧图标，出现在单元格标题的左侧 |
| leftIconWidget | Widget? | - | 左侧图标组件 |
| note | String? | - | 和标题同行的说明文字 |
| noteMaxLine | int | 1 | 说明文字组件 最大行数 |
| noteMaxWidth | double? | - | 说明文字组件 最大宽度，超过部分显示省略号，防止文字溢出 |
| noteWidget | Widget? | - | 说明文字组件 |
| onClick | TCellClick? | - | 点击事件 |
| onLongPress | TCellClick? | - | 长按事件 |
| required | bool? | false | 是否显示表单必填星号 |
| rightIcon | IconData? | - | 最右侧图标 |
| rightIconWidget | Widget? | - | 最右侧图标组件 |
| showBottomBorder | bool? | false | 是否显示下边框（建议TCellGroup组件下false，避免与bordered重叠） |
| style | TCellStyle? | - | 自定义样式 |
| title | String? | - | 标题 |
| titleWidget | Widget? | - | 标题组件 |

#### TCellGroup

##### 简介

单元格组组件

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| bordered | bool? | false | 是否显示组边框 |
| builder | CellBuilder? | - | cell构建器，可自定义cell父组件，如Dismissible |
| cells | List | - | 单元格列表 |
| isShowLastBordered | bool? | false | 是否显示最后一个cell的下边框 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| scrollable | bool? | false | 可滚动 |
| style | TCellStyle? | - | 自定义样式 |
| theme | TCellGroupTheme? | TCellGroupTheme.defaultTheme | 单元格组风格。可选项：default/card |
| title | String? | - | 单元格组标题 |
| titleWidget | Widget? | - | 单元格组标题组件 |

#### TCellStyle

##### 简介

单元格组件样式

##### 工厂构造方法

###### TCellStyle.cellStyle

生成单元格默认样式

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| context | BuildContext | - | 传递context，会生成默认样式 |

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| arrowColor | Color? | - | 箭头颜色 |
| backgroundColor | Color? | - | 默认状态背景颜色 |
| borderedColor | Color? | - | 单元格边框颜色 |
| cardBorderRadius | BorderRadius? | - | 卡片模式边框圆角 |
| cardPadding | EdgeInsets? | - | 卡片模式内边距 |
| clickBackgroundColor | Color? | - | 点击状态背景颜色 |
| context | BuildContext? | - | 传递context，会生成默认样式 |
| descriptionStyle | TextStyle? | - | 内容描述文字样式 |
| groupBorderedColor | Color? | - | 单元格组边框颜色 |
| groupTitleStyle | TextStyle? | - | 单元组标题文字样式 |
| leftIconColor | Color? | - | 左侧图标颜色 |
| noteStyle | TextStyle? | - | 说明文字样式 |
| padding | EdgeInsets? | - | 单元格内边距 |
| requiredStyle | TextStyle? | - | 必填星号文字样式 |
| rightIconColor | Color? | - | 右侧图标颜色 |
| titleBackgroundColor | Color? | - | 单元格组标题背景颜色 |
| titlePadding | EdgeInsets? | - | 单元格组标题内边距 |
| titleStyle | TextStyle? | - | 标题文字样式 |

#### TCellGroupTheme

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| defaultTheme | - |
| cardTheme | - |

#### TCellAlign

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| top | - |
| middle | - |
| bottom | - |

#### CellBuilder

##### 类型定义

```dart
typedef CellBuilder = Widget Function(BuildContext context, TCell cell, int index);
```

#### TCellClick

##### 类型定义

```dart
typedef TCellClick = void Function(TCell cell);
```

## 设计指南

1. [常见用法](#常见用法)
2. [推荐/慎用示例](#推荐-慎用示例)
3. [相似组件](#相似组件)

#### 常见用法

###### 常用作内容详情入口或功能入口的平铺陈列。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-2.png)

---

###### 常用作同类型同格式信息项平铺陈列。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-3.png)

#### 推荐/慎用示例

###### 作为入口时，不建议承载过多过复杂的内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 作为入口时，不建议在一个单元格内承载其他操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [宫格](https://tdesign.tencent.com/flutter/components/grid) | 当需要展示多个功能或信息入口，且这些入口没有明显的优先级时使用。 |
