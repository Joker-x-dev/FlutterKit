import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/core/base/base_tab/base_tab_logic.dart';
import 'package:get/get.dart';

import '../data/nested_scroll_demo_data.dart';
import '../localization/demo_keys.dart';
import '../states/nested_scroll_demo_state.dart';

/// 嵌套滚动示例交互控制器。
class NestedScrollDemoLogic extends BaseTabLogic {
  /// 创建嵌套滚动示例交互控制器。
  ///
  /// [state] 外部注入的页面展示状态，供测试与预览使用。
  /// [refreshDelay] 单次刷新等待时间。
  /// [delayExecutor] 外部注入的等待执行器，供测试隔离时间依赖。
  NestedScrollDemoLogic({
    NestedScrollDemoState? state,
    this.refreshDelay = const Duration(seconds: 1),
    Future<void> Function(Duration)? delayExecutor,
  }) : state = state ?? NestedScrollDemoData.createState(),
       _delayExecutor = delayExecutor ?? Future<void>.delayed;

  /// 页面展示状态。
  final NestedScrollDemoState state;

  /// 单次刷新等待时间。
  final Duration refreshDelay;

  /// 刷新等待执行器。
  final Future<void> Function(Duration) _delayExecutor;

  /// 外层资料折叠滚动控制器。
  final ScrollController outerScrollController = ScrollController();

  /// 下拉刷新指示器状态监听器。
  final IndicatorStateListenable refreshStateListenable =
      IndicatorStateListenable();

  /// 刷新任务是否正在执行。
  bool _isRefreshing = false;

  /// 标签标题列表。
  @override
  List<String> get tabList =>
      NestedScrollDemoTab.values.map(_titleForTab).toList(growable: false);

  /// 当前标签控制器。
  TabController get tabController => tabState.tabController!;

  /// 初始化标签控制器并关闭父类 PageView 控制器。
  @override
  void onInit() {
    tabState.usePageView = false;
    super.onInit();
  }

  /// 释放页面滚动控制器与标签控制器。
  @override
  void onClose() {
    outerScrollController.dispose();
    super.onClose();
  }

  /// 刷新当前选中的标签。
  Future<void> refreshCurrentTab() {
    return refreshTab(NestedScrollDemoTab.values[tabController.index]);
  }

  /// 刷新指定 Tab 并轮换首条帖子。
  ///
  /// [tab] 目标标签。
  ///
  /// 刷新执行期间忽略重复请求，等待执行失败时向调用方继续抛出异常。
  Future<void> refreshTab(NestedScrollDemoTab tab) async {
    if (_isRefreshing) {
      return;
    }

    _isRefreshing = true;
    try {
      await _delayExecutor(refreshDelay);
      final RxList<NestedScrollDemoPostItem> posts = state.postsForTab(tab);
      if (posts.isNotEmpty) {
        posts.add(posts.removeAt(0));
      }
    } finally {
      _isRefreshing = false;
    }
  }

  /// 返回上一页。
  void back() {
    Get.back<void>();
  }

  /// 返回标签对应的本地化标题。
  ///
  /// [tab] 目标标签。
  String _titleForTab(NestedScrollDemoTab tab) {
    return switch (tab) {
      NestedScrollDemoTab.notes => DemoKeys.nestedScrollNotes.tr,
      NestedScrollDemoTab.collections => DemoKeys.nestedScrollCollections.tr,
      NestedScrollDemoTab.liked => DemoKeys.nestedScrollLiked.tr,
    };
  }
}
