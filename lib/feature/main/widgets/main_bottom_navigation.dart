import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../core/design_system/theme/app_theme.dart';
import '../../../core/design_system/theme/size.dart';
import '../../../core/ui/preview/app_preview_annotations.dart';
import '../models/main_navigation_item.dart';
import '../states/main_state.dart';

/// 主页面底部导航栏
///
/// 使用 TDesign 底部导航展示竖屏主页面入口。
class MainBottomNavigation extends StatelessWidget {
  /// 当前选中的页面下标
  final int currentIndex;

  /// 导航项点击回调
  final ValueChanged<int> onSelected;

  /// 导航项配置
  final List<MainNavigationItem> items;

  /// 创建主页面底部导航栏
  ///
  /// [currentIndex] 当前选中的页面下标。
  /// [onSelected] 导航项点击回调。
  /// [items] 导航项配置。
  const MainBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onSelected,
    required this.items,
  });

  /// 构建竖屏主页面底部导航栏
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final String localeTag = Application.locale.value.toLanguageTag();
      final AppTheme appTheme = AppTheme.of(context);
      return TDBottomTabBar(
        key: ValueKey<String>(localeTag),
        barHeight: 60,
        TDBottomTabBarBasicType.iconText,
        currentIndex: currentIndex,
        componentType: TDBottomTabBarComponentType.normal,
        navigationTabs: items
            .map(
              (MainNavigationItem item) =>
                  _buildNavigationItem(item, selectedColor: appTheme.primary),
            )
            .toList(),
      );
    });
  }

  /// 构建 TDesign 底部导航选项
  ///
  /// [item] 主导航项配置。
  /// [selectedColor] 选中状态颜色。
  ///
  /// 返回 TDesign 底部导航选项。
  TDBottomTabBarTabConfig _buildNavigationItem(
    MainNavigationItem item, {
    required Color selectedColor,
  }) {
    return TDBottomTabBarTabConfig(
      tabText: item.localizedLabel,
      selectedIcon: Icon(item.selectedIcon, color: selectedColor),
      unselectedIcon: Icon(item.icon),
      onTap: () => onSelected(item.index),
    );
  }
}

/// 主页面底部导航栏预览
@WidgetPreview()
Widget previewMainBottomNavigation() {
  return Builder(
    builder: (BuildContext context) {
      return MainBottomNavigation(
        currentIndex: 1,
        onSelected: (_) {},
        items: MainState.defaultNavigationItems,
      ).width(spacer160 * 2);
    },
  );
}
