import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_logic.dart';
import 'package:flutter_kit/core/data/repository/user_info_store_repository.dart';
import 'package:flutter_kit/core/model/entity/user/user.dart';

/// 本地存储示例页 Logic
///
/// 通过 [UserInfoStoreRepository] 读写用户信息。
class LocalStorageDemoLogic extends BaseLogic {
  /// 用户信息存储仓库
  final UserInfoStoreRepository _userInfoStoreRepository =
      UserInfoStoreRepository();

  /// 当前用户信息
  final Rxn<User> user = Rxn<User>();

  /// 保存演示用户信息
  Future<void> saveUser() async {
    const User demoUser = User(
      id: 10086,
      nickName: '演示用户',
      phone: '18800000000',
    );
    await _userInfoStoreRepository.saveUserInfo(demoUser);
    await readUser();
  }

  /// 读取用户信息
  Future<void> readUser() async {
    user.value = await _userInfoStoreRepository.getUserInfo();
  }

  /// 清除用户信息
  Future<void> clearUser() async {
    await _userInfoStoreRepository.clearUserInfo();
    user.value = null;
  }
}
