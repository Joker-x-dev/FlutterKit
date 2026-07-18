import '../../../model/entity/auth/auth.dart';

/// 认证信息本地数据源接口
///
/// 定义认证信息本地读写的契约。
abstract class AuthStoreDataSource {
  /// 保存认证信息
  ///
  /// [auth] 认证信息对象
  Future<void> saveAuth(Auth auth);

  /// 读取认证信息
  ///
  /// 返回认证信息对象，不存在时返回 null
  Future<Auth?> getAuth();

  /// 读取访问令牌
  ///
  /// 返回 token 字符串，不存在时返回 null
  Future<String?> getToken();

  /// 清除认证信息
  Future<void> clearAuth();

  /// 检查当前是否已登录
  ///
  /// 有非空 token 且访问令牌未过期时返回 true
  Future<bool> isLoggedIn();

  /// 判断访问令牌是否需要刷新
  Future<bool> shouldRefreshToken();
}
