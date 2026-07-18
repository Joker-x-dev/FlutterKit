import '../core/network/debug/network_debug_tools.dart';
import 'app_initializer.dart';

/// 网络调试工具初始化器
///
/// 负责在应用启动阶段初始化 [NetworkDebugTools]，生产环境无实际行为。
class DebugNetworkInitializer implements AppInitializer {
  @override
  Future<void> init() async {
    NetworkDebugTools.initialize();
  }
}
