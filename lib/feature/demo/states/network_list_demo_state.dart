import 'package:flutter_kit/core/base/base_list/base_list_state.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';

/// 网络列表示例页 State
///
/// 配置商品分页列表的页面状态与单页请求数量。
class NetworkListDemoState extends BaseListState<Goods> {
  /// 单页商品数量
  @override
  int get pageSize => 15;
}
