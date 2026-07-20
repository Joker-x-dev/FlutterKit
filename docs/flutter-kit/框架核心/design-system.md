# 设计系统

FlutterKit 的设计系统位于 `lib/core/design_system/`。它不是另一个组件库，而是 TDesign Flutter 之上的项目级约定：主题语义、间距、圆角、阴影、布局常量、`Space` 组件和链式扩展共同保证页面不会把视觉数值散落在业务模块里。

## 组成与职责

| 位置 | 提供内容 | 页面使用方式 |
| --- | --- | --- |
| `theme/app_theme.dart` | 主题语义色、字体、Material 主题适配 | `appTheme.textPrimary`、`AppTheme.of(context)` |
| `theme/size.dart` | TDesign 间距与语义化 `EdgeInsets` | `pagePadding`、`listItemPadding` |
| `theme/shape.dart` | 圆角与 `RoundedRectangleBorder` | `radiusLarge`、`largeRoundedShape` |
| `theme/shadows.dart` | TDesign 阴影与常用 `BoxDecoration` | `shadowBase`、`cardShadow` |
| `theme/layout.dart` | Row、Column、Wrap、Alignment 常量 | `mainBetween`、`crossCenter` |
| `widgets/space.dart` | 固定水平/垂直留白 Widget | `SpaceVerticalLarge()` |
| `extensions/` | Widget、列表和动画链式包装 | `.padAll()`、`.scrollable()` |

所有大小和形状 getter 都通过 `TDTheme.of(Get.context!)` 读取当前主题。因此页面应在 build 过程中读取它们，不能在静态字段或应用启动前缓存。

## 资源和语义选择

优先选择业务含义，而不是“看起来接近”的裸数值。

| 需求 | 推荐 API | 避免 |
| --- | --- | --- |
| 页面背景 | `appTheme.backgroundPage` / `backgroundSecondaryContainer` | `Color(0xfff5f5f5)` |
| 卡片内边距 | `cardPadding` / `spacePaddingLarge` | `EdgeInsets.all(15)` |
| 列表页边距 | `listItemPadding` | 每页重复写水平、垂直数值 |
| 模块分隔 | `SpaceVerticalLarge` / `spaceVerticalXLarge` | 无语义的 `SizedBox(height: 17)` |
| 卡片圆角 | `radiusDefault` / `radiusLarge` | 固定 `BorderRadius.circular(10)` |
| 文字颜色 | `appTheme.textPrimary` / `textSecondary` | `Colors.black54` |

## 页面布局示例

```dart
/// 设置页面内容区，组合项目语义色、间距与链式布局。
Widget buildSettingsBody(AppTheme appTheme) {
  return <Widget>[
    TDText('账号设置', font: appTheme.fontTitleLarge),
    // 固定模块内间距使用语义化 Space 组件。
    const SpaceVerticalLarge(),
    TDCellGroup(
      theme: TDCellGroupTheme.cardTheme,
      cells: const [TDCell(title: '个人资料', arrow: true)],
    ),
  ]
      // List<Widget> 扩展负责 Column，不需要手写 children。
      .toColumnStretch()
      // 页面统一采用项目定义的垂直间距。
      .scrollable(padding: pageVerticalPadding);
}
```

## Space 与 SizedBox

`SpaceHorizontalXSmall` 到 `SpaceHorizontalXXLarge`、`SpaceVerticalXSmall` 到 `SpaceVerticalXXLarge` 是 `SizedBox` 的语义化封装。相邻组件的固定间隔优先使用它们；只有动态尺寸或一次性与设计规范无关的占位才直接使用 `SizedBox`。

```dart
/// 图标与文字之间使用最小水平间距。
Widget buildLabel() => <Widget>[
  const Icon(Icons.info_outline),
  const SpaceHorizontalXSmall(),
  const Text('说明'),
].toRow();
```

## 设计系统与 TDesign 的边界

- TDesign 负责标准业务组件，如 `TDCell`、`TDButton`、`TDNavBar` 和 `TDEmpty`。
- FlutterKit 负责将这些组件接入主题、父类和页面规范，并提供项目通用扩展。
- 业务组件的固定结构放在对应 Feature 的 `widgets/`；不要为了一个页面专用结构新增 core 组件。

## 注意事项

- 颜色、尺寸和圆角需要随主题变化时必须从主题 getter 获取，不能写入 `const`。
- `cardShadow`、`popupShadow` 当前包含白色背景；深色模式卡片应优先通过 `appTheme.backgroundContainer` 自行组合，避免白底覆盖主题。
- 链式扩展是语法层便利，不是强制替代 Flutter 原生 Widget；复杂约束应优先清晰的原生树。

## 关联阅读

- [主题系统](./theme.md)
- [Widget 链式扩展](./widget-extensions.md)
- [动画链式扩展](./animated-extensions.md)
- [TDesign Flutter](./tdesign.md)
