import '../../../model/entity/user/user.dart';

/// 用户信息本地数据源接口
///
/// 定义用户信息本地读写的契约。
abstract class UserInfoStoreDataSource {
  /// 保存用户信息
  ///
  /// [user] 用户信息对象
  Future<void> saveUserInfo(User user);

  /// 读取用户信息
  ///
  /// 返回用户信息对象，不存在时返回 null
  Future<User?> getUserInfo();

  /// 更新用户信息中的指定字段
  ///
  /// [updates] 需要更新的字段映射，值为 null 时删除对应字段
  Future<void> updateUserInfo(Map<String, dynamic> updates);

  /// 清除用户信息
  Future<void> clearUserInfo();

  /// 读取用户 ID
  ///
  /// 返回用户 ID，不存在时返回 0
  Future<int> getUserId();

  /// 读取用户昵称
  Future<String?> getNickName();

  /// 读取用户头像 URL
  Future<String?> getAvatarUrl();
}
