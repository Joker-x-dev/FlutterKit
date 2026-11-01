# TDesign Flutter

FlutterKit 使用 [TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/getting-started) 作为基础组件 API 的权威来源，并在 `docs/tdesign-flutter/` 归档当前项目使用的组件资料。本章不重复编写完整组件 API，只约定如何把 TDesign、FlutterKit 主题与 Feature 业务组件正确组合。

## 三层边界

| 层级 | 内容 | 查阅位置 |
| --- | --- | --- |
| 官方组件层 | `TButton`、`TCell`、`TNavBar`、`TTabsBar`、`TEmpty` 等 API | TDesign 官方文档 |
| 本地参考层 | 当前依赖版本的组件资料与示例 | 仓库 `docs/tdesign-flutter/` |
| 项目规范层 | `AppTheme`、尺寸/形状、BaseView、链式扩展、业务 Widget | `lib/core/` 与本帮助文档 |

遇到“某个 `T*` 属性怎么传”先看官方或本地参考，并以 `pubspec.lock` 锁定版本的 Dart 声明核对精确签名；遇到“页面该如何统一样式、加载状态和导航结构”看 FlutterKit 文档。不要为了填补官方 API 文档而在 Feature 中复制一份组件封装。

## 接入规则

```dart
/// 使用 TDesign Cell 组成项目设置项。
Widget buildSettingsCell(SettingsLogic logic) {
  return TCellGroup(
    // 卡片主题由 TDesign 组件负责具体视觉结构。
    variant: TCellGroupVariant.card,
    cells: [
      TCell(
        title: const Text('通知设置'),
        subtitle: const Text('管理消息提醒方式'),
        arrow: true,
        // 点击只转交 Logic，业务跳转不写在 Widget 内。
        onTap: logic.openNotificationSettings,
      ),
    ],
  ).backgroundColor(appTheme.backgroundContainer);
}
```

## 常用组件的项目位置

| 需求 | 优先组件或封装 | 补充说明 |
| --- | --- | --- |
| 页面导航栏 | `BaseView.head()` → `TNavBar` | 普通页面无需手写 AppBar |
| 加载、空、错误 | `BaseNetworkView` → `TLoading` / `TEmpty` | 用状态机，不在每页重复判断 |
| 设置列表 | `TCellGroup`、`TCell` | ThemeDemoView 是现有示例 |
| 底部导航 | `TTabBar` | MainView 处理响应式位置 |
| Tab | `BaseTabView` → `TTabsBar` | 处理 Tab / PageView 同步 |
| 主操作 | `TButton`、`TFab` | 颜色通过主题或官方主题参数表达 |
| 弹窗 | `BaseDialog` 或 TDesign 对话框 | 底部业务弹窗优先 BaseDialog |

## 主题接入

TDesign JSON 被解析为 `TThemeData`，再通过 `TThemeBuilder.light/dark` 投影为 Material 主题；`AppTheme` 随后合并到同一个 `ThemeData`。因此 TDesign 组件与项目语义色可在同一次主题切换中更新。详见 [主题系统](./theme.md)。

## 注意事项

- 顶层 `appTheme`、`context.tTheme` 与尺寸 getter 都要求组件位于初始化后的应用树中；不要在全局静态初始化阶段读取。
- 新组件先查看当前 `tdesign_flutter` 版本的官方 API，再在项目中组合；不要按 Web、Vue 或 React 的 TDesign API 猜测 Dart 参数。
- 组件预览使用 [Widget Preview](../扩展/widget-preview.md)，网络页面预览必须注入静态数据。

## 关联阅读

- [设计系统](./design-system.md)
- [主题系统](./theme.md)
- [基础父类](./base.md)
