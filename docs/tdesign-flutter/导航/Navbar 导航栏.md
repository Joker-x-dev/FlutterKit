# Navbar 导航栏

> 用于承载页面标题、返回操作和少量辅助功能，通常位于页面顶部。
> 当需要在页面间跳转、返回，或需承载少量辅助功能时使用。

> 来源：[Navbar 导航栏](https://tdesign.tencent.com/flutter/components/navbar)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 组件类型

**基础 H5 导航栏**

```dart
TNavBar(
  title: const Text('TDesign Flutter'),
)
```

**带左侧操作的导航栏**

```dart
TNavBar(
  leading: const [
    TNavBarItem(
      icon: Icons.arrow_back,
      onTap: () => Navigator.maybePop(context),
    ),
  ],
  title: const Text('详情页'),
)
```

**带右侧操作的导航栏**

```dart
TNavBar(
  title: const Text('设置'),
  actions: const [
    TNavBarItem(icon: Icons.search, onTap: () {}),
    TNavBarItem(icon: Icons.more_horiz, onTap: () {}),
  ],
)
```

**带搜索的导航栏**

```dart
TNavBar(
  title: const Text('搜索'),
  actions: [
    TNavBarItem(
      customWidget: TSearchBar(
        hintText: '搜索...',
        onChanged: (v) {},
      ),
    ),
  ],
)
```

**带图片的导航栏**

```dart
TNavBar(
  title: const Text('TDesign Flutter'),
  flexibleSpace: Image.asset(
    'assets/logo.png',
    fit: BoxFit.cover,
  ),
)
```

### 组件样式

**标题对齐**

```dart
// 左对齐（默认）
TNavBar(title: const Text('左对齐'), centerTitle: false)

// 居中（默认）
TNavBar(title: const Text('居中'), centerTitle: true)
```

**标题尺寸**

```dart
TNavBar(
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      TText('主标题', style: TTextThemeData.title),
      TText('副标题', style: TTextThemeData.subtitle),
    ],
  ),
)
```

**自定义颜色**

```dart
TNavBar(
  title: const Text('自定义颜色'),
  // 通过 TNavBarThemeData 配置
)
```

## TNavBar

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| actions | List<TNavBarItem>? | - | 右侧操作项（对齐 AppBar.actions） | 否 |
| belowTitleWidget | Widget? | - | NavBar 标题区域下方的 Widget，内容位于 height 定义的高度内 | 否 |
| centerTitle | bool | true | 标题是否居中 | 否 |
| flexibleSpace | Widget? | - | 固定背景 Widget，位于导航栏内容下层 | 否 |
| height | double | 48 | 高度；作为 PreferredSizeWidget.preferredSize 的唯一高度来源 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态 | 否 |
| leading | List<TNavBarItem>? | - | 左侧操作项（对齐 AppBar.leading） | 否 |
| onBack | VoidCallback? | - | 默认返回按钮的点击事件，仅在 useDefaultBack 为 true 时生效 | 否 |
| title | Widget? | - | 标题控件，文本标题可传入 Text('标题') 或 TText('标题')，默认使用 NavBar 的标题字体和标题颜色 | 否 |
| useBorderStyle | bool | false | 是否使用边框模式 | 否 |
| useDefaultBack | bool | false | 是否使用默认的返回按钮，默认不显示 | 否 |
| useSafeArea | bool | false | 是否避让顶部系统安全区，开启后安全区高度不计入 preferredSize | 否 |

## TNavBarItem

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| customWidget | Widget? | - | 自定义组件，优先级高于 icon，可以是任意 Widget | 否 |
| icon | IconData? | - | 图标 | 否 |
| iconColor | Color? | - | 图标颜色 | 否 |
| iconSize | double? | 24.0 | 图标尺寸，默认 24；显式传入 null 时由当前 IconTheme 决定 | 否 |
| onTap | VoidCallback? | - | 点击回调；null 表示禁用 | 否 |
| padding | EdgeInsetsGeometry? | - | 内部填充 | 否 |

## TNavBarBorder

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| color | Color? | - | 边框颜色 | 否 |
| padding | EdgeInsetsGeometry? | - | 内部填充 | 否 |
| radius | double | 22.0 | 边框圆角 | 否 |
| width | double | 1.0 | 边框宽度 | 否 |

## TNavBarThemeData

NavBar 组件 ThemeExtension，管理子树级默认样式（标题颜色、背景、内边距、阴影、边框等）。构造器参数优先级高于 ThemeData。

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 | 否 |
| backIconColor | Color? | - | 返回图标颜色 | 否 |
| border | TNavBarBorder? | - | 操作项边框配置，仅在 TNavBar.useBorderStyle 为 true 时生效 | 否 |
| boxShadow | List<BoxShadow>? | - | 底部阴影 | 否 |
| opacity | double? | - | 背景颜色透明度，未配置时为 1 | 否 |
| padding | EdgeInsetsGeometry? | - | 内部填充 | 否 |
| titleColor | Color? | - | 标题的子树默认颜色，仅在 NavBar 标题未自行提供前景色时生效 | 否 |
| titleMargin | double? | - | 中间文案左右两边间距 | 否 |

## 何时使用

需要在页面间跳转、返回，或需承载少量辅助功能时使用。

## 组件搭配使用

带图标的导航栏与抽屉、动作面板组合使用，用于唤起一组操作或功能。

## 常见用法

1. 通常用来承载页面标题和返回操作，点击跳转回到上一个打开的页面。
2. 在应用内，通常用来承载搜索、扫码等功能性高频操作。
