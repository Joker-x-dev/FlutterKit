import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../base/base_view.dart';
import 'base_tab_logic.dart';

/// 基础 Tab 页面
///
/// 统一构建顶部 TabBar 与 PageView 联动结构。
abstract class BaseTabView<T extends BaseTabLogic> extends BaseView<T> {
  /// 创建基础 Tab 页面
  ///
  /// [logic] 外部注入的 Tab Logic；为空时通过 GetX 获取已注册实例。
  BaseTabView({super.key, super.logic});

  /// Tab 选中颜色
  Color get tabColor => appTheme.textPrimary;

  /// 包含 TabBar 的导航栏高度
  @override
  double get navHeight => 92;

  /// 导航栏底部 TabBar
  @override
  Widget? get navBottomWidget => tabsWidget();

  /// tabsWidget
  Widget tabsWidget() {
    return TDTabBar(
      tabs: controller.tabList.map((title) => TDTab(text: title)).toList(),
      indicatorColor: tabColor,
      labelColor: tabColor,
      controller: controller.tabState.tabController,
      dividerHeight: 0,
      onTap: (int index) => controller.tabChange(index),
      showIndicator: true,
    );
  }

  /// 主视图 如果不想使用pageView 子类重写body即可
  @override
  Widget body() {
    return PageView(
      controller: controller.tabState.pageController,
      children: pageViewChildren(),
      onPageChanged: (int index) => controller.pageViewChange(index),
    );
  }

  /// 抽象方法，子类可选实现，返回 PageView 的子页面列表
  List<Widget> pageViewChildren() {
    return [];
  }
}
