import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/service/demo_counter_service.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../core/design_system/theme/size.dart';
import '../../../core/ui/preview/app_preview_annotations.dart';
import '../localization/main_keys.dart';
import '../logics/core_demo_logic.dart';
import '../widgets/demo_list_group.dart';

/// 核心示例页
///
/// 展示网络、数据库、本地存储、状态管理等核心能力入口。
class CoreDemoView extends BaseView<CoreDemoLogic> {
  /// 创建核心示例页
  /// [logic] 外部注入的核心示例 Logic 一般用于测试和预览。
  CoreDemoView({super.key, super.logic});

  /// 隐藏 Tab 页面返回按钮
  @override
  bool get navBackBtn => false;

  /// 首页标题栏高度
  @override
  double get navHeight => 56;

  /// 导航栏标题
  @override
  String? get navTitle => MainKeys.tabCore.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建核心示例列表
  @override
  Widget body() {
    return Obx(() {
      final String localeTag = Application.locale.value.toLanguageTag();
      final int count = logic.count.value;
      return DemoListGroup(
        items: logic.coreDemoState.demoItems,
        leadingCells: <TDCell>[
          if (count > 1)
            TDCell(
              key: ValueKey<String>('global-counter-$localeTag-$count'),
              bordered: true,
              leftIcon: TDIcons.dashboard,
              title: MainKeys.globalCounter.trParams(<String, String>{
                'count': '$count',
              }),
            ),
        ],
        onItemTap: logic.onItemTap,
      ).scrollable(padding: pageVerticalPadding);
    });
  }
}

/// 核心示例页面预览
@ResponsivePreview()
Widget previewCoreDemoView() {
  final DemoCounterService counterService = DemoCounterService();
  counterService.count.value = 3;
  return CoreDemoView(logic: CoreDemoLogic(counterService: counterService));
}
