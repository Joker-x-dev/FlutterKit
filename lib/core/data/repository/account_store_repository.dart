import 'package:flutter_kit/core/datastore/datasource/account/account_store_data_source.dart';
import 'package:flutter_kit/core/datastore/datasource/account/account_store_data_source_impl.dart';

/// 账号密码本地存储仓库
///
/// 作为账号密码本地数据的统一入口，封装 [AccountStoreDataSource] 的读写逻辑。
class AccountStoreRepository {
  /// 账号密码本地数据源
  final AccountStoreDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  AccountStoreRepository({AccountStoreDataSource? dataSource})
    : _dataSource = dataSource ?? AccountStoreDataSourceImpl();

  /// 保存账号
  ///
  /// [account] 用户账号
  Future<void> saveAccount(String account) => _dataSource.setAccount(account);

  /// 读取账号
  ///
  /// 返回用户账号，默认空字符串
  Future<String> loadAccount() => _dataSource.getAccount();

  /// 保存密码
  ///
  /// [password] 用户密码
  Future<void> savePassword(String password) =>
      _dataSource.setPassword(password);

  /// 读取密码
  ///
  /// 返回用户密码，默认空字符串
  Future<String> loadPassword() => _dataSource.getPassword();
}
