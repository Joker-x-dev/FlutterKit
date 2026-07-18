import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_logic.dart';

import '../../../core/service/user_service.dart';
import '../../../routes/demo/demo_navigator.dart';
import '../../../routes/demo/demo_result.dart';
import '../../../routes/user/user_navigator.dart';
import '../models/demo_action.dart';
import '../models/demo_item.dart';
import '../states/navigation_demo_state.dart';

/// 导航示例页 Logic
///
/// 管理导航示例入口、登录状态和页面结果回传。
class NavigationDemoLogic extends BaseLogic {
  /// 创建导航示例页 Logic
  ///
  /// [userService] 外部注入的用户服务，一般用于测试和预览。
  NavigationDemoLogic({UserService? userService})
    : _injectedUserService = userService;

  /// 外部注入的用户服务
  final UserService? _injectedUserService;

  /// 导航示例页面状态
  final NavigationDemoState navigationDemoState = NavigationDemoState();

  /// 全局用户状态服务
  UserService get userService =>
      _injectedUserService ?? Get.find<UserService>();

  /// 处理导航示例菜单点击
  ///
  /// [item] 被点击的菜单项。
  void onItemTap(DemoItem item) {
    switch (item.action) {
      case DemoAction.navigationWithParams:
        _onNavigationWithParamsTap();
        return;
      case DemoAction.navigationResult:
        unawaited(_onNavigationResultTap());
        return;
      case DemoAction.routeInterceptor:
        _onRouteInterceptorTap();
        return;
      default:
        throw UnsupportedError(
          'NavigationDemoLogic 不支持 ${item.action.name} 操作',
        );
    }
  }

  /// 带参跳转示例点击
  void _onNavigationWithParamsTap() {
    DemoNavigator.toNavigationWithArgs<void>(123);
  }

  /// 结果回传示例点击
  Future<void> _onNavigationResultTap() async {
    final DemoResult? result = await DemoNavigator.toNavigationResult();
    if (result != null) {
      navigationDemoState.demoResult.value = result;
    }
  }

  /// 路由拦截示例点击（跳转用户信息页，触发登录拦截）
  void _onRouteInterceptorTap() {
    UserNavigator.toUserInfo<void>();
  }
}
