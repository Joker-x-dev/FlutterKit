/// Token 本地存储数据源接口
///
/// 定义 Token 读写契约，由 [TokenStoreDataSourceImpl] 实现。
abstract class TokenStoreDataSource {
  /// 保存 Token
  ///
  /// [token] 用户访问令牌
  Future<void> setToken(String token);

  /// 读取 Token
  ///
  /// 返回 Token，默认空字符串
  Future<String> getToken();

  /// 清除 Token
  Future<void> clearToken();
}
