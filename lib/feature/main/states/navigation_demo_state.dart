import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../routes/demo/demo_result.dart';
import '../localization/main_keys.dart';
import '../models/demo_action.dart';
import '../models/demo_item.dart';

/// 导航示例页 State
///
/// 保存导航 Tab 的演示卡片列表和页面回传结果。
class NavigationDemoState {
  /// 默认导航示例菜单
  static const List<DemoItem> defaultDemoItems = <DemoItem>[
    DemoItem(
      title: MainKeys.demoNavigationWithArgs,
      description: MainKeys.demoNavigationWithArgsDesc,
      icon: TDIcons.share,
      action: DemoAction.navigationWithParams,
    ),
    DemoItem(
      title: MainKeys.demoNavigationResult,
      description: MainKeys.demoNavigationResultDesc,
      icon: TDIcons.swap,
      action: DemoAction.navigationResult,
    ),
    DemoItem(
      title: MainKeys.demoRouteInterceptor,
      description: MainKeys.demoRouteInterceptorDesc,
      icon: TDIcons.lock_on,
      action: DemoAction.routeInterceptor,
    ),
  ];

  /// 创建导航示例页状态
  ///
  /// [demoItems] 导航演示卡片列表。
  NavigationDemoState({this.demoItems = defaultDemoItems});

  /// 演示卡片列表
  final List<DemoItem> demoItems;

  /// 最近一次页面回传结果
  final Rxn<DemoResult> demoResult = Rxn<DemoResult>();
}
