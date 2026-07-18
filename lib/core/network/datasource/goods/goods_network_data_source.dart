import '../../../../core/model/entity/goods/goods.dart';
import '../../../../core/model/request/goods_search_request.dart';
import '../../../../core/model/response/base/base_list_response.dart';
import '../../../../core/model/response/base/base_response.dart';

/// 商品网络数据源接口
///
/// 定义商品模块所有网络请求契约，由 [GoodsNetworkDataSourceImpl] 实现。
abstract class GoodsNetworkDataSource {
  /// 分页查询商品
  ///
  /// [request] 商品搜索分页请求参数
  /// 返回商品分页列表响应
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  );

  /// 获取商品详情
  ///
  /// [id] 商品 ID
  /// 返回商品详情响应
  Future<BaseResponse<Goods>> getGoodsInfo(int id);
}
