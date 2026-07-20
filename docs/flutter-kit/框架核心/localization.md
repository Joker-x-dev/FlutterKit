# 国际化

FlutterKit 使用 GetX `Translations` 管理应用文案，当前支持简体中文 `zh_CN` 与英文 `en_US`。文案按 Core 与 Feature 模块拆分，再由 `AppTranslations` 聚合；语言选择由 `Application.locale` 保存为响应式全局状态，并通过 `LocaleStoreRepository` 持久化。

## 文案结构

```text
lib/
├── core/localization/
│   ├── app_translations.dart       # 全部模块语言 Map 聚合
│   ├── common/                     # 跨模块通用文案
│   └── network/                    # 网络、错误、刷新等 Core 文案
└── feature/<module>/localization/
    ├── <module>_keys.dart          # 文案 key 常量
    ├── <module>_zh.dart            # 简体中文 Map
    └── <module>_en.dart            # 英文 Map
```

Core 只放跨模块通用、网络和基础组件文案；业务模块文案放 Feature 自己的 `localization/`。不要把一整个页面的字符串塞入 `common_zh.dart`。

## AppTranslations 聚合

文件：`lib/core/localization/app_translations.dart`

```dart
/// 聚合 Core 与 Feature 文案后注入 GetMaterialApp。
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      ...commonZh,
      ...networkZh,
      ...mainZh,
      ...demoZh,
      ...authZh,
      ...userZh,
    },
    'en_US': {
      ...commonEn,
      ...networkEn,
      ...mainEn,
      ...demoEn,
      ...authEn,
      ...userEn,
    },
  };
}
```

`main.dart` 将 `translations: AppTranslations()`、`locale: Application.locale.value` 与 `fallbackLocale: const Locale('zh', 'CN')` 传入 `GetMaterialApp`。根节点的 `Obx` 同时订阅主题和语言，语言变更后当前应用树可以重建。

## 定义与使用文案

以 Demo 模块为例，先在 `demo_keys.dart` 声明稳定 key，再在中文与英文 Map 提供相同 key 的值。

```dart
/// Demo 模块文案 key。
class DemoKeys {
  const DemoKeys._();

  /// 网络请求页面标题。
  static const String titleNetworkDemo = 'demoTitleNetworkDemo';
}

/// 中文文案映射。
final Map<String, String> demoZh = {
  DemoKeys.titleNetworkDemo: '自动网络状态示例',
};

/// 英文文案映射。
final Map<String, String> demoEn = {
  DemoKeys.titleNetworkDemo: 'Automatic Network State Demo',
};
```

```dart
/// View 中通过 GetX 扩展读取当前语言文案。
@override
String? get navTitle => DemoKeys.titleNetworkDemo.tr;
```

不要在 View 中根据 `locale.languageCode` 手动分支，也不要将中文作为逻辑判断条件；所有显示文本都通过 key 和 `.tr` 取得。

## 参数化文案

GetX 支持位置参数和命名参数。项目当前同时使用 `trArgs` 与 `trParams`：

```dart
/// 使用位置参数替换 %s。
final String soldText = CommonKeys.goodsSold.trArgs([goods.sold.toString()]);

/// 使用命名参数替换 @result。
final String resultText = MainKeys.navigationResult.trParams({
  'result': result.message,
});
```

翻译 Map 中的占位符必须与调用方式一致；新增或修改占位符时同步检查中文、英文和所有调用点。

## 启动恢复与切换

`LocaleInitializer` 启动时从 `LocaleStoreRepository` 读取 `zh_CN` 或 `en_US` 并写入 `Application.locale`。用户在 ThemeDemo 切换语言时，`Application.updateLocale()` 会执行四件事：

1. 更新 `Get.locale`，使后续 `.tr` 读取目标语言。
2. 更新响应式 `Application.locale`，重建根应用。
3. 调用 `Get.forceAppUpdate()`，刷新未直接订阅语言状态的已存在路由。
4. 将语言 tag 保存到 `LocaleStoreRepository`，供下次启动恢复。

```dart
/// 切换到英文并持久化。
await Application.updateLocale(const Locale('en', 'US'));
```

## 新增模块文案流程

1. 在 `feature/<module>/localization/` 新建 `<module>_keys.dart`、`<module>_zh.dart`、`<module>_en.dart`。
2. 使用带模块前缀的 key，避免与 Core 或其他模块冲突。
3. 在 `AppTranslations` 同时展开中文与英文 Map。
4. 在 View、Logic、父类和错误处理处使用 `.tr`、`trArgs` 或 `trParams`。
5. 从 ThemeDemo 切换两种语言，检查导航标题、缺省页、Toast、刷新文案和路由返回页。

## TDesign 组件文案

TDesign Flutter 的组件内部文案不由 GetX `Translations` 自动翻译。TDesign 官方本地文档 `docs/tdesign-flutter/开始/快速开始.md` 说明可通过 `TDResourceDelegate` 与 `TDTheme.setResourceBuilder` 注入资源代理。当前 FlutterKit 尚未实现该代理；新增第三种语言或需要统一翻译 TDesign 内置文案时，应先在 Core 封装该能力，不能在业务页面逐个覆盖组件内部文本。

## 注意事项

- 每个 key 必须在所有已支持语言 Map 中存在；缺失 key 会直接显示 key 本身或回退文案。
- Feature 文案不跨模块 import；跨模块共用文本才提升到 Core common。
- 语言、主题是独立状态：主题切换不改变语言，语言切换不重新加载主题 JSON。
- Preview 与测试需要设置 `Get.locale`、注册 `AppTranslations`，确保 `.tr` 有可用翻译上下文。

## 关联阅读

- [主题系统](./theme.md)
- [深色模式](./dark-mode.md)
- [状态管理](./state.md)
