import 'package:get/get.dart';

import '../logics/about_demo_logic.dart';
import '../logics/core_demo_logic.dart';
import '../logics/expand_demo_logic.dart';
import '../logics/main_logic.dart';
import '../logics/navigation_demo_logic.dart';

/// 主页面依赖绑定
///
/// 注册底部 4 个 Tab 对应的 Logic。
class MainBinding extends Bindings {
  /// 注册主页面及四个子页面 Logic
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(() => MainLogic());
    Get.lazyPut<CoreDemoLogic>(() => CoreDemoLogic());
    Get.lazyPut<NavigationDemoLogic>(() => NavigationDemoLogic());
    Get.lazyPut<ExpandDemoLogic>(() => ExpandDemoLogic());
    Get.lazyPut<AboutDemoLogic>(() => AboutDemoLogic());
  }
}
