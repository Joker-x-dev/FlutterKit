import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/shape.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/routes/demo/demo_params.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/navigation_with_args_logic.dart';

/// 带参跳转示例页
///
/// 展示从路由参数中读取商品 ID 并展示。
class NavigationWithArgsView extends BaseView<NavigationWithArgsLogic> {
  /// 创建带参跳转示例页面
  ///
  /// [logic] 外部注入的带参跳转示例 Logic 一般用于测试和预览。
  NavigationWithArgsView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleNavigationWithArgs.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建路由参数展示内容
  @override
  Widget body() {
    return [
          TDText(
            '${DemoKeys.receivedGoodsId.tr}:',
            font: appTheme.fontBodyLarge,
            textColor: appTheme.textSecondary,
          ),
          TDText(
            '${logic.params.goodsId}',
            font: appTheme.fontDisplayMedium,
            textColor: appTheme.primary,
            fontWeight: appTheme.fontWeightBold,
          ),
        ]
        .toColumnCenter(
          spacing: spaceVerticalMedium,
          mainAxisSize: MainAxisSize.min,
        )
        .padAll(spacePaddingLarge)
        .backgroundColor(appTheme.backgroundContainer)
        .clipRadius(radiusExtraLarge)
        .center();
  }
}

/// 带参跳转示例页面预览
@ResponsivePreview()
Widget previewNavigationWithArgsView() {
  final NavigationWithArgsLogic logic = NavigationWithArgsLogic(
    initialParams: const DemoParams(goodsId: 9527),
  )..onInit();
  return NavigationWithArgsView(logic: logic);
}
