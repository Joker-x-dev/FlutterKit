import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/routes/demo/demo_result.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/navigation_result_logic.dart';

/// 结果回传示例页
///
/// 点击按钮后通过 Get.back 返回 [DemoResult]。
class NavigationResultView extends BaseView<NavigationResultLogic> {
  /// 创建结果回传示例页面
  ///
  /// [logic] 外部注入的结果回传示例 Logic 一般用于测试和预览。
  NavigationResultView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleNavigationResult.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建结果回传操作按钮
  @override
  Widget body() {
    return TDButton(
      text: DemoKeys.returnResult.tr,
      theme: TDButtonTheme.primary,
      onTap: logic.returnResult,
    ).center();
  }
}

/// 结果回传示例页面预览
@ResponsivePreview()
Widget previewNavigationResultView() =>
    NavigationResultView(logic: NavigationResultLogic());
