/// 账号密码本地存储数据源接口
///
/// 定义账号与密码读写契约，由 [AccountStoreDataSourceImpl] 实现。
abstract class AccountStoreDataSource {
  /// 保存账号
  ///
  /// [account] 用户账号
  Future<void> setAccount(String account);

  /// 读取账号
  ///
  /// 返回用户账号，默认空字符串
  Future<String> getAccount();

  /// 保存密码
  ///
  /// [password] 用户密码
  Future<void> setPassword(String password);

  /// 读取密码
  ///
  /// 返回用户密码，默认空字符串
  Future<String> getPassword();
}
