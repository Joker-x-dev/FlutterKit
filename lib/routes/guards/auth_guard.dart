import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/service/user_service.dart';
import '../auth/auth_routes.dart';
import 'route_guard.dart';

/// 登录态导航拦截能力
///
/// 受保护页面通过 GetX Middleware 自动校验全局用户状态。
///
/// 认证路由守卫
///
/// 拦截需要登录态的页面，未登录时重定向到登录页。
class AuthGuard extends RouteGuard {
  /// 创建认证路由守卫
  AuthGuard();

  /// 校验目标路由的登录状态
  ///
  /// [route] 原始目标路由名称。
  ///
  /// 未登录时返回登录页配置，已登录时返回 `null` 并继续导航。
  @override
  RouteSettings? redirect(String? route) {
    final isLoggedIn = Get.find<UserService>().isLoggedIn.value;
    if (!isLoggedIn) {
      return const RouteSettings(name: AuthRoutes.login);
    }
    return null;
  }
}
