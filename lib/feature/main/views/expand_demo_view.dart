import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';

import '../../../core/design_system/theme/size.dart';
import '../../../core/ui/preview/app_preview_annotations.dart';
import '../localization/main_keys.dart';
import '../logics/expand_demo_logic.dart';
import '../widgets/demo_list_group.dart';

/// 扩展示例页
///
/// 展示屏幕适配等扩展能力入口。
class ExpandDemoView extends BaseView<ExpandDemoLogic> {
  /// 创建扩展示例页
  /// [logic] 外部注入的扩展示例 Logic 一般用于测试和预览。
  ExpandDemoView({super.key, super.logic});

  /// 隐藏 Tab 页面返回按钮
  @override
  bool get navBackBtn => false;

  /// 首页标题栏高度
  @override
  double get navHeight => 56;

  /// 导航栏标题
  @override
  String? get navTitle => MainKeys.tabExpand.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建扩展示例列表
  @override
  Widget body() {
    return DemoListGroup(
      items: logic.expandDemoState.demoItems,
      onItemTap: logic.onItemTap,
    ).scrollable(padding: pageVerticalPadding);
  }
}

/// 扩展示例页面预览
@ResponsivePreview()
Widget previewExpandDemoView() {
  final ExpandDemoLogic logic = ExpandDemoLogic();
  return ExpandDemoView(logic: logic);
}
