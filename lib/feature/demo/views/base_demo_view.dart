import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/base_demo_logic.dart';

/// Base 示例页
///
/// 展示 BaseView 的导航栏、下拉菜单、FloatingActionButton 与底部 TabBar。
class BaseDemoView extends BaseView<BaseDemoLogic> {
  /// 创建 Base 示例页面
  ///
  /// [logic] 外部注入的 Base 示例 Logic 一般用于测试和预览。
  BaseDemoView({super.key, super.logic});

  /// 导航栏高度
  @override
  double get navHeight => 88;

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleBaseDemo.tr;

  /// 导航栏右侧操作项
  @override
  List<TDNavBarItem>? get rightBarItems => [
    TDNavBarItem(
      icon: TDIcons.notification,
      iconSize: 20,
      padding: EdgeInsets.only(right: spaceHorizontalXLarge),
    ),
    TDNavBarItem(
      icon: TDIcons.logo_github,
      iconSize: 20,
      padding: EdgeInsets.only(right: spaceHorizontalLarge),
    ),
  ];

  /// 导航栏底部下拉菜单
  @override
  Widget? get navBottomWidget => TDDropdownMenu(
    direction: TDDropdownMenuDirection.down,
    items: [
      TDDropdownItem(
        options: [
          TDDropdownItemOption(
            label: DemoKeys.baseAllProducts.tr,
            value: 'all',
            selected: true,
          ),
          TDDropdownItemOption(
            label: DemoKeys.baseLatestProducts.tr,
            value: 'new',
          ),
          TDDropdownItemOption(
            label: DemoKeys.basePopularProducts.tr,
            value: 'hot',
          ),
        ],
      ),
      TDDropdownItem(
        options: [
          TDDropdownItemOption(
            label: DemoKeys.baseDefaultSort.tr,
            value: 'default',
            selected: true,
          ),
          TDDropdownItemOption(
            label: DemoKeys.basePriceHighToLow.tr,
            value: 'price',
          ),
        ],
      ),
    ],
  );

  /// 构建 Base 示例页面内容
  @override
  Widget body() => TDText(
    '${DemoKeys.baseContentTitle.tr}\n${DemoKeys.baseContentDescription.tr}',
    textAlign: TextAlign.center,
  ).center().backgroundColor(appTheme.backgroundSecondaryContainer);

  /// 构建悬浮操作按钮
  @override
  Widget? floatingAction() {
    return TDFab(
      theme: TDFabTheme.primary,
      text: DemoKeys.baseFloatingAction.tr,
    );
  }

  /// 构建示例底部导航栏
  @override
  Widget? bottom() {
    return TDBottomTabBar(
      barHeight: 60,
      TDBottomTabBarBasicType.iconText,
      currentIndex: 2,
      componentType: TDBottomTabBarComponentType.normal,
      navigationTabs: [
        _buildTabItem(
          DemoKeys.baseTabMessages.tr,
          TDIcons.chat_message,
          TDIcons.chat_message_filled,
          0,
        ),
        _buildTabItem(
          DemoKeys.baseTabTasks.tr,
          TDIcons.file_1,
          TDIcons.file_1_filled,
          1,
        ),
        _buildTabItem(
          DemoKeys.baseTabWorkspace.tr,
          TDIcons.app,
          TDIcons.app_filled,
          2,
        ),
        _buildTabItem(
          DemoKeys.baseTabContacts.tr,
          TDIcons.personal_information,
          TDIcons.personal_information_filled,
          3,
        ),
        _buildTabItem(
          DemoKeys.baseTabProfile.tr,
          TDIcons.user_1,
          TDIcons.user_1_filled,
          4,
        ),
      ],
    );
  }

  /// 构建底部导航栏选项
  ///
  /// [title] 导航标题。
  /// [icon] 未选中图标。
  /// [iconFill] 选中图标。
  /// [index] 导航下标。
  ///
  /// 返回 TDesign 底部导航选项。
  TDBottomTabBarTabConfig _buildTabItem(
    String title,
    IconData icon,
    IconData iconFill,
    int index,
  ) {
    return TDBottomTabBarTabConfig(
      tabText: title,
      selectedIcon: Icon(iconFill, color: appTheme.primary),
      unselectedIcon: Icon(icon),
      onTap: () {},
    );
  }
}

/// Base 示例页面预览
@ResponsivePreview()
Widget previewBaseDemoView() => BaseDemoView(logic: BaseDemoLogic());
