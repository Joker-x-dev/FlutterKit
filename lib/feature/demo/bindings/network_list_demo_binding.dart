import 'package:get/get.dart';

import '../logics/network_list_demo_logic.dart';

/// 网络列表示例页 Binding
///
/// 注册 [NetworkListDemoLogic] 控制器。
class NetworkListDemoBinding extends Bindings {
  /// 注册网络列表示例页 Logic
  @override
  void dependencies() {
    Get.lazyPut<NetworkListDemoLogic>(() => NetworkListDemoLogic());
  }
}
