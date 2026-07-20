---
name: fkit-preview
description: 为 FlutterKit 页面和组件新增、修复或审查 Widget Preview，覆盖响应式设备注解、Logic 注入、静态 Preview Data、网络状态和深浅色检查。用户提到预览、Widget Preview、页面预览、组件预览或全量补预览时使用。
---

# FKit Preview

## 必读资料

先阅读 `AGENTS.md`、`docs/flutter-kit/扩展/widget-preview.md`、`docs/flutter-kit/业务功能/view.md`，再检查：

- `lib/core/ui/preview/app_preview_annotations.dart`
- `lib/core/ui/preview/app_preview.dart`
- 当前 Feature 已有 Preview
- `test/core/ui/preview/feature_preview_test.dart`

## 工作流

1. 区分完整页面和独立组件。完整页面默认使用 `@ResponsivePreview()`，组件使用 `@WidgetPreview()`；只在明确需要单设备时使用 Mobile、Tablet 或 Foldable 注解。
2. 将顶层 `previewXxx` 函数放在当前 View/Widget 文件末尾，保持右侧预览聚焦当前文件。
3. 页面通过构造参数注入 Logic，不依赖路由 Binding；不要为预览新增大量回调参数或复制 Content Widget。
4. 网络、分页和刷新页面写入稳定的 Preview Data，并切换到成功状态；禁止真实网络、数据库或异步初始化。
5. 组件使用真实业务模型的静态预览数据。组件正式 API 没有点击事件时，不为预览伪造 `onTap`。
6. 检查手机、折叠屏、平板以及工具栏深浅色切换。

## 验证

运行 `test/core/ui/preview/feature_preview_test.dart` 与相关 Widget 测试。确认预览可独立构建、没有 overflow、没有 GetX 注册缺失，也没有真实外部请求。
