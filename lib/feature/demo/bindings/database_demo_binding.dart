import 'package:get/get.dart';

import '../logics/database_demo_logic.dart';

/// 数据库示例页 Binding
///
/// 注册 [DatabaseDemoLogic] 控制器。
class DatabaseDemoBinding extends Bindings {
  /// 注册数据库示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<DatabaseDemoLogic>(() => DatabaseDemoLogic());
  }
}
