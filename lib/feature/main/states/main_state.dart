import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/main_keys.dart';
import '../models/main_navigation_item.dart';

/// 主页面状态
///
/// 保存主导航下标、页面控制器与页面切换动画状态。
class MainState {
  /// 默认主导航项
  static const List<MainNavigationItem> defaultNavigationItems =
      <MainNavigationItem>[
        MainNavigationItem(
          label: MainKeys.tabCore,
          icon: TDIcons.layers,
          selectedIcon: TDIcons.layers_filled,
          index: 0,
        ),
        MainNavigationItem(
          label: MainKeys.tabNavigation,
          icon: TDIcons.share,
          selectedIcon: TDIcons.share_filled,
          index: 1,
        ),
        MainNavigationItem(
          label: MainKeys.tabExpand,
          icon: TDIcons.desktop,
          selectedIcon: TDIcons.desktop_filled,
          index: 2,
        ),
        MainNavigationItem(
          label: MainKeys.tabAbout,
          icon: TDIcons.info_circle,
          selectedIcon: TDIcons.info_circle_filled,
          index: 3,
        ),
      ];

  /// 创建主页面状态
  ///
  /// [navigationItems] 主导航项配置。
  MainState({this.navigationItems = defaultNavigationItems});

  /// 主导航项配置
  final List<MainNavigationItem> navigationItems;

  /// 页面下标
  final RxInt pageIndex = 0.obs;

  /// PageView 控制器
  late final PageController pageController;

  /// 页面切换动画锁
  ///
  /// 避免动画途经页面覆盖目标导航下标。
  final RxBool isAnimating = false.obs;
}
