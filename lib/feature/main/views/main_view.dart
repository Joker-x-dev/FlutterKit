import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/service/demo_counter_service.dart';
import 'package:flutter_kit/core/service/user_service.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';

import '../../../core/design_system/theme/size.dart';
import '../logics/about_demo_logic.dart';
import '../logics/core_demo_logic.dart';
import '../logics/expand_demo_logic.dart';
import '../logics/main_logic.dart';
import '../logics/navigation_demo_logic.dart';
import '../widgets/main_bottom_navigation.dart';
import '../widgets/main_side_navigation.dart';
import 'about_demo_view.dart';
import 'core_demo_view.dart';
import 'expand_demo_view.dart';
import 'navigation_demo_view.dart';

/// 主页面
///
/// 手机竖屏使用底部导航，手机横屏使用左侧导航。
class MainView extends BaseView<MainLogic> {
  /// 创建主页面
  ///
  /// [logic] 外部注入的主页面 Logic 一般用于测试和预览。
  /// [pages] 主导航页面列表，未传入时使用默认页面。
  MainView({super.key, super.logic, List<Widget>? pages})
    : _pages =
          pages ??
          <Widget>[
            CoreDemoView(),
            NavigationDemoView(),
            ExpandDemoView(),
            AboutDemoView(),
          ];

  /// 主导航页面列表
  final List<Widget> _pages;

  /// 隐藏主框架顶部导航栏
  @override
  bool get isHiddenNav => true;

  /// 构建随屏幕方向切换导航位置的主页面
  @override
  Widget body() {
    return Builder(
      builder: (BuildContext context) {
        final Widget pageView = _buildPageView();
        final bool isLandscape =
            MediaQuery.orientationOf(context) == Orientation.landscape;

        return <Widget>[
          isLandscape
              ? MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: _buildSideNavigation(),
                    )
                    .pad(top: MediaQuery.paddingOf(context).top)
                    .width(spacer96 + spacer16)
                    .backgroundColor(appTheme.backgroundContainer)
              : const SizedBox.shrink(),
          pageView.expanded(),
        ].toRow();
      },
    );
  }

  /// 构建主页面内容切换区域
  Widget _buildPageView() {
    return PageView(
      controller: logic.mainState.pageController,
      onPageChanged: logic.onPageChanged,
      children: _pages,
    );
  }

  /// 构建随屏幕方向显示的底部导航区域
  @override
  Widget? bottom() {
    return Builder(
      builder: (BuildContext context) {
        if (MediaQuery.orientationOf(context) == Orientation.landscape) {
          return const SizedBox.shrink();
        }
        return _buildBottomNavigation();
      },
    );
  }

  /// 构建竖屏底部导航栏
  Widget _buildBottomNavigation() {
    return Obx(
      () => MainBottomNavigation(
        currentIndex: logic.mainState.pageIndex.value,
        onSelected: logic.onNavigationSelected,
        items: logic.mainState.navigationItems,
      ),
    );
  }

  /// 构建横屏左侧导航栏
  Widget _buildSideNavigation() {
    return Obx(
      () => MainSideNavigation(
        currentIndex: logic.mainState.pageIndex.value,
        onSelected: logic.onNavigationSelected,
        items: logic.mainState.navigationItems,
      ),
    );
  }
}

/// 主页面预览
@ResponsivePreview()
Widget previewMainView() {
  final UserService userService = UserService();
  final DemoCounterService counterService = DemoCounterService();
  counterService.count.value = 3;
  final NavigationDemoLogic navigationLogic = NavigationDemoLogic(
    userService: userService,
  );
  final MainLogic logic = MainLogic()..onInit();
  return MainView(
    logic: logic,
    pages: <Widget>[
      CoreDemoView(logic: CoreDemoLogic(counterService: counterService)),
      NavigationDemoView(logic: navigationLogic),
      ExpandDemoView(logic: ExpandDemoLogic()),
      AboutDemoView(logic: AboutDemoLogic()),
    ],
  );
}
