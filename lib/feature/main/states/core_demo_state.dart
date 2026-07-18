import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../demo/localization/demo_keys.dart';
import '../localization/main_keys.dart';
import '../models/demo_action.dart';
import '../models/demo_item.dart';

/// 核心示例页 State
///
/// 保存核心 Tab 的演示卡片列表。
class CoreDemoState {
  /// 默认核心示例菜单
  static const List<DemoItem> defaultDemoItems = <DemoItem>[
    DemoItem(
      title: DemoKeys.titleBaseDemo,
      description: DemoKeys.titleBaseDemoDesc,
      icon: TDIcons.user_avatar,
      action: DemoAction.base,
    ),
    DemoItem(
      title: DemoKeys.titleBaseRefreshDemo,
      description: DemoKeys.titleBaseRefreshDemoDesc,
      icon: TDIcons.refresh,
      action: DemoAction.baseRefresh,
    ),
    DemoItem(
      title: DemoKeys.titleBaseTabDemo,
      description: DemoKeys.titleBaseTabDemoDesc,
      icon: TDIcons.app,
      action: DemoAction.baseTab,
    ),
    DemoItem(
      title: MainKeys.demoNetwork,
      description: MainKeys.demoNetworkDesc,
      icon: TDIcons.wifi,
      action: DemoAction.network,
    ),
    DemoItem(
      title: MainKeys.demoNetworkRequest,
      description: MainKeys.demoNetworkRequestDesc,
      icon: TDIcons.internet,
      action: DemoAction.networkRequest,
    ),
    DemoItem(
      title: MainKeys.demoNetworkList,
      description: MainKeys.demoNetworkListDesc,
      icon: TDIcons.list,
      action: DemoAction.networkList,
    ),
    DemoItem(
      title: MainKeys.demoStateManagement,
      description: MainKeys.demoStateManagementDesc,
      icon: TDIcons.dashboard,
      action: DemoAction.stateManagement,
    ),
    DemoItem(
      title: MainKeys.demoDatabase,
      description: MainKeys.demoDatabaseDesc,
      icon: TDIcons.server,
      action: DemoAction.database,
    ),
    DemoItem(
      title: MainKeys.demoLocalStorage,
      description: MainKeys.demoLocalStorageDesc,
      icon: TDIcons.folder,
      action: DemoAction.localStorage,
    ),
  ];

  /// 创建核心示例页状态
  ///
  /// [demoItems] 初始演示卡片列表。
  const CoreDemoState({this.demoItems = defaultDemoItems});

  /// 演示卡片列表
  final List<DemoItem> demoItems;
}
