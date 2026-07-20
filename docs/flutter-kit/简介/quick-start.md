# 快速开始

本节以当前仓库为准，从获取源码、验证环境、运行 Demo 到生成代码。首次不要直接删除 Demo；先跑通网络、主题、路由和 Preview，才能确认本机 SDK、生成器与平台配置均正常。

## 获取项目

```bash
# GitHub 仓库。
git clone https://github.com/Joker-x-dev/FlutterKit.git
cd FlutterKit

# 获取 Flutter 依赖。
flutter pub get

# 检查 Flutter SDK 与已安装平台。
flutter doctor

# 默认目标设备运行应用。
flutter run
```

GitHub 访问不便时使用 Gitee：

```bash
git clone https://gitee.com/Joker-x-dev/FlutterKit.git
cd FlutterKit
flutter pub get
flutter run
```

## 首次验证

1. 进入 Demo，验证网络详情、分页、本地存储和数据库示例。
2. 打开 ThemeDemo，验证浅色、深色、跟随系统和颜色预设。
3. 打开 Android Studio 的 Widget Preview，检查 `@ResponsivePreview()` 页面。
4. 切换手机横竖屏与大窗口，确认 MainView 导航适配。

## 生成代码

修改 `@JsonSerializable` 模型、Retrofit 接口或 FlutterGen 资源后执行：

```bash
# 生成 json_serializable、Retrofit、资源访问器等代码。
dart run build_runner build --delete-conflicting-outputs
```

生成文件如 `*.g.dart` 由工具维护，不手工编辑。生成后运行 `flutter analyze`，再按改动运行相应 test。

## 常用命令

| 目标 | 命令 |
| --- | --- |
| 获取依赖 | `flutter pub get` |
| 静态检查 | `flutter analyze` |
| 运行测试 | `flutter test` |
| 指定设备运行 | `flutter run -d <deviceId>` |
| 构建 Android | `flutter build apk` 或 `flutter build appbundle` |
| 构建 iOS | `flutter build ipa` |

## 关联阅读

- [环境要求](./environment.md)
- [创建页面](../业务功能/create-page.md)
- [Widget Preview](../扩展/widget-preview.md)
