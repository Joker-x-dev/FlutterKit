import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/model/entity/goods/goods.dart';
import '../../../../core/model/request/goods_search_request.dart';
import '../../../../core/model/response/base/base_list_response.dart';
import '../../../../core/model/response/base/base_response.dart';
import 'goods_network_data_source.dart';

part 'goods_network_data_source_impl.g.dart';

/// 商品网络数据源实现
///
/// 基于 Retrofit 生成具体网络请求实现，同时实现 [GoodsNetworkDataSource] 接口。
@RestApi(baseUrl: 'goods/info')
abstract class GoodsNetworkDataSourceImpl implements GoodsNetworkDataSource {
  /// 创建商品网络数据源实现
  ///
  /// [dio] Dio 网络客户端。
  /// [baseUrl] 可选商品接口基础地址。
  factory GoodsNetworkDataSourceImpl(Dio dio, {String baseUrl}) =
      _GoodsNetworkDataSourceImpl;

  /// 分页查询商品
  @POST('/page')
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    @Body() GoodsSearchRequest request,
  );

  /// 获取商品详情
  @GET('/info')
  Future<BaseResponse<Goods>> getGoodsInfo(@Query('id') int id);
}
