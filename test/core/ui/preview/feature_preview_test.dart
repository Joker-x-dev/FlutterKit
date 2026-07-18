import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/ui/preview/app_preview.dart';
import 'package:flutter_kit/feature/auth/views/login_view.dart';
import 'package:flutter_kit/feature/demo/views/base_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/base_refresh_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/base_tab_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/database_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/local_storage_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/navigation_result_view.dart';
import 'package:flutter_kit/feature/demo/views/navigation_with_args_view.dart';
import 'package:flutter_kit/feature/demo/views/network_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/network_list_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/network_request_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/screen_adapt_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/state_management_demo_view.dart';
import 'package:flutter_kit/feature/demo/views/theme_demo_view.dart';
import 'package:flutter_kit/feature/main/views/about_demo_view.dart';
import 'package:flutter_kit/feature/main/views/core_demo_view.dart';
import 'package:flutter_kit/feature/main/views/expand_demo_view.dart';
import 'package:flutter_kit/feature/main/views/main_view.dart';
import 'package:flutter_kit/feature/main/views/navigation_demo_view.dart';
import 'package:flutter_kit/feature/main/widgets/demo_card.dart';
import 'package:flutter_kit/feature/main/widgets/demo_list_group.dart';
import 'package:flutter_kit/feature/main/widgets/main_bottom_navigation.dart';
import 'package:flutter_kit/feature/main/widgets/main_side_navigation.dart';
import 'package:flutter_kit/feature/user/views/user_info_view.dart';

/// Feature Preview 组件构建器
typedef FeaturePreviewBuilder = Widget Function();

/// Feature 页面与组件预览测试
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// 每个预览测试后清理 GetX 全局状态
  tearDown(Get.reset);

  final Map<String, FeaturePreviewBuilder> pagePreviews =
      <String, FeaturePreviewBuilder>{
        'LoginView': previewLoginView,
        'BaseDemoView': previewBaseDemoView,
        'BaseRefreshDemoView': previewBaseRefreshDemoView,
        'BaseTabDemoView': previewBaseTabDemoView,
        'DatabaseDemoView': previewDatabaseDemoView,
        'LocalStorageDemoView': previewLocalStorageDemoView,
        'NavigationResultView': previewNavigationResultView,
        'NavigationWithArgsView': previewNavigationWithArgsView,
        'NetworkDemoView': previewNetworkDemoView,
        'NetworkListDemoView': previewNetworkListDemoView,
        'NetworkRequestDemoView': previewNetworkRequestDemoView,
        'ScreenAdaptDemoView': previewScreenAdaptDemoView,
        'StateManagementDemoView': previewStateManagementDemoView,
        'ThemeDemoView': previewThemeDemoView,
        'AboutDemoView': previewAboutDemoView,
        'CoreDemoView': previewCoreDemoView,
        'ExpandDemoView': previewExpandDemoView,
        'MainView': previewMainView,
        'NavigationDemoView': previewNavigationDemoView,
        'UserInfoView': previewUserInfoView,
      };

  for (final MapEntry<String, FeaturePreviewBuilder> entry
      in pagePreviews.entries) {
    testWidgets('${entry.key} 页面预览可构建', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: wrapAppScreenPreview(entry.value())),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  }

  final Map<String, FeaturePreviewBuilder> componentPreviews =
      <String, FeaturePreviewBuilder>{
        'DemoCard': previewDemoCard,
        'DemoListGroup': previewDemoListGroup,
        'MainBottomNavigation': previewMainBottomNavigation,
        'MainSideNavigation': previewMainSideNavigation,
      };

  for (final MapEntry<String, FeaturePreviewBuilder> entry
      in componentPreviews.entries) {
    testWidgets('${entry.key} 组件预览可构建', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: wrapAppComponentPreview(entry.value())),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  }
}
