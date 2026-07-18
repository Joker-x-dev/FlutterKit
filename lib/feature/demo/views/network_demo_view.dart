import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base_network/base_network_view.dart';
import 'package:flutter_kit/core/data/preview/goods_preview_data.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';

import '../../../core/design_system/extensions/widget/scroll_extension.dart';
import '../../../core/ui/widgets/goods_detail_content.dart';
import '../localization/demo_keys.dart';
import '../logics/network_demo_logic.dart';

/// 网络请求示例页
///
/// 使用 [BaseNetworkView] 展示单条商品详情。
class NetworkDemoView extends BaseNetworkView<NetworkDemoLogic> {
  /// 创建网络请求示例页面
  ///
  /// [logic] 外部注入的网络请求示例 Logic 一般用于测试和预览。
  NetworkDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleNetworkDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建商品详情内容
  ///
  /// [controller] 网络请求示例页 Logic。
  @override
  Widget bodyContent(NetworkDemoLogic controller) {
    return Obx(() {
      final goods = controller.networkDemoState.goods.value;
      return GoodsDetailContent(
        goods: goods,
      ).scrollable(padding: listItemPadding);
    });
  }
}

/// 网络请求示例页面预览
@ResponsivePreview()
Widget previewNetworkDemoView() {
  final NetworkDemoLogic logic = NetworkDemoLogic();
  logic.networkDemoState.goods.value = previewGoods.first;
  logic.setStatusSuccess();
  return NetworkDemoView(logic: logic);
}
