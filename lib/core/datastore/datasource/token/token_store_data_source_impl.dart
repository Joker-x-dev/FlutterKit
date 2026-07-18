import 'package:flutter_kit/core/util/storage/storage_util.dart';

import 'token_store_data_source.dart';

/// Token 本地存储数据源实现
///
/// 基于 [StorageUtil] 封装 Token 的本地读写。
class TokenStoreDataSourceImpl implements TokenStoreDataSource {
  /// 访问令牌存储键
  static const String _accessTokenKey = 'access_token';

  /// 保存访问令牌
  ///
  /// [token] 用户访问令牌。
  @override
  Future<void> setToken(String token) async {
    await StorageUtil.setString(_accessTokenKey, token);
  }

  /// 读取访问令牌
  ///
  /// 返回已保存令牌；不存在时返回空字符串。
  @override
  Future<String> getToken() async {
    return StorageUtil.getString(_accessTokenKey);
  }

  /// 清除访问令牌
  @override
  Future<void> clearToken() async {
    await StorageUtil.delete(_accessTokenKey);
  }
}
