import '../../datastore/datasource/auth/auth_store_data_source.dart';
import '../../datastore/datasource/auth/auth_store_data_source_impl.dart';
import '../../model/entity/auth/auth.dart';

/// 认证信息本地存储仓库
///
/// 作为认证信息本地读写的统一入口，封装 [AuthStoreDataSource]。
class AuthStoreRepository {
  /// 认证信息本地数据源
  final AuthStoreDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  AuthStoreRepository({AuthStoreDataSource? dataSource})
    : _dataSource = dataSource ?? AuthStoreDataSourceImpl();

  /// 保存认证信息
  ///
  /// [auth] 待持久化的认证信息。
  Future<void> saveAuth(Auth auth) => _dataSource.saveAuth(auth);

  /// 读取认证信息
  Future<Auth?> getAuth() => _dataSource.getAuth();

  /// 读取访问令牌
  Future<String?> getToken() => _dataSource.getToken();

  /// 清除认证信息
  Future<void> clearAuth() => _dataSource.clearAuth();

  /// 检查当前是否已登录
  Future<bool> isLoggedIn() => _dataSource.isLoggedIn();

  /// 判断访问令牌是否需要刷新
  Future<bool> shouldRefreshToken() => _dataSource.shouldRefreshToken();
}
