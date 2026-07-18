import 'package:get/get.dart';

import '../logics/state_management_demo_logic.dart';

/// 状态管理示例页 Binding
///
/// 注册 [StateManagementDemoLogic] 控制器。
class StateManagementDemoBinding extends Bindings {
  /// 注册状态管理示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<StateManagementDemoLogic>(() => StateManagementDemoLogic());
  }
}
