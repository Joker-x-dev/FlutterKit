import 'package:get/get.dart';

import '../logics/screen_adapt_demo_logic.dart';

/// 屏幕适配示例页 Binding
///
/// 注册 [ScreenAdaptDemoLogic] 控制器。
class ScreenAdaptDemoBinding extends Bindings {
  /// 注册屏幕适配示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<ScreenAdaptDemoLogic>(() => ScreenAdaptDemoLogic());
  }
}
