import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/localization/app_translations.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';
import 'package:flutter_kit/core/service/demo_counter_service.dart';
import 'package:flutter_kit/core/ui/preview/app_preview.dart';
import 'package:flutter_kit/core/ui/widgets/goods_detail_content.dart';
import 'package:flutter_kit/core/ui/widgets/goods_list_card.dart';
import 'package:flutter_kit/feature/demo/localization/demo_keys.dart';
import 'package:flutter_kit/feature/demo/localization/demo_zh.dart';
import 'package:flutter_kit/feature/demo/logics/local_storage_demo_logic.dart';
import 'package:flutter_kit/feature/demo/views/local_storage_demo_view.dart';
import 'package:flutter_kit/feature/demo/logics/screen_adapt_demo_logic.dart';
import 'package:flutter_kit/feature/demo/views/screen_adapt_demo_view.dart';
import 'package:flutter_kit/feature/main/localization/main_keys.dart';
import 'package:flutter_kit/feature/main/localization/main_zh.dart';
import 'package:flutter_kit/feature/main/logics/about_demo_logic.dart';
import 'package:flutter_kit/feature/main/logics/core_demo_logic.dart';
import 'package:flutter_kit/feature/main/logics/expand_demo_logic.dart';
import 'package:flutter_kit/feature/main/models/demo_action.dart';
import 'package:flutter_kit/feature/main/models/demo_item.dart';
import 'package:flutter_kit/feature/main/states/core_demo_state.dart';
import 'package:flutter_kit/feature/main/states/expand_demo_state.dart';
import 'package:flutter_kit/feature/main/states/navigation_demo_state.dart';
import 'package:flutter_kit/feature/main/views/about_demo_view.dart';
import 'package:flutter_kit/feature/main/views/core_demo_view.dart';
import 'package:flutter_kit/feature/main/widgets/demo_card.dart';
import 'package:flutter_kit/feature/main/widgets/demo_list_group.dart';
import 'package:flutter_kit/routes/demo/demo_pages.dart';
import 'package:flutter_kit/routes/demo/demo_routes.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 示例配置与 TDesign 组件一致性测试
///
/// 验证示例路由不重复，并确保主要列表卡片使用 TDesign 单元格。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ThemeData theme;

  /// 清理 GetX 测试依赖
  tearDown(() {
    Get.reset();
  });

  /// 加载测试主题
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

  /// 验证 Demo 路由名称唯一
  test('demo route names are unique', () {
    final routeNames = DemoPages.routes.map((page) => page.name).toList();

    expect(routeNames.toSet().length, routeNames.length);
  });

  /// 验证保留的 Flutter Base 示例路由不存在重复能力入口
  test('flutter base demo routes keep only unique capabilities', () {
    final routeNames = DemoPages.routes.map((page) => page.name).toSet();

    expect(routeNames, contains(DemoRoutes.baseDemo));
    expect(routeNames, contains(DemoRoutes.baseRefreshDemo));
    expect(routeNames, contains(DemoRoutes.baseTabDemo));
  });

  /// 验证首页子页面持有各自的菜单配置
  test('home demo states own page-specific menu data', () {
    expect(
      const CoreDemoState().demoItems,
      same(CoreDemoState.defaultDemoItems),
    );
    expect(
      NavigationDemoState().demoItems,
      same(NavigationDemoState.defaultDemoItems),
    );
    expect(
      const ExpandDemoState().demoItems,
      same(ExpandDemoState.defaultDemoItems),
    );
  });

  /// 验证 Base 示例归入核心页且扩展页入口顺序固定
  test('demo entries are grouped without duplicate list or network demos', () {
    final coreLogic = CoreDemoLogic();
    final coreTitles = coreLogic.coreDemoState.demoItems
        .map((item) => item.title)
        .toList();
    final expandLogic = ExpandDemoLogic();
    final expandItems = expandLogic.expandDemoState.demoItems;

    expect(coreTitles, contains(DemoKeys.titleBaseDemo));
    expect(coreTitles, contains(DemoKeys.titleBaseRefreshDemo));
    expect(coreTitles, contains(DemoKeys.titleBaseTabDemo));
    expect(coreTitles.take(3), [
      DemoKeys.titleBaseDemo,
      DemoKeys.titleBaseRefreshDemo,
      DemoKeys.titleBaseTabDemo,
    ]);
    expect(coreTitles.toSet().length, coreTitles.length);
    expect(expandItems, hasLength(2));
    expect(expandItems.map((item) => item.title), <String>[
      MainKeys.demoScreenAdapt,
      DemoKeys.titleThemeDemo,
    ]);
  });

  /// 验证核心页仅在全局计数大于 1 时展示状态提示
  testWidgets('core demo shows shared counter above one', (tester) async {
    final DemoCounterService counterService = DemoCounterService();
    counterService.count.value = 1;

    await tester.pumpWidget(
      GetMaterialApp(
        theme: theme,
        translations: AppTranslations(),
        locale: const Locale('zh', 'CN'),
        home: CoreDemoView(
          logic: CoreDemoLogic(counterService: counterService),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('全局计数器：1'), findsNothing);

    counterService.count.value = 2;
    await tester.pump();

    expect(find.text('全局计数器：2'), findsOneWidget);
  });

  /// 验证关于页面展示 Logo 与完整链接列表
  testWidgets('about demo renders logo and link list', (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        theme: theme,
        translations: AppTranslations(),
        locale: const Locale('zh', 'CN'),
        home: AboutDemoView(logic: AboutDemoLogic()),
      ),
    );
    await tester.pump();

    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.byType(TDCell), findsNWidgets(5));
    expect(find.text('项目文档'), findsOneWidget);
    expect(find.text('示例 Demo'), findsOneWidget);
    expect(find.text('https://example.com/flutter-kit/docs'), findsOneWidget);
  });

  /// 验证核心页中文标题与说明遵循统一文案结构
  test('core demo copy uses consistent Chinese structure', () {
    final titles = <String>[
      demoZh[DemoKeys.titleBaseDemo]!,
      demoZh[DemoKeys.titleBaseRefreshDemo]!,
      demoZh[DemoKeys.titleBaseTabDemo]!,
      mainZh[MainKeys.demoNetwork]!,
      mainZh[MainKeys.demoNetworkRequest]!,
      mainZh[MainKeys.demoNetworkList]!,
      mainZh[MainKeys.demoStateManagement]!,
      mainZh[MainKeys.demoDatabase]!,
      mainZh[MainKeys.demoLocalStorage]!,
    ];
    final descriptions = <String>[
      demoZh[DemoKeys.titleBaseDemoDesc]!,
      demoZh[DemoKeys.titleBaseRefreshDemoDesc]!,
      demoZh[DemoKeys.titleBaseTabDemoDesc]!,
      mainZh[MainKeys.demoNetworkDesc]!,
      mainZh[MainKeys.demoNetworkRequestDesc]!,
      mainZh[MainKeys.demoNetworkListDesc]!,
      mainZh[MainKeys.demoStateManagementDesc]!,
      mainZh[MainKeys.demoDatabaseDesc]!,
      mainZh[MainKeys.demoLocalStorageDesc]!,
    ];

    expect(titles.every((title) => title.endsWith('示例')), isTrue);
    expect(
      descriptions.every((description) => description.startsWith('展示')),
      isTrue,
    );
  });

  /// 验证首页示例卡片使用 TDCell
  testWidgets('demo card uses TDesign cell', (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        theme: theme,
        home: Scaffold(
          body: DemoCard(
            title: 'Demo',
            description: 'Description',
            icon: TDIcons.app,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.byType(TDCell), findsOneWidget);
  });

  /// 验证首页示例列表使用单个 TDCellGroup
  testWidgets('demo list group uses one TDesign cell group', (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        theme: theme,
        home: Scaffold(
          body: DemoListGroup(
            items: [
              DemoItem(
                title: 'First',
                description: 'First description',
                icon: TDIcons.app,
                action: DemoAction.base,
              ),
              DemoItem(
                title: 'Second',
                description: 'Second description',
                icon: TDIcons.layers,
                action: DemoAction.network,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(TDCellGroup), findsOneWidget);
    expect(find.byType(TDCell), findsNWidgets(2));
    expect(tester.getTopLeft(find.byType(TDCell).first).dx, 16);
  });

  /// 验证本地存储操作按钮在常见手机宽度下不会溢出
  testWidgets('local storage actions adapt without overflow', (tester) async {
    for (final width in <double>[375, 432]) {
      tester.view.physicalSize = Size(width, 812);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      Get.put<LocalStorageDemoLogic>(LocalStorageDemoLogic());
      await tester.pumpWidget(
        GetMaterialApp(
          theme: theme,
          translations: AppTranslations(),
          locale: const Locale('zh', 'CN'),
          home: LocalStorageDemoView(),
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull);
      await Get.delete<LocalStorageDemoLogic>();
    }
  });

  /// 验证屏幕适配示例按断点切换网格和列表列数
  testWidgets('screen adapt demo changes columns by breakpoint', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    /// 构建指定宽度页面并返回两个示例网格的列数
    Future<List<int>> pumpWidth(double width) async {
      tester.view.physicalSize = Size(width, 2400);
      await tester.pumpWidget(
        GetMaterialApp(
          theme: theme,
          translations: AppTranslations(),
          locale: const Locale('zh', 'CN'),
          home: ScreenAdaptDemoView(logic: ScreenAdaptDemoLogic()),
        ),
      );
      await tester.pump();

      return tester
          .widgetList<GridView>(find.byType(GridView))
          .map(
            (gridView) =>
                (gridView.gridDelegate
                        as SliverGridDelegateWithFixedCrossAxisCount)
                    .crossAxisCount,
          )
          .toList();
    }

    expect(await pumpWidth(400), <int>[2, 1]);
    expect(find.text('sm'), findsOneWidget);

    expect(await pumpWidth(900), <int>[4, 2]);
    expect(find.text('lg'), findsOneWidget);
  });

  /// 验证商品列表项使用 TDCell
  testWidgets('goods list card uses TDesign cell', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: wrapAppComponentPreview(
          const GoodsListCard(
            goods: Goods(title: 'Goods', price: 100, sold: 1),
          ),
        ),
      ),
    );

    expect(find.byType(TDCell), findsOneWidget);
  });

  /// 验证网络状态页与下拉刷新页复用的商品详情组件
  testWidgets('shared goods detail content renders product information', (
    tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        theme: theme,
        translations: AppTranslations(),
        locale: const Locale('zh', 'CN'),
        home: const Scaffold(
          body: SingleChildScrollView(
            child: GoodsDetailContent(
              goods: Goods(
                title: '共享商品详情',
                subTitle: '网络状态与下拉刷新共用布局',
                price: 199,
                sold: 8,
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(GoodsDetailContent), findsOneWidget);
    expect(find.text('共享商品详情'), findsOneWidget);
    expect(find.text('网络状态与下拉刷新共用布局'), findsOneWidget);
    expect(find.byIcon(Icons.image_outlined), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  /// 验证 TDCellGroup 可用于示例页滚动布局
  testWidgets('TDesign cell group works in scrollable demo layout', (
    tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        theme: theme,
        home: const Scaffold(
          body: SingleChildScrollView(
            child: TDCellGroup(
              theme: TDCellGroupTheme.cardTheme,
              cells: [TDCell(title: 'Title', note: 'Value')],
            ),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
  });
}
