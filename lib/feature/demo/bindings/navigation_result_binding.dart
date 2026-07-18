import 'package:get/get.dart';

import '../logics/navigation_result_logic.dart';

/// 结果回传示例页 Binding
///
/// 注册 [NavigationResultLogic] 控制器。
class NavigationResultBinding extends Bindings {
  /// 注册结果回传示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<NavigationResultLogic>(() => NavigationResultLogic());
  }
}
