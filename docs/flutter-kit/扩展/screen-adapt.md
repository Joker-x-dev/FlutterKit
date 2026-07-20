# 屏幕适配

适配能力位于 `lib/core/ui/adaptive/`。FlutterKit 不以设备品牌判断布局，而是根据当前逻辑宽度得到 `BreakpointType`，再通过 `BuildContext.bp` 选择尺寸、列数或导航形态。局部组件还可配合 `LayoutBuilder` 根据实际约束计算。

## 断点

| 断点 | 逻辑宽度 | 常见用途 |
| --- | --- | --- |
| `xs` | `< 320` | 极窄手机 |
| `sm` | `< 600` | 常规手机、竖向折叠屏 |
| `md` | `< 840` | 大手机、折叠展开、窄平板 |
| `lg` | `>= 840` | 平板、桌面宽窗口 |

## 根据断点取值

```dart
/// 商品网格根据当前 BuildContext 的断点选择列数和页边距。
Widget buildGoodsGrid(BuildContext context, List<Goods> goods) {
  // 未提供某个档位时 bp 会按断点回退规则选取最接近可用值。
  final int columns = context.bp<int>(xs: 2, sm: 2, md: 3, lg: 4);
  final double padding = context.bp<double>(xs: 16, md: 24, lg: 32);

  return goods.toGridView(
    crossAxisCount: columns,
    padding: EdgeInsets.all(padding),
    // 单项结构保持不变，适配只改变布局参数。
    itemBuilder: (context, index, item) => GoodsListCard(goods: item),
  );
}
```

## 局部布局

```dart
/// 卡片内布局按自身可用宽度判断，不依赖全屏宽度。
Widget buildResponsiveCard() {
  return LayoutBuilder(
    builder: (context, constraints) {
      // 根据父组件约束生成局部断点，适合嵌套面板与分栏页面。
      final BreakpointType type = BreakpointType.fromWidth(constraints.maxWidth);
      final bool horizontal = type.index >= BreakpointType.md.index;
      return horizontal
          ? const Row(children: [Expanded(child: Text('左')), Expanded(child: Text('右'))])
          : const Column(children: [Text('上'), Text('下')]);
    },
  );
}
```

## MainView 的导航适配

主框架的导航在竖屏手机呈现底部导航，在横屏或宽屏布局呈现左侧导航。导航选中状态属于 Main Logic / State，不能因为布局切换重新创建一份状态；横竖屏切换后应继续显示用户原先选择的页面。

## 验收

使用 `@ResponsivePreview()` 与真实设备分别检查手机、折叠屏、平板；同时检查横竖屏、系统字体放大、刘海和底部手势区。`ScreenAdaptDemoView` 是网格、列表、文字和组件尺寸的现有示例。

## 注意事项

- 断点调整布局，不应替代无障碍文字缩放；`ScreenUtilInit` 已开启 `minTextAdapt`。
- 同一个页面的不同布局应复用同一 Logic 和 State，避免屏幕旋转时丢失选中状态。
- 不要用屏幕物理像素或设备型号判断平板，逻辑宽度才能适配窗口化与桌面端。

## 关联阅读

- [Widget Preview](./widget-preview.md)
- [安全区适配](./safe-area.md)
- [设计系统](../框架核心/design-system.md)
