import 'package:get/get.dart';

import '../../feature/auth/bindings/auth_binding.dart';
import '../../feature/auth/views/login_view.dart';
import 'auth_routes.dart';

/// Auth 模块页面配置
class AuthPages {
  AuthPages._();

  static final List<GetPage<void>> routes = [
    GetPage(
      name: AuthRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
  ];
}
