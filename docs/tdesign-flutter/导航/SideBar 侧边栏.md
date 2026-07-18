# SideBar 侧边栏

> 用于内容分类后的展示切换。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/side-bar)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_sidebar_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/sidebar/td_sidebar_page.dart)

[td_sidebar_page_anchor.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/sidebar/td_sidebar_page_anchor.dart)

[td_sidebar_page_custom.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/sidebar/td_sidebar_page_custom.dart)

[td_sidebar_page_icon.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/sidebar/td_sidebar_page_icon.dart)

[td_sidebar_page_pagination.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/sidebar/td_sidebar_page_pagination.dart)

#### 1 组件类型

侧边导航用法

```
  Widget _buildAnchorSideBar(BuildContext context) {
    var demoHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        titleBarHeight -
        testButtonHeight;

    return Column(
      children: [
        Container(
          height: testButtonHeight,
          padding: const EdgeInsets.all(16),
          child: TDButton(
            text: '更新children',
            onTap: () {
              setState(() {
                var children = list
                    .map((e) => SideItemProps(
                        index: e.index,
                        label: '变更${e.index}',
                        badge: e.badge,
                        value: e.value,
                        icon: e.icon))
                    .toList();
                _sideBarController.children = children;
                setState(() {});
              });
            },
          ),
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 110,
                child: TDSideBar(
                  style: TDSideBarStyle.normal,
                  value: currentValue,
                  controller: _sideBarController,
                  onChanged: onChanged,
                  onSelected: onSelected,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    controller: _demoScroller,
                    child: Container(
                      color: TDTheme.of(context).bgColorContainer,
                      child: Column(
                        children: [
                          ...pages,
                          Container(height: demoHeight - itemHeight)
                        ],
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
```


```
  Widget _buildPaginationSideBar(BuildContext context) {
    // 切页用法
    final list = [];
    final pages = [];

    for (var i = 0; i < 100; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项 ${i}',
        value: i,
      ));
      pages.add(getPageDemo(i));
    }

    list[1].badge = const TDBadge(TDBadgeType.redPoint);
    list[2].badge = const TDBadge(
      TDBadgeType.message,
      count: '8',
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        currentValue = value;
      }
    }

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: TDSideBar(
            style: TDSideBarStyle.normal,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => TDSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    icon: ele.icon))
                .toList(),
            onSelected: setCurrentValue,
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: pages,
            physics: const NeverScrollableScrollPhysics(),
          ),
        )
      ],
    );
  }
```


```
  Widget _buildAnchorSideBar(BuildContext context) {
    var demoHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        titleBarHeight -
        testButtonHeight;

    return Column(
      children: [
        Container(
          height: testButtonHeight,
          padding: const EdgeInsets.all(16),
          child: TDButton(
            text: '更新children',
            onTap: () {
              setState(() {
                var children = list
                    .map((e) => SideItemProps(
                        index: e.index,
                        label: '变更${e.index}',
                        badge: e.badge,
                        value: e.value,
                        icon: e.icon))
                    .toList();
                _sideBarController.children = children;
                setState(() {});
              });
            },
          ),
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 110,
                child: TDSideBar(
                  style: TDSideBarStyle.normal,
                  value: currentValue,
                  controller: _sideBarController,
                  onChanged: onChanged,
                  onSelected: onSelected,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    controller: _demoScroller,
                    child: Container(
                      color: TDTheme.of(context).bgColorContainer,
                      child: Column(
                        children: [
                          ...pages,
                          Container(height: demoHeight - itemHeight)
                        ],
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
```


```
  Widget _buildPaginationSideBar(BuildContext context) {
    // 切页用法
    final list = [];
    final pages = [];

    for (var i = 0; i < 100; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项 ${i}',
        value: i,
      ));
      pages.add(getPageDemo(i));
    }

    list[1].badge = const TDBadge(TDBadgeType.redPoint);
    list[2].badge = const TDBadge(
      TDBadgeType.message,
      count: '8',
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        currentValue = value;
      }
    }

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: TDSideBar(
            style: TDSideBarStyle.normal,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => TDSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    icon: ele.icon))
                .toList(),
            onSelected: setCurrentValue,
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: pages,
            physics: const NeverScrollableScrollPhysics(),
          ),
        )
      ],
    );
  }
```

图标侧边导航

```
  Widget _buildIconSideBar(BuildContext context) {
    final list = [];
    final pages = [];

    for (var i = 0; i < 20; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项${i}',
        value: i,
        icon: TDIcons.app,
      ));
      pages.add(getAnchorDemo(i));
    }

    pages.add(Container(
      height: MediaQuery.of(context).size.height - itemHeight,
      decoration: BoxDecoration(color: TDTheme.of(context).bgColorContainer),
    ));

    list[1].badge = const TDBadge(TDBadgeType.redPoint);
    list[2].badge = const TDBadge(
      TDBadgeType.message,
      count: '8',
    );

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: TDSideBar(
            style: TDSideBarStyle.normal,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => TDSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    icon: ele.icon))
                .toList(),
            onChanged: onChanged,
            onSelected: onSelected,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: _demoScroller,
            child: Column(
              children: pages,
            ),
          ),
        )
      ],
    );
  }
```

#### 1 组件样式

侧边导航样式

```
  Widget _buildOutlineSideBar(BuildContext context) {
    // 非通栏选项样式
    final list = [];
    final pages = [];

    for (var i = 0; i < 20; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项${i}',
        value: i,
      ));
      pages.add(getAnchorDemo(i));
    }

    pages.add(Container(
      height: MediaQuery.of(context).size.height - itemHeight,
      decoration: BoxDecoration(color: TDTheme.of(context).bgColorContainer),
    ));

    list[1].badge = const TDBadge(TDBadgeType.redPoint);
    list[2].badge = const TDBadge(
      TDBadgeType.message,
      count: '8',
    );

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: TDSideBar(
            style: TDSideBarStyle.outline,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => TDSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    icon: ele.icon))
                .toList(),
            onChanged: onChanged,
            onSelected: onSelected,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: _demoScroller,
            child: Column(
              children: pages,
            ),
          ),
        )
      ],
    );
  }
```


```
  Widget _buildCustomSideBar(BuildContext context) {
    // 自定义样式
    final list = [];
    final pages = [];

    for (var i = 0; i < 100; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项 $i',
        value: i,
        textStyle: TextStyle(color: TDTheme.of(context).brandLightColor),
      ));
      pages.add(getPageDemo(i));
    }

    list[1].badge = const TDBadge(TDBadgeType.redPoint);
    list[2].badge = const TDBadge(
      TDBadgeType.message,
      count: '8',
    );
    list[1].textStyle = const TextStyle(color: Colors.green);

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        currentValue = value;
      }
    }

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: TDSideBar(
            style: TDSideBarStyle.normal,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => TDSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    textStyle: ele.textStyle,
                    icon: ele.icon))
                .toList(),
            selectedTextStyle: const TextStyle(color: Colors.red),
            onSelected: setCurrentValue,
            contentPadding:
                const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            selectedBgColor: Colors.blue,
            unSelectedBgColor: Colors.yellow,
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: pages,
            physics: const NeverScrollableScrollPhysics(),
          ),
        )
      ],
    );
  }
```


```
  Widget _buildOutlineSideBar(BuildContext context) {
    // 非通栏选项样式
    final list = [];
    final pages = [];

    for (var i = 0; i < 20; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项${i}',
        value: i,
      ));
      pages.add(getAnchorDemo(i));
    }

    pages.add(Container(
      height: MediaQuery.of(context).size.height - itemHeight,
      decoration: BoxDecoration(color: TDTheme.of(context).bgColorContainer),
    ));

    list[1].badge = const TDBadge(TDBadgeType.redPoint);
    list[2].badge = const TDBadge(
      TDBadgeType.message,
      count: '8',
    );

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: TDSideBar(
            style: TDSideBarStyle.outline,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => TDSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    icon: ele.icon))
                .toList(),
            onChanged: onChanged,
            onSelected: onSelected,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: _demoScroller,
            child: Column(
              children: pages,
            ),
          ),
        )
      ],
    );
  }
```


```
  Widget _buildCustomSideBar(BuildContext context) {
    // 自定义样式
    final list = [];
    final pages = [];

    for (var i = 0; i < 100; i++) {
      list.add(SideItemProps(
        index: i,
        label: '选项 $i',
        value: i,
        textStyle: TextStyle(color: TDTheme.of(context).brandLightColor),
      ));
      pages.add(getPageDemo(i));
    }

    list[1].badge = const TDBadge(TDBadgeType.redPoint);
    list[2].badge = const TDBadge(
      TDBadgeType.message,
      count: '8',
    );
    list[1].textStyle = const TextStyle(color: Colors.green);

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        currentValue = value;
      }
    }

    return Row(
      children: [
        SizedBox(
          width: 110,
          child: TDSideBar(
            style: TDSideBarStyle.normal,
            value: currentValue,
            controller: _sideBarController,
            children: list
                .map((ele) => TDSideBarItem(
                    label: ele.label ?? '',
                    badge: ele.badge,
                    value: ele.value,
                    textStyle: ele.textStyle,
                    icon: ele.icon))
                .toList(),
            selectedTextStyle: const TextStyle(color: Colors.red),
            onSelected: setCurrentValue,
            contentPadding:
                const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            selectedBgColor: Colors.blue,
            unSelectedBgColor: Colors.yellow,
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: pages,
            physics: const NeverScrollableScrollPhysics(),
          ),
        )
      ],
    );
  }
```

## API

1. [TDSideBar](#tdsidebar)
2. [TDSideBarItem](#tdsidebaritem)

#### TDSideBar

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| children | List | const [] | 单项 |
| contentPadding | EdgeInsetsGeometry? | - | 自定义文本框内边距 |
| controller | TDSideBarController? | - | 控制器 |
| defaultValue | int? | - | 默认值 |
| height | double? | - | 高度 |
| key |  | - |  |
| loading | bool? | - | 加载效果 |
| loadingWidget | Widget? | - | 自定义加载动画 |
| onChanged | ValueChanged? | - | 选中值发生变化（Controller控制） |
| onSelected | ValueChanged? | - | 选中值发生变化（点击事件） |
| selectedBgColor | Color? | - | 选择的背景颜色 |
| selectedColor | Color? | - | 选中值后颜色 |
| selectedTextStyle | TextStyle? | - | 选中样式 |
| style | TDSideBarStyle | TDSideBarStyle.normal | 样式 |
| unSelectedBgColor | Color? | - | 未选择的背景颜色 |
| unSelectedColor | Color? | - | 未选中颜色 |
| value | int? | - | 选项值 |

#### TDSideBarItem

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| badge | TDBadge? | - | 徽标 |
| disabled | bool | false | 是否禁用 |
| icon | IconData? | - | 图标 |
| key |  | - |  |
| label | String | '' | 标签 |
| textStyle | TextStyle? | - | 标签样式 |
| value | int | -1 | 值 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [正确/慎用示例](#正确-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当内容项数量较多，需要用户根据品类快速选择到目标内容项时使用。

#### 组件搭配使用

###### 侧边栏与徽标组合使用，用于展示品类的状态信息或营销情况。

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-1.png)

#### 正确/慎用示例

###### 建议文本简明扼要，若文本过长建议进行换行处理，尽量避免将文本进行截断。

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 不建议仅用图标、emoji作为品类选项，避免表意不清晰。

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [标签栏](<TabBar 标签栏.md>) | 目标模块/视图需要从应用的任何地方直接进行访问时使用 |
| [选项卡](<Tabs 选项卡.md>) | 当内容/数据需要一定的分类纬度进行区分，便于用户快速作出选择并切换时可以使用。 |
