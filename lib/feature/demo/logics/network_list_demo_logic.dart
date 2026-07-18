import 'package:flutter_kit/core/base/base_list/base_list_logic.dart';
import 'package:flutter_kit/core/data/repository/goods_repository.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';
import 'package:flutter_kit/core/model/request/goods_search_request.dart';
import 'package:flutter_kit/core/model/response/base/base_list_response.dart';
import 'package:flutter_kit/core/model/response/base/base_response.dart';

/// 网络列表示例页 Logic
///
/// 通过 [BaseListLogic] 加载商品分页数据。
class NetworkListDemoLogic extends BaseListLogic<Goods> {
  /// 初始化网络列表分页配置
  @override
  void onInit() {
    listState.pageSize = 15;
    super.onInit();
  }

  /// 商品分页请求
  @override
  Future<BaseResponse<BaseListResponse<Goods>>> Function()? get apiRequest =>
      () => GoodsRepository().getGoodsPage(
        GoodsSearchRequest(
          page: listState.currentPage,
          size: listState.pageSize,
        ),
      );
}
