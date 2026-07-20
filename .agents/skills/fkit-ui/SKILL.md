---
name: fkit-ui
description: 使用 FlutterKit 设计系统、TDesign Flutter、Widget 与动画扩展实现或重构页面和组件，覆盖主题语义、响应式布局、安全区、深浅色和预览。用户要求编写 UI、修改布局、统一样式、实现组件或适配多尺寸屏幕时使用。
---

# FKit UI

## 必读资料

先阅读 `AGENTS.md`，再依次读取：

1. `lib/core/design_system/README.md`
2. `lib/core/design_system/extensions/extensions.dart`
3. `docs/tdesign-flutter/README.md` 与目标组件页面
4. `docs/flutter-kit/框架核心/design-system.md`
5. `docs/flutter-kit/框架核心/widget-extensions.md`

按需读取 `docs/flutter-kit/框架核心/theme.md`、`docs/flutter-kit/框架核心/dark-mode.md`、`docs/flutter-kit/框架核心/animated-extensions.md`，以及 `docs/flutter-kit/扩展/` 下的屏幕适配、安全区与预览专题。检查扩展方法时打开 `lib/core/design_system/extensions/widget/` 或 `lib/core/design_system/extensions/animated/` 中的真实声明，不猜签名。

## 固定检查顺序

1. 分析页面信息层级、交互状态、屏幕方向和断点需求。
2. 在 TDesign 组件索引中查找已有组件，优先组合 `TD*` 组件。
3. 在完整布局规范和扩展统一入口中查找已有布局、间距、装饰、裁剪、滚动、手势、文本、变换和动画能力。
4. 使用 `AppTheme`、语义尺寸、Shape、Shadow、`Space` 和现有扩展实现布局。
5. 将 `Obx` 缩到实际读取 Rx 的最小区域，保持静态布局不重复重建。
6. 处理深浅色、安全区、横竖屏、手机、平板与折叠屏。
7. 为完整页面添加响应式 Preview，为模块组件添加 Widget Preview。

## 禁止事项

- 不硬编码颜色、间距、圆角、阴影或重复 `EdgeInsets`。
- 不按 TDesign Web、Vue、React 或旧版本文档推测 Dart 参数。
- 不在全局或静态字段缓存依赖主题上下文的 getter。
- 不忽略链式扩展包装顺序；背景、裁剪、点击和滚动的先后顺序必须符合目标 Widget 树。
- 不为单次样式需求新增跨项目通用扩展。

## 验证

运行相关 Widget/Preview 测试并检查无 overflow。至少验证浅色、深色和任务涉及的关键尺寸；涉及主导航时验证手机横竖屏状态一致性。执行相关分析与 `git diff --check`。
