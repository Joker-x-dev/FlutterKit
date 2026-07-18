import 'package:flutter_kit/core/datastore/datasource/token/token_store_data_source.dart';
import 'package:flutter_kit/core/datastore/datasource/token/token_store_data_source_impl.dart';

/// Token 本地存储仓库
///
/// 作为 Token 本地数据的统一入口，封装 [TokenStoreDataSource] 的读写逻辑。
class TokenStoreRepository {
  /// Token 本地数据源
  final TokenStoreDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  TokenStoreRepository({TokenStoreDataSource? dataSource})
    : _dataSource = dataSource ?? TokenStoreDataSourceImpl();

  /// 保存 Token
  ///
  /// [token] 用户访问令牌
  Future<void> saveToken(String token) => _dataSource.setToken(token);

  /// 读取 Token
  ///
  /// 返回 Token，默认空字符串
  Future<String> loadToken() => _dataSource.getToken();

  /// 清除 Token
  Future<void> clearToken() => _dataSource.clearToken();
}
