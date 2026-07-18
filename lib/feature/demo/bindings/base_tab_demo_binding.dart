import 'package:get/get.dart';

import '../logics/base_tab_demo_logic.dart';

/// BaseTab 示例页 Binding
///
/// 注册 [BaseTabDemoLogic] 控制器。
class BaseTabDemoBinding extends Bindings {
  /// 注册 BaseTab 示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<BaseTabDemoLogic>(() => BaseTabDemoLogic());
  }
}
