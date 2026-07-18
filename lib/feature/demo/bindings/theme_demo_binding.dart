import 'package:get/get.dart';

import '../logics/theme_demo_logic.dart';

/// 主题示例页 Binding
///
/// 注册 [ThemeDemoLogic] 控制器。
class ThemeDemoBinding extends Bindings {
  /// 注册语言与主题示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<ThemeDemoLogic>(() => ThemeDemoLogic());
  }
}
