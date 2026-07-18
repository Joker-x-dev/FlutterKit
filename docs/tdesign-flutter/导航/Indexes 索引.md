# Indexes 索引

> 用于页面中信息快速检索，可以根据目录中的页码快速找到所需的内容。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/indexes)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_indexes_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_indexes_page.dart)

#### 1 组件类型

基础索引类型

```
Widget _buildSimple(BuildContext context) {
  final renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  final indexList = _list.map((item) => item['index'] as String).toList();
  return TDButton(
    text: '基础用法',
    isBlock: true,
    size: TDButtonSize.large,
    theme: TDButtonTheme.primary,
    type: TDButtonType.outline,
    onTap: () {
      Navigator.of(context).push(
        TDSlidePopupRoute(
          slideTransitionFrom: SlideTransitionFrom.right,
          modalTop: renderBox?.size.height,
          builder: (context) {
            return TDIndexes(
              indexList: indexList,
              builderContent: (context, index) {
                final list = _list.firstWhere(
                        (element) => element['index'] == index)['children']
                    as List;
                return TDCellGroup(
                  cells: list
                      .map((e) => TDCell(
                            title: e,
                          ))
                      .toList(),
                );
              },
            );
          },
        ),
      );
    },
  );
}
```


```
Widget _buildSimple(BuildContext context) {
  final renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  final indexList = _list.map((item) => item['index'] as String).toList();
  return TDButton(
    text: '基础用法',
    isBlock: true,
    size: TDButtonSize.large,
    theme: TDButtonTheme.primary,
    type: TDButtonType.outline,
    onTap: () {
      Navigator.of(context).push(
        TDSlidePopupRoute(
          slideTransitionFrom: SlideTransitionFrom.right,
          modalTop: renderBox?.size.height,
          builder: (context) {
            return TDIndexes(
              indexList: indexList,
              builderContent: (context, index) {
                final list = _list.firstWhere(
                        (element) => element['index'] == index)['children']
                    as List;
                return TDCellGroup(
                  cells: list
                      .map((e) => TDCell(
                            title: e,
                          ))
                      .toList(),
                );
              },
            );
          },
        ),
      );
    },
  );
}
```

#### 1 组件样式

其他索引类型

```
Widget _buildOther(BuildContext context) {
  final renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  final indexList = _list.map((item) => item['index'] as String).toList();
  return TDButton(
    text: '胶囊索引',
    isBlock: true,
    size: TDButtonSize.large,
    theme: TDButtonTheme.primary,
    type: TDButtonType.outline,
    onTap: () {
      Navigator.of(context).push(
        TDSlidePopupRoute(
          slideTransitionFrom: SlideTransitionFrom.right,
          modalTop: renderBox?.size.height,
          builder: (context) {
            return TDIndexes(
              indexList: indexList,
              capsuleTheme: true,
              builderContent: (context, index) {
                final list = _list.firstWhere(
                        (element) => element['index'] == index)['children']
                    as List;
                return TDCellGroup(
                  cells: list
                      .map((e) => TDCell(
                            title: e,
                          ))
                      .toList(),
                );
              },
            );
          },
        ),
      );
    },
  );
}
```


```
Widget _buildOther(BuildContext context) {
  final renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  final indexList = _list.map((item) => item['index'] as String).toList();
  return TDButton(
    text: '胶囊索引',
    isBlock: true,
    size: TDButtonSize.large,
    theme: TDButtonTheme.primary,
    type: TDButtonType.outline,
    onTap: () {
      Navigator.of(context).push(
        TDSlidePopupRoute(
          slideTransitionFrom: SlideTransitionFrom.right,
          modalTop: renderBox?.size.height,
          builder: (context) {
            return TDIndexes(
              indexList: indexList,
              capsuleTheme: true,
              builderContent: (context, index) {
                final list = _list.firstWhere(
                        (element) => element['index'] == index)['children']
                    as List;
                return TDCellGroup(
                  cells: list
                      .map((e) => TDCell(
                            title: e,
                          ))
                      .toList(),
                );
              },
            );
          },
        ),
      );
    },
  );
}
```

## API

1. [TDIndexes](#tdindexes)
2. [TDIndexesAnchor](#tdindexesanchor)
3. [TDIndexesList](#tdindexeslist)

#### TDIndexes

##### 简介

索引

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| builderAnchor | Widget? Function(BuildContext context, String index, bool isPinnedToTop)? | - | 锚点自定义构建 |
| builderContent | Widget? Function(BuildContext context, String index) | - | 内容自定义构建 |
| builderIndex | Widget Function(BuildContext context, String index, bool isActive)? | - | 索引文本自定义构建，包括索引激活左侧提示 |
| capsuleTheme | bool? | false | 锚点是否为胶囊式样式 |
| indexList | List? | - | 索引字符列表。不传默认 A-Z |
| indexListMaxHeight | double? | 0.8 | 索引列表最大高度（父容器高度的百分比，默认 0.8） |
| key |  | - |  |
| onChange | void Function(String index)? | - | 索引发生变更时触发事件 |
| onSelect | void Function(String index)? | - | 点击侧边栏时触发事件 |
| reverse | bool? | false | 反方向滚动置顶 |
| scrollController | ScrollController? | - | 滚动控制器 |
| sticky | bool? | true | 锚点是否吸顶 |
| stickyOffset | double? | 0 | 锚点吸顶时与顶部的距离 |

#### TDIndexesAnchor

##### 简介

索引锚点

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| activeIndex | ValueNotifier | - | 选中索引 |
| builderAnchor | Widget? Function(BuildContext context, String index, bool isPinnedToTop)? | - | 索引锚点构建 |
| capsuleTheme | bool | - | 是否为胶囊式样式 |
| key |  | - |  |
| sticky | bool | - | 索引是否吸顶 |
| text | String | - | 锚点文本 |

#### TDIndexesList

##### 简介

索引

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| activeIndex | ValueNotifier | - | 选中索引 |
| builderIndex | Widget Function(BuildContext context, String index, bool isActive)? | - | 索引文本自定义构建，包括索引激活左侧提示 |
| indexList | List | - | 索引字符列表。不传默认 A-Z |
| indexListMaxHeight | double | 0.8 | 索引列表最大高度（父容器高度的百分比，默认0.8） |
| key |  | - |  |
| onSelect | void Function(String newIndex, String oldIndex) | - | 点击侧边栏时触发事件 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当数据项较多时，为方便用户快速找到目标数据项时使用。

#### 组件搭配使用

###### 索引与[单选框](<../输入/Radio 单选框.md>)、[多选框](<../输入/CheckBox 多选框.md>)组合使用，在选择数据的场景配合索引有利于用户快速找到目标选项。

![](https://tdesign.gtimg.com/site/design/mobile-guide/indexes/indexes-1.png)

#### 推荐/慎用示例

###### 索引项需要跟数据项小标题保持一致。

![](https://tdesign.gtimg.com/site/design/mobile-guide/indexes/indexes-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/indexes/indexes-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 索引项排序应具备一定的逻辑相关性。

![](https://tdesign.gtimg.com/site/design/mobile-guide/indexes/indexes-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/indexes/indexes-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [侧边栏](<SideBar 侧边栏.md>) | 当内容项数量较多，需要用户根据品类快速选择到目标内容项时使用。 |
