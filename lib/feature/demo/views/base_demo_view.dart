import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../core/design_system/theme/app_theme.dart';
import '../localization/demo_keys.dart';
import '../logics/base_demo_logic.dart';

/// Base 示例页
///
/// 展示 BaseView 的导航栏、下拉菜单、FloatingActionButton 与底部 TabBar。
class BaseDemoView extends BaseView<BaseDemoLogic> {
  BaseDemoView({super.key, super.logic});

  @override
  double get navHeight => 88;

  @override
  String? get navTitle => DemoKeys.titleBaseDemo.tr;

  @override
  List<TNavBarItem>? get rightBarItems => [
    TNavBarItem(icon: TIcons.notification, iconSize: 20, onTap: () {}),
    TNavBarItem(icon: TIcons.logo_github, iconSize: 20, onTap: () {}),
  ];

  @override
  Widget? get navBottomWidget => Obx(() {
    final String productFilter = logic.productFilter.value;
    final String productSort = logic.productSort.value;
    return TDropdownMenu(
      placement: TDropdownMenuPlacement.below,
      items: [
        TDropdownMenuItem(
          label: _productFilterLabel(productFilter),
          panelBuilder: (context, controller) =>
              TDropdownSingleSelectPanel<String>(
                controller: controller,
                options: [
                  TDropdownMenuOption<String>(
                    label: DemoKeys.baseAllProducts.tr,
                    value: 'all',
                  ),
                  TDropdownMenuOption<String>(
                    label: DemoKeys.baseLatestProducts.tr,
                    value: 'new',
                  ),
                  TDropdownMenuOption<String>(
                    label: DemoKeys.basePopularProducts.tr,
                    value: 'hot',
                  ),
                ],
                value: productFilter,
                onChanged: logic.updateProductFilter,
              ),
        ),
        TDropdownMenuItem(
          label: _productSortLabel(productSort),
          panelBuilder: (context, controller) =>
              TDropdownSingleSelectPanel<String>(
                controller: controller,
                options: [
                  TDropdownMenuOption<String>(
                    label: DemoKeys.baseDefaultSort.tr,
                    value: 'default',
                  ),
                  TDropdownMenuOption<String>(
                    label: DemoKeys.basePriceHighToLow.tr,
                    value: 'price',
                  ),
                ],
                value: productSort,
                onChanged: logic.updateProductSort,
              ),
        ),
      ],
    );
  });

  String _productFilterLabel(String value) {
    return switch (value) {
      'new' => DemoKeys.baseLatestProducts.tr,
      'hot' => DemoKeys.basePopularProducts.tr,
      _ => DemoKeys.baseAllProducts.tr,
    };
  }

  String _productSortLabel(String value) {
    return value == 'price'
        ? DemoKeys.basePriceHighToLow.tr
        : DemoKeys.baseDefaultSort.tr;
  }

  @override
  Widget body() => TText(
    '${DemoKeys.baseContentTitle.tr}\n${DemoKeys.baseContentDescription.tr}',
    textAlign: .center,
  ).center().backgroundColor(appTheme.backgroundSecondaryContainer);

  /// 对应旧版 TDFab(theme: TDFabTheme.primary)。
  /// 新版 TFab 仅限 Stack 子组件使用，Scaffold.floatingActionButton 场景改用
  /// TButton 保持相同的视觉规格（large / fill / primary / round）。
  @override
  Widget? floatingAction() => TButton(
    size: TButtonSize.large,
    variant: TButtonVariant.fill,
    colorPreset: TButtonColorPreset.primary,
    shape: TButtonShape.round,
    onPressed: () {},
    child: [
      const Icon(TIcons.add, size: 18),
      const SizedBox(width: 4),
      Text(DemoKeys.baseFloatingAction.tr),
    ].toRow(mainAxisSize: .min),
  );

  @override
  Widget? bottom() => TTabBar(
    type: TTabBarType.iconText,
    value: 2,
    onChanged: (_) {},
    navigationTabs: [
      _buildTabItem(
        DemoKeys.baseTabMessages.tr,
        TIcons.chat_message,
        TIcons.chat_message_filled,
        0,
      ),
      _buildTabItem(
        DemoKeys.baseTabTasks.tr,
        TIcons.file_1,
        TIcons.file_1_filled,
        1,
      ),
      _buildTabItem(
        DemoKeys.baseTabWorkspace.tr,
        TIcons.app,
        TIcons.app_filled,
        2,
      ),
      _buildTabItem(
        DemoKeys.baseTabContacts.tr,
        TIcons.personal_information,
        TIcons.personal_information_filled,
        3,
      ),
      _buildTabItem(
        DemoKeys.baseTabProfile.tr,
        TIcons.user_1,
        TIcons.user_1_filled,
        4,
      ),
    ],
  );

  TTabBarItemConfig _buildTabItem(
    String title,
    IconData icon,
    IconData iconFill,
    int index,
  ) => TTabBarItemConfig(
    tabText: title,
    selectedIcon: Icon(iconFill, color: appTheme.primary),
    unselectedIcon: Icon(icon),
    onTap: () {},
  );
}

/// Base 示例页面预览
@ResponsivePreview()
Widget previewBaseDemoView() => BaseDemoView(logic: BaseDemoLogic());
