import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base_list/base_list_view.dart';

import '../../../core/data/preview/goods_preview_data.dart';
import '../../../core/model/entity/goods/goods.dart';
import '../../../core/ui/preview/app_preview_annotations.dart';
import '../../../core/ui/widgets/goods_list_card.dart';
import '../localization/demo_keys.dart';
import '../logics/network_list_demo_logic.dart';

/// 网络列表示例页面
class NetworkListDemoView extends BaseListView<NetworkListDemoLogic, Goods> {
  /// 创建网络列表示例页面
  /// [logic] 外部注入的网络列表 Logic 一般用于测试和预览。
  NetworkListDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleNetworkListDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建商品列表项
  @override
  Widget itemWidget(Goods item, int index) => GoodsListCard(goods: item);
}

/// 网络列表示例页面预览
@ResponsivePreview()
Widget previewNetworkListDemoView() {
  final NetworkListDemoLogic logic = NetworkListDemoLogic();
  logic.listState.dataList.assignAll(previewGoods);
  logic.setStatusSuccess();
  return NetworkListDemoView(logic: logic);
}
