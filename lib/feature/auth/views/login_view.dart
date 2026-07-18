import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../core/ui/preview/app_preview_annotations.dart';
import '../localization/auth_keys.dart';
import '../logics/login_logic.dart';

/// 登录页面
class LoginView extends BaseView<LoginLogic> {
  /// 创建登录页面
  /// [logic] 外部注入的登录 Logic 一般用于测试和预览。
  LoginView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => AuthKeys.pageTitle.tr;

  /// 构建登录页面内容
  @override
  Widget body() => TDButton(
    text: AuthKeys.loginButton.tr,
    theme: TDButtonTheme.primary,
    onTap: logic.login,
  ).center();
}

/// 登录页面预览
@ResponsivePreview()
Widget previewLoginView() => LoginView(logic: LoginLogic());
