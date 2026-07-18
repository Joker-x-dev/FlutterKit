import '../../core/util/route/route_util.dart';
import 'auth_routes.dart';

/// Auth 模块导航器
class AuthNavigator {
  AuthNavigator._();

  /// 跳转到登录页面
  static Future<T?>? toLogin<T>() {
    return toPage<T>(AuthRoutes.login);
  }
}
