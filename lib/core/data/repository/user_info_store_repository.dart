import '../../datastore/datasource/userinfo/user_info_store_data_source.dart';
import '../../datastore/datasource/userinfo/user_info_store_data_source_impl.dart';
import '../../model/entity/user/user.dart';

/// 用户信息本地存储仓库
///
/// 作为用户信息本地读写的统一入口，封装 [UserInfoStoreDataSource]。
class UserInfoStoreRepository {
  /// 用户信息本地数据源
  final UserInfoStoreDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  UserInfoStoreRepository({UserInfoStoreDataSource? dataSource})
    : _dataSource = dataSource ?? UserInfoStoreDataSourceImpl();

  /// 保存用户信息
  ///
  /// [user] 待持久化的用户信息。
  Future<void> saveUserInfo(User user) => _dataSource.saveUserInfo(user);

  /// 读取用户信息
  Future<User?> getUserInfo() => _dataSource.getUserInfo();

  /// 更新用户信息中的指定字段
  ///
  /// [updates] 字段更新映射；值为 `null` 时删除对应字段。
  Future<void> updateUserInfo(Map<String, dynamic> updates) =>
      _dataSource.updateUserInfo(updates);

  /// 清除用户信息
  Future<void> clearUserInfo() => _dataSource.clearUserInfo();

  /// 读取用户 ID
  Future<int> getUserId() => _dataSource.getUserId();

  /// 读取用户昵称
  Future<String?> getNickName() => _dataSource.getNickName();

  /// 读取用户头像 URL
  Future<String?> getAvatarUrl() => _dataSource.getAvatarUrl();
}
