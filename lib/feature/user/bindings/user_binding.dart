import 'package:get/get.dart';

import '../logics/user_info_logic.dart';

/// User 模块依赖绑定
///
/// 注册用户信息页面所需控制器
class UserBinding extends Bindings {
  /// 注册用户信息页面 Logic
  @override
  void dependencies() {
    Get.lazyPut<UserInfoLogic>(() => UserInfoLogic());
  }
}
