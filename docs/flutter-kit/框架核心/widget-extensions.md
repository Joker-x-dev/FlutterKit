# Widget 链式扩展

FlutterKit 在 `lib/core/design_system/extensions/widget/` 为 Flutter `Widget`、`List<Widget>`、`List<T>` 和 `int` 提供了链式扩展。统一入口是：

```dart
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
```

扩展的本质是将当前对象包装进标准 Flutter Widget，不会改变原组件。它用于让常见页面结构更紧凑；复杂约束、需要命名 key 或团队成员不熟悉链式顺序时，直接写 Flutter 原生 Widget 更清晰。

## 分类与 API

| 分类 | 源码 | 常用 API | 底层包装 |
| --- | --- | --- | --- |
| Row / Column / Stack / Wrap | `row_extension.dart` 等 | `toRow`、`toColumnStretch`、`toStack`、`toWrap` | `Row`、`Column`、`Stack`、`Wrap` |
| 尺寸与约束 | `size_extension.dart` | `width`、`height`、`size`、`tight`、`constrained`、`aspectRatio` | `SizedBox`、`ConstrainedBox`、`AspectRatio` |
| 对齐与布局 | `layout_extension.dart` | `center`、`alignment`、`expanded`、`flexible`、`positioned`、`safeArea` | `Center`、`Align`、Flex、`SafeArea` |
| 间距 | `padding_extension.dart` | `pad`、`padAll`、`padSymmetric`、`padHorizontal`、`padVertical` | `Padding` |
| 装饰 | `decoration_extension.dart` | `backgroundColor`、`backgroundGradient`、`border`、`boxShadow`、`elevation` | `DecoratedBox`、`Material` |
| 裁剪 | `clip_extension.dart` | `clipRRect`、`clipRadius`、`clipCircle`、`clipPath` | `ClipRRect`、`ClipOval`、`ClipPath` |
| 滚动 | `scroll_extension.dart` | `scrollable`、`verticalScroll`、`horizontalScroll`、`bouncingScroll` | `SingleChildScrollView` |
| 手势 | `gesture_extension.dart` | `onTap`、`onLongPress`、`gestures`、`onScale` | `GestureDetector` |
| 列表与网格 | `list_view_extension.dart`、`grid_view_extension.dart` | `toListView`、`toListViewSeparated`、`toGridView` | `ListView`、`GridView` |
| 文本 | `text_extension.dart`、`text_span_extension.dart` | `bold`、`fontSize`、`textColor`、`textStyle` | `Text.copyWith` |
| 变换与效果 | `transform_extension.dart`、`effect_extension.dart` | `rotate`、`scale`、`translate`、`opacity`、`blur`、`ripple` | `Transform`、`Opacity`、`ImageFiltered`、`InkWell` |
| 语义与工具 | `utility_extension.dart`、`icon_extension.dart`、`keep_alive_extension.dart` | `visibility`、`semantics`、图标样式、`keepAlive` | Flutter 对应组件与 KeepAlive 包装 |

## 链式顺序决定 Widget 树

每次调用都把前一项作为 child。因此调用从左到右，外层包装逐渐增加；这会直接影响背景、裁剪和点击区域。

```dart
/// 圆角背景卡片，背景本身被裁剪。
Widget buildClippedCard(AppTheme theme) {
  return const Text('内容')
      // 第一步：文字外层加内边距。
      .padAll(spacePaddingLarge)
      // 第二步：Padding 外层绘制容器背景。
      .backgroundColor(theme.backgroundContainer)
      // 第三步：裁剪最外层背景和内容，圆角真正生效。
      .clipRadius(radiusLarge);
}
```

上例对应概念树：`ClipRRect(DecoratedBox(Padding(Text)))`。若写成 `.clipRadius(...).backgroundColor(...)`，得到 `DecoratedBox(ClipRRect(Padding(Text)))`，背景不会被圆角裁剪。需要涟漪点击时，`ripple()` 应包在有 `Material` 背景和明确裁剪范围的合适层级，避免水波溢出卡片。

## 常用组合

### 列表页面

```dart
/// 使用 List<Widget> 扩展构建标准纵向页面。
Widget buildPage(AppTheme theme) {
  return <Widget>[
    TDText('标题', font: theme.fontTitleLarge),
    const SpaceVerticalLarge(),
    const Text('正文内容'),
  ]
      // 纵向拉伸，保证每个子项占据可用宽度。
      .toColumnStretch()
      // 可滚动容器统一补页面边距。
      .scrollable(padding: pagePadding)
      .backgroundColor(theme.backgroundPage);
}
```

### 点击卡片

```dart
/// 点击区域包住完整卡片，不只包住文本。
Widget buildActionCard(AppTheme theme, VoidCallback onTap) {
  return const Text('打开详情')
      .padAll(spacePaddingLarge)
      .backgroundColor(theme.backgroundContainer)
      .clipRadius(radiusDefault)
      // GestureDetector 放在最外层，整张卡片都可响应点击。
      .onTap(onTap);
}
```

### 数据列表和网格

```dart
/// 数据集合扩展自动提供 itemBuilder 的 index 与元素。
Widget buildGoodsGrid(List<Goods> goods) {
  return goods.toGridView(
    crossAxisCount: 2,
    // 业务只描述每个商品项，GridView 配置由扩展处理。
    itemBuilder: (context, index, item) => GoodsListCard(goods: item),
  );
}
```

## 何时使用原生 Widget

- 父子约束需要一眼可见，例如复杂 `CustomScrollView`、Sliver、嵌套滚动和 `LayoutBuilder`。
- 需要精确管理 `Key`、`RenderObject`、动画状态或调试 Widget 树。
- 链条超过三到四层且阅读负担大时，拆成有变量名的原生 Widget 树。
- 团队 API 未覆盖的 Flutter 能力，直接使用官方 Widget，不要临时在页面复制扩展实现。

## 性能边界

链式方法会增加包装 Widget；单个静态页面通常无感，但大量列表项中堆叠装饰、裁剪、模糊与 Intrinsic 系列尺寸方法会产生布局或合成成本。列表项优先复用稳定 Widget，避免在 `itemBuilder` 中创建不必要的 `IntrinsicWidth`、大面积 `BackdropFilter` 或多层裁剪。

## 关联阅读

- [设计系统](./design-system.md)
- [动画链式扩展](./animated-extensions.md)
- [BaseList](./base-list.md)
