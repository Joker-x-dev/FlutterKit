import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base_refresh/base_refresh_view.dart';
import 'package:flutter_kit/core/data/preview/goods_preview_data.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';

import '../../../core/model/entity/goods/goods.dart';
import '../../../core/ui/widgets/goods_detail_content.dart';
import '../localization/demo_keys.dart';
import '../logics/base_refresh_demo_logic.dart';

/// BaseRefresh 示例页
///
/// 展示 [BaseRefreshView] 商品详情与下拉刷新能力。
class BaseRefreshDemoView extends BaseRefreshView<BaseRefreshDemoLogic> {
  /// 创建 BaseRefresh 示例页面
  ///
  /// [logic] 外部注入的 BaseRefresh 示例 Logic 一般用于测试和预览。
  BaseRefreshDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleBaseRefreshDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建商品详情内容
  ///
  /// [logic] BaseRefresh 示例页 Logic。
  @override
  List<Widget> pageContent(BaseRefreshDemoLogic logic) {
    final Goods goods = logic.baseRefreshDemoState.goods.value;
    return [GoodsDetailContent(goods: goods)];
  }
}

/// BaseRefresh 示例页面预览
@ResponsivePreview()
Widget previewBaseRefreshDemoView() {
  final BaseRefreshDemoLogic logic = BaseRefreshDemoLogic();
  logic.baseRefreshDemoState.goods.value = previewGoods.first;
  logic.setStatusSuccess();
  return BaseRefreshDemoView(logic: logic);
}
