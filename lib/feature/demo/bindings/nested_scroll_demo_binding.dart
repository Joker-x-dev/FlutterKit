import 'package:get/get.dart';

import '../logics/nested_scroll_demo_logic.dart';

/// 嵌套滚动示例 Binding。
///
/// 注册 [NestedScrollDemoLogic] 控制器。
class NestedScrollDemoBinding extends Bindings {
  /// 注册嵌套滚动示例 Logic。
  @override
  void dependencies() {
    Get.lazyPut<NestedScrollDemoLogic>(NestedScrollDemoLogic.new);
  }
}
