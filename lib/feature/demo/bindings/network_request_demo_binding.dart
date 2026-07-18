import 'package:get/get.dart';

import '../logics/network_request_demo_logic.dart';

/// 网络请求（独立）示例页 Binding
///
/// 注册 [NetworkRequestDemoLogic] 控制器。
class NetworkRequestDemoBinding extends Bindings {
  /// 注册独立网络请求示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<NetworkRequestDemoLogic>(() => NetworkRequestDemoLogic());
  }
}
