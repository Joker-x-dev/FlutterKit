import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/localization/app_translations.dart';
import 'package:flutter_kit/core/util/storage/storage_util.dart';
import 'package:flutter_kit/feature/auth/localization/auth_keys.dart';
import 'package:flutter_kit/feature/demo/logics/base_demo_logic.dart';
import 'package:flutter_kit/feature/demo/logics/base_tab_demo_logic.dart';
import 'package:flutter_kit/feature/demo/views/base_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/base_tab_demo_view.dart';
import 'package:flutter_kit/feature/main/localization/main_keys.dart';
import 'package:flutter_kit/feature/main/models/demo_action.dart';
import 'package:flutter_kit/feature/main/models/demo_item.dart';
import 'package:flutter_kit/feature/main/widgets/demo_list_group.dart';
import 'package:flutter_kit/feature/user/localization/user_keys.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 示例页面语言响应测试
///
/// 验证首页列表、Base 页面与 BaseTab 页面在切换语言后同步刷新。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ThemeData theme;

  /// 加载测试所需的 TDesign 主题
  setUpAll(() async {
    TDTheme.needMultiTheme();
    final jsonString = await rootBundle.loadString('assets/json/theme.json');
    final themeData = TDThemeData.fromJson(
      'theme',
      jsonString,
      darkName: 'themeDark',
    )!;
    theme = AppTheme.buildMaterialTheme(themeData.light, Brightness.light);
  });

  /// 初始化语言状态与本地存储
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageUtil.init();
    Get.locale = const Locale('zh', 'CN');
    Application.locale.value = const Locale('zh', 'CN');
  });

  /// 恢复全局语言状态并清理 GetX 依赖
  tearDown(() {
    Get.locale = const Locale('zh', 'CN');
    Application.locale.value = const Locale('zh', 'CN');
    Get.reset();
  });

  /// 构建指定示例页面
  ///
  /// [tester] Widget 测试控制器。
  /// [home] 待验证页面。
  Future<void> pumpPage(WidgetTester tester, Widget home) async {
    await tester.pumpWidget(
      GetMaterialApp(
        theme: theme,
        translations: AppTranslations(),
        locale: const Locale('zh', 'CN'),
        home: home,
      ),
    );
    await tester.pumpAndSettle();
  }

  /// 切换至英文并等待全局页面刷新
  ///
  /// [tester] Widget 测试控制器。
  Future<void> switchToEnglish(WidgetTester tester) async {
    await Application.updateLocale(const Locale('en', 'US'));
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await tester.pumpAndSettle();
  }

  /// 验证登录与退出登录提示提供完整中英文文案
  test('auth feedback messages support Chinese and English', () {
    final translations = AppTranslations().keys;

    expect(translations['zh_CN']?[AuthKeys.loginSuccess], '登录成功');
    expect(translations['en_US']?[AuthKeys.loginSuccess], 'Login successful');
    expect(translations['zh_CN']?[UserKeys.logoutSuccess], '已退出登录');
    expect(
      translations['en_US']?[UserKeys.logoutSuccess],
      'Logged out successfully',
    );
  });

  /// 验证公共示例列表根据当前语言动态解析标题与说明
  testWidgets('demo list group reacts to locale changes', (tester) async {
    await pumpPage(
      tester,
      Scaffold(
        body: DemoListGroup(
          items: [
            DemoItem(
              title: MainKeys.demoNetwork,
              description: MainKeys.demoNetworkDesc,
              icon: TDIcons.wifi,
              action: DemoAction.network,
            ),
          ],
        ),
      ),
    );

    expect(find.text('自动网络状态示例'), findsOneWidget);

    await switchToEnglish(tester);

    expect(find.text('Automatic Network State Demo'), findsOneWidget);
    expect(
      find.text('Show BaseNetworkView auto request and state switching'),
      findsOneWidget,
    );
  });

  /// 验证 Base 页面下拉菜单、内容和底部导航同步切换语言
  testWidgets('base demo page reacts to locale changes', (tester) async {
    Get.put<BaseDemoLogic>(BaseDemoLogic());
    await pumpPage(tester, BaseDemoView());

    expect(find.text('全部产品'), findsOneWidget);
    expect(find.text('页面主视图内容\n对 Scaffold 做了封装，减少样板代码'), findsOneWidget);
    expect(find.text('消息'), findsOneWidget);

    await switchToEnglish(tester);

    expect(find.text('All Products'), findsOneWidget);
    expect(
      find.text(
        'Main Page Content\nWrap Scaffold to reduce repetitive boilerplate code',
      ),
      findsOneWidget,
    );
    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  /// 验证 BaseTab 标签与页面内容同步切换语言
  testWidgets('base tab demo page reacts to locale changes', (tester) async {
    Get.put<BaseTabDemoLogic>(BaseTabDemoLogic());
    await pumpPage(tester, BaseTabDemoView());

    expect(find.text('标签页 1'), findsOneWidget);
    expect(find.text('页面 1'), findsOneWidget);

    await switchToEnglish(tester);

    expect(find.text('Tab 1'), findsOneWidget);
    expect(find.text('Page 1'), findsOneWidget);
  });
}
