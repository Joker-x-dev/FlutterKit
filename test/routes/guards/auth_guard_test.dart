import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/service/user_service.dart';
import 'package:flutter_kit/routes/auth/auth_routes.dart';
import 'package:flutter_kit/routes/guards/auth_guard.dart';
import 'package:flutter_kit/routes/user/user_pages.dart';
import 'package:flutter_kit/routes/user/user_routes.dart';

/// 登录态路由守卫测试
///
/// 验证受保护路由在不同登录状态下的导航结果。
void main() {
  late UserService userService;

  /// 注册测试所需的全局用户状态
  setUp(() {
    Get.testMode = true;
    userService = UserService();
    Get.put<UserService>(userService);
  });

  /// 清理 GetX 测试容器
  tearDown(() {
    Get.reset();
  });

  /// 验证未登录状态重定向到登录页
  test('redirects to login when user is signed out', () {
    final RouteSettings? result = AuthGuard().redirect('/user/info');

    expect(result?.name, AuthRoutes.login);
  });

  /// 验证已登录状态允许继续导航
  test('allows navigation when user is signed in', () {
    userService.isLoggedIn.value = true;

    final RouteSettings? result = AuthGuard().redirect('/user/info');

    expect(result, isNull);
  });

  /// 验证用户信息路由自动挂载登录守卫
  test('protects user info route with auth guard', () {
    final userInfoPage = UserPages.routes.singleWhere(
      (page) => page.name == UserRoutes.userInfo,
    );

    expect(userInfoPage.middlewares, contains(isA<AuthGuard>()));
  });
}
