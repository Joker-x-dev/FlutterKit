import '../../model/entity/auth/auth.dart';
import '../../model/request/login_request.dart';
import '../../model/response/base/base_response.dart';
import '../../network/datasource/auth/auth_network_data_source.dart';
import '../../network/datasource/auth/auth_network_data_source_impl.dart';
import '../../network/provider/dio_provider.dart';

/// 认证数据仓库
///
/// 作为认证模块对外唯一数据入口，封装 [AuthNetworkDataSource] 的网络请求。
class AuthRepository {
  /// 认证网络数据源
  final AuthNetworkDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  AuthRepository({AuthNetworkDataSource? dataSource})
    : _dataSource = dataSource ?? AuthNetworkDataSourceImpl(DioProvider().dio);

  /// 密码登录
  ///
  /// [request] 登录请求参数
  /// 返回登录结果响应
  Future<BaseResponse<Auth>> loginByPassword(LoginRequest request) =>
      _dataSource.loginByPassword(request);
}
