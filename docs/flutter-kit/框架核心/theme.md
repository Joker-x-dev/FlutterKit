# 主题系统

FlutterKit 同时维护 TDesign、Material 与项目语义主题。主题并非页面自己切换几组颜色：启动时从 JSON 资源解析 `TDThemeData`，恢复用户的颜色和模式，`main.dart` 通过 `Obx` 重建 `GetMaterialApp`，`AppTheme` 再将当前 TDesign token 暴露给项目业务代码。

TDesign 组件主题 API 与 JSON token 以仓库 `docs/tdesign-flutter/开始/快速开始.md` 为本地参考；深色主题配置、`TDTheme.needMultiTheme()` 与 Flutter `ThemeMode` 的官方说明见 `docs/tdesign-flutter/全局配置/深色模式.md`。本章只说明 FlutterKit 的项目级接入，深色模式的完整流程见 [深色模式](./dark-mode.md)。

## 完整链路

```text
assets/json/theme.json、blue.json、green.json、red.json
  → ThemeColorPreset（名称、资源路径、darkName、预览色）
  → ThemeInitializer（启动解析并恢复持久化选择）
  → Application.themeData / themeMode / themeColorName
  → main.dart 中 Obx
  → TDThemeData.light / TDThemeData.dark
  → AppTheme.buildMaterialTheme()
  → ThemeData.extensions: TDThemeData + AppTheme
  → BaseView.appTheme / AppTheme.of(context) / TDesign 组件
```

## 资源与预设

| 预设 | `ThemeColorPreset.name` | 资源 | 深色键 |
| --- | --- | --- | --- |
| 默认蓝 | `theme` | `assets/json/theme.json` | `themeDark` |
| 绿色 | `green` | `assets/json/green.json` | `greenDark` |
| 红色 | `red` | `assets/json/red.json` | `redDark` |
| 蓝色 | `blue` | `assets/json/blue.json` | `blueDark` |

新增主题的步骤是：新增 JSON 资源、生成或更新资源访问器、在 `ThemeColorPreset` 声明预设、放入 `values`，最后在 `ThemeDemoView` 的展示文案映射中补齐名称与说明。只增加色值而不注册预设，用户无法选择和持久化它。

## 启动与恢复

```dart
/// 主题启动初始化器，位于 bootstrap/theme_initializer.dart。
class ThemeInitializer implements AppInitializer {
  @override
  Future<void> init() async {
    // 启用 TDesign 的多主题能力，必须在读取主题数据前执行。
    TDTheme.needMultiTheme();
    final repository = ThemeStoreRepository();

    // 无效或缺失的名称会由 fromName 回退到 defaultTheme。
    final preset = ThemeColorPreset.fromName(
      await repository.getThemeColorName(),
    );
    final TDThemeData? themeData = await preset.loadThemeData();
    if (themeData != null) {
      // 写入响应式全局状态，main.dart 的 Obx 会读取它。
      Application.updateTheme(themeData, colorName: preset.name);
    }

    // 仅在保存的下标合法时恢复 ThemeMode，避免损坏存储导致崩溃。
    final int? modeIndex = await repository.getThemeModeIndex();
    if (modeIndex != null && modeIndex >= 0 && modeIndex < ThemeMode.values.length) {
      Application.themeMode.value = ThemeMode.values[modeIndex];
    }
  }
}
```

## 深色模式

`Application.themeMode` 默认 `ThemeMode.system`；`main.dart` 根据系统亮度选择浅色或深色 `TDThemeData`，并同步 Material 主题与系统栏。深色 JSON、回退、跟随系统、持久化和 ThemeDemo 的完整行为集中在 [深色模式](./dark-mode.md)，避免与主题总览重复。

## 业务代码如何读取主题

```dart
/// 主题感知的卡片内容。
Widget buildProfileCard(BuildContext context) {
  // AppTheme 是 ThemeExtension；可在任意拥有 context 的组件中获取。
  final AppTheme theme = AppTheme.of(context);

  return TDText(
    '个人资料',
    // 字体和颜色均来自当前深浅主题。
    font: theme.fontTitleMedium,
    textColor: theme.textPrimary,
  )
      .padAll(spacePaddingLarge)
      .backgroundColor(theme.backgroundContainer)
      .clipRadius(radiusLarge);
}
```

`BaseView` 已提供 `appTheme` getter；普通子组件使用 `AppTheme.of(context)`。不要直接解析 JSON，也不要在页面中判断 `Brightness` 后写两套色值。

## 用户切换主题

```dart
/// ThemeDemoLogic 中的颜色切换逻辑。
Future<void> updateThemeColor(ThemeColorPreset preset) async {
  try {
    // 读取选中预设的明暗主题数据。
    final TDThemeData? themeData = await preset.loadThemeData();
    if (themeData == null) return;

    // 更新内存状态并将颜色名称写入本地存储。
    await Application.updateThemeColor(themeData, preset.name);
  } on Object {
    // 资源解析失败时保持当前主题，避免切换到半初始化状态。
    return;
  }
}

/// 深浅模式切换同样通过 Application 统一持久化。
Future<void> updateThemeMode(ThemeMode mode) async {
  await Application.updateThemeMode(mode);
}
```

## Material、TDesign 与系统栏

`AppTheme.buildMaterialTheme()` 创建 `ThemeData`：使用 TDesign 品牌色构建 `ColorScheme`，注入 `TDThemeData` 与 `AppTheme` 两个 `ThemeExtension`，并同步普通图标、AppBar 前景与容器背景。`AppTheme.buildSystemUiOverlayStyle()` 为 `AnnotatedRegion<SystemUiOverlayStyle>` 提供状态栏、导航栏和图标亮度，确保系统栏与当前页面主题一致。

## 主题与国际化

主题与语言都是 `Application` 的响应式全局状态，但持久化路径不同：主题用 `ThemeStoreRepository` 保存颜色名和 `ThemeMode.index`；语言用 `LocaleStoreRepository` 保存 locale tag，并通过 `Get.locale` 与 `Get.forceAppUpdate()` 刷新存量路由。切换任一项不需要重启应用。

## 注意事项

- 不要使用 `--dart-define` 控制主题；当前项目的主题切换完全由 Dart 运行时状态与本地存储实现。
- 主题 JSON 改动后需检查浅色、深色、跟随系统、所有颜色预设，以及系统状态栏。
- 主题数据读取失败时 `ThemeInitializer` 保留默认 `TDThemeData.defaultData()`，页面仍能启动。

## 关联阅读

- [设计系统](./design-system.md)
- [深色模式](./dark-mode.md)
- [国际化](./localization.md)
- [TDesign Flutter](./tdesign.md)
- [ThemeDemoView](../业务功能/view.md)
