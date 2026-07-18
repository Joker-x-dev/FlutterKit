import '../../core/util/route/route_util.dart';
import 'user_routes.dart';

/// User 模块导航器
class UserNavigator {
  UserNavigator._();

  /// 跳转到用户信息页面
  static Future<T?>? toUserInfo<T>() {
    return toPage<T>(UserRoutes.userInfo);
  }
}
