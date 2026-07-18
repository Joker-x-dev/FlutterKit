import 'package:get/get.dart';

import '../../../core/base/base/base_logic.dart';
import '../../../core/model/entity/auth/auth.dart';
import '../../../core/model/entity/user/user.dart';
import '../../../core/service/user_service.dart';
import '../../../core/util/toast/toast_util.dart';
import '../../../core/util/route/route_util.dart';
import '../localization/auth_keys.dart';

/// 登录页面逻辑控制器
///
/// 构造演示用户数据并更新全局登录状态。
class LoginLogic extends BaseLogic {
  /// 模拟登录
  ///
  /// 构造演示认证信息与用户信息，更新全局登录状态后返回上一页
  Future<void> login() async {
    final Auth auth = Auth(
      token: 'demo-token',
      refreshToken: 'demo-refresh',
      expire: 3600,
      refreshExpire: 7200,
    );
    final User user = User(id: 1, nickName: '演示用户', phone: '18800000000');

    await Get.find<UserService>().updateUserState(auth, user);
    ToastUtil.success(AuthKeys.loginSuccess.tr);
    back<void>();
  }
}
