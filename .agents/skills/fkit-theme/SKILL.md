---
name: fkit-theme
description: 实现和维护 FlutterKit 主题、深色模式、主题颜色预设、持久化恢复、系统栏同步与国际化。用户要求修改主题、深浅色、颜色 JSON、语言切换、文案资源或 ThemeDemo 时使用。
---

# FKit Theme

## 必读资料

先阅读 `AGENTS.md`，再读取：

- `docs/flutter-kit/框架核心/theme.md`
- `docs/flutter-kit/框架核心/dark-mode.md`
- `docs/flutter-kit/框架核心/localization.md`
- `docs/flutter-kit/框架核心/design-system.md`
- `docs/tdesign-flutter/全局配置/深色模式.md`

核对 `ThemeInitializer`、`Application`、`main.dart`、`ThemeColorPreset`、主题 Repository/DataSource 和现有主题测试。

## 主题工作流

1. 从 `assets/json/` 中的主题 JSON 与 `ThemeColorPreset` 确认浅色、深色名称和回退关系。
2. 保持 ThemeInitializer → Application → `Obx` → TDesign/Material/AppTheme → System UI 的现有更新链路。
3. 通过 Repository 持久化主题模式、颜色和语言；不要在 View 直接写存储。
4. 使用语义颜色与字体，不为深色模式复制两套业务 Widget。
5. 修改主题 token 时验证所有引用方、预览和 ThemeDemo。

## 国际化工作流

1. 公共文案放 Core localization，业务文案放对应 Feature localization。
2. 同步 key、中文、英文映射和聚合注册，避免页面硬编码可翻译文案。
3. 保持接口返回文本和动态业务内容不进入静态翻译表。

## 验证

运行主题初始化、AppTheme、主题 Demo、语言响应性等相关测试。检查浅色、深色、跟随系统、颜色预设恢复、系统栏和 Preview，再执行静态分析与 `git diff --check`。
