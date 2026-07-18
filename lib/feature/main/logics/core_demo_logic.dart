import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_logic.dart';
import 'package:flutter_kit/core/service/demo_counter_service.dart';

import '../../../routes/demo/demo_navigator.dart';
import '../models/demo_action.dart';
import '../models/demo_item.dart';
import '../states/core_demo_state.dart';

/// 核心示例页 Logic
///
/// 管理“核心”Tab 中的演示卡片列表，点击后跳转到对应示例页。
class CoreDemoLogic extends BaseLogic {
  /// 创建核心示例页 Logic
  ///
  /// [counterService] 外部注入的全局计数器服务，一般用于测试和预览。
  CoreDemoLogic({DemoCounterService? counterService})
    : _injectedCounterService = counterService;

  /// 外部注入的全局计数器服务
  final DemoCounterService? _injectedCounterService;

  /// 核心示例页面状态
  final CoreDemoState coreDemoState = const CoreDemoState();

  /// 当前全局计数器服务
  DemoCounterService get _counterService =>
      _injectedCounterService ?? Get.find<DemoCounterService>();

  /// 当前全局计数值
  RxInt get count => _counterService.count;

  /// 处理核心示例菜单点击
  ///
  /// [item] 被点击的菜单项。
  void onItemTap(DemoItem item) {
    switch (item.action) {
      case DemoAction.base:
        _onBaseDemoTap();
        return;
      case DemoAction.baseRefresh:
        _onBaseRefreshDemoTap();
        return;
      case DemoAction.baseTab:
        _onBaseTabDemoTap();
        return;
      case DemoAction.network:
        _onNetworkDemoTap();
        return;
      case DemoAction.networkRequest:
        _onNetworkRequestDemoTap();
        return;
      case DemoAction.networkList:
        _onNetworkListDemoTap();
        return;
      case DemoAction.stateManagement:
        _onStateManagementDemoTap();
        return;
      case DemoAction.database:
        _onDatabaseDemoTap();
        return;
      case DemoAction.localStorage:
        _onLocalStorageDemoTap();
        return;
      default:
        throw UnsupportedError('CoreDemoLogic 不支持 ${item.action.name} 操作');
    }
  }

  /// Network Demo 点击
  void _onNetworkDemoTap() {
    DemoNavigator.toNetworkDemo<void>();
  }

  /// Network List Demo 点击
  void _onNetworkListDemoTap() {
    DemoNavigator.toNetworkListDemo<void>();
  }

  /// Database Demo 点击
  void _onDatabaseDemoTap() {
    DemoNavigator.toDatabaseDemo<void>();
  }

  /// Local Storage Demo 点击
  void _onLocalStorageDemoTap() {
    DemoNavigator.toLocalStorageDemo<void>();
  }

  /// State Management Demo 点击
  void _onStateManagementDemoTap() {
    DemoNavigator.toStateManagementDemo<void>();
  }

  /// Network Request Demo 点击
  void _onNetworkRequestDemoTap() {
    DemoNavigator.toNetworkRequestDemo<void>();
  }

  /// BaseView 示例点击
  void _onBaseDemoTap() {
    DemoNavigator.toBaseDemo<void>();
  }

  /// BaseRefresh 示例点击
  void _onBaseRefreshDemoTap() {
    DemoNavigator.toBaseRefreshDemo<void>();
  }

  /// BaseTab 示例点击
  void _onBaseTabDemoTap() {
    DemoNavigator.toBaseTabDemo<void>();
  }
}
