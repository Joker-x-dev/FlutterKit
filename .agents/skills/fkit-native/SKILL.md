---
name: fkit-native
description: 管理 FlutterKit 多端运行时资源、应用图标、原生启动页、Android/iOS/Web/桌面端配置和发布构建。用户要求生成图标、启动页、FlutterGen 资源、同步原生底座、排查原生缓存或执行多端打包时使用。
---

# FKit Native

## 必读资料

先阅读 `AGENTS.md`、`docs/flutter-kit/扩展/assets.md`、根目录 `README.md` 的构建章节，以及当前任务对应的 YAML 和原生平台文件。涉及生成器行为时查阅当前依赖版本的官方文档，不凭记忆填写配置。

## 资源边界

- `assets/image/`、`assets/icon/`、`assets/json/` 是运行时资源，由 FlutterGen 生成类型安全访问器。
- `assets/dev/` 只保存图标和启动页生成源图，不注册为运行时资源。
- `flutter_launcher_icons.yaml` 管理多端桌面图标。
- `flutter_native_splash.yaml` 管理 Android、iOS 与 Web 原生启动页。

## 工作流

1. 明确目标平台和目标效果，检查源图尺寸、画布、Alpha、透明边距及安全区。
2. 修改源图或 YAML，不直接编辑将被生成器覆盖的输出文件。
3. 只运行任务需要的生成命令，并审查各平台生成差异。
4. Android 12 启动图遵守中心安全区；iOS 图标使用独立安全边距源图并移除 Alpha。
5. 区分原生 LaunchScreen 与 Flutter 首帧，避免 Dart 页面重复展示第二个启动 Logo。
6. 原生效果未更新时先诊断 App、Simulator/Xcode/Gradle 缓存，不反复改变正确配置。
7. 按目标平台运行构建或最小启动验证，保留混淆符号文件和发布配置。

## 常用命令

- 资源代码：`dart run build_runner build --delete-conflicting-outputs`
- 图标：`dart run flutter_launcher_icons`
- 启动页：`dart run flutter_native_splash:create`
- 质量检查：`flutter analyze`、`flutter test`、`git diff --check`

## 验证

检查配置解析、源图尺寸、生成文件、Git 差异和目标平台实际显示。生成器产生无关格式变化时单独识别，不覆盖用户的原生工程修改。
