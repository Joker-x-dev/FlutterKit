import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart' as flutter_physics;
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/generated/assets.gen.dart';
import 'package:get/get.dart';

import '../localization/demo_keys.dart';
import '../logics/nested_scroll_demo_logic.dart';
import '../states/nested_scroll_demo_state.dart';
import 'nested_scroll_demo_grid.dart';
import 'nested_scroll_demo_header.dart';
import 'nested_scroll_demo_tab_header.dart';
import 'nested_scroll_demo_top_bar.dart';
import 'nested_scroll_refresh_ball.dart';

/// 嵌套滚动示例标签内容构建器。
///
/// [context] 当前构建上下文。
/// [tabIndex] 标签索引。
/// [scrollPhysics] EasyRefresh 注入的内部滚动物理效果。
typedef NestedScrollDemoTabBuilder = Widget Function(
  BuildContext context,
  int tabIndex,
  ScrollPhysics scrollPhysics,
);

/// 嵌套滚动示例页面主体。
class NestedScrollDemoPageBody extends StatelessWidget {
  /// 创建个人主页嵌套滚动主体。
  ///
  /// [tabController] 标签控制器。
  /// [outerScrollController] 外层资料折叠滚动控制器。
  /// [refreshStateListenable] 下拉刷新指示器状态监听器。
  /// [tabTitles] 标签标题。
  /// [tabBuilder] 标签内容构建器。
  /// [onRefresh] 当前标签刷新操作。
  /// [onBack] 返回操作。
  const NestedScrollDemoPageBody({
    super.key,
    required this.tabController,
    required this.outerScrollController,
    required this.refreshStateListenable,
    required this.tabTitles,
    required this.tabBuilder,
    required this.onRefresh,
    required this.onBack,
  });

  /// 资料头折叠完成判定的浮点容差。
  static const double _collapseCompletionTolerance = 0.5;

  /// 刷新位移约三百毫秒内平稳回弹的弹簧参数。
  static final flutter_physics.SpringDescription _refreshReboundSpring =
      flutter_physics.SpringDescription.withDurationAndBounce(
        duration: const Duration(milliseconds: 300),
        bounce: 0,
      );

  /// 标签控制器。
  final TabController tabController;

  /// 外层资料折叠滚动控制器。
  final ScrollController outerScrollController;

  /// 下拉刷新指示器状态监听器。
  final IndicatorStateListenable refreshStateListenable;

  /// 标签标题。
  final List<String> tabTitles;

  /// 标签内容构建器。
  final NestedScrollDemoTabBuilder tabBuilder;

  /// 当前标签刷新操作。
  final Future<void> Function() onRefresh;

  /// 返回操作。
  final VoidCallback onBack;

  /// 构建背景、嵌套滚动、刷新指示器和固定顶栏。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double topBarContentHeight = spacer48;
    final double topBarHeight = mediaQuery.padding.top + topBarContentHeight;
    final double profileHeaderExtent =
        mediaQuery.orientation == Orientation.landscape
        ? spacer160 + spacer64
        : spacer160 + spacer96;
    final double profileSheetOverlap = spaceVerticalMedium;
    final double refreshTriggerOffset = spacer48 + spacer12;

    return <Widget>[
      _buildStretchBackground(
        topBarHeight: topBarHeight,
        profileHeaderExtent: profileHeaderExtent,
        profileSheetOverlap: profileSheetOverlap,
      ),
      _buildRefreshContent(
        profileHeaderExtent: profileHeaderExtent,
        refreshTriggerOffset: refreshTriggerOffset,
      ).padTop(topBarHeight),
      _buildRefreshIndicator(
        topBarHeight: topBarHeight,
        refreshTriggerOffset: refreshTriggerOffset,
      ),
      _buildTopBar(
        statusBarHeight: mediaQuery.padding.top,
        contentHeight: topBarContentHeight,
        profileHeaderExtent: profileHeaderExtent,
      ),
    ].toStack(clipBehavior: .hardEdge);
  }

  /// 构建顶部锚定并随下拉位移增高的背景。
  ///
  /// [topBarHeight] 状态栏与顶栏总高度。
  /// [profileHeaderExtent] 资料头展开高度。
  /// [profileSheetOverlap] 背景延伸至下半区圆角后的距离。
  Widget _buildStretchBackground({
    required double topBarHeight,
    required double profileHeaderExtent,
    required double profileSheetOverlap,
  }) {
    return outerScrollController.animatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return ValueListenableBuilder<IndicatorState?>(
          valueListenable: refreshStateListenable,
          child: child,
          builder:
              (
                BuildContext context,
                IndicatorState? refreshState,
                Widget? child,
              ) {
                final double pullOffset = math.max(
                  refreshState?.offset ?? 0,
                  0,
                );
                final double collapseOffset = _collapseOffset(
                  profileHeaderExtent,
                );
                return child!
                    .keyed(const ValueKey<String>('nested-scroll-background'))
                    .positioned(
                      top: -collapseOffset,
                      left: 0,
                      right: 0,
                      height:
                          topBarHeight +
                          profileHeaderExtent +
                          profileSheetOverlap +
                          pullOffset,
                    );
              },
        );
      },
      child: Assets.image.background
          .svg(
            fit: .cover,
            alignment: .topCenter,
            semanticsLabel: DemoKeys.titleNestedScrollDemo.tr,
          )
          .decorated(
            position: .foreground,
            gradient: LinearGradient(
              begin: .topCenter,
              end: .bottomCenter,
              colors: <Color>[
                appTheme.primaryDark.withValues(alpha: 0),
                appTheme.primaryDark.withValues(alpha: 0.92),
              ],
              stops: const <double>[0.2, 1],
            ),
          )
          .repaintBoundary(),
    );
  }

  /// 构建 EasyRefresh 与 NestedScrollView 协作的页面前景。
  ///
  /// [profileHeaderExtent] 资料头展开高度。
  /// [refreshTriggerOffset] 刷新触发位移。
  Widget _buildRefreshContent({
    required double profileHeaderExtent,
    required double refreshTriggerOffset,
  }) {
    return EasyRefresh.builder(
      scrollController: outerScrollController,
      isNested: true,
      triggerAxis: .vertical,
      spring: _refreshReboundSpring,
      frictionFactor: (double overscrollFraction) => 0.5,
      header: ListenerHeader(
        listenable: refreshStateListenable,
        triggerOffset: refreshTriggerOffset,
        clamping: true,
        safeArea: false,
        processedDuration: Duration.zero,
        maxOverOffset: spacer160,
      ),
      notLoadFooter: const NotLoadFooter(clamping: true),
      onRefresh: onRefresh,
      childBuilder: (BuildContext context, ScrollPhysics physics) {
        final ScrollPhysics innerPhysics = physics.applyTo(
          const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
        );
        return ValueListenableBuilder<IndicatorState?>(
          valueListenable: refreshStateListenable,
          child:
              TabBarView(
                controller: tabController,
                physics: const PageScrollPhysics(),
                children: List<Widget>.generate(
                  tabController.length,
                  (int tabIndex) => tabBuilder(context, tabIndex, innerPhysics),
                ),
              ).nestedScroll(
                key: const ValueKey<String>('nested-scroll-nested-scroll'),
                controller: outerScrollController,
                physics: physics,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        const NestedScrollDemoHeader()
                            .height(profileHeaderExtent)
                            .keyed(
                              const ValueKey<String>(
                                'nested-scroll-demo-header',
                              ),
                            )
                            .sliverToBoxAdapter(),
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: NestedScrollDemoTabHeaderDelegate(
                            extent: spacer40,
                            child: _buildTabHeader(
                              profileHeaderExtent: profileHeaderExtent,
                            ),
                          ),
                        ).sliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context,
                              ),
                        ),
                      ];
                    },
              ),
          builder:
              (
                BuildContext context,
                IndicatorState? refreshState,
                Widget? child,
              ) {
                final double pullOffset = math.max(
                  refreshState?.offset ?? 0,
                  0,
                );
                return child!
                    .keyed(
                      const ValueKey<String>(
                        'nested-scroll-refresh-foreground',
                      ),
                    )
                    .translateY(pullOffset);
              },
        );
      },
    );
  }

  /// 构建随资料头折叠更新圆角遮罩的吸顶标签栏。
  ///
  /// [profileHeaderExtent] 资料头最大折叠范围。
  Widget _buildTabHeader({required double profileHeaderExtent}) {
    return outerScrollController.animatedBuilder(
      builder: (BuildContext context, Widget? child) {
        final double collapseOffset = _collapseOffset(profileHeaderExtent);
        final bool isProfileHeaderCollapsed =
            collapseOffset >=
            profileHeaderExtent - _collapseCompletionTolerance;
        return NestedScrollDemoTabHeader(
          controller: tabController,
          titles: tabTitles,
          showCornerGuard: isProfileHeaderCollapsed,
        );
      },
    );
  }

  /// 构建独立于滚动前景的刷新指示器。
  ///
  /// [topBarHeight] 状态栏与顶栏总高度。
  /// [refreshTriggerOffset] 刷新触发位移。
  Widget _buildRefreshIndicator({
    required double topBarHeight,
    required double refreshTriggerOffset,
  }) {
    return ValueListenableBuilder<IndicatorState?>(
      valueListenable: refreshStateListenable,
      builder: (BuildContext context, IndicatorState? state, Widget? child) {
        final double offset = math.max(state?.offset ?? 0, 0);
        if (offset <= 0) {
          return const SizedBox.shrink();
        }
        final double progress = (offset / refreshTriggerOffset).clamp(0, 1);
        final double indicatorExtent = spacer24 + spacer4;
        final bool isProcessing = state?.mode == IndicatorMode.processing;
        return NestedScrollRefreshBall(
              key: const ValueKey<String>('nested-scroll-refresh-ball'),
              progress: progress,
              isProcessing: isProcessing,
              color: appTheme.textAnti.withValues(alpha: 0.72),
              strokeWidth: spaceIndicator + spaceDivider * 2,
            )
            .square(indicatorExtent)
            .center()
            .keyed(const ValueKey<String>('nested-scroll-refresh-indicator'))
            .positioned(
              top:
                  topBarHeight -
                  refreshTriggerOffset +
                  offset +
                  spaceVerticalLarge,
              left: 0,
              right: 0,
            );
      },
    );
  }

  /// 构建随资料头折叠改变背景透明度的固定顶栏。
  ///
  /// [statusBarHeight] 系统状态栏高度。
  /// [contentHeight] 顶栏内容高度。
  /// [profileHeaderExtent] 资料头展开高度。
  Widget _buildTopBar({
    required double statusBarHeight,
    required double contentHeight,
    required double profileHeaderExtent,
  }) {
    return outerScrollController.animatedBuilder(
      builder: (BuildContext context, Widget? child) {
        final double collapseOffset = _collapseOffset(profileHeaderExtent);
        final double opacity = (collapseOffset / spacer96).clamp(0, 1);
        final bool isTopBarOpaque =
            collapseOffset >= spacer96 - _collapseCompletionTolerance;
        return NestedScrollDemoTopBar(
          key: const ValueKey<String>('nested-scroll-top-bar'),
          statusBarHeight: statusBarHeight,
          opacity: opacity,
          showSmallAvatar: isTopBarOpaque,
          onBack: onBack,
        ).positioned(
          top: 0,
          left: 0,
          right: 0,
          height: statusBarHeight + contentHeight,
        );
      },
    );
  }

  /// 获取当前资料头折叠位移。
  ///
  /// [profileHeaderExtent] 资料头最大折叠范围。
  double _collapseOffset(double profileHeaderExtent) {
    if (!outerScrollController.hasClients) {
      return 0;
    }
    return outerScrollController.offset.clamp(0, profileHeaderExtent);
  }
}

/// 个人主页嵌套滚动主体组件预览。
@WidgetPreview()
Widget previewNestedScrollDemoPageBody() {
  return const _NestedScrollDemoPageBodyPreview();
}

/// 个人主页嵌套滚动主体预览控制器宿主。
class _NestedScrollDemoPageBodyPreview extends StatefulWidget {
  /// 创建个人主页嵌套滚动主体预览控制器宿主。
  const _NestedScrollDemoPageBodyPreview();

  /// 创建预览控制状态。
  @override
  State<_NestedScrollDemoPageBodyPreview> createState() =>
      _NestedScrollDemoPageBodyPreviewState();
}

/// 个人主页嵌套滚动主体预览控制状态。
class _NestedScrollDemoPageBodyPreviewState
    extends State<_NestedScrollDemoPageBodyPreview> {
  /// 预览页面 Logic。
  late final NestedScrollDemoLogic _logic;

  /// 初始化预览页面控制器。
  @override
  void initState() {
    super.initState();
    _logic = NestedScrollDemoLogic(refreshDelay: Duration.zero)..onInit();
  }

  /// 释放预览页面控制器。
  @override
  void dispose() {
    _logic.onClose();
    super.dispose();
  }

  /// 构建可独立渲染的嵌套滚动主体。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return NestedScrollDemoPageBody(
      tabController: _logic.tabController,
      outerScrollController: _logic.outerScrollController,
      refreshStateListenable: _logic.refreshStateListenable,
      tabTitles: _logic.tabList,
      onRefresh: _logic.refreshCurrentTab,
      onBack: _logic.back,
      tabBuilder:
          (BuildContext context, int tabIndex, ScrollPhysics scrollPhysics) {
            final NestedScrollDemoTab tab =
                NestedScrollDemoTab.values[tabIndex];
            return Obx(() {
              final List<NestedScrollDemoPostItem> posts = _logic.state
                  .postsForTab(tab)
                  .take(6)
                  .toList(growable: false);
              return NestedScrollDemoGridTab(
                posts: posts,
                tabIndex: tabIndex,
                scrollPhysics: scrollPhysics,
              );
            });
          },
    );
  }
}
