import 'package:get/get.dart';

import '../../../core/base/base/base_logic.dart';
import '../../../core/service/user_service.dart';
import '../../../core/util/toast/toast_util.dart';
import '../../../core/util/route/route_util.dart';
import '../localization/user_keys.dart';

/// 用户信息页面逻辑控制器
///
/// 提供受保护页面的退出登录操作。
class UserInfoLogic extends BaseLogic {
  /// 退出登录
  ///
  /// 清除全局登录状态并返回上一页
  Future<void> logout() async {
    await Get.find<UserService>().logout();
    ToastUtil.success(UserKeys.logoutSuccess.tr);
    back<void>();
  }
}
