import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/model/entity/user/user.dart';
import '../../../../core/model/response/base/base_response.dart';
import 'user_network_data_source.dart';

part 'user_network_data_source_impl.g.dart';

/// 用户网络数据源实现
///
/// 基于 Retrofit 生成具体网络请求实现，同时实现 [UserNetworkDataSource] 接口。
@RestApi(baseUrl: 'user')
abstract class UserNetworkDataSourceImpl implements UserNetworkDataSource {
  /// 创建用户网络数据源实现
  ///
  /// [dio] Dio 网络客户端。
  /// [baseUrl] 可选用户接口基础地址。
  factory UserNetworkDataSourceImpl(Dio dio, {String baseUrl}) =
      _UserNetworkDataSourceImpl;

  /// 获取用户个人信息
  @GET('/info')
  Future<BaseResponse<User>> getPersonInfo();
}
