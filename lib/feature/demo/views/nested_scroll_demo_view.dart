import 'package:flutter/material.dart';
import 'package:flutter_kit/core/base/base_tab/base_tab_view.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:get/get.dart';

import '../logics/nested_scroll_demo_logic.dart';
import '../states/nested_scroll_demo_state.dart';
import '../widgets/nested_scroll_demo_grid.dart';
import '../widgets/nested_scroll_demo_page_body.dart';

/// 嵌套滚动示例页面。
///
/// 组合资料头折叠、标签吸顶、内部列表滚动和背景拉伸刷新效果。
class NestedScrollDemoView extends BaseTabView<NestedScrollDemoLogic> {
  /// 创建嵌套滚动示例页面。
  ///
  /// [logic] 外部注入的页面 Logic，一般用于测试和预览。
  NestedScrollDemoView({super.key, super.logic});

  /// 隐藏基础页面导航栏，由页面绘制透明折叠顶栏。
  @override
  bool get isHiddenNav => true;

  /// 页面背景颜色。
  @override
  Color? get backgroundColor => appTheme.backgroundPage;

  /// 构建个人主页嵌套滚动内容。
  @override
  Widget body() {
    return NestedScrollDemoPageBody(
      tabController: logic.tabController,
      outerScrollController: logic.outerScrollController,
      refreshStateListenable: logic.refreshStateListenable,
      tabTitles: logic.tabList,
      onRefresh: logic.refreshCurrentTab,
      onBack: logic.back,
      tabBuilder:
          (BuildContext context, int tabIndex, ScrollPhysics scrollPhysics) {
            final NestedScrollDemoTab tab =
                NestedScrollDemoTab.values[tabIndex];
            return Obx(() {
              final List<NestedScrollDemoPostItem> posts = logic.state
                  .postsForTab(tab)
                  .toList(growable: false);
              return NestedScrollDemoGridTab(
                key: PageStorageKey<String>('nested-scroll-tab-$tabIndex'),
                posts: posts,
                tabIndex: tabIndex,
                scrollPhysics: scrollPhysics,
              );
            });
          },
    );
  }
}

/// 嵌套滚动示例页面预览。
@ResponsivePreview()
Widget previewNestedScrollDemoView() {
  final NestedScrollDemoLogic logic = NestedScrollDemoLogic(
    refreshDelay: Duration.zero,
  )..onInit();
  return NestedScrollDemoView(logic: logic);
}
