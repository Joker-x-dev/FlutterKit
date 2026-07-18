import 'package:get/get.dart';

import '../../feature/user/bindings/user_binding.dart';
import '../../feature/user/views/user_info_view.dart';
import '../guards/auth_guard.dart';
import 'user_routes.dart';

/// User 模块页面配置
class UserPages {
  UserPages._();

  /// User 模块全部页面路由
  static final List<GetPage<void>> routes = [
    GetPage(
      name: UserRoutes.userInfo,
      page: () => UserInfoView(),
      binding: UserBinding(),
      middlewares: [AuthGuard()],
    ),
  ];
}
