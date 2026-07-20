# 动画链式扩展

动画扩展位于 `lib/core/design_system/extensions/animated/`，并从 `extensions.dart` 统一导出。它们为常用布局、装饰、透明度、变换、交互、文本和图标提供隐式动画或内部 `StatefulWidget` 包装，默认动画时长多数为 `Duration(milliseconds: 300)`。

## 分类与 API

| 分类 | 常用 API | 动画实现 |
| --- | --- | --- |
| 动画上下文 | `animate(duration:, curve:)` | 通过内部 InheritedWidget 传递时长与曲线 |
| 布局 | `animatedPadding`、`animatedMargin`、`animatedConstraints` | `AnimatedPadding`、`AnimatedContainer`、约束 Tween |
| 装饰 | `animatedDecoration`、`animatedBorderRadius`、`animatedBackgroundColor`、`animatedElevation` | `DecorationTween`、`AnimatedContainer`、`AnimatedPhysicalModel` |
| 变换 | `animatedTransform`、`animatedScale`、`animatedRotate`、`animatedTranslate` | `TweenAnimationBuilder`、`AnimatedScale` |
| 视觉效果 | `animatedOpacity`、`animatedFadeIn`、`animatedFadeOut`、`animatedVisibility` | `AnimatedOpacity`、Tween |
| 手势 | `animatedTap`、`animatedRipple`、`animatedTapScale`、`animatedHover` | 内部 StatefulWidget、`AnimationController`、InkWell |
| 图标 | `animatedIcon`、`animatedIconColor`、`animatedIconSize` | 自定义隐式动画 Icon |
| 文本 | `animatedText`、`animatedTextColor`、`animatedTextSize`、`animatedTextStyle` | 自定义隐式动画 Text |

## 组合方式

`animate()` 是装饰、约束和变换类扩展的动画配置提供者；对应动画方法必须位于它的子树中。项目源码会在缺少动画上下文时以断言提示，因此不要把 `.animate()` 写在无关的兄弟节点上。

```dart
/// 根据选中状态动画化卡片的背景、边距和缩放。
Widget buildSelectableCard(bool selected, AppTheme theme) {
  return const Text('选择主题')
      // 内边距扩展使用命名尺寸参数，状态变化时会补间到新值。
      .animatedPadding(
        all: selected ? spacePaddingLarge : spacePaddingSmall,
      )
      .animatedDecoration(
        BoxDecoration(
          color: selected ? theme.primaryLight : theme.backgroundContainer,
          borderRadius: BorderRadius.circular(radiusLarge),
        ),
      )
      // Decoration 动画读取这一层提供的时长和曲线。
      .animate(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
      );
}
```

## 交互动画示例

```dart
/// 为完整操作区域提供按下缩放反馈。
Widget buildAnimatedAction(VoidCallback onTap, AppTheme theme) {
  return const Text('保存')
      .padAll(spacePaddingLarge)
      .backgroundColor(theme.primary)
      .clipRadius(radiusDefault)
      // 内部组件持有 AnimationController，并在松手时触发业务回调。
      .animatedTapScale(onTap, duration: const Duration(milliseconds: 100));
}
```

## 文本与图标示例

```dart
/// 主题状态变化时平滑过渡标题颜色与字号。
Widget buildAnimatedTitle(bool active, AppTheme theme) {
  return Text(active ? '已启用' : '未启用')
      // Text 扩展只替换文本样式相关字段，不改变语义内容。
      .animatedTextColor(
        active ? theme.primary : theme.textSecondary,
        duration: const Duration(milliseconds: 180),
      )
      .animatedTextSize(
        active ? 18 : 14,
        duration: const Duration(milliseconds: 180),
      );
}
```

## 时长、曲线和重建

隐式动画依靠父组件传入新属性值触发；状态不变时不会开始动画。优先让小范围 `Obx` 或 `ValueListenableBuilder` 包住需要变化的控件，避免把整个长列表放进一个响应式 build。`animatedTapScale`、`animatedHover` 等内部有 `AnimationController`，列表滚动时必须保持 item 的 key 和数据身份稳定，避免频繁销毁重建。

## 适用边界

- 适合状态切换、轻量反馈、主题颜色变化和简单出现/消失。
- 连续手势驱动、复杂编排、跨页面 Hero 或需要精确时间线时使用 Flutter `AnimationController`、`AnimatedBuilder`、`Hero` 或专用状态管理。
- 大面积 blur、频繁 transform 和大量同步隐式动画会增加合成压力；列表内应限制动画数量与时长。

## 关联阅读

- [Widget 链式扩展](./widget-extensions.md)
- [设计系统](./design-system.md)
- [主题系统](./theme.md)
