# 图标、资源与启动页

FlutterKit 将运行时资源、应用图标源图和原生启动页源图分开管理：业务页面只访问已打包的资源；桌面图标与启动页由开发依赖在各原生平台生成。这种分层避免将生成源图带入应用资源包，也避免手动修改 Android、iOS 等平台的生成文件。

## 职责与目录

| 分类 | 目录或文件 | 是否打包到 Flutter 应用 | 职责 |
| --- | --- | --- | --- |
| 页面图片 | `assets/image/` | 是 | Logo、插图和业务图片 |
| 页面图标 | `assets/icon/` | 是 | SVG 缺省图、业务图标 |
| 配置资源 | `assets/json/` | 是 | TDesign 主题等 JSON 配置 |
| 生成源图 | `assets/dev/` | 否 | 桌面图标、原生启动页的输入图片 |
| 资源访问器 | `lib/generated/assets.gen.dart` | 随 Dart 编译 | FlutterGen 生成的类型安全访问入口 |
| 图标配置 | `flutter_launcher_icons.yaml` | 否 | 多平台桌面图标生成规则 |
| 启动页配置 | `flutter_native_splash.yaml` | 否 | Android、iOS、Web 原生启动页生成规则 |

```text
assets/
├── image/                       # Flutter 运行时图片
│   └── logo.png
├── icon/                        # Flutter 运行时 SVG 图标
│   ├── empty_error.svg
│   └── empty_void.svg
├── json/                        # Flutter 运行时 JSON 配置
│   └── theme.json
└── dev/                         # 仅供生成器读取，不在 pubspec.yaml 注册
    ├── app_icon.png
    ├── app_icon_ios.png
    ├── splash.png
    └── splash_android_12.png
```

`pubspec.yaml` 只注册 `assets/image/`、`assets/icon/` 与 `assets/json/`。`assets/dev/` 的图片不能在业务 Widget 中通过 `Image.asset` 使用；它们只在执行图标或启动页生成命令时读取。

## 资源生成命令

`flutter_gen_runner` 作为 `build_runner` 的构建器运行，不提供独立的 `fluttergen` 命令。新增、删除或重命名 `assets/image/`、`assets/icon/`、`assets/json/` 中的文件后，执行以下命令更新 `Assets` 访问器：

```bash
# 生成 FlutterGen 资源访问器，以及受 build_runner 管理的其他代码产物。
dart run build_runner build --delete-conflicting-outputs
```

图标与启动页分别由后文的 `flutter_launcher_icons`、`flutter_native_splash` 命令生成；资源访问器生成不会更新原生图标和启动页文件。

## 运行时资源

### 资源声明与 FlutterGen

FlutterKit 已在 `pubspec.yaml` 声明三个运行时资源目录，并通过 `flutter_gen_runner` 生成 `lib/generated/assets.gen.dart`。业务代码优先使用 `Assets` 访问器，而不是手写字符串路径：重命名或删除资源后，编译器能更早发现失效引用。

| 资源类型 | 访问方式 | 典型用途 |
| --- | --- | --- |
| PNG、JPG、WebP | `Assets.image.xxx.image()` | 构建 `Image` Widget |
| SVG | `Assets.icon.xxx.svg()` 或 `.path` | 构建 SVG，或传递给需要路径的组件 |
| JSON | `Assets.json.xxx` | `rootBundle.loadString`、主题解析 |

```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_kit/generated/assets.gen.dart';

/// 应用品牌与缺省图示例。
class BrandAssets extends StatelessWidget {
  /// 创建应用品牌与缺省图示例。
  const BrandAssets({super.key});

  /// 构建运行时资源内容。
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // FlutterGen 返回的图片访问器，避免业务代码维护字符串路径。
        Assets.image.logo.image(width: 72, height: 72),
        const SizedBox(height: 16),
        // SVG 可直接由 FlutterGen 创建 Widget。
        Assets.icon.emptyVoid.svg(width: 160, height: 120),
        const SizedBox(height: 16),
        // 需要路径参数的第三方组件使用 .path。
        SvgPicture.asset(Assets.icon.emptyError.path, width: 160, height: 120),
      ],
    );
  }
}
```

新增页面资源的固定流程如下：

1. 按用途放入 `assets/image/`、`assets/icon/` 或 `assets/json/`，不要放入 `assets/dev/`。
2. 目录已被 `pubspec.yaml` 注册时无需逐个追加文件路径；新增资源类别时才更新 `pubspec.yaml`。
3. 执行资源生成命令，确认 `Assets` 出现对应访问器。
4. 使用 `Assets` 替代字符串路径，并在页面或组件预览中验证显示效果。

`lib/generated/assets.gen.dart` 是生成文件，不应手工编辑。主题 JSON 的读取与主题颜色预设请参考[主题系统](../框架核心/theme.md)。

## 应用桌面图标

桌面图标由 [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) 生成，配置文件是根目录的 `flutter_launcher_icons.yaml`。当前配置会同时覆盖 Android、iOS、Web、Windows 与 macOS。

| 配置项 | 当前资源 | 覆盖平台 | 说明 |
| --- | --- | --- | --- |
| `image_path` | `assets/dev/app_icon.png` | Android、Web、Windows、macOS | 默认图标源图 |
| `image_path_ios` | `assets/dev/app_icon_ios.png` | iOS | 1024×1024 画布，Logo 保留透明安全边距 |
| `remove_alpha_ios` | `true` | iOS | App Store 图标不保留 Alpha 通道 |
| `background_color_ios` | `#FFFFFF` | iOS | 透明区域填充的背景色 |

替换图标时，默认源图应使用清晰的正方形或带充足透明边距的 PNG；建议准备 1024×1024 版本。iOS 会施加系统圆角与视觉缩放，不能直接复用贴边的 Android 图标，因此保留独立的 `app_icon_ios.png`。运行时 Logo `assets/image/logo.png` 与桌面图标用途不同，不应互相替代。

```bash
# 读取 flutter_launcher_icons.yaml，生成全部已启用平台的桌面图标。
dart run flutter_launcher_icons
```

生成完成后，应分别检查 Android 启动器、iOS 主屏幕、浏览器 favicon、Windows 可执行文件图标和 macOS AppIcon。不要直接编辑 `android/app/src/main/res/mipmap-*`、`ios/Runner/Assets.xcassets/AppIcon.appiconset/` 或各桌面端图标输出目录；下次生成会覆盖这些文件。

## 原生启动页

启动页由 [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) 生成。它显示在 Flutter Engine 与首帧 Widget 就绪之前，因此不能用页面内的 `Loading`、`Image` 或动画替代。原生启动页应只承载品牌标识与背景色，首个 Flutter 页面负责后续加载状态。

### 当前配置

| 平台范围 | 配置 | 当前资源与规则 |
| --- | --- | --- |
| Android 12 以下、iOS、Web | `image`、`image_dark` | 共用 `assets/dev/splash.png`，居中展示 |
| Android 12 及以上 | `android_12.image`、`image_dark` | 使用 `assets/dev/splash_android_12.png` |
| 浅色背景 | `color` | `#FFFFFF` |
| 深色背景 | `color_dark` | `#121212` |
| iOS 展示方式 | `ios_content_mode` | `center`，不使用 iOS 专用启动图 |

Android 12 采用系统启动屏图标规范。`splash_android_12.png` 使用 1152×1152 的透明 PNG，关键标识必须位于中心直径 768 的安全区域内；超出该区域的内容可能被系统裁剪。Android 12 以下、iOS 与 Web 则使用同一张 `splash.png`，保证不同平台的品牌标识一致。

```yaml
# Android 12 以下、iOS 与 Web 使用同一张中心启动图。
image: "assets/dev/splash.png"
image_dark: "assets/dev/splash.png"

# iOS 将中心图按原始尺寸居中显示，不配置独立 iOS 图片。
ios_content_mode: center

android_12:
  # Android 12+ 使用符合系统安全区要求的透明图片。
  image: "assets/dev/splash_android_12.png"
  image_dark: "assets/dev/splash_android_12.png"
```

修改 `flutter_native_splash.yaml` 或 `assets/dev/splash*.png` 后执行：

```bash
# 根据 flutter_native_splash.yaml 重新生成 Android、iOS 与 Web 原生启动页资源。
dart run flutter_native_splash:create
```

若需要移除生成的启动页并恢复 Flutter 默认配置，可执行：

```bash
# 删除 flutter_native_splash 写入的原生启动页配置与资源引用。
dart run flutter_native_splash:remove
```

## 更换品牌资源的检查清单

1. 页面 Logo 放入 `assets/image/`，再生成 FlutterGen 访问器。
2. 桌面图标源图放入 `assets/dev/app_icon.png`；iOS 同时更新带安全边距的 `app_icon_ios.png`。
3. 普通原生启动图更新 `assets/dev/splash.png`；Android 12 图同步更新 `splash_android_12.png`，并检查中心安全区。
4. 分别执行 `dart run build_runner build --delete-conflicting-outputs`、`dart run flutter_launcher_icons` 与 `dart run flutter_native_splash:create`。
5. 在 Android 12+、Android 12 以下、iOS 与 Web 实机或模拟器检查图标和启动页；启动页只应出现一次，且不应被首个 Flutter 页面重复展示。

## 常见问题

| 现象 | 原因与处理 |
| --- | --- |
| `Assets.image.xxx` 不存在 | 新文件未放入已注册目录或尚未运行 `build_runner`；确认路径后重新生成 |
| 页面能运行但 SVG 不显示 | 使用 SVG 时应通过 `Assets.icon.xxx.svg()` 或 `SvgPicture.asset(Assets.icon.xxx.path)` 构建 |
| Android 12 启动标识被裁剪 | 图片未使用 1152×1152 透明画布，或关键内容超出中心直径 768 的安全区 |
| iOS 图标显得过大 | `app_icon_ios.png` 缺少透明边距；保留独立 1024×1024 画布后重新生成图标 |
| iOS 仍显示旧图标或旧启动页 | 先停止应用并重新构建；模拟器仍缓存时执行 `flutter clean` 后重新安装 |
| 手动修改原生资源后再次丢失 | 图标与启动页目录由生成器维护；应修改 `assets/dev/` 和 YAML，再重新生成 |

## 关联阅读

- [主题系统](../框架核心/theme.md)
- [深色模式](../框架核心/dark-mode.md)
- [Widget 链式扩展](../框架核心/widget-extensions.md)
- [预览](./widget-preview.md)
