import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:flutter_kit/feature/demo/logics/nested_scroll_demo_logic.dart';
import 'package:flutter_kit/feature/demo/states/nested_scroll_demo_state.dart';
import 'package:flutter_kit/feature/demo/views/nested_scroll_demo_view.dart';

import '../../support/test_environment.dart';

/// 嵌套滚动示例嵌套滚动与响应式布局测试。
void main() {
  setUp(initializeCoreTestEnvironment);
  tearDown(resetCoreTestEnvironment);

  testWidgets('页面组合共享控制器与固定下拉刷新参数', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    final NestedScrollDemoLogic logic = NestedScrollDemoLogic(
      refreshDelay: Duration.zero,
    );

    await _pumpProfilePage(tester, logic: logic);

    final EasyRefresh easyRefresh = tester.widget<EasyRefresh>(
      find.byType(EasyRefresh),
    );
    final NestedScrollView nestedScrollView = tester.widget<NestedScrollView>(
      find.byKey(const ValueKey<String>('nested-scroll-nested-scroll')),
    );
    final ListenerHeader header = easyRefresh.header! as ListenerHeader;
    final CustomScrollView innerScrollView = tester.widget<CustomScrollView>(
      _gridFinder(0),
    );

    expect(easyRefresh.isNested, isTrue);
    expect(easyRefresh.triggerAxis, Axis.vertical);
    expect(easyRefresh.scrollController, same(nestedScrollView.controller));
    expect(easyRefresh.scrollController, same(logic.outerScrollController));
    expect(
      tester.widget<TTabsBar>(find.byType(TTabsBar)).controller,
      same(logic.tabController),
    );
    expect(logic.tabState.pageController, isNull);
    expect(easyRefresh.frictionFactor?.call(0.5), 0.5);
    expect(header.triggerOffset, 60);
    expect(header.clamping, isTrue);
    expect(header.safeArea, isFalse);
    expect(header.maxOverOffset, 160);
    expect(easyRefresh.notLoadFooter, isA<NotLoadFooter>());
    expect(easyRefresh.notLoadFooter?.clamping, isTrue);
    expect(nestedScrollView.physics, isA<BouncingScrollPhysics>());
    expect(
      nestedScrollView.physics?.parent,
      isA<AlwaysScrollableScrollPhysics>(),
    );
    final ScrollPhysics innerPhysics = innerScrollView.physics!;
    expect(innerScrollView.primary, isTrue);
    expect(innerPhysics, isA<BouncingScrollPhysics>());
    expect(innerPhysics.parent, isA<AlwaysScrollableScrollPhysics>());
    expect(innerPhysics.parent?.parent, isA<AlwaysScrollableScrollPhysics>());
    expect(innerPhysics.parent?.parent?.parent, isA<ClampingScrollPhysics>());
    expect(tester.takeException(), isNull);
  });

  final List<(String, Size, Brightness, int)> renderCases =
      <(String, Size, Brightness, int)>[
        ('三百二十像素窄屏', const Size(320, 700), Brightness.light, 2),
        ('浅色手机竖屏', const Size(390, 844), Brightness.light, 2),
        ('浅色手机横屏', const Size(844, 390), Brightness.light, 3),
        ('深色折叠屏', const Size(673, 841), Brightness.dark, 3),
        ('深色平板', const Size(700, 1000), Brightness.dark, 3),
      ];

  for (final (name, size, brightness, expectedColumns) in renderCases) {
    testWidgets('$name 可渲染且使用预期网格列数', (WidgetTester tester) async {
      _configureSurface(tester, size);
      final NestedScrollDemoLogic logic = NestedScrollDemoLogic(
        refreshDelay: Duration.zero,
      );

      await _pumpProfilePage(tester, logic: logic, brightness: brightness);

      expect(
        find.byKey(const ValueKey<String>('nested-scroll-background')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey<String>('nested-scroll-demo-header')),
        findsOneWidget,
      );
      expect(find.byType(TTabsBar), findsOneWidget);
      expect(find.text('Joker.X'), findsOneWidget);
      final SliverGrid grid = tester.widget<SliverGrid>(
        find.byKey(const ValueKey<String>('nested-scroll-grid-sliver-0')),
      );
      final SliverGridDelegateWithFixedCrossAxisCount delegate =
          grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegate.crossAxisCount, expectedColumns);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('顶栏按钮使用同组图标和相同尺寸且不显示搜索入口', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    await _pumpProfilePage(
      tester,
      logic: NestedScrollDemoLogic(refreshDelay: Duration.zero),
    );

    final IconButton backButton = tester.widget<IconButton>(
      find.widgetWithIcon(IconButton, Icons.arrow_back_rounded),
    );
    final IconButton shareButton = tester.widget<IconButton>(
      find.widgetWithIcon(IconButton, Icons.share_rounded),
    );
    final Icon backIcon = backButton.icon as Icon;
    final Icon shareIcon = shareButton.icon as Icon;

    expect(backIcon.icon, Icons.arrow_back_rounded);
    expect(shareIcon.icon, Icons.share_rounded);
    expect(backIcon.icon?.fontFamily, shareIcon.icon?.fontFamily);
    expect(backIcon.size, shareIcon.size);
    expect(
      backButton.style?.fixedSize?.resolve(<WidgetState>{}),
      shareButton.style?.fixedSize?.resolve(<WidgetState>{}),
    );
    expect(backButton.onPressed, isNotNull);
    expect(shareButton.onPressed, isNull);
    expect(find.byTooltip('搜索'), findsNothing);
    expect(find.byIcon(TIcons.search), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('下半区保持四十像素并以左右圆角覆盖资料背景', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    await _pumpProfilePage(
      tester,
      logic: NestedScrollDemoLogic(refreshDelay: Duration.zero),
    );

    final Finder tabBar = find.byKey(
      const ValueKey<String>('nested-scroll-tab-bar'),
    );
    final Finder tabBarClipFinder = find.ancestor(
      of: tabBar,
      matching: find.byType(ClipRRect),
    );
    final Rect tabBarRect = tester.getRect(tabBar);
    final ClipRRect tabBarClip = tester.widget<ClipRRect>(tabBarClipFinder);
    final BorderRadius tabBarRadius = tabBarClip.borderRadius as BorderRadius;
    final Positioned expandedBackground = _backgroundPosition(tester);

    expect(tabBarRect.height, closeTo(40, 0.001));
    expect(tabBarRadius.topLeft.x, greaterThan(0));
    expect(tabBarRadius.topRight.x, greaterThan(0));
    expect(tabBarClip.clipBehavior, isNot(Clip.none));
    expect(_tabCornerGuardColor(tester).a, 0);
    expect(
      expandedBackground.top! + expandedBackground.height!,
      closeTo(tabBarRect.top + 12, 0.001),
    );

    await tester.drag(_gridFinder(0), const Offset(0, -440));
    await tester.pumpAndSettle();

    final Rect collapsedTabBarRect = tester.getRect(tabBar);
    final Positioned collapsedBackground = _backgroundPosition(tester);
    expect(_outerScrollOffset(tester), closeTo(256, 1));
    expect(collapsedTabBarRect.height, closeTo(40, 0.001));
    expect(_tabCornerGuardColor(tester), _topBarColor(tester));
    expect(
      collapsedBackground.top! + collapsedBackground.height!,
      closeTo(collapsedTabBarRect.top + 12, 0.001),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('上滑九十六像素后显示实色顶栏与小头像', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    final NestedScrollDemoLogic logic = NestedScrollDemoLogic(
      refreshDelay: Duration.zero,
    );
    await _pumpProfilePage(tester, logic: logic);

    final Finder profileHeader = find.byKey(
      const ValueKey<String>('nested-scroll-demo-header'),
    );
    final double initialHeaderTop = tester.getTopLeft(profileHeader).dy;
    expect(_outerScrollOffset(tester), 0);
    expect(_gridScrollPosition(tester, 0).pixels, 0);
    expect(_topBarColor(tester).a, closeTo(0, 0.001));
    expect(_smallAvatarTranslationY(tester), closeTo(48, 0.001));
    expect(_smallAvatarOpacity(tester), 0);

    await tester.drag(_gridFinder(0), const Offset(0, -120));
    await tester.pumpAndSettle();

    final double collapsedOffset = _outerScrollOffset(tester);
    expect(collapsedOffset, greaterThanOrEqualTo(96));
    expect(collapsedOffset, lessThan(256));
    expect(_gridScrollPosition(tester, 0).pixels, closeTo(0, 1));
    expect(
      tester.getTopLeft(profileHeader).dy,
      closeTo(initialHeaderTop - collapsedOffset, 1),
    );
    expect(_topBarColor(tester).a, closeTo(1, 0.001));
    expect(_smallAvatarTranslationY(tester), closeTo(0, 0.001));
    expect(_smallAvatarOpacity(tester), 1);

    await tester.drag(_gridFinder(0), const Offset(0, -320));
    await tester.pumpAndSettle();

    final double innerOffsetAfterHeaderCollapsed = _gridScrollPosition(
      tester,
      0,
    ).pixels;
    expect(_outerScrollOffset(tester), closeTo(256, 1));
    expect(innerOffsetAfterHeaderCollapsed, greaterThan(0));
    expect(_smallAvatarTranslationY(tester), closeTo(0, 0.001));
    expect(_smallAvatarOpacity(tester), 1);

    await tester.drag(_gridFinder(0), const Offset(0, -120));
    await tester.pumpAndSettle();

    expect(_outerScrollOffset(tester), closeTo(256, 1));
    expect(
      _gridScrollPosition(tester, 0).pixels,
      greaterThan(innerOffsetAfterHeaderCollapsed),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('短列表下拉一百像素时前景背景跟手且阈值内释放回弹', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    final _TrackingNestedScrollDemoLogic logic = _TrackingNestedScrollDemoLogic(
      state: _buildShortProfileState(),
      refreshDelay: Duration.zero,
    );
    await _pumpProfilePage(tester, logic: logic);

    final CustomScrollView scrollView = tester.widget<CustomScrollView>(
      _gridFinder(0),
    );
    expect(scrollView.primary, isTrue);
    expect(scrollView.physics, isA<BouncingScrollPhysics>());
    expect(_outerScrollOffset(tester), 0);
    expect(_gridScrollPosition(tester, 0).pixels, 0);
    final Positioned initialBackground = _backgroundPosition(tester);
    final Finder profileHeader = find.byKey(
      const ValueKey<String>('nested-scroll-demo-header'),
    );
    final double initialHeaderTop = tester.getTopLeft(profileHeader).dy;

    final _ActivePullGesture gesture = await _startActivePull(
      tester,
      totalDistance: 100,
    );

    final IndicatorState refreshState = _refreshState(tester);
    final double pullOffset = _foregroundTranslationY(tester);
    final Positioned stretchedBackground = _backgroundPosition(tester);
    expect(refreshState.mode, IndicatorMode.drag);
    expect(
      find.byKey(const ValueKey<String>('nested-scroll-refresh-ball')),
      findsOneWidget,
    );
    expect(find.byType(TLoading), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(refreshState.offset, closeTo(pullOffset, 0.001));
    expect(pullOffset, closeTo(45, 0.001));
    expect(stretchedBackground.top, closeTo(0, 0.001));
    expect(
      stretchedBackground.height,
      closeTo(initialBackground.height! + pullOffset, 0.001),
    );
    expect(
      tester.getTopLeft(profileHeader).dy,
      closeTo(initialHeaderTop + pullOffset, 0.001),
    );
    expect(logic.refreshInvocationCount, 0);

    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(logic.refreshInvocationCount, 0);
    expect(_foregroundTranslationY(tester), closeTo(0, 1));
    expect(_backgroundPosition(tester).top, closeTo(0, 0.001));
    expect(
      _backgroundPosition(tester).height,
      closeTo(initialBackground.height!, 1),
    );
    expect(tester.getTopLeft(profileHeader).dy, closeTo(initialHeaderTop, 1));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('短列表下拉超过阈值仅触发一次刷新', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    final _TrackingNestedScrollDemoLogic logic = _TrackingNestedScrollDemoLogic(
      state: _buildShortProfileState(),
      refreshDelay: Duration.zero,
    );
    await _pumpProfilePage(tester, logic: logic);

    final _ActivePullGesture gesture = await _startActivePull(
      tester,
      totalDistance: 160,
    );
    final IndicatorState refreshState = _refreshState(tester);
    expect(refreshState.mode, IndicatorMode.armed);
    expect(refreshState.offset, greaterThan(60));

    await gesture.up();
    await tester.pumpAndSettle();

    expect(logic.refreshInvocationCount, 1);
    for (int frame = 0; frame < 10; frame++) {
      await tester.pump(const Duration(milliseconds: 16));
    }
    expect(logic.refreshInvocationCount, 1);
    expect(tester.takeException(), isNull);
  });

  testWidgets('下拉依次回收内部列表、展开资料头并进入刷新位移', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    final _TrackingNestedScrollDemoLogic logic = _TrackingNestedScrollDemoLogic(
      refreshDelay: Duration.zero,
    );
    await _pumpProfilePage(tester, logic: logic);

    final NestedScrollView nestedScrollView = tester.widget<NestedScrollView>(
      find.byKey(const ValueKey<String>('nested-scroll-nested-scroll')),
    );
    final ScrollController outerController = nestedScrollView.controller!;
    final ScrollPosition innerPosition = _gridScrollPosition(tester, 0);
    expect(outerController.position.maxScrollExtent, closeTo(256, 0.001));
    outerController.jumpTo(outerController.position.maxScrollExtent);
    innerPosition.jumpTo(100);
    await tester.pump();
    expect(_outerScrollOffset(tester), closeTo(256, 0.001));
    expect(_gridScrollPosition(tester, 0).pixels, closeTo(100, 0.001));

    final _ActivePullGesture gesture = await _startActivePull(
      tester,
      totalDistance: 60,
    );
    expect(_gridScrollPosition(tester, 0).pixels, inExclusiveRange(0, 100));
    expect(_outerScrollOffset(tester), closeTo(256, 0.001));
    expect(_refreshState(tester).offset, closeTo(0, 0.001));

    await gesture.moveByDistance(_gridScrollPosition(tester, 0).pixels);
    expect(_gridScrollPosition(tester, 0).pixels, closeTo(0, 0.001));
    expect(_outerScrollOffset(tester), closeTo(256, 0.001));
    expect(_refreshState(tester).offset, closeTo(0, 0.001));

    await gesture.moveByDistance(100);
    expect(_gridScrollPosition(tester, 0).pixels, closeTo(0, 0.001));
    expect(_outerScrollOffset(tester), inExclusiveRange(0, 256));
    expect(_refreshState(tester).offset, closeTo(0, 0.001));

    await gesture.moveByDistance(_outerScrollOffset(tester));
    expect(_gridScrollPosition(tester, 0).pixels, closeTo(0, 0.001));
    expect(_outerScrollOffset(tester), closeTo(0, 0.001));
    expect(_refreshState(tester).offset, closeTo(0, 0.001));

    await gesture.moveByDistance(40);
    expect(_outerScrollOffset(tester), closeTo(0, 0.001));
    expect(_gridScrollPosition(tester, 0).pixels, closeTo(0, 0.001));
    expect(_refreshState(tester).mode, IndicatorMode.drag);
    final double pullOffset = _refreshState(tester).offset;
    expect(pullOffset, inExclusiveRange(0, 60));
    expect(_foregroundTranslationY(tester), closeTo(pullOffset, 0.001));

    await gesture.up();
    await tester.pumpAndSettle();
    expect(logic.refreshInvocationCount, 0);
    expect(tester.takeException(), isNull);
  });

  testWidgets('三个标签横向切换不刷新并独立保留列表位置', (WidgetTester tester) async {
    _configureSurface(tester, const Size(390, 844));
    final _TrackingNestedScrollDemoLogic logic = _TrackingNestedScrollDemoLogic(
      refreshDelay: Duration.zero,
    );
    await _pumpProfilePage(tester, logic: logic);

    await tester.drag(_gridFinder(0), const Offset(0, -600));
    await tester.pumpAndSettle();
    final double firstTabOffset = _gridScrollPosition(tester, 0).pixels;
    expect(firstTabOffset, greaterThan(0));

    await _switchToNextTab(tester);
    expect(_selectedTabIndex(tester), 1);
    expect(_gridScrollPosition(tester, 1).pixels, closeTo(0, 1));

    await _switchToNextTab(tester);
    expect(_selectedTabIndex(tester), 2);
    expect(_gridScrollPosition(tester, 2).pixels, closeTo(0, 1));

    await _switchToPreviousTab(tester);
    await _switchToPreviousTab(tester);

    expect(_selectedTabIndex(tester), 0);
    expect(_gridScrollPosition(tester, 0).pixels, closeTo(firstTabOffset, 1));
    expect(logic.refreshInvocationCount, 0);
    expect(tester.takeException(), isNull);
  });
}

/// 配置 Widget 测试逻辑屏幕尺寸。
///
/// [tester] 当前 Widget 测试控制器。
/// [size] 逻辑屏幕尺寸。
void _configureSurface(WidgetTester tester, Size size) {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = size;
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(tester.view.resetPhysicalSize);
}

/// 构建并稳定嵌套滚动示例。
///
/// [tester] 当前 Widget 测试控制器。
/// [logic] 页面业务 Logic。
/// [brightness] 页面主题亮度。
Future<void> _pumpProfilePage(
  WidgetTester tester, {
  required NestedScrollDemoLogic logic,
  Brightness brightness = Brightness.light,
}) async {
  logic.onInit();
  addTearDown(logic.onClose);
  await tester.pumpWidget(
    buildCoreTestApp(
      home: NestedScrollDemoView(logic: logic),
      brightness: brightness,
    ),
  );
  await tester.pumpAndSettle();
}

/// 记录 EasyRefresh 发起刷新次数的测试 Logic。
class _TrackingNestedScrollDemoLogic extends NestedScrollDemoLogic {
  /// 创建刷新调用跟踪 Logic。
  ///
  /// [state] 页面展示状态。
  /// [refreshDelay] 单次刷新等待时间。
  _TrackingNestedScrollDemoLogic({
    super.state,
    super.refreshDelay = const Duration(seconds: 1),
  });

  /// EasyRefresh 发起刷新次数。
  int refreshInvocationCount = 0;

  /// 记录调用后刷新当前标签。
  @override
  Future<void> refreshCurrentTab() {
    refreshInvocationCount++;
    return super.refreshCurrentTab();
  }
}

/// 返回指定标签内部 Grid。
///
/// [tabIndex] 标签索引。
Finder _gridFinder(int tabIndex) {
  return find.byKey(
    PageStorageKey<String>('nested-scroll-grid-$tabIndex'),
    skipOffstage: false,
  );
}

/// 返回指定标签内部 Grid 的 Scrollable。
///
/// [tabIndex] 标签索引。
Finder _gridScrollableFinder(int tabIndex) {
  return find
      .descendant(
        of: _gridFinder(tabIndex),
        matching: find.byType(Scrollable, skipOffstage: false),
        skipOffstage: false,
      )
      .first;
}

/// 返回指定标签内部 Grid 的滚动位置。
///
/// [tester] 当前 Widget 测试控制器。
/// [tabIndex] 标签索引。
ScrollPosition _gridScrollPosition(WidgetTester tester, int tabIndex) {
  return tester
      .state<ScrollableState>(_gridScrollableFinder(tabIndex))
      .position;
}

/// 在当前标签 Grid 上执行保持按下状态的分段下拉手势。
///
/// [tester] 当前 Widget 测试控制器。
/// [totalDistance] 手指累计下拉距离。
Future<_ActivePullGesture> _startActivePull(
  WidgetTester tester, {
  required double totalDistance,
}) async {
  final Finder scrollable = _gridScrollableFinder(0).hitTestable();
  expect(scrollable, findsOneWidget);
  final _ActivePullGesture gesture = _ActivePullGesture(
    tester: tester,
    gesture: await tester.startGesture(tester.getCenter(scrollable)),
  );
  await gesture.moveByDistance(totalDistance);
  return gesture;
}

/// 保持按下状态并按固定帧率推进的下拉测试手势。
class _ActivePullGesture {
  /// 创建可继续推进的下拉测试手势。
  ///
  /// [tester] 当前 Widget 测试控制器。
  /// [gesture] 底层触控手势。
  _ActivePullGesture({required this.tester, required this.gesture});

  /// 当前 Widget 测试控制器。
  final WidgetTester tester;

  /// 底层触控手势。
  final TestGesture gesture;

  /// 已发送的触控帧数。
  int _frame = 0;

  /// 按十像素小步继续向下移动。
  ///
  /// [distance] 本阶段累计移动距离。
  Future<void> moveByDistance(double distance) async {
    double movedDistance = 0;
    while (movedDistance < distance) {
      final double remainingDistance = distance - movedDistance;
      final double stepDistance = remainingDistance < 10
          ? remainingDistance
          : 10;
      _frame++;
      await gesture.moveBy(
        Offset(0, stepDistance),
        timeStamp: Duration(milliseconds: _frame * 16),
      );
      movedDistance += stepDistance;
      await tester.pump(const Duration(milliseconds: 16));
    }
  }

  /// 释放当前下拉手势。
  Future<void> up() async {
    _frame++;
    await gesture.up(timeStamp: Duration(milliseconds: _frame * 16));
  }
}

/// 返回 EasyRefresh Header 当前指示器状态。
///
/// [tester] 当前 Widget 测试控制器。
IndicatorState _refreshState(WidgetTester tester) {
  final EasyRefresh easyRefresh = tester.widget<EasyRefresh>(
    find.byType(EasyRefresh),
  );
  final ListenerHeader header = easyRefresh.header! as ListenerHeader;
  final IndicatorState? state = header.listenable?.value;
  expect(state, isNotNull);
  return state!;
}

/// 返回刷新前景当前纵向平移量。
///
/// [tester] 当前 Widget 测试控制器。
double _foregroundTranslationY(WidgetTester tester) {
  final Finder foreground = find.byKey(
    const ValueKey<String>('nested-scroll-refresh-foreground'),
  );
  final Finder transform = find.ancestor(
    of: foreground,
    matching: find.byType(Transform),
  );
  return tester.widget<Transform>(transform.first).transform.getTranslation().y;
}

/// 返回 NestedScrollView 外层折叠位移。
///
/// [tester] 当前 Widget 测试控制器。
double _outerScrollOffset(WidgetTester tester) {
  final NestedScrollView nestedScrollView = tester.widget<NestedScrollView>(
    find.byKey(const ValueKey<String>('nested-scroll-nested-scroll')),
  );
  return nestedScrollView.controller!.offset;
}

/// 返回拉伸背景当前定位参数。
///
/// [tester] 当前 Widget 测试控制器。
Positioned _backgroundPosition(WidgetTester tester) {
  final Finder background = find.byKey(
    const ValueKey<String>('nested-scroll-background'),
  );
  final Finder positioned = find.ancestor(
    of: background,
    matching: find.byType(Positioned),
  );
  return tester.widget<Positioned>(positioned.first);
}

/// 返回固定顶栏当前背景颜色。
///
/// [tester] 当前 Widget 测试控制器。
Color _topBarColor(WidgetTester tester) {
  final Finder topBar = find.byKey(
    const ValueKey<String>('nested-scroll-top-bar'),
  );
  final Finder decoratedBox = find.descendant(
    of: topBar,
    matching: find.byType(DecoratedBox),
  );
  return _decoratedBoxColor(tester, decoratedBox.first);
}

/// 返回吸顶标签栏圆角后方的遮罩颜色。
///
/// [tester] 当前 Widget 测试控制器。
Color _tabCornerGuardColor(WidgetTester tester) {
  return _decoratedBoxColor(
    tester,
    find.byKey(const ValueKey<String>('nested-scroll-tab-corner-guard')),
  );
}

/// 读取折叠顶栏小头像的垂直位移。
///
/// [tester] 当前 Widget 测试控制器。
double _smallAvatarTranslationY(WidgetTester tester) {
  final Finder avatar = find.byKey(
    const ValueKey<String>('nested-scroll-small-avatar'),
  );
  final Finder transform = find.ancestor(
    of: avatar,
    matching: find.byType(Transform),
  );
  return tester.widget<Transform>(transform.first).transform.storage[13];
}

/// 读取折叠顶栏小头像的不透明度。
///
/// [tester] 当前 Widget 测试控制器。
double _smallAvatarOpacity(WidgetTester tester) {
  final Finder visibility = find.byKey(
    const ValueKey<String>('nested-scroll-small-avatar-visibility'),
  );
  final Finder opacity = find.descendant(
    of: visibility,
    matching: find.byType(AnimatedOpacity),
  );
  return tester.widget<AnimatedOpacity>(opacity).opacity;
}

/// 读取链式背景装饰的颜色。
///
/// [tester] 当前 Widget 测试控制器。
/// [finder] 目标装饰盒查找器。
Color _decoratedBoxColor(WidgetTester tester, Finder finder) {
  final DecoratedBox decoratedBox = tester.widget<DecoratedBox>(finder);
  final BoxDecoration decoration = decoratedBox.decoration as BoxDecoration;
  return decoration.color!;
}

/// 返回 TDesign 标签栏当前选中索引。
///
/// [tester] 当前 Widget 测试控制器。
int _selectedTabIndex(WidgetTester tester) {
  return tester.widget<TTabsBar>(find.byType(TTabsBar)).controller!.index;
}

/// 横向切换到下一个标签。
///
/// [tester] 当前 Widget 测试控制器。
Future<void> _switchToNextTab(WidgetTester tester) async {
  await tester.fling(find.byType(TabBarView), const Offset(-360, 0), 1000);
  await tester.pumpAndSettle();
}

/// 横向切换到上一个标签。
///
/// [tester] 当前 Widget 测试控制器。
Future<void> _switchToPreviousTab(WidgetTester tester) async {
  await tester.fling(find.byType(TabBarView), const Offset(360, 0), 1000);
  await tester.pumpAndSettle();
}

/// 构建用于短列表下拉验证的三标签状态。
NestedScrollDemoState _buildShortProfileState() {
  const NestedScrollDemoPostItem post = NestedScrollDemoPostItem(
    assetPath: 'assets/image/nested_scroll_demo/grid.svg',
    titleIndex: 1,
    author: 'Loren',
    likes: 1,
  );
  return NestedScrollDemoState(
    notePosts: const <NestedScrollDemoPostItem>[post],
    collectionPosts: const <NestedScrollDemoPostItem>[post],
    likedPosts: const <NestedScrollDemoPostItem>[post],
  );
}
