import 'package:get/get.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';

import '../../../core/base/base_refresh/base_refresh_state.dart';

/// BaseRefresh 示例页 State
///
/// 保存商品详情数据。
class BaseRefreshDemoState extends BaseRefreshState {
  /// 商品信息
  final Rx<Goods> goods = Rx<Goods>(Goods());
}
