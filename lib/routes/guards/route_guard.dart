import 'package:get/get.dart';

/// 路由守卫基础能力
///
/// 统一承载权限校验、登录拦截和页面埋点等导航中间件扩展。
///
/// 路由守卫基类
///
/// 项目中的所有路由守卫应继承此类，通过重写 [redirect] 或 [onPageCalled]
/// 实现权限校验、登录拦截、页面埋点等通用逻辑。
abstract class RouteGuard extends GetMiddleware {
  /// 创建路由守卫
  RouteGuard();
}
