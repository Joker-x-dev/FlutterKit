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

/// 主页面侧边导航栏
///
/// 使用 TDesign 侧边导航展示横屏主页面入口。
class MainSideNavigation extends StatelessWidget {
  /// 当前选中的页面下标
  final int currentIndex;

  /// 导航项点击回调
  final ValueChanged<int> onSelected;

  /// 导航项配置
  final List<MainNavigationItem> items;

  /// 创建主页面侧边导航栏
  ///
  /// [currentIndex] 当前选中的页面下标。
  /// [onSelected] 导航项点击回调。
  /// [items] 导航项配置。
  const MainSideNavigation({
    super.key,
    required this.currentIndex,
    required this.onSelected,
    required this.items,
  });

  /// 构建横屏主页面侧边导航栏
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final String localeTag = Application.locale.value.toLanguageTag();
      final AppTheme appTheme = AppTheme.of(context);
      return TDSideBar(
        key: ValueKey<String>('main-side-$localeTag-$currentIndex'),
        value: currentIndex,
        selectedColor: appTheme.primary,
        unSelectedColor: appTheme.textSecondary,
        selectedBgColor: appTheme.backgroundContainer,
        unSelectedBgColor: appTheme.backgroundContainer,
        children: items.map((MainNavigationItem item) {
          return TDSideBarItem(
            icon: currentIndex == item.index ? item.selectedIcon : item.icon,
            label: item.localizedLabel,
            value: item.index,
          );
        }).toList(),
        onSelected: onSelected,
      );
    });
  }
}

/// 主页面侧边导航栏预览
@WidgetPreview()
Widget previewMainSideNavigation() {
  return Builder(
    builder: (BuildContext context) {
      return MainSideNavigation(
        currentIndex: 0,
        onSelected: (_) {},
        items: MainState.defaultNavigationItems,
      ).size(spacer160, spacer160 + spacer96);
    },
  );
}
