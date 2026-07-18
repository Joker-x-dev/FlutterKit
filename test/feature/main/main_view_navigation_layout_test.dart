import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/ui/preview/app_preview.dart';
import 'package:flutter_kit/feature/main/logics/main_logic.dart';
import 'package:flutter_kit/feature/main/views/main_view.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 主页面导航栏响应式布局测试
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// 每个测试后清理 GetX 全局状态
  tearDown(Get.reset);

  /// 验证手机方向变化时切换底部导航与左侧导航
  testWidgets('手机竖屏显示底部导航且横屏显示左侧导航', (WidgetTester tester) async {
    final MainLogic logic = MainLogic()..onInit();
    final MainView mainView = MainView(
      logic: logic,
      pages: const <Widget>[
        Text('page-0'),
        Text('page-1'),
        Text('page-2'),
        Text('page-3'),
      ],
    );

    addTearDown(logic.onClose);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      tester.view.resetPadding();
      tester.view.resetViewPadding();
    });

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(MaterialApp(home: wrapAppScreenPreview(mainView)));
    await tester.pumpAndSettle();

    expect(find.byType(TDBottomTabBar), findsOneWidget);
    expect(find.byType(TDSideBar), findsNothing);

    await tester.tap(find.text('关于'));
    await tester.pumpAndSettle();

    expect(logic.mainState.pageIndex.value, 3);
    expect(logic.mainState.pageController.page, moreOrLessEquals(3));

    tester.view.physicalSize = const Size(812, 375);
    tester.view.padding = const FakeViewPadding(top: 24, bottom: 24);
    tester.view.viewPadding = const FakeViewPadding(top: 24, bottom: 24);
    await tester.pumpAndSettle();

    expect(find.byType(TDBottomTabBar), findsNothing);
    expect(find.byType(TDSideBar), findsOneWidget);
    expect(tester.takeException(), isNull);
    final BuildContext sideBarContext = tester.element(find.byType(TDSideBar));
    expect(MediaQuery.paddingOf(sideBarContext).top, 0);
    expect(MediaQuery.paddingOf(sideBarContext).bottom, 0);
    expect(tester.getTopLeft(find.byType(TDSideBar)).dy, 24);
    expect(tester.getSize(find.byType(TDSideBar)).height, 351);
    final TDSideBar sideBar = tester.widget<TDSideBar>(find.byType(TDSideBar));
    expect(sideBar.selectedBgColor, sideBar.unSelectedBgColor);
    expect(sideBar.value, 3);
    expect(logic.mainState.pageController.page, moreOrLessEquals(3));

    await tester.tap(find.text('导航'));
    await tester.pumpAndSettle();

    expect(logic.mainState.pageIndex.value, 1);
    expect(logic.mainState.pageController.page, moreOrLessEquals(1));

    tester.view.physicalSize = const Size(375, 812);
    await tester.pumpAndSettle();

    final TDBottomTabBar bottomTabBar = tester.widget<TDBottomTabBar>(
      find.byType(TDBottomTabBar),
    );
    expect(find.byType(TDSideBar), findsNothing);
    expect(bottomTabBar.currentIndex, 1);
  });
}
