import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base_tab/base_tab_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/base_tab_demo_logic.dart';

/// BaseTab 示例页
///
/// 展示 [BaseTabView] 标签与页面联动切换。
class BaseTabDemoView extends BaseTabView<BaseTabDemoLogic> {
  /// 创建 BaseTab 示例页面
  ///
  /// [logic] 外部注入的 BaseTab 示例 Logic 一般用于测试和预览。
  BaseTabDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleBaseTabDemo.tr;

  /// 构建标签页内容
  @override
  List<Widget> pageViewChildren() {
    return [
      TDText(
        DemoKeys.baseTabPageOne.tr,
        textColor: appTheme.error,
      ).center().backgroundColor(appTheme.errorLight),
      TDText(
        DemoKeys.baseTabPageTwo.tr,
        textColor: appTheme.success,
      ).center().backgroundColor(appTheme.successLight),
      TDText(
        DemoKeys.baseTabPageThree.tr,
        textColor: appTheme.primary,
      ).center().backgroundColor(appTheme.primaryLight),
    ];
  }
}

/// BaseTab 示例页面预览
@ResponsivePreview()
Widget previewBaseTabDemoView() {
  final BaseTabDemoLogic logic = BaseTabDemoLogic()..onInit();
  return BaseTabDemoView(logic: logic);
}
