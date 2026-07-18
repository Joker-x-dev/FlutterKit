import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// Material 与 TDesign 主题桥接测试
///
/// 验证普通导航图标使用语义前景色，品牌色仅用于主要交互。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late TDThemeData themeData;

  /// 加载项目主题配置
  setUpAll(() async {
    TDTheme.needMultiTheme();
    final jsonString = await rootBundle.loadString('assets/json/theme.json');
    themeData = TDThemeData.fromJson(
      'theme',
      jsonString,
      darkName: 'themeDark',
    )!;
  });

  /// 验证浅色模式普通图标不使用品牌色
  test('light theme uses text color for navigation icons', () {
    final theme = AppTheme.buildMaterialTheme(
      themeData.light,
      Brightness.light,
    );

    expect(theme.colorScheme.primary, themeData.light.brandNormalColor);
    expect(theme.iconTheme.color, themeData.light.textColorPrimary);
    expect(
      theme.appBarTheme.iconTheme?.color,
      themeData.light.textColorPrimary,
    );
  });

  /// 验证深色模式普通图标使用深色主题前景色
  test('dark theme uses dark text color for navigation icons', () {
    final darkTheme = themeData.dark!;
    final theme = AppTheme.buildMaterialTheme(darkTheme, Brightness.dark);

    expect(theme.colorScheme.primary, darkTheme.brandNormalColor);
    expect(theme.iconTheme.color, darkTheme.textColorPrimary);
    expect(theme.appBarTheme.iconTheme?.color, darkTheme.textColorPrimary);
    expect(theme.scaffoldBackgroundColor, darkTheme.bgColorPage);
  });

  /// 验证系统导航栏背景与主题容器颜色一致
  test('system navigation bar uses theme container color', () {
    final lightStyle = AppTheme.buildSystemUiOverlayStyle(
      themeData.light,
      Brightness.light,
    );
    final darkTheme = themeData.dark!;
    final darkStyle = AppTheme.buildSystemUiOverlayStyle(
      darkTheme,
      Brightness.dark,
    );

    expect(
      lightStyle.systemNavigationBarColor,
      themeData.light.bgColorContainer,
    );
    expect(lightStyle.systemNavigationBarIconBrightness, Brightness.dark);
    expect(darkStyle.systemNavigationBarColor, darkTheme.bgColorContainer);
    expect(darkStyle.systemNavigationBarIconBrightness, Brightness.light);
  });

  /// 验证 BaseView 返回按钮显式使用主要文本色
  testWidgets('base view back button uses text primary color', (tester) async {
    final theme = AppTheme.buildMaterialTheme(
      themeData.light,
      Brightness.light,
    );

    await tester.pumpWidget(
      GetMaterialApp(theme: theme, home: _TestBaseView()),
    );

    final backButton = tester.widget<BackButton>(find.byType(BackButton));
    expect(backButton.color, themeData.light.textColorPrimary);
  });

  /// 验证 BaseView 为底部安全区提供容器背景
  testWidgets('base view paints bottom navigation safe area', (tester) async {
    final theme = AppTheme.buildMaterialTheme(
      themeData.light,
      Brightness.light,
    );

    await tester.pumpWidget(
      GetMaterialApp(theme: theme, home: _TestBottomBaseView()),
    );

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    final bottomNavigationBar = scaffold.bottomNavigationBar! as ColoredBox;
    expect(bottomNavigationBar.color, themeData.light.bgColorContainer);
  });
}

/// BaseView 导航栏测试页面
class _TestBaseView extends BaseView<GetxController> {
  /// 创建测试页面
  _TestBaseView();

  /// 测试页面标题
  @override
  String? get navTitle => 'Title';

  /// 构建测试页面内容
  @override
  Widget body() => const SizedBox.shrink();
}

/// BaseView 底部导航测试页面
class _TestBottomBaseView extends _TestBaseView {
  /// 创建底部导航测试页面
  _TestBottomBaseView();

  /// 构建测试底部导航内容
  @override
  Widget? bottom() => const SizedBox(height: 60);
}
