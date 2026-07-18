# Tabs 选项卡

> 用于内容分类后的展示切换。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/tabs)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_tabs_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_tabs_page.dart)

#### 1 组件类型

均分选项卡

```
  Widget _buildItemWithSplit1(BuildContext context) {
    return TDTabBar(
      tabs: subList(2),
      controller: _tabController1,
      showIndicator: true,
    );
  }
```


```
  Widget _buildItemWithSplit2(BuildContext context) {
    return TDTabBar(
      tabs: subList(3),
      controller: _tabController2,
      showIndicator: true,
    );
  }
```


```
  Widget _buildItemWithSplit3(BuildContext context) {
    return TDTabBar(
      tabs: subList(4),
      controller: _tabController3,
      showIndicator: true,
    );
  }
```


```
  Widget _buildItemWithSplit4(BuildContext context) {
    return TDTabBar(
      tabs: subList(5),
      controller: _tabController4,
      showIndicator: true,
    );
  }
```

等距选项卡

```
  Widget _buildItemWithSpace(BuildContext context) {
    return TDTabBar(
      tabs: subList(16),
      controller: TabController(length: 16, vsync: this),
      labelPadding: const EdgeInsets.all(10),
      showIndicator: true,
      isScrollable: true,
    );
  }
```

带图标选项卡

```
  Widget _buildItemWithIcon(BuildContext context) {
    var tabs = List.generate(3, (index) {
      final text = '选项${index + 1}';
      return TDTab(
        text: text,
        icon: const Icon(TDIcons.app, size: 18),
      );
    });
    return TDTabBar(
      tabs: tabs,
      controller: TabController(length: tabs.length, vsync: this),
      showIndicator: true,
    );
  }
```

带微标选项卡

```
  Widget _buildItemWithLogo(BuildContext context) {
    var tabs = [
      const TDTab(
        text: '选项',
        contentHeight: 48,
        textMargin: EdgeInsets.only(right: 8),
        badge: TDBadge(TDBadgeType.redPoint),
      ),
      const TDTab(
        text: '选项',
        contentHeight: 42,
        textMargin: EdgeInsets.only(right: 16, top: 2, bottom: 2),
        badge: TDBadge(TDBadgeType.message, message: '8'),
      ),
      const TDTab(
        text: '选项',
        height: 48,
        icon: Icon(TDIcons.app, size: 18),
      ),
    ];
    return TDTabBar(
      tabs: tabs,
      controller: TabController(length: tabs.length, vsync: this),
      showIndicator: true,
    );
  }
```

带内容区选项卡

```
  Widget _buildItemWithContent(BuildContext context) {
    var tabController = TabController(length: 3, vsync: this);
    return SizedBox(
      height: 120 + 48,
      child: Column(
        children: [
          TDTabBar(
            tabs: subList(3),
            controller: tabController,
            showIndicator: true,
            isScrollable: false,
          ),
          Container(
            height: 120,
            color: TDTheme.of(context).bgColorContainer,
            child: TDTabBarView(
              children: _getTabViews(),
              controller: tabController,
            ),
          )
        ],
      ),
    );
  }
```

#### 1 组件状态

选项卡状态

```
  Widget _buildItemWithStatus(BuildContext context) {
    var tabs = [
      const TDTab(text: '选中'),
      const TDTab(text: '默认'),
      const TDTab(text: '禁用', enable: false),
    ];
    return TDTabBar(
      tabs: tabs,
      controller: TabController(length: tabs.length, vsync: this),
      showIndicator: true,
    );
  }
```

#### 1 组件样式

选项卡尺寸

```
  Widget _buildItemWithSizeSmall(BuildContext context) {
    var tabs = [
      const TDTab(text: '小尺寸'),
      const TDTab(text: '选项2'),
      const TDTab(text: '选项3'),
      const TDTab(text: '选项4'),
    ];
    return TDTabBar(
      tabs: tabs,
      controller: TabController(length: tabs.length, vsync: this),
      showIndicator: true,
    );
  }
```


```
  Widget _buildItemWithSizeBig(BuildContext context) {
    var tabs = [
      const TDTab(text: '大尺寸', size: TDTabSize.large),
      const TDTab(text: '选项2', size: TDTabSize.large),
      const TDTab(text: '选项3', size: TDTabSize.large),
      const TDTab(text: '选项4', size: TDTabSize.large),
    ];
    return TDTabBar(
      tabs: tabs,
      controller: TabController(length: tabs.length, vsync: this),
      showIndicator: true,
    );
  }
```

选项卡样式

```
  Widget _buildItemWithOutlineNormal(BuildContext context) {
    var tabs = [
      const TDTab(text: '选项1'),
      const TDTab(text: '选项2'),
      const TDTab(text: '选项3'),
      const TDTab(text: '选项4'),
    ];
    return TDTabBar(
      tabs: tabs,
      outlineType: TDTabBarOutlineType.capsule,
      controller: TabController(length: tabs.length, vsync: this),
      showIndicator: false,
    );
  }
```


```
  Widget _buildItemWithOutlineCard(BuildContext context) {
    var tabs = [
      const TDTab(text: '选项1'),
      const TDTab(text: '选项2'),
      const TDTab(text: '选项3'),
      const TDTab(text: '选项4'),
    ];
    return TDTabBar(
      tabs: tabs,
      outlineType: TDTabBarOutlineType.card,
      controller: TabController(length: tabs.length, vsync: this),
      showIndicator: false,
    );
  }
```

## API

1. [TDTabBar](#tdtabbar)
2. [TDTabBarView](#tdtabbarview)
3. [TDTab](#tdtab)

#### TDTabBar

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | tabBar背景色，当outlineType为card时控制选中tab颜色 |
| controller | TabController? | - | tab控制器 |
| decoration | Decoration? | - | tabBar修饰 |
| dividerColor | Color? | - | 分割线颜色 |
| dividerHeight | double | 0.5 | 分割线高度,小于等于0则不展示分割线 |
| height | double? | - | tabBar高度 |
| indicator | Decoration? | - | 自定义引导控件 |
| indicatorColor | Color? | - | tabBar下标颜色 |
| indicatorHeight | double? | - | tabBar下标高度 |
| indicatorPadding | EdgeInsets? | - | 引导padding |
| indicatorWidth | double? | - | tabBar下标宽度 |
| isScrollable | bool | false | 是否滚动 |
| key |  | - |  |
| labelColor | Color? | - | tabBar 已选标签颜色 |
| labelPadding | EdgeInsetsGeometry? | - | tab间距 |
| labelStyle | TextStyle? | - | 已选label字体 |
| onTap | Function(int)? | - | 点击事件 |
| outlineType | TDTabBarOutlineType | TDTabBarOutlineType.filled | 选项卡样式 |
| physics | ScrollPhysics? | - | 自定义滑动 |
| selectedBgColor | Color? | - | 被选中背景色，只有outlineType为capsule时有效 |
| showIndicator | bool | false | 是否展示引导控件 |
| tabAlignment |  | - |  |
| tabs | List | - | tab数组 |
| unSelectedBgColor | Color? | - | 未选中背景色，只有outlineType为capsule时有效 |
| unselectedLabelColor | Color? | - | tabBar未选标签颜色 |
| unselectedLabelStyle | TextStyle? | - | unselectedLabel字体 |
| width | double? | - | tabBar宽度 |

#### TDTabBarView

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| children | List | - | 子widget列表 |
| controller | TabController? | - | 控制器 |
| isSlideSwitch | bool | false | 是否可以滑动切换 |
| key |  | - |  |

#### TDTab

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| badge | TDBadge? | - | 图标 |
| child | Widget? | - | 子widget |
| contentHeight | double? | - | 中间内容高度 |
| enable | bool | true | 是否可用，默认true |
| height | double? | - | tab高度 |
| icon | Widget? | - | 图标 |
| iconMargin | EdgeInsetsGeometry | const EdgeInsets.only(bottom: 4.0, right: 4.0) | 图标间距 |
| key |  | - |  |
| outlineType | TDTabOutlineType | TDTabOutlineType.filled | 选项卡样式 |
| size | TDTabSize | TDTabSize.small | 选项卡尺寸 |
| text | String? | - | 文字内容 |
| textMargin | EdgeInsetsGeometry? | - | 中间内容宽度 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [常见用法](#常见用法)
5. [推荐/慎用示例](#推荐-慎用示例)
6. [相似组件](#相似组件)

#### 何时使用

当内容/数据需要一定的分类纬度进行区分，便于用户快速作出选择并切换时可以使用。

#### 与页面布局相关

###### 位于页面或模块的顶部，统领下方内容的切换，通常设置吸顶，方便用户快速切换。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-2.png)

#### 组件搭配使用

###### 选项卡与[徽标](<../数据展示/Badge 徽标.md>)组合使用，用于展示户该分类的状态变化或营销信息。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-3.png)

#### 常见用法

###### 较常使用于以信息瀑布流为场景的应用，使用选项卡承载类目或状态，便于用户区分和切换。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-5.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-6.png)

#### 推荐/慎用示例

###### 不建议使用选项卡来实现功能模块间的切换。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 建议文本简明扼要，不建议将文本进行截断或换行；若需要使用较长文本，建议使用等距选项卡。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-9.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-10.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 尽量避免使用多个选项卡进行嵌套，若使用，建议避免使用相同样式进行嵌套；一般情况下选项卡内的信息需要进一步分类，建议使用下拉菜单或标签进行选择过滤。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-11.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-12.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [标签栏](<TabBar 标签栏.md>) | 当目标模块/视图需要从应用的任何地方直接进行访问时使用。 |
| [侧边栏](<SideBar 侧边栏.md>) | 当内容项数量较多，需要用户根据品类快速选择到目标内容项时使用。 |
