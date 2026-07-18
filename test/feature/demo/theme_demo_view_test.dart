import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/data/repository/locale_store_repository.dart';
import 'package:flutter_kit/core/data/repository/theme_store_repository.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/localization/app_translations.dart';
import 'package:flutter_kit/core/util/storage/storage_util.dart';
import 'package:flutter_kit/feature/demo/logics/theme_demo_logic.dart';
import 'package:flutter_kit/feature/demo/localization/demo_keys.dart';
import 'package:flutter_kit/feature/demo/views/theme_demo_view.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 语言与主题设置页测试
///
/// 验证页面使用 TDesign 设置项，并确保响应式状态与持久化行为正常。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ThemeData lightTheme;
  late ThemeData darkTheme;
  late TDThemeData defaultThemeData;

  /// 加载测试所需的 TDesign 明暗主题
  setUpAll(() async {
    TDTheme.needMultiTheme();
    final jsonString = await rootBundle.loadString('assets/json/theme.json');
    defaultThemeData = TDThemeData.fromJson(
      'theme',
      jsonString,
      darkName: 'themeDark',
    )!;
    lightTheme = AppTheme.buildMaterialTheme(
      defaultThemeData.light,
      Brightness.light,
    );
    darkTheme = AppTheme.buildMaterialTheme(
      defaultThemeData.dark ?? defaultThemeData.light,
      Brightness.dark,
    );
  });

  /// 初始化全局状态、应用信息与本地存储
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageUtil.init();
    Application.locale.value = const Locale('zh', 'CN');
    Application.themeMode.value = ThemeMode.system;
    Application.updateTheme(defaultThemeData, colorName: 'theme');
    Get.put<ThemeDemoLogic>(ThemeDemoLogic());
  });

  /// 清理 GetX 依赖与应用全局状态
  tearDown(() {
    Application.locale.value = const Locale('zh', 'CN');
    Application.themeMode.value = ThemeMode.system;
    Application.updateTheme(defaultThemeData, colorName: 'theme');
    Get.reset();
  });

  /// 构建语言与主题设置页
  Future<void> pumpThemeDemoView(WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: Application.themeMode.value,
        translations: AppTranslations(),
        locale: const Locale('zh', 'CN'),
        home: ThemeDemoView(),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// 验证页面进入时不触发 GetX 响应式作用域异常
  testWidgets('renders TDesign settings without improper Obx usage', (
    tester,
  ) async {
    await pumpThemeDemoView(tester);

    expect(tester.takeException(), isNull);
    expect(find.byType(TDCellGroup), findsNWidgets(3));
    expect(find.byType(TDSwitch), findsOneWidget);
    expect(find.text('语言设置'), findsOneWidget);
    expect(find.text('深浅模式'), findsOneWidget);
    expect(find.text('主题颜色'), findsOneWidget);
    expect(find.text('绿色主题'), findsOneWidget);
    expect(find.text('红色主题'), findsOneWidget);
    expect(find.text('蓝色主题'), findsOneWidget);
    expect(find.text('默认主题'), findsOneWidget);
    expect(find.text('关于'), findsNothing);
    expect(
      tester.getTopLeft(find.text('默认主题')).dy,
      lessThan(tester.getTopLeft(find.text('绿色主题')).dy),
    );
  });

  /// 验证语言切换通过 Repository 完成本地持久化
  testWidgets('switches and persists locale through repository', (
    tester,
  ) async {
    await pumpThemeDemoView(tester);

    await tester.tap(find.text('当前语言（点击切换）'));
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await tester.pumpAndSettle();

    final renderedTexts = tester
        .widgetList<Text>(find.byType(Text))
        .map((widget) => widget.data)
        .whereType<String>()
        .toList();
    expect(Application.locale.value, const Locale('en', 'US'));
    expect(Get.locale, const Locale('en', 'US'));
    expect(DemoKeys.languageSettingTitle.tr, 'Language');
    expect(renderedTexts, contains('Language'));
    expect(renderedTexts, contains('Brightness Mode'));
    expect(renderedTexts, contains('Theme Color'));
    expect(renderedTexts, contains('Green Theme'));
    expect(renderedTexts, contains('Current language (tap to switch)'));
    expect(await LocaleStoreRepository().getLocaleTag(), 'en_US');
    expect(tester.takeException(), isNull);
  });

  /// 验证手动选择深色模式后更新并持久化主题模式
  testWidgets('selects and persists dark theme mode', (tester) async {
    await pumpThemeDemoView(tester);

    await tester.tap(find.text('深色模式'));
    await tester.pumpAndSettle();

    expect(Application.themeMode.value, ThemeMode.dark);
    expect(
      await ThemeStoreRepository().getThemeModeIndex(),
      ThemeMode.dark.index,
    );
    expect(tester.takeException(), isNull);
  });

  /// 验证选择主题颜色后更新应用主题并完成持久化
  testWidgets('selects and persists green theme color', (tester) async {
    await pumpThemeDemoView(tester);

    await tester.tap(find.text('绿色主题'));
    await tester.pumpAndSettle();

    expect(Application.themeColorName.value, 'green');
    expect(Application.themeData.value.dark, isNotNull);
    expect(await ThemeStoreRepository().getThemeColorName(), 'green');
    expect(tester.takeException(), isNull);
  });
}
