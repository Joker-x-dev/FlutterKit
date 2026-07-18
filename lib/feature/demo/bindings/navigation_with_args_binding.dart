import 'package:get/get.dart';

import '../logics/navigation_with_args_logic.dart';

/// 带参跳转示例页 Binding
///
/// 注册 [NavigationWithArgsLogic] 控制器。
class NavigationWithArgsBinding extends Bindings {
  /// 注册带参跳转示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<NavigationWithArgsLogic>(() => NavigationWithArgsLogic());
  }
}
