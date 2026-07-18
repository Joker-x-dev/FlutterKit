import 'package:get/get.dart';

import '../logics/network_demo_logic.dart';

/// 网络请求示例页 Binding
///
/// 注册 [NetworkDemoLogic] 控制器。
class NetworkDemoBinding extends Bindings {
  /// 注册网络请求示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<NetworkDemoLogic>(() => NetworkDemoLogic());
  }
}
