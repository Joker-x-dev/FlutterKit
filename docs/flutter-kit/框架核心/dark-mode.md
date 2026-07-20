# 深色模式

FlutterKit 的深色模式建立在 TDesign Flutter 多主题能力、Flutter `ThemeData.darkTheme` 和 GetX 响应式状态之上。它不是页面内通过 `Brightness` 写两套颜色：主题 JSON 同时提供浅色和深色 token，应用根节点根据 `ThemeMode` 选择当前亮度，`AppTheme`、TDesign 组件、Material 组件与系统状态栏一起更新。

## TDesign 参考与项目边界

TDesign 深色模式的原始说明已归档在仓库：

- `docs/tdesign-flutter/全局配置/深色模式.md`
- `docs/tdesign-flutter/开始/快速开始.md`

官方文档说明如何生成 JSON、开启 `TDTheme.needMultiTheme()` 和配置 Flutter 的 `theme / darkTheme / themeMode`。FlutterKit 在此基础上增加颜色预设、GetX 响应状态、持久化、`AppTheme` 语义色与系统栏同步。

## 当前主题链路

```text
assets/json/<preset>.json
  → ThemeColorPreset(name, assetPath, darkName)
  → TDThemeData.fromJson(name, json, darkName: darkName)
  → Application.themeData / themeMode / themeColorName
  → main.dart Obx
  → GetMaterialApp.theme / darkTheme / themeMode
  → TDesign 组件 + AppTheme + SystemUiOverlayStyle
```

| 预设 | 浅色主题名称 | 深色主题键 | JSON 资源 |
| --- | --- | --- | --- |
| 默认 | `theme` | `themeDark` | `assets/json/theme.json` |
| 绿色 | `green` | `greenDark` | `assets/json/green.json` |
| 红色 | `red` | `redDark` | `assets/json/red.json` |
| 蓝色 | `blue` | `blueDark` | `assets/json/blue.json` |

`darkName` 必须与 JSON 内的深色主题 key 一致；仅有浅色 token 时，`TDThemeData.dark` 会为空。

## 初始化与深色主题回退

`ThemeInitializer` 在应用启动时先调用 `TDTheme.needMultiTheme()`，读取上次保存的颜色预设，再按保存的 `ThemeMode.index` 恢复显示模式。无效颜色名称回退到默认预设；无效模式下标不更新默认的 `ThemeMode.system`。

在 `main.dart` 中：

```dart
// 当前主题模式决定是否应使用深色数据。
final bool isDark =
    themeMode == ThemeMode.dark ||
    (themeMode == ThemeMode.system &&
        MediaQuery.platformBrightnessOf(context) == Brightness.dark);

// 深色 token 缺失时以浅色数据兜底，保证应用仍可启动。
final TDThemeData darkTheme = themeData.dark ?? themeData.light;
final TDThemeData activeTheme = isDark ? darkTheme : themeData.light;
```

回退只是一层运行时保护，不是完整深色主题。正式预设必须在 JSON 内提供完整深色 token；否则深色系统下会显示浅色背景、文字或组件状态。

## 三种模式

| `ThemeMode` | 行为 | ThemeDemo 操作 |
| --- | --- | --- |
| `system` | 根据 `MediaQuery.platformBrightnessOf` 跟随系统 | 跟随系统开关 |
| `light` | 始终使用浅色主题 | 点击浅色模式 |
| `dark` | 始终使用深色主题 | 点击深色模式 |

`ThemeDemoLogic.updateFollowSystem()` 在关闭跟随系统时，以当前系统亮度决定保留浅色或深色，避免开关关闭后发生视觉跳变。

## Material、TDesign 与系统栏

`AppTheme.buildMaterialTheme()` 将当前 `TDThemeData` 转为 Material `ThemeData`：

- `ColorScheme` 使用 TDesign 品牌色；
- `ThemeData.extensions` 同时注入 `TDThemeData` 与 `AppTheme`；
- AppBar、IconTheme、页面背景使用当前 token；
- `AppTheme.buildSystemUiOverlayStyle()` 让状态栏和导航栏图标亮度随当前深浅主题变化。

业务页面读取 `appTheme.textPrimary`、`appTheme.backgroundContainer` 等语义色，而不是自行判断深色模式。TDesign 组件通过当前 `TDThemeData` 读取 token；两者由同一 `Obx` 重建过程更新。

## 切换与持久化

`Application.updateThemeMode(mode)` 先更新响应式 `themeMode`，再用 `ThemeStoreRepository` 保存 `mode.index`；`Application.updateThemeColor(themeData, colorName)` 同时更新主题数据、颜色名称并持久化颜色名称。ThemeDemo 只调用这些入口，不直接写 `StorageUtil`。

```dart
// 手动切换深浅模式并持久化。
await Application.updateThemeMode(ThemeMode.dark);

// 加载预设 JSON 后切换品牌颜色并持久化名称。
final TDThemeData? themeData = await ThemeColorPreset.green.loadThemeData();
if (themeData != null) {
  await Application.updateThemeColor(themeData, ThemeColorPreset.green.name);
}
```

## 新增带深色模式的预设

1. 使用 TDesign 主题生成器或按本地 TDesign 文档准备浅色与深色 JSON token。
2. 将 JSON 放入 `assets/json/`，更新资源生成访问器。
3. 在 `ThemeColorPreset` 定义 `name`、`assetPath`、`darkName`、`previewColor`，并加入 `values`。
4. 在 ThemeDemo 的标题、说明映射中加入新预设文案。
5. 分别检查浅色、深色、跟随系统、所有预设、TDesign 组件和系统状态栏。

## 常见问题

- 深色模式仍是浅色：JSON 没有对应 `darkName`，或名称与 `ThemeColorPreset.darkName` 不一致。
- 自定义 Widget 不变色：页面写死 `Colors.*`，应改用 `AppTheme` 语义色。
- TDesign 组件与自定义组件颜色不一致：确认 JSON token、`TDThemeData` 和 `AppTheme` 来自同一个预设。
- 系统栏图标看不清：确认根节点仍使用 `AppTheme.buildSystemUiOverlayStyle()`。

## 关联阅读

- [主题系统](./theme.md)
- [TDesign Flutter](./tdesign.md)
- [ThemeDemoView](../业务功能/view.md)
