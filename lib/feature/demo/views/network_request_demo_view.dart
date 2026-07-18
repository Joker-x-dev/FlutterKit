import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/data/preview/goods_preview_data.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/widgets/space.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/network_request_demo_logic.dart';

/// 网络请求（独立）示例页
///
/// 演示手动调用 [RequestHelper] 发起网络请求并展示结果。
class NetworkRequestDemoView extends BaseView<NetworkRequestDemoLogic> {
  /// 创建网络请求示例页面
  ///
  /// [logic] 外部注入的网络请求示例 Logic 一般用于测试和预览。
  NetworkRequestDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleNetworkRequestDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建网络请求状态与结果内容
  @override
  Widget body() {
    return Obx(
      () =>
          [
                TDButton(
                  text: logic.isLoading.value
                      ? '${DemoKeys.requestStart.tr}...'
                      : DemoKeys.requestStart.tr,
                  theme: TDButtonTheme.primary,
                  disabled: logic.isLoading.value,
                  onTap: logic.request,
                ),
                const SpaceVerticalLarge(),
                if (logic.goods.value != null)
                  TDCellGroup(
                    theme: TDCellGroupTheme.cardTheme,
                    cells: [
                      _infoCell(
                        DemoKeys.goodsTitle.tr,
                        logic.goods.value!.title,
                      ),
                      _infoCell(
                        DemoKeys.goodsSubtitle.tr,
                        logic.goods.value!.subTitle ?? '',
                      ),
                      _infoCell(
                        DemoKeys.goodsPrice.tr,
                        '¥${logic.goods.value!.price.toStringAsFixed(2)}',
                      ),
                      _infoCell(
                        DemoKeys.goodsSold.tr,
                        '${logic.goods.value!.sold}',
                      ),
                    ],
                  )
                else
                  TDEmpty(
                    emptyText:
                        logic.errorMessage.value ?? DemoKeys.requestResult.tr,
                  ),
              ]
              .toColumnCenter(spacing: spaceVerticalLarge)
              .scrollable(padding: pageVerticalPadding),
    );
  }

  /// 构建请求结果信息单元格
  ///
  /// [label] 字段名称。
  /// [value] 字段值。
  ///
  /// 返回 TDesign 单元格。
  TDCell _infoCell(String label, String value) {
    return TDCell(title: label, note: value);
  }
}

/// 网络请求示例页面预览
@ResponsivePreview()
Widget previewNetworkRequestDemoView() {
  final NetworkRequestDemoLogic logic = NetworkRequestDemoLogic();
  logic.goods.value = previewGoods.first;
  return NetworkRequestDemoView(logic: logic);
}
