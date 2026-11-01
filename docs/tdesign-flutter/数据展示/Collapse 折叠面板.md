# Collapse 折叠面板

> 可以折叠/展开的内容区域。

> 来源：[Collapse 折叠面板](https://tdesign.tencent.com/flutter/components/collapse)
> 归档时间：2026-10-30T16:00:00+08:00

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
    return TCollapse(
      onExpansionChanged: (int index, bool isExpanded) {
        setState(() {
          _basicData[index].isExpanded = !isExpanded;
        });
      },
      children: _basicData.map((CollapseDataItem item) {
        return TCollapsePanel(
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
    return TCollapse(
      onExpansionChanged: (int index, bool isExpanded) {
        setState(() {
          _blockStyleWithOpText[index].isExpanded = !isExpanded;
        });
      },
      children: _blockStyleWithOpText.map((CollapseDataItem item) {
        return TCollapsePanel(
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
    return TCollapse<String>(
      mode: TCollapseMode.accordion,
      value: _accordionValue,
      onChanged: (value) => setState(() => _accordionValue = value),
      children: _accordionData.map((CollapseDataItem item) {
        return TCollapsePanel(
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
    return TCollapse(
      onExpansionChanged: (int index, bool isExpanded) {
        setState(() {
          _blockStyleData[index].isExpanded = !isExpanded;
        });
      },
      children: _blockStyleData.map((CollapseDataItem item) {
        return TCollapsePanel(
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
    return TCollapse(
      variant: TCollapseVariant.card,
      onExpansionChanged: (int index, bool isExpanded) {
        setState(() {
          _cardStyleData[index].isExpanded = !isExpanded;
        });
      },
      children: _cardStyleData.map((CollapseDataItem item) {
        return TCollapsePanel(
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

1. [TCollapse](#tcollapse)
2. [TCollapsePanel](#tcollapsepanel)

#### TCollapse

##### 简介

折叠面板列表组件，需配合 `TCollapsePanel` 使用

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| children | List<TCollapsePanel<T>> | - | 折叠面板列表 |
| mode | TCollapseMode | TCollapseMode.multiple | 多面板或手风琴模式 |
| variant | TCollapseVariant? | - | 通栏或卡片样式；未设置时读取组件 Theme |
| onExpansionChanged | ExpansionPanelCallback? | - | 点击面板时回调当前索引和点击前的展开状态 |
| animationDuration | Duration? | - | 动画时长；未设置时读取组件 Theme |
| elevation | double? | - | 阴影；未设置时读取组件 Theme |
| value | T? | - | 手风琴模式下当前展开面板的值 |
| onChanged | ValueChanged<T?>? | - | 手风琴模式下目标值变更回调 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |

#### TCollapsePanel

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| headerBuilder | ExpansionPanelHeaderBuilder | - | 标题构建器 |
| body | Widget | - | 面板内容 |
| key | Key? | - | 面板稳定标识 |
| isExpanded | bool | false | multiple 模式下是否展开 |
| disabled | bool | false | 是否禁用交互 |
| placement | TCollapsePlacement | TCollapsePlacement.bottom | 内容向上或向下展开 |
| semanticsLabel | String? | - | 复杂自定义标题的无障碍标签 |
| expandIconTextBuilder | TCollapseIconTextBuilder? | - | 展开图标旁说明文案 |
| value | T? | - | 手风琴模式下的唯一标识 |
| backgroundColor | Color? | - | 面板背景色 |

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
