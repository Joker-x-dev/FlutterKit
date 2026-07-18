import 'package:get/get.dart';

import '../logics/login_logic.dart';

/// Auth 模块依赖绑定
///
/// 注册登录页面所需控制器
class AuthBinding extends Bindings {
  /// 注册登录页面 Logic
  @override
  void dependencies() {
    Get.lazyPut<LoginLogic>(() => LoginLogic());
  }
}
