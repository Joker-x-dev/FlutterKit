import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_logic.dart';
import 'package:flutter_kit/core/service/demo_counter_service.dart';

/// 状态管理示例页 Logic
///
/// 操作全局 [DemoCounterService] 中的计数器。
class StateManagementDemoLogic extends BaseLogic {
  /// 创建状态管理示例页 Logic
  /// [counterService] 外部注入的计数器服务，一般用于测试和预览。
  StateManagementDemoLogic({DemoCounterService? counterService})
    : _injectedCounterService = counterService;

  /// 外部注入的计数器服务
  final DemoCounterService? _injectedCounterService;

  /// 当前计数器服务
  DemoCounterService get _counterService =>
      _injectedCounterService ?? Get.find<DemoCounterService>();

  /// 当前计数值
  RxInt get count => _counterService.count;

  /// 计数加 1
  void increment() => _counterService.increase();

  /// 计数减 1
  void decrement() => _counterService.decrease();

  /// 重置计数器
  void reset() => _counterService.reset();
}
