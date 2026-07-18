import '../../../../core/model/entity/auth/auth.dart';
import '../../../../core/model/request/login_request.dart';
import '../../../../core/model/response/base/base_response.dart';

/// 认证网络数据源接口
///
/// 定义登录、Token 刷新等认证相关网络请求契约。
abstract class AuthNetworkDataSource {
  /// 密码登录
  ///
  /// [request] 登录请求参数
  /// 返回登录结果响应
  Future<BaseResponse<Auth>> loginByPassword(LoginRequest request);
}
