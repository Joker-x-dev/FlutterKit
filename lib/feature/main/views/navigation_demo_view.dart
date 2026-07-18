import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/service/user_service.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../core/design_system/theme/size.dart';
import '../localization/main_keys.dart';
import '../logics/navigation_demo_logic.dart';
import '../widgets/demo_list_group.dart';

/// 导航示例页
///
/// 展示带参跳转、结果回传、登录拦截及其执行状态。
class NavigationDemoView extends BaseView<NavigationDemoLogic> {
  /// 创建导航示例页面
  /// [logic] 外部注入的导航示例 Logic 一般用于测试和预览。
  NavigationDemoView({super.key, super.logic});

  /// 隐藏 Tab 页面返回按钮
  @override
  bool get navBackBtn => false;

  /// 首页标题栏高度
  @override
  double get navHeight => 56;

  /// 导航栏标题
  @override
  String? get navTitle => MainKeys.tabNavigation.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建导航示例内容
  @override
  Widget body() {
    return Obx(() {
      final localeTag = Application.locale.value.toLanguageTag();
      final demoResult = logic.navigationDemoState.demoResult.value;
      final statusCells = <TDCell>[
        if (logic.userService.isLoggedIn.value)
          TDCell(
            key: ValueKey<String>('logged-in-$localeTag'),
            bordered: true,
            leftIcon: TDIcons.check_circle,
            title: MainKeys.navigationLoggedIn.tr,
          ),
        if (demoResult != null)
          TDCell(
            key: ValueKey<String>('result-$localeTag'),
            bordered: true,
            leftIcon: TDIcons.info_circle,
            title: MainKeys.navigationResult.trParams({
              'id': '${demoResult.id}',
              'message': demoResult.message,
            }),
          ),
      ];

      return DemoListGroup(
        items: logic.navigationDemoState.demoItems,
        leadingCells: statusCells,
        onItemTap: logic.onItemTap,
      ).scrollable(padding: pageVerticalPadding);
    });
  }
}

/// 导航示例页面预览
@ResponsivePreview()
Widget previewNavigationDemoView() {
  final UserService userService = UserService();
  userService.isLoggedIn.value = true;
  final NavigationDemoLogic logic = NavigationDemoLogic(
    userService: userService,
  );
  return NavigationDemoView(logic: logic);
}
