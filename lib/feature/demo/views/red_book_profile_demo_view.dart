import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart' as flutter_physics;
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/shape.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_config.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_extension.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/generated/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/red_book_profile_demo_logic.dart';
import '../states/red_book_profile_demo_state.dart';

/// 仿小红书个人主页示例页。
///
/// 组合资料头折叠、标签吸顶、内部列表滚动和背景拉伸刷新效果。
class RedBookProfileDemoView extends BaseView<RedBookProfileDemoLogic> {
  /// 创建仿小红书个人主页示例页。
  ///
  /// [logic] 外部注入的页面 Logic，一般用于测试和预览。
  RedBookProfileDemoView({super.key, super.logic});

  /// 隐藏基础页面导航栏，由页面绘制透明折叠顶栏。
  @override
  bool get isHiddenNav => true;

  /// 禁止键盘改变嵌套滚动视口高度。
  @override
  bool get resizeToAvoidBottomInset => false;

  /// 页面背景颜色。
  @override
  Color? get backgroundColor => appTheme.backgroundPage;

  /// 构建个人主页嵌套滚动内容。
  @override
  Widget body() => _RedBookProfileDemoBody(logic: logic);
}

/// 个人主页滚动控制器宿主。
class _RedBookProfileDemoBody extends StatefulWidget {
  /// 创建个人主页滚动控制器宿主。
  ///
  /// [logic] 页面业务 Logic。
  const _RedBookProfileDemoBody({required this.logic});

  /// 页面业务 Logic。
  final RedBookProfileDemoLogic logic;

  /// 创建个人主页滚动状态。
  @override
  State<_RedBookProfileDemoBody> createState() =>
      _RedBookProfileDemoBodyState();
}

/// 个人主页滚动控制状态。
class _RedBookProfileDemoBodyState extends State<_RedBookProfileDemoBody>
    with SingleTickerProviderStateMixin {
  /// 页面标签数量。
  static const int _tabCount = 3;

  /// 小头像显隐动画时长。
  static const Duration _avatarAnimationDuration = Duration(milliseconds: 300);

  /// 资料头折叠完成判定的浮点容差。
  static const double _collapseCompletionTolerance = 0.5;

  /// 刷新位移约三百毫秒内平稳回弹的弹簧参数。
  static final flutter_physics.SpringDescription _refreshReboundSpring =
      flutter_physics.SpringDescription.withDurationAndBounce(
        duration: const Duration(milliseconds: 300),
        bounce: 0,
      );

  /// 外层折叠滚动控制器。
  late final ScrollController _outerScrollController;

  /// 标签页控制器。
  late final TabController _tabController;

  /// 下拉刷新指示器状态监听器。
  late final IndicatorStateListenable _refreshStateListenable;

  /// 初始化页面生命周期对象。
  @override
  void initState() {
    super.initState();
    _outerScrollController = ScrollController();
    _tabController = TabController(length: _tabCount, vsync: this);
    _refreshStateListenable = IndicatorStateListenable();
  }

  /// 释放页面生命周期对象。
  @override
  void dispose() {
    _tabController.dispose();
    _outerScrollController.dispose();
    super.dispose();
  }

  /// 构建背景、嵌套滚动、刷新指示器和固定顶栏。
  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double topBarContentHeight = spacer48;
    final double topBarHeight = mediaQuery.padding.top + topBarContentHeight;
    final double profileHeaderExtent =
        mediaQuery.orientation == Orientation.landscape
        ? spacer160 + spacer64
        : spacer160 + spacer96;
    final double refreshTriggerOffset = spacer48 + spacer12;

    return Stack(
      clipBehavior: Clip.hardEdge,
      children: <Widget>[
        _buildStretchBackground(
          appTheme: appTheme,
          topBarHeight: topBarHeight,
          profileHeaderExtent: profileHeaderExtent,
        ),
        Padding(
          padding: EdgeInsets.only(top: topBarHeight),
          child: _buildRefreshContent(
            appTheme: appTheme,
            profileHeaderExtent: profileHeaderExtent,
            refreshTriggerOffset: refreshTriggerOffset,
          ),
        ),
        _buildRefreshIndicator(
          appTheme: appTheme,
          topBarHeight: topBarHeight,
          refreshTriggerOffset: refreshTriggerOffset,
        ),
        _buildTopBar(
          appTheme: appTheme,
          statusBarHeight: mediaQuery.padding.top,
          contentHeight: topBarContentHeight,
          profileHeaderExtent: profileHeaderExtent,
        ),
      ],
    );
  }

  /// 构建顶部锚定并随下拉位移增高的背景。
  ///
  /// [appTheme] 当前应用主题。
  /// [topBarHeight] 状态栏与顶栏总高度。
  /// [profileHeaderExtent] 资料头展开高度。
  Widget _buildStretchBackground({
    required AppTheme appTheme,
    required double topBarHeight,
    required double profileHeaderExtent,
  }) {
    return AnimatedBuilder(
      animation: _outerScrollController,
      builder: (BuildContext context, Widget? child) {
        return ValueListenableBuilder<IndicatorState?>(
          valueListenable: _refreshStateListenable,
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
                return Positioned(
                  key: const ValueKey<String>('red-book-background'),
                  top: -collapseOffset,
                  left: 0,
                  right: 0,
                  height: topBarHeight + profileHeaderExtent + pullOffset,
                  child: child!,
                );
              },
        );
      },
      child: RepaintBoundary(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Assets.image.redBookProfile.picVitality.svg(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              semanticsLabel: DemoKeys.titleRedBookProfileDemo.tr,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    appTheme.primaryDark.withValues(alpha: 0),
                    appTheme.primaryDark.withValues(alpha: 0.92),
                  ],
                  stops: const <double>[0.2, 1],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建 EasyRefresh 与 NestedScrollView 协作的页面前景。
  ///
  /// [appTheme] 当前应用主题。
  /// [profileHeaderExtent] 资料头展开高度。
  /// [refreshTriggerOffset] 刷新触发位移。
  Widget _buildRefreshContent({
    required AppTheme appTheme,
    required double profileHeaderExtent,
    required double refreshTriggerOffset,
  }) {
    return EasyRefresh.builder(
      scrollController: _outerScrollController,
      isNested: true,
      triggerAxis: Axis.vertical,
      spring: _refreshReboundSpring,
      frictionFactor: (double overscrollFraction) => 0.5,
      header: ListenerHeader(
        listenable: _refreshStateListenable,
        triggerOffset: refreshTriggerOffset,
        clamping: true,
        safeArea: false,
        processedDuration: Duration.zero,
        maxOverOffset: spacer160,
      ),
      notLoadFooter: const NotLoadFooter(clamping: true),
      onRefresh: () => widget.logic.refreshTab(_tabController.index),
      childBuilder: (BuildContext context, ScrollPhysics physics) {
        final ScrollPhysics innerPhysics = physics.applyTo(
          const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
        );
        return ValueListenableBuilder<IndicatorState?>(
          valueListenable: _refreshStateListenable,
          child: NestedScrollView(
            key: const ValueKey<String>('red-book-nested-scroll'),
            controller: _outerScrollController,
            physics: physics,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: SizedBox(
                        key: const ValueKey<String>('red-book-profile-header'),
                        height: profileHeaderExtent,
                        child: _buildProfileHeader(appTheme),
                      ),
                    ),
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                      sliver: SliverPersistentHeader(
                        pinned: true,
                        delegate: _RedBookTabHeaderDelegate(
                          extent: spacer40,
                          child: _buildTabHeader(appTheme),
                        ),
                      ),
                    ),
                  ];
                },
            body: TabBarView(
              controller: _tabController,
              physics: const PageScrollPhysics(),
              children: List<Widget>.generate(
                _tabCount,
                (int tabIndex) => _RedBookProfileGridTab(
                  key: PageStorageKey<String>('red-book-tab-$tabIndex'),
                  logic: widget.logic,
                  tabIndex: tabIndex,
                  scrollPhysics: innerPhysics,
                ),
              ),
            ),
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
                return Transform.translate(
                  key: const ValueKey<String>('red-book-refresh-foreground'),
                  offset: Offset(0, pullOffset),
                  child: child,
                );
              },
        );
      },
    );
  }

  /// 构建个人资料区。
  ///
  /// [appTheme] 当前应用主题。
  Widget _buildProfileHeader(AppTheme appTheme) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: _maximumContentWidth()),
            child: Padding(
              padding: EdgeInsets.all(spacePaddingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildLargeAvatar(appTheme),
                      SizedBox(width: spaceHorizontalLarge),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TDText(
                              DemoKeys.redBookProfileName.tr,
                              font: appTheme.fontTitleLarge,
                              fontWeight: appTheme.fontWeightBold,
                              textColor: appTheme.textAnti,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: spaceVerticalXSmall),
                            TDText(
                              DemoKeys.redBookProfileId.tr,
                              font: appTheme.fontBodySmall,
                              textColor: appTheme.textAnti.withValues(
                                alpha: 0.72,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spaceVerticalMedium),
                  TDText(
                    DemoKeys.redBookProfileBio.tr,
                    font: appTheme.fontBodySmall,
                    textColor: appTheme.textAnti,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: <Widget>[
                      _RedBookProfileStat(
                        value: '13',
                        label: DemoKeys.redBookFollowing.tr,
                        appTheme: appTheme,
                      ),
                      SizedBox(width: spaceHorizontalLarge),
                      _RedBookProfileStat(
                        value: '18',
                        label: DemoKeys.redBookFollowers.tr,
                        appTheme: appTheme,
                      ),
                      SizedBox(width: spaceHorizontalLarge),
                      _RedBookProfileStat(
                        value: '342',
                        label: DemoKeys.redBookLikesAndSaves.tr,
                        appTheme: appTheme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DecoratedBox(
            key: const ValueKey<String>('red-book-profile-sheet-overlap'),
            decoration: _profileSheetDecoration(appTheme),
            child: SizedBox(
              width: double.infinity,
              height: spaceVerticalMedium,
            ),
          ),
        ),
      ],
    );
  }

  /// 构建带新增标记的大头像。
  ///
  /// [appTheme] 当前应用主题。
  Widget _buildLargeAvatar(AppTheme appTheme) {
    final double avatarExtent = spacer64 + spacer16;
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        _buildAvatar(
          extent: avatarExtent,
          borderWidth: spaceIndicator,
          appTheme: appTheme,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: appTheme.primary,
              shape: BoxShape.circle,
              border: Border.all(color: appTheme.textAnti, width: spaceDivider),
            ),
            child: SizedBox.square(
              dimension: spacer24,
              child: Icon(
                TDIcons.add,
                size: spacer16,
                color: appTheme.textAnti,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 构建圆形头像。
  ///
  /// [extent] 头像边长。
  /// [borderWidth] 头像描边宽度。
  /// [appTheme] 当前应用主题。
  Widget _buildAvatar({
    required double extent,
    required double borderWidth,
    required AppTheme appTheme,
  }) {
    return SizedBox.square(
      dimension: extent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: appTheme.textAnti, width: borderWidth),
        ),
        child: Padding(
          padding: EdgeInsets.all(borderWidth),
          child: ClipOval(
            child: Assets.image.redBookProfile.iconHanbao.svg(
              width: extent - borderWidth * 4,
              height: extent - borderWidth * 4,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  /// 构建吸顶标签栏及搜索入口。
  ///
  /// [appTheme] 当前应用主题。
  Widget _buildTabHeader(AppTheme appTheme) {
    final double tabBarWidth = spacer160 + spacer64 + spacer16;
    return DecoratedBox(
      key: const ValueKey<String>('red-book-tab-bar'),
      decoration: _profileSheetDecoration(appTheme),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: tabBarWidth,
            child: TDTabBar(
              controller: _tabController,
              height: spacer40,
              tabs: <TDTab>[
                TDTab(text: DemoKeys.redBookNotes.tr),
                TDTab(text: DemoKeys.redBookCollections.tr),
                TDTab(text: DemoKeys.redBookLiked.tr),
              ],
              backgroundColor: appTheme.backgroundContainer,
              dividerHeight: 0,
              showIndicator: true,
              indicatorWidth: spacer24,
              indicatorHeight: spaceIndicator + spaceDivider * 2,
              indicatorColor: appTheme.primary,
              labelColor: appTheme.textPrimary,
              unselectedLabelColor: appTheme.textSecondary,
              labelStyle: TextStyle(
                fontWeight: appTheme.fontWeightBold,
                fontSize: appTheme.fontTitleSmall?.size,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: appTheme.fontWeightRegular,
                fontSize: appTheme.fontTitleSmall?.size,
              ),
              labelPadding: EdgeInsets.symmetric(
                horizontal: spaceHorizontalMedium,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              tooltip: DemoKeys.redBookSearch.tr,
              onPressed: () => _showUnavailableToast(context),
              icon: Icon(
                TDIcons.search,
                size: spacer24,
                color: appTheme.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建独立于滚动前景的刷新指示器。
  ///
  /// [appTheme] 当前应用主题。
  /// [topBarHeight] 状态栏与顶栏总高度。
  /// [refreshTriggerOffset] 刷新触发位移。
  Widget _buildRefreshIndicator({
    required AppTheme appTheme,
    required double topBarHeight,
    required double refreshTriggerOffset,
  }) {
    return ValueListenableBuilder<IndicatorState?>(
      valueListenable: _refreshStateListenable,
      builder: (BuildContext context, IndicatorState? state, Widget? child) {
        final double offset = math.max(state?.offset ?? 0, 0);
        if (offset <= 0) {
          return const SizedBox.shrink();
        }
        final double progress = (offset / refreshTriggerOffset).clamp(0, 1);
        final double indicatorExtent = spacer24 + spacer4;
        final bool isProcessing = state?.mode == IndicatorMode.processing;
        return Positioned(
          key: const ValueKey<String>('red-book-refresh-indicator'),
          top:
              topBarHeight - refreshTriggerOffset + offset + spaceVerticalLarge,
          left: 0,
          right: 0,
          child: Center(
            child: SizedBox.square(
              dimension: indicatorExtent,
              child: isProcessing
                  ? TDLoading(
                      size: TDLoadingSize.medium,
                      icon: TDLoadingIcon.circle,
                      iconColor: appTheme.primary,
                    )
                  : CircularProgressIndicator(
                      value: progress,
                      strokeWidth: spaceIndicator,
                      strokeCap: StrokeCap.round,
                      color: appTheme.primary,
                      backgroundColor: appTheme.backgroundContainer.withValues(
                        alpha: 0.64,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  /// 构建随资料头折叠改变背景透明度的固定顶栏。
  ///
  /// [appTheme] 当前应用主题。
  /// [statusBarHeight] 系统状态栏高度。
  /// [contentHeight] 顶栏内容高度。
  /// [profileHeaderExtent] 资料头展开高度。
  Widget _buildTopBar({
    required AppTheme appTheme,
    required double statusBarHeight,
    required double contentHeight,
    required double profileHeaderExtent,
  }) {
    return AnimatedBuilder(
      animation: _outerScrollController,
      builder: (BuildContext context, Widget? child) {
        final double collapseOffset = _collapseOffset(profileHeaderExtent);
        final double opacity = (collapseOffset / spacer96).clamp(0, 1);
        final bool isProfileHeaderCollapsed =
            collapseOffset >=
            profileHeaderExtent - _collapseCompletionTolerance;
        return Positioned(
          key: const ValueKey<String>('red-book-top-bar'),
          top: 0,
          left: 0,
          right: 0,
          height: statusBarHeight + contentHeight,
          child: ColoredBox(
            color: appTheme.primaryDark.withValues(alpha: opacity),
            child: Padding(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: ClipRect(
                key: const ValueKey<String>('red-book-small-avatar-clip'),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        tooltip: DemoKeys.redBookBack.tr,
                        onPressed: () => Get.back<void>(),
                        icon: Icon(
                          TDIcons.chevron_left,
                          size: spacer24,
                          color: appTheme.textAnti,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      key: const ValueKey<String>(
                        'red-book-small-avatar-visibility',
                      ),
                      duration: _avatarAnimationDuration,
                      curve: Curves.easeOutBack,
                      opacity: isProfileHeaderCollapsed ? 1 : 0,
                      child: AnimatedContainer(
                        key: const ValueKey<String>('red-book-small-avatar'),
                        duration: _avatarAnimationDuration,
                        curve: Curves.easeOutBack,
                        transform: Matrix4.translationValues(
                          0,
                          isProfileHeaderCollapsed ? 0 : spacer48,
                          0,
                        ),
                        child: _buildAvatar(
                          extent: spacer24,
                          borderWidth: spaceDivider,
                          appTheme: appTheme,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        tooltip: DemoKeys.redBookShare.tr,
                        onPressed: () => _showUnavailableToast(context),
                        icon: Icon(
                          TDIcons.share,
                          size: spacer24,
                          color: appTheme.textAnti,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// 获取当前资料头折叠位移。
  ///
  /// [profileHeaderExtent] 资料头最大折叠范围。
  double _collapseOffset(double profileHeaderExtent) {
    if (!_outerScrollController.hasClients) {
      return 0;
    }
    return _outerScrollController.offset.clamp(0, profileHeaderExtent);
  }

  /// 获取响应式内容最大宽度。
  double _maximumContentWidth() => spacer160 * 5 + spacer40;

  /// 构建资料区与下半区衔接使用的圆角背景。
  ///
  /// [appTheme] 当前应用主题。
  BoxDecoration _profileSheetDecoration(AppTheme appTheme) {
    return BoxDecoration(
      color: appTheme.backgroundContainer,
      borderRadius: BorderRadius.vertical(top: Radius.circular(radiusLarge)),
    );
  }

  /// 显示未实现扩展交互的提示。
  ///
  /// [context] 当前页面上下文。
  void _showUnavailableToast(BuildContext context) {
    TDToast.showText(
      DemoKeys.redBookDemoActionUnavailable.tr,
      context: context,
    );
  }
}

/// 个人资料统计项。
class _RedBookProfileStat extends StatelessWidget {
  /// 创建个人资料统计项。
  ///
  /// [value] 统计数值。
  /// [label] 统计名称。
  /// [appTheme] 当前应用主题。
  const _RedBookProfileStat({
    required this.value,
    required this.label,
    required this.appTheme,
  });

  /// 统计数值。
  final String value;

  /// 统计名称。
  final String label;

  /// 当前应用主题。
  final AppTheme appTheme;

  /// 构建统计数值与名称。
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TDText(
          value,
          font: appTheme.fontBodySmall,
          fontWeight: appTheme.fontWeightBold,
          textColor: appTheme.textAnti,
        ),
        SizedBox(height: spaceVerticalXSmall),
        TDText(
          label,
          font: appTheme.fontBodySmall,
          textColor: appTheme.textAnti.withValues(alpha: 0.72),
        ),
      ],
    );
  }
}

/// 个人主页标签吸顶代理。
class _RedBookTabHeaderDelegate extends SliverPersistentHeaderDelegate {
  /// 创建标签吸顶代理。
  ///
  /// [extent] 标签栏固定高度。
  /// [child] 标签栏内容。
  const _RedBookTabHeaderDelegate({required this.extent, required this.child});

  /// 标签栏固定高度。
  final double extent;

  /// 标签栏内容。
  final Widget child;

  /// 标签栏最大高度。
  @override
  double get maxExtent => extent;

  /// 标签栏最小高度。
  @override
  double get minExtent => extent;

  /// 构建吸顶标签栏。
  ///
  /// [context] 当前构建上下文。
  /// [shrinkOffset] 当前收缩位移。
  /// [overlapsContent] 是否覆盖内部内容。
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => child;

  /// 判断标签栏配置是否需要重建。
  ///
  /// [oldDelegate] 上一次标签栏代理。
  @override
  bool shouldRebuild(covariant _RedBookTabHeaderDelegate oldDelegate) {
    return oldDelegate.extent != extent || oldDelegate.child != child;
  }
}

/// 单个个人主页标签列表。
class _RedBookProfileGridTab extends StatelessWidget {
  /// 创建个人主页标签列表。
  ///
  /// [logic] 页面业务 Logic。
  /// [tabIndex] 标签下标。
  const _RedBookProfileGridTab({
    super.key,
    required this.logic,
    required this.tabIndex,
    required this.scrollPhysics,
  });

  /// 页面业务 Logic。
  final RedBookProfileDemoLogic logic;

  /// 标签下标。
  final int tabIndex;

  /// EasyRefresh 注入的内部列表滚动物理效果。
  final ScrollPhysics scrollPhysics;

  /// 构建带重叠补偿和独立滚动位置的响应式 Grid。
  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme.of(context);
    final SliverOverlapAbsorberHandle overlapHandle =
        NestedScrollView.sliverOverlapAbsorberHandleFor(context);
    return Obx(() {
      final List<RedBookProfilePostItem> posts = logic.state
          .postsForTab(tabIndex)
          .toList(growable: false);
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final BreakpointType breakpoint = BreakpointType.fromWidth(
            constraints.maxWidth,
          );
          final int columnCount = breakpoint.bp(xs: 2, sm: 2, md: 3, lg: 3);
          final double maxContentWidth = spacer160 * 5 + spacer40;
          final double sideInset = math.max(
            spacePaddingXSmall,
            (constraints.maxWidth - maxContentWidth) / 2 + spacePaddingXSmall,
          );
          final double cardExtent = breakpoint.bp(
            xs: spacer160 + spacer96,
            sm: spacer160 + spacer96,
            md: spacer160 + spacer96 + spacer32,
            lg: spacer160 + spacer96 + spacer32,
          );
          return CustomScrollView(
            key: PageStorageKey<String>('red-book-grid-$tabIndex'),
            primary: true,
            physics: scrollPhysics,
            slivers: <Widget>[
              SliverOverlapInjector(handle: overlapHandle),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  sideInset,
                  spaceVerticalXSmall,
                  sideInset,
                  MediaQuery.paddingOf(context).bottom + spaceVerticalLarge,
                ),
                sliver: SliverGrid(
                  key: ValueKey<String>('red-book-grid-sliver-$tabIndex'),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnCount,
                    mainAxisExtent: cardExtent,
                    mainAxisSpacing: spaceVerticalXSmall,
                    crossAxisSpacing: spaceHorizontalXSmall,
                  ),
                  delegate: SliverChildBuilderDelegate((
                    BuildContext context,
                    int index,
                  ) {
                    return _RedBookProfilePostCard(
                      key: ValueKey<String>('red-book-post-$tabIndex-$index'),
                      item: posts[index],
                      appTheme: appTheme,
                    );
                  }, childCount: posts.length),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}

/// 个人主页帖子卡片。
class _RedBookProfilePostCard extends StatelessWidget {
  /// 创建个人主页帖子卡片。
  ///
  /// [item] 帖子展示数据。
  /// [appTheme] 当前应用主题。
  const _RedBookProfilePostCard({
    super.key,
    required this.item,
    required this.appTheme,
  });

  /// 帖子展示数据。
  final RedBookProfilePostItem item;

  /// 当前应用主题。
  final AppTheme appTheme;

  /// 构建封面、标题和作者信息。
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: appTheme.backgroundContainer,
        borderRadius: BorderRadius.circular(radiusLarge),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radiusLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SvgPicture.asset(
                item.assetPath,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                semanticsLabel: DemoKeys.redBookPostTitle.trParams(
                  <String, String>{'index': '${item.titleIndex}'},
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(spacePaddingSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TDText(
                    DemoKeys.redBookPostTitle.trParams(<String, String>{
                      'index': '${item.titleIndex}',
                    }),
                    font: appTheme.fontBodySmall,
                    fontWeight: appTheme.fontWeightMedium,
                    textColor: appTheme.textPrimary,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: spaceVerticalXSmall),
                  Row(
                    children: <Widget>[
                      ClipOval(
                        child: Assets.image.redBookProfile.iconHanbao.svg(
                          width: spacer16,
                          height: spacer16,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: spaceHorizontalXSmall),
                      Expanded(
                        child: TDText(
                          item.author,
                          font: appTheme.fontMarkSmall,
                          textColor: appTheme.textSecondary,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        TDIcons.heart,
                        size: spacer16,
                        color: appTheme.textSecondary,
                      ),
                      SizedBox(width: spaceHorizontalXSmall),
                      TDText(
                        '${item.likes}',
                        font: appTheme.fontMarkSmall,
                        textColor: appTheme.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 仿小红书个人主页示例页面预览。
@ResponsivePreview()
Widget previewRedBookProfileDemoView() {
  return RedBookProfileDemoView(
    logic: RedBookProfileDemoLogic(refreshDelay: Duration.zero),
  );
}
