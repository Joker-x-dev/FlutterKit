import 'package:flutter/material.dart';
import 'package:flutter_kit/core/base/base/base_logic.dart';

import '../states/main_state.dart';

/// 主页面 Logic
///
/// 管理主导航选中状态与页面切换交互。
class MainLogic extends BaseLogic {
  /// 主页面状态
  final MainState mainState = MainState();

  /// 初始化主页面控制器
  @override
  void onInit() {
    super.onInit();
    _initializePageController();
  }

  /// 初始化页面控制器
  void _initializePageController() {
    mainState.pageController = PageController(
      initialPage: mainState.pageIndex.value,
    );
  }

  /// 处理主导航选中事件
  ///
  /// [index] 目标页面下标。
  void onNavigationSelected(int index) {
    mainState.isAnimating.value = true;
    _setPageIndex(index);
    _animateToPage(index);
  }

  /// 处理 PageView 页面变化
  ///
  /// [index] 当前页面下标。
  void onPageChanged(int index) {
    // 动画期间忽略途经页面，手动滑动时直接同步导航状态
    if (!mainState.isAnimating.value) {
      _setPageIndex(index);
      mainState.isAnimating.value = false;
      return;
    }

    if (mainState.pageIndex.value == index && mainState.isAnimating.value) {
      _setPageIndex(index);
      mainState.isAnimating.value = false;
    }
  }

  /// 设置页面下标
  void _setPageIndex(int index) {
    mainState.pageIndex.value = index;
  }

  /// 动画切换到目标页面
  void _animateToPage(int index) {
    mainState.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// 释放页面控制器
  @override
  void onClose() {
    mainState.pageController.dispose();
    super.onClose();
  }
}
