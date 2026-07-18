import '../../model/entity/goods/goods.dart';
import '../../model/request/goods_search_request.dart';
import '../../model/response/base/base_list_response.dart';
import '../../model/response/base/base_response.dart';
import '../../network/datasource/goods/goods_network_data_source.dart';
import '../../network/datasource/goods/goods_network_data_source_impl.dart';
import '../../network/provider/dio_provider.dart';

/// 商品数据仓库
///
/// 作为商品模块对外唯一数据入口，封装 [GoodsNetworkDataSource] 的网络请求。
class GoodsRepository {
  /// 商品网络数据源
  final GoodsNetworkDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  GoodsRepository({GoodsNetworkDataSource? dataSource})
    : _dataSource = dataSource ?? GoodsNetworkDataSourceImpl(DioProvider().dio);

  /// 分页查询商品
  ///
  /// [request] 商品搜索分页请求参数
  /// 返回商品分页列表响应
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) => _dataSource.getGoodsPage(request);

  /// 获取商品详情
  ///
  /// [id] 商品 ID
  /// 返回商品详情响应
  Future<BaseResponse<Goods>> getGoodsInfo(int id) =>
      _dataSource.getGoodsInfo(id);
}
