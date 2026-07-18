import 'package:get/get.dart';

import '../core/service/demo_counter_service.dart';
import '../core/service/user_service.dart';
import 'app_initializer.dart';

/// 全局服务初始化器
///
/// 在存储初始化完成后注册 GetX 服务，并从本地存储恢复 [UserService] 状态。
class ServiceInitializer implements AppInitializer {
  @override
  Future<void> init() async {
    Get.put(DemoCounterService());

    final userService = UserService();
    await userService.initialize();
    Get.put(userService);
  }
}
