import 'package:get/get.dart';

import '../logics/base_refresh_demo_logic.dart';

/// BaseRefresh 示例页 Binding
///
/// 注册 [BaseRefreshDemoLogic] 控制器。
class BaseRefreshDemoBinding extends Bindings {
  /// 注册 BaseRefresh 示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<BaseRefreshDemoLogic>(() => BaseRefreshDemoLogic());
  }
}
