---
name: fkit-setup
description: 将 FlutterKit 脚手架初始化为新的应用项目，统一修改应用显示名称、Dart 包名、Android Application ID、Apple Bundle ID、Linux/Windows 标识、Web 名称、运行时品牌文案、Logo、桌面图标和启动页。用户拉取模板后要求改名、改包名、替换品牌资源或完成首次项目配置时使用。
---

# FKit Setup

## 必读资料

先阅读仓库根目录 `AGENTS.md`、`docs/flutter-kit/扩展/assets.md`、`README.md` 的构建章节，以及 `.agents/skills/fkit-native/SKILL.md`。修改配置前检查当前六端原生文件、`pubspec.yaml`、图标与启动页 YAML，不凭记忆猜测 Flutter 模板字段。

## 收集项目身份

在写入前取得以下信息；缺失的关键标识必须向用户确认，不自行创造：

| 信息 | 格式与用途 |
| --- | --- |
| 应用显示名称 | 用户可见名称，可包含空格和中文 |
| Dart 包名 | `snake_case`，用于 `pubspec.yaml` 与 `package:` import |
| Application/Bundle ID | 小写反向域名，例如 `com.example.product` |
| 项目描述 | `pubspec.yaml`、商店或 README 简介 |
| 公司与版权 | Windows、macOS 等原生元数据 |
| 仓库、文档、Demo 地址 | 关于页与 README；缺失时保留或删除，禁止假地址 |
| Logo、图标、启动页源图 | 运行时 Logo、通用图标、iOS 安全边距图、Android 12 启动图 |
| 目标平台 | Android、iOS、macOS、Linux、Windows、Web 的实际支持范围 |

先建立旧值到新值的明确映射，区分显示名称、Dart 包名、原生 ID、二进制名和品牌资源，不做单一字符串的全仓库替换。

## 保留 FlutterKit 框架身份

应用改名不等于抹除框架来源。默认保留以下内容中的 FlutterKit/FKit 名称：

- `docs/flutter-kit/` 与 `docs/tdesign-flutter/` 框架参考文档。
- `.agents/skills/` 目录中的 `fkit-*` 项目 Skill 名称和触发描述。
- `AGENTS.md` 中的框架技术规范。
- README 中用户明确要求保留的框架致谢、来源或上游仓库链接。

只修改运行时身份、应用专属说明和用户明确要求重写的仓库资料。完成后按允许列表审查旧标识残留，不把框架文档中的合法名称当作错误。

## 多端修改清单

| 范围 | 重点位置与操作 |
| --- | --- |
| Flutter/Dart | 修改 `pubspec.yaml` 的 `name`、`description`；Dart 包名变化时更新 `lib/`、`test/` 中全部 `package:` import |
| 运行时文案 | 修改应用名称国际化、关于页名称、项目链接和业务品牌文案，不改框架文档术语 |
| Android | 修改 `namespace`、`applicationId`、Manifest label；同步移动 MainActivity 包目录并修改 Kotlin `package` 声明 |
| iOS | 修改 Runner 与 RunnerTests 的 `PRODUCT_BUNDLE_IDENTIFIER`，同步 `CFBundleDisplayName`、`CFBundleName` |
| macOS | 修改 `PRODUCT_NAME`、Bundle ID、RunnerTests ID、版权、`.app` 引用、Scheme 与测试宿主路径 |
| Linux | 修改 `BINARY_NAME`、`APPLICATION_ID` 和窗口标题 |
| Windows | 修改 CMake project/binary、窗口标题、Runner.rc 的公司、描述、内部名、文件名、产品名和版权 |
| Web | 修改 manifest `name`、`short_name`，以及 index 的页面标题和 Apple Web App 名称 |
| 品牌资源 | 更新 `assets/image/logo.png` 与 `assets/dev/` 生成源图，核对两个 YAML 后运行图标和启动页生成器 |
| 项目资料 | 按用户决定更新 README、关于页、仓库、文档和 Demo 地址，禁止保留 `example.com` 等占位链接 |

## 执行顺序

1. 记录工作区状态，使用精确文本搜索建立当前身份清单，保护用户已有修改。
2. 先修改 Dart 包名和运行时文案，再修改各平台 ID、显示名称与原生入口路径。
3. 使用文件移动保持 Android Kotlin 包目录与声明一致；编辑 Xcode/CMake/RC 文件时同时更新测试和构建引用。
4. 替换运行时 Logo、图标与启动页源图，按 `fkit-native` 流程检查尺寸、Alpha、透明边距和 Android 12 安全区。
5. 运行 FlutterGen、图标和启动页生成命令，只接受与配置对应的生成差异。
6. 搜索旧 Dart 包名、旧原生 ID、旧二进制名、占位 URL 和旧运行时显示名称；对框架文档中的合法 FlutterKit 名称使用允许列表。
7. 更新测试期望和必要项目说明，不修改生成文件的手写内容。

## 生成与验证

- 执行 `flutter pub get`。
- Dart 包名、Model、Retrofit 或运行时资源变化时执行 `dart run build_runner build --delete-conflicting-outputs`。
- 执行 `dart run flutter_launcher_icons` 与 `dart run flutter_native_splash:create`。
- 运行 `dart format`、`flutter analyze`、`flutter test` 和 `git diff --check`。
- 至少构建当前环境支持的 Android、iOS `--no-codesign`、macOS 与 Web；Linux、Windows 在对应系统验证。
- 检查安装后的应用名称、包标识、主屏图标、原生启动页、关于页和版本信息，确认没有缓存旧品牌资源。
