import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base_network/base_network_state.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';

/// 网络请求示例页 State
///
/// 保存商品详情数据。
class NetworkDemoState extends BaseNetworkState {
  /// 商品详情
  final Rx<Goods> goods = Goods().obs;
}
