# 环境要求

FlutterKit 的具体 SDK 约束以仓库 `pubspec.yaml` 为准；当前开发环境还需要对应平台的原生工具链。先执行 `flutter doctor -v`，再处理缺失项，比只安装 Flutter SDK 更能快速定位构建问题。

## 开发工具

| 工具 | 用途 |
| --- | --- |
| Flutter / Dart SDK | 编译、运行、分析与测试 |
| Android Studio / IntelliJ IDEA | Android、Flutter 开发与 Widget Preview |
| Xcode（macOS） | iOS、macOS 构建与签名 |
| Android SDK | Android 构建、模拟器、真机调试 |
| Chromium 系浏览器 | Web 调试 |
| Git | 获取源码与协作 |

## 平台说明

- Android：安装 Android SDK、接受 licenses，并配置模拟器或 USB 调试真机。
- iOS / macOS：只能在 macOS 上构建，首次需完成 Xcode Command Line Tools 和签名设置。
- Windows / Linux：桌面包应在目标系统构建和验证。
- Web：使用 `flutter devices` 确认浏览器设备可用。

## 项目环境配置

项目的环境行为由 Dart 源码维护，不以 `--dart-define=ENV=...` 作为启动前提。不要照搬其他脚手架的环境命令；需要增加环境能力时先阅读当前 `lib/core/env/` 与启动初始化实现，明确 Debug、Release 的真实规则。

## 诊断顺序

```bash
# 查看 SDK、平台工具链和许可证状态。
flutter doctor -v

# 确认项目依赖解析正常。
flutter pub get

# 列出可运行设备。
flutter devices

# 运行静态检查。
flutter analyze
```

## 关联阅读

- [快速开始](./quick-start.md)
- [项目架构与职责](./architecture.md)
