# Drawer 抽屉

> 用作一组平行关系页面/内容的切换器，相较于Tab，同屏可展示更多的选项数量。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/drawer)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_drawer_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_drawer_page.dart)

#### 1 组件类型

基础抽屉

```
Widget _buildBaseSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '基础抽屉',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        items: List.generate(
            drawerItemLength, (index) => TDDrawerItem(title: '菜单${index + 1}')),
        onItemClick: (index, item) {
          print('drawer item被点击，index：$index，title：${item.title}');
        },
      );
    },
  );
}
```


```
Widget _buildBaseSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '基础抽屉',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        items: List.generate(
            drawerItemLength, (index) => TDDrawerItem(title: '菜单${index + 1}')),
        onItemClick: (index, item) {
          print('drawer item被点击，index：$index，title：${item.title}');
        },
      );
    },
  );
}
```

带图标抽屉

```
Widget _buildIconSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '带图标抽屉',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        items: List.generate(
            drawerItemLength,
            (index) => TDDrawerItem(
                title: '菜单${index + 1}', icon: const Icon(TDIcons.app))),
      );
    },
  );
}
```


```
Widget _buildIconSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '带图标抽屉',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        items: List.generate(
            drawerItemLength,
            (index) => TDDrawerItem(
                title: '菜单${index + 1}', icon: const Icon(TDIcons.app))),
      );
    },
  );
}
```

#### 1 组件样式

带标题抽屉

```
Widget _buildTitleSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '带图标抽屉',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        title: '标题',
        placement: TDDrawerPlacement.left,
        items: List.generate(
            drawerItemLength, (index) => TDDrawerItem(title: '菜单${index + 1}')),
      );
    },
  );
}
```


```
Widget _buildTitleSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '带图标抽屉',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        title: '标题',
        placement: TDDrawerPlacement.left,
        items: List.generate(
            drawerItemLength, (index) => TDDrawerItem(title: '菜单${index + 1}')),
      );
    },
  );
}
```

带底部插槽样式

```
Widget _buildBottomSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '带底部插槽样式',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        title: '标题',
        placement: TDDrawerPlacement.left,
        items: List.generate(
            drawerItemLength, (index) => TDDrawerItem(title: '菜单${index + 1}')),
        footer: const TDButton(
          text: '操作',
          type: TDButtonType.outline,
          width: double.infinity,
          size: TDButtonSize.large,
        ),
      );
    },
  );
}
```


```
Widget _buildBottomSimple(BuildContext context) {
  /// 获取navBar尺寸
  var renderBox = navBarkey.currentContext?.findRenderObject() as RenderBox?;
  return TDButton(
    text: '带底部插槽样式',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDDrawer(
        context,
        visible: true,
        drawerTop: renderBox?.size.height,
        title: '标题',
        placement: TDDrawerPlacement.left,
        items: List.generate(
            drawerItemLength, (index) => TDDrawerItem(title: '菜单${index + 1}')),
        footer: const TDButton(
          text: '操作',
          type: TDButtonType.outline,
          width: double.infinity,
          size: TDButtonSize.large,
        ),
      );
    },
  );
}
```

## API

1. [TDDrawer](#tddrawer)
2. [TDDrawerWidget](#tddrawerwidget)
3. [TDDrawerItem](#tddraweritem)

#### TDDrawer

##### 简介

抽屉组件

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 组件背景颜色 |
| bordered | bool? | true | 是否显示边框 |
| closeOnOverlayClick | bool? | true | 点击蒙层时是否关闭抽屉 |
| contentWidget | Widget? | - | 自定义内容，优先级高于[items]/[footer]/[title] |
| context | BuildContext | context | 上下文 |
| drawerTop | double? | - | 距离顶部的距离 |
| footer | Widget? | - | 抽屉的底部 |
| hover | bool? | true | 是否开启点击反馈 |
| isShowLastBordered | bool? | true | 是否显示最后一行分割线 |
| items | List? | - | 抽屉里的列表项 |
| onClose | VoidCallback? | - | 关闭时触发 |
| onItemClick | TDDrawerItemClickCallback? | - | 点击抽屉里的列表项触发 |
| placement | TDDrawerPlacement? | TDDrawerPlacement.right | 抽屉方向 |
| showOverlay | bool? | true | 是否显示遮罩层 |
| style | TDCellStyle? | - | 列表自定义样式 |
| title | String? | - | 抽屉的标题 |
| titleWidget | Widget? | - | 抽屉的标题组件 |
| visible | bool? | - | 组件是否可见 |
| width | double? | 280 | 宽度 |

#### TDDrawerWidget

##### 简介

抽屉内容组件
可用于 Scaffold 中的 drawer 属性

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 组件背景颜色 |
| bordered | bool? | true | 是否显示边框 |
| contentWidget | Widget? | - | 自定义内容，优先级高于[items]/[footer]/[title] |
| footer | Widget? | - | 抽屉的底部 |
| hover | bool? | true | 是否开启点击反馈 |
| isShowLastBordered | bool? | true | 是否显示最后一行分割线 |
| items | List? | - | 抽屉里的列表项 |
| key |  | - |  |
| onItemClick | TDDrawerItemClickCallback? | - | 点击抽屉里的列表项触发 |
| style | TDCellStyle? | - | 列表自定义样式 |
| title | String? | - | 抽屉的标题 |
| titleWidget | Widget? | - | 抽屉的标题组件 |
| width | double? | 280 | 宽度 |

#### TDDrawerItem

##### 简介

抽屉里的列表项

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| content | Widget? | - | 完全自定义 |
| icon | Widget? | - | 每列图标 |
| title | String? | - | 每列标题 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

需要收折展示一组数量较多的菜单时使用

#### 组件搭配使用

###### 抽屉与[按钮](<../基础/Button 按钮.md>)组合使用，通过按钮点击唤起抽屉。

![](https://tdesign.gtimg.com/site/design/mobile-guide/drawer/drawer-1.png)

#### 常见用法

###### 在网站场景，通常用来收折展示整个网站的菜单导航。

![](https://tdesign.gtimg.com/site/design/mobile-guide/drawer/drawer-2.png)

---

###### 在应用场景，通常用来承载某类相关性较强的或较为低频的，如个人中心、设置等场景。

![](https://tdesign.gtimg.com/site/design/mobile-guide/drawer/drawer-3.png)

#### 推荐/慎用示例

###### 若抽屉内的菜单项较多，且菜单项之间的关联性存在差异时，建议对菜单项进行分组。

![](https://tdesign.gtimg.com/site/design/mobile-guide/drawer/drawer-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/drawer/drawer-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [动作面板](<../反馈/ActionSheet 动作面板.md>) | 需要提供一组与当前场景操作相关的关联操作时使用。 |
| [对话框](<../反馈/Dialog 对话框.md>) | 需要用户做一些决定，或这提供完成某个任务是需要的一些额外信息时使用。 |
| [下拉菜单](<../反馈/DropdownMenu 下拉菜单.md>) | 当内容较多时，需要通过筛选快速定位某一类内容时使用。 |
| [选择器](<../反馈/DropdownMenu 下拉菜单.md>) | 当需要在有限的空间展示大量选项供用户选择，或者一组选项由递进层级构成需要用户逐级选择时使用。 |
