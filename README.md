<div align="center">

<img src="docs/images/graphs/logo.png" width="120" alt="FlutterKit Logo"/>

# FlutterKit

_一个模块化、开箱即用并支持 AI 辅助开发的 Flutter 快速开发脚手架_

<!-- 语言切换按钮 -->
<div align="center">
  <a href="README_EN.md">🌍 English</a>
</div>

[![GitHub](https://img.shields.io/badge/GitHub-FlutterKit-blue?style=flat-square&logo=github)](https://github.com/Joker-x-dev/FlutterKit)
[![Gitee](https://img.shields.io/badge/Gitee-FlutterKit-red?style=flat-square&logo=gitee)](https://gitee.com/Joker-x-dev/FlutterKit)
[![Docs](https://img.shields.io/badge/Docs-flutter.dusksnow.top-orange?style=flat-square&logo=readthedocs)](https://flutter.dusksnow.top)
[![TDesign](https://img.shields.io/badge/UI-TDesign_Flutter-0052D9?style=flat-square&logo=flutter)](https://tdesign.tencent.com/flutter/getting-started)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/Joker-x-dev/FlutterKit)

</div>

## 📖 项目简介

FlutterKit 是一个基于 **Flutter / Dart / GetX / TDesign Flutter** 的跨平台项目脚手架，内置网络、分页、数据库、本地存储、状态管理、导航、国际化、主题和屏幕适配等常用能力，并提供对应的功能示例页面，方便通过 **“拉仓库 → 运行 → 填业务”** 快速开始 Flutter 项目。

Android、iOS、macOS、Linux、Windows 和 Web 六个平台的原生工程均已纳入仓库，可直接作为模块化 Flutter 项目的基础工程。

> 如果项目对你有帮助，欢迎点个 Star ⭐ 这会是持续维护的动力！

## 📱 项目预览

项目内置 Flutter Widget Preview 支持，页面与组件均提供独立预览入口；响应式页面可同时检查 Mobile、Tablet 和 Foldable 三类屏幕尺寸。

<img src="docs/images/preview/mobile.png" alt="手机"/>

<img src="docs/images/preview/tablet.png" alt="平板"/>

### 📍 项目地址

- **GitHub**：https://github.com/Joker-x-dev/FlutterKit
- **Gitee**：https://gitee.com/Joker-x-dev/FlutterKit
- **示例 Demo**：[下载安装](https://www.pgyer.com/FlutterKit)

### 📚 说明文档

- **项目文档**：[在线查看](https://flutter.dusksnow.top)
  - 与代码同步的在线文档，包含快速开始、架构说明、模块规范、示例路由和常见定制点
- **TDesign Flutter 组件库**：[在线查看](https://tdesign.tencent.com/flutter/getting-started)
  - TDesign Flutter 组件使用说明与 API 文档
- **Flutter 官方文档**：[在线查看](https://docs.flutter.dev)
  - Flutter 跨平台开发、构建与发布说明

## 🤖 AI 辅助开发

FlutterKit 不内置 AI 模型或在线服务。仓库通过项目规则、框架文档和专项 Skill，为支持这些能力的 AI 开发工具提供可直接读取的项目上下文。

- **项目规则**：根目录 [`AGENTS.md`](AGENTS.md) 统一维护架构边界、UI 规范、注释要求和验证流程
- **框架文档**：[`docs/flutter-kit/`](docs/flutter-kit/README.md) 与 [`docs/tdesign-flutter/`](docs/tdesign-flutter/README.md) 提供框架和组件的实现依据
- **专项 Skill**：[`.agents/skills/`](.agents/skills/) 包含项目初始化、Feature、UI、数据、导航、预览、主题、原生配置和代码审查九类工作流

```text
使用 $fkit-feature 和 $fkit-ui 创建商品详情页面。
使用 $fkit-setup 修改应用名称、包名、图标和启动页。
使用 $fkit-audit 审查 feature/main 的架构与预览完整性。
```

完整说明请阅读[AI 辅助开发文档](https://flutter.dusksnow.top/help/intro/ai-coding)。

## 🧩 内置能力

- **基础页面**：统一 View、Logic、State、Dialog、Tab、Refresh 和 List 页面抽象
- **基础网络**：Dio + Retrofit 请求封装、拦截器、异常转换与统一结果处理
- **分页列表**：统一刷新、加载更多、加载态、错误态和空态处理
- **导航能力**：命名路由、带参跳转、结果回传和路由守卫示例
- **数据库**：基于 SQLite 的本地数据库与 Repository 示例
- **本地存储**：账号、认证、Token、主题、语言和用户信息存储封装
- **状态管理**：GetX 页面状态、依赖管理与全局 Service 示例
- **屏幕适配**：断点、方向、安全区以及手机、平板、折叠屏响应式布局
- **设计系统**：统一颜色、字体、间距、圆角、阴影、主题和 Widget 扩展
- **国际化**：公共文案与 Feature 文案分层管理
- **环境配置**：Dart 源码维护 dev、test、pre、prod，Debug 支持应用内切换，Release 使用生产环境
- **开发调试**：Alice、Pretty Dio Logger、Logger 与 Widget Preview
- **AI 辅助开发**：项目级 `AGENTS.md`、框架文档和九个专项 Skill，为代码生成、重构与审查提供统一规则

## 🛠️ 技术栈

| 类别 | 技术选型 | 说明 |
| --- | --- | --- |
| 编程语言 | Dart | Flutter 官方开发语言 |
| UI 框架 | Flutter | Android、iOS、macOS、Linux、Windows、Web 跨平台 UI |
| 架构模式 | GetX + MVVM | View、Logic、State 分层与依赖管理 |
| 组件库 | TDesign Flutter | 腾讯 TDesign Flutter 组件库 |
| 导航框架 | GetX Navigation | 命名路由、参数、结果与路由守卫 |
| 网络请求 | Dio + Retrofit | HTTP 客户端、接口声明与拦截器 |
| 数据序列化 | json_serializable | JSON 模型代码生成 |
| 数据库 | sqflite | SQLite 本地数据库 |
| 本地存储 | shared_preferences | 跨平台键值存储 |
| 屏幕适配 | flutter_screenutil | 尺寸适配与响应式布局支持 |
| 刷新分页 | easy_refresh | 下拉刷新与上拉加载 |
| 调试工具 | Alice + Logger | 网络检查与日志输出 |
| 代码生成 | build_runner + FlutterGen | 模型、网络接口与资源代码生成 |

## 📱 功能模块目录

- **主模块（main）**
  - 主页面（main）
  - 核心能力示例（core-demo）
  - 导航示例（navigation-demo）
  - 扩展示例（expand-demo）
  - 关于页面（about-demo）

- **认证模块（auth）**
  - 登录页（login）

- **用户模块（user）**
  - 用户信息页（user-info）

- **示例模块（demo）**
  - 基础页面示例（base-demo）
  - 基础 Tab 示例（base-tab-demo）
  - 基础刷新示例（base-refresh-demo）
  - 通用网络请求示例（network-demo）
  - 通用分页列表示例（network-list-demo）
  - 独立网络请求示例（network-request-demo）
  - 数据库示例（database-demo）
  - 本地存储示例（local-storage-demo）
  - 状态管理示例（state-management-demo）
  - 带参跳转示例（navigation-with-args）
  - 结果回传示例（navigation-result）
  - 屏幕适配示例（screen-adapt-demo）
  - 主题示例（theme-demo）

## 📁 项目结构

```text
lib/
├── bootstrap/              # 应用启动与基础服务初始化
├── core/                   # 多 Feature 共享的核心能力
│   ├── base/               # 页面、列表、网络、刷新、Tab 和弹窗基类
│   ├── config/             # 应用配置
│   ├── data/               # Repository 与跨模块预览数据
│   ├── database/           # SQLite 数据源与实体
│   ├── datastore/          # 本地键值数据源
│   ├── design_system/      # 主题、间距、扩展与通用设计规范
│   ├── env/                # 多环境源码配置
│   ├── localization/       # 公共国际化资源
│   ├── mixin/              # 通用 Mixin
│   ├── model/              # Entity、Request 和 Response
│   ├── network/            # 网络数据源、拦截器与 Dio Provider
│   ├── result/             # 请求结果与错误处理
│   ├── service/            # 全局 Service
│   ├── ui/                 # 通用 UI、响应式与预览能力
│   └── util/               # 路由、存储、日志、提示等工具
├── feature/                # 功能模块
│   ├── auth/               # 认证模块
│   ├── demo/               # 示例模块
│   ├── main/               # 主模块
│   └── user/               # 用户模块
├── generated/              # 自动生成的资源代码
├── routes/                 # 路由、参数、结果与守卫
├── application.dart        # 应用根组件
└── main.dart               # 应用入口
```

## 🚀 快速开始

### 环境要求

- Flutter SDK：`>= 3.38.0`
- Dart SDK：`>= 3.9.0 < 4.0.0`
- Android Studio / IntelliJ IDEA / Visual Studio Code

### 安装与运行

```bash
flutter pub get
flutter run
```

### 代码生成

修改 JSON Model、Retrofit 数据源，或新增、删除、重命名 `assets/image/`、`assets/icon/`、`assets/json/` 中的资源后执行：

```bash
# 生成 JSON、Retrofit 与 FlutterGen 的 Assets 资源访问器。
dart run build_runner build --delete-conflicting-outputs
```

持续监听文件变化：

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### 质量检查

```bash
flutter analyze
flutter test
```

## 📦 打包发布

### Android

生成 arm64 APK：

```bash
flutter build apk --release --obfuscate --split-debug-info=./debug_info --target-platform android-arm64
```

生成用于 Google Play 发布的 AAB：

```bash
flutter build appbundle --release --obfuscate --split-debug-info=./debug_info
```

### iOS

```bash
flutter build ios --release --obfuscate --split-debug-info=./debug_info
```

### macOS

```bash
flutter build macos --release
```

### Web

```bash
flutter build web --release
```

### Linux

```bash
flutter build linux --release
```

### Windows

```bash
flutter build windows --release
```

`debug_info` 目录包含混淆后的符号文件，需要与对应版本的安装包一起保存，便于还原线上堆栈。

Linux 和 Windows 应用需在对应操作系统中构建，iOS 和 macOS 应用需使用 macOS 与 Xcode。

## 👥 加入群聊

欢迎加入开发者交流群，一起交流 Flutter、Android、HarmonyOS 与跨平台项目架构。

<div align="left">
  <img src="docs/images/group/qq.jpg" width="200" alt="QQ群二维码"/>
  <p>扫码或搜索群号加入 QQ 群</p>
</div>

## 🤝 参与贡献

欢迎提交 Issue 和 Pull Request，一起完善 Flutter 跨平台开发体验。

- **代码贡献**：完善功能实现、修复问题或补充测试
- **问题反馈**：提交可复现的 Bug、兼容性问题或功能建议
- **文档优化**：完善使用说明、架构文档和示例说明
- **设计支持**：提供 UI、交互和多端适配建议
- **测试协助**：验证 Android、iOS、macOS、Linux、Windows 和 Web 平台行为

提交代码前请确保通过项目静态分析与相关测试，并遵循现有目录结构和编码规范。
