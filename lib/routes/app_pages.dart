import 'auth/auth_pages.dart';
import 'demo/demo_pages.dart';
import 'main/main_pages.dart';
import 'user/user_pages.dart';

/// 应用页面配置
class AppPages {
  AppPages._();

  /// 所有页面路由配置
  static final routes = [
    // 主页模块
    ...MainPages.routes,

    // Demo 模块
    ...DemoPages.routes,

    // Auth 模块
    ...AuthPages.routes,

    // User 模块
    ...UserPages.routes,
  ];
}
