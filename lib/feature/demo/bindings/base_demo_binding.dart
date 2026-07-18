import 'package:get/get.dart';

import '../logics/base_demo_logic.dart';

/// Base 示例页 Binding
///
/// 注册 [BaseDemoLogic] 控制器。
class BaseDemoBinding extends Bindings {
  /// 注册 Base 示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<BaseDemoLogic>(() => BaseDemoLogic());
  }
}
