# Collapse 折叠面板

> 可以折叠/展开的内容区域。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/collapse)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_collapse_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_collapse_page.dart)

#### 1 Type 组件类型

Basic 基础折叠面板

```
  Widget _buildBasicCollapse(BuildContext context) {
    return TDCollapse(
      style: TDCollapseStyle.block,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _basicData[index].isExpanded = !isExpanded;
        });
      },
      children: _basicData.map((CollapseDataItem item) {
        return TDCollapsePanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text(item.headerValue);
          },
          isExpanded: item.isExpanded,
          body: const Text(randomString),
        );
      }).toList(),
    );
  }
```

with Operation Instructions 带操作说明

```
  Widget _buildCollapseWithOperationText(BuildContext context) {
    return TDCollapse(
      style: TDCollapseStyle.block,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _blockStyleWithOpText[index].isExpanded = !isExpanded;
        });
      },
      children: _blockStyleWithOpText.map((CollapseDataItem item) {
        return TDCollapsePanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text(item.headerValue);
          },
          expandIconTextBuilder: (BuildContext context, bool isExpanded) {
            return isExpanded ? '收起' : '展开';
          },
          isExpanded: item.isExpanded,
          body: const Text(randomString),
        );
      }).toList(),
    );
  }
```

Accordion 手风琴式

```
  Widget _buildAccordionCollapse(BuildContext context) {
    return TDCollapse.accordion(
      style: TDCollapseStyle.block,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _accordionData[index].isExpanded = !isExpanded;
        });
      },
      children: _accordionData.map((CollapseDataItem item) {
        return TDCollapsePanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text(item.headerValue);
          },
          isExpanded: item.isExpanded,
          body: const Text(randomString),
          value: item.expandedValue,
        );
      }).toList(),
    );
  }
```

#### 1 Style 组件样式

Block Style 通栏样式

```
  Widget _buildBlockStyleCollapse(BuildContext context) {
    return TDCollapse(
      style: TDCollapseStyle.block,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _blockStyleData[index].isExpanded = !isExpanded;
        });
      },
      children: _blockStyleData.map((CollapseDataItem item) {
        return TDCollapsePanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text(item.headerValue);
          },
          isExpanded: item.isExpanded,
          body: const Text(randomString),
        );
      }).toList(),
    );
  }
```

Card Style 卡片样式

```
  Widget _buildCardCollapse(BuildContext context) {
    return TDCollapse(
      style: TDCollapseStyle.card,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _cardStyleData[index].isExpanded = !isExpanded;
        });
      },
      children: _cardStyleData.map((CollapseDataItem item) {
        return TDCollapsePanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Text(item.headerValue);
          },
          isExpanded: item.isExpanded,
          body: const Text(randomString),
        );
      }).toList(),
    );
  }
```

## API

1. [TDCollapse](#tdcollapse)

#### TDCollapse

##### 简介

折叠面板列表组件，需配合 [TDCollapsePanel] 使用

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| animationDuration | Duration | kThemeAnimationDuration | 折叠面板列表的动画时长 |
| children | List | - | 折叠面板列表的子组件 |
| elevation | double | 0 | 折叠面板列表的阴影 |
| expansionCallback | ExpansionPanelCallback? | - | 折叠面板列表的回调函数； |
| key |  | - |  |
| style | TDCollapseStyle | TDCollapseStyle.block | 折叠面板列表的样式 |

##### 工厂构造方法

| 名称 | 说明 |
| --- | --- |
| TDCollapse.accordion |  |

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当信息较多，需要进行收纳时使用。

#### 常见用法

###### 经常用于信息种类较多的页面，将相对次要的信息收纳起来，让用户能够关注到页面中的主要信息或流程。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-1.png)

---

###### 在展示多条内容较长的同类型信息时，通常从中抽取出关键信息作为标题，收纳在手风琴式折叠面板中，便于用户检索和查看。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-2.png)

---

###### 在网站中，经常使用折叠面板作为分类导航，将页面进行归类、收纳在折叠面板中，展开后可点击跳转。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-3.png)

#### 推荐/慎用示例

###### 当信息层级较多时，不建议嵌套折叠面板，层级过多时建议审视信息结构或使用其它交互方式展示。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 不建议使用右箭头作为折叠面板的展开图标，用户可能会误把它认作跳转二级页面的入口。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [下拉菜单](<../反馈/DropdownMenu 下拉菜单.md>) | 当内容较多时，需要通过筛选快速定位某一类内容时使用。 |
