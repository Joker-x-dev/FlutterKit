import 'package:get/get.dart';

import '../logics/local_storage_demo_logic.dart';

/// 本地存储示例页 Binding
///
/// 注册 [LocalStorageDemoLogic] 控制器。
class LocalStorageDemoBinding extends Bindings {
  /// 注册本地存储示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<LocalStorageDemoLogic>(() => LocalStorageDemoLogic());
  }
}
