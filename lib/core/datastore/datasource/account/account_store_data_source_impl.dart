import 'package:flutter_kit/core/util/storage/storage_util.dart';

import 'account_store_data_source.dart';

/// 账号密码本地存储数据源实现
///
/// 基于 [StorageUtil] 封装账号与密码的本地读写。
class AccountStoreDataSourceImpl implements AccountStoreDataSource {
  /// 账号存储键
  static const String _accountKey = 'account';

  /// 密码存储键
  static const String _passwordKey = 'password';

  /// 保存用户账号
  ///
  /// [account] 用户账号。
  @override
  Future<void> setAccount(String account) async {
    await StorageUtil.setString(_accountKey, account);
  }

  /// 读取用户账号
  ///
  /// 返回已保存账号；不存在时返回空字符串。
  @override
  Future<String> getAccount() async {
    return StorageUtil.getString(_accountKey);
  }

  /// 保存用户密码
  ///
  /// [password] 用户密码。
  @override
  Future<void> setPassword(String password) async {
    await StorageUtil.setString(_passwordKey, password);
  }

  /// 读取用户密码
  ///
  /// 返回已保存密码；不存在时返回空字符串。
  @override
  Future<String> getPassword() async {
    return StorageUtil.getString(_passwordKey);
  }
}
