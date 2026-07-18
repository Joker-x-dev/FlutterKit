import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/model/entity/auth/auth.dart';
import '../../../../core/model/request/login_request.dart';
import '../../../../core/model/response/base/base_response.dart';
import 'auth_network_data_source.dart';

part 'auth_network_data_source_impl.g.dart';

/// 认证网络数据源实现
///
/// 基于 Retrofit 生成具体网络请求实现，同时实现 [AuthNetworkDataSource] 接口。
@RestApi(baseUrl: 'auth')
abstract class AuthNetworkDataSourceImpl implements AuthNetworkDataSource {
  /// 创建认证网络数据源实现
  ///
  /// [dio] Dio 网络客户端。
  /// [baseUrl] 可选认证接口基础地址。
  factory AuthNetworkDataSourceImpl(Dio dio, {String baseUrl}) =
      _AuthNetworkDataSourceImpl;

  /// 密码登录
  @POST('/login')
  Future<BaseResponse<Auth>> loginByPassword(@Body() LoginRequest request);
}
