import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/user_keys.dart';
import '../logics/user_info_logic.dart';

/// 用户信息页面
class UserInfoView extends BaseView<UserInfoLogic> {
  /// 创建用户信息页面
  ///
  /// [logic] 外部注入的用户信息 Logic 一般用于测试和预览。
  UserInfoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => UserKeys.pageTitle.tr;

  /// 构建退出登录操作按钮
  @override
  Widget body() {
    return TDButton(
      text: UserKeys.logoutButton.tr,
      theme: TDButtonTheme.danger,
      onTap: logic.logout,
    ).center();
  }
}

/// 用户信息页面预览
@ResponsivePreview()
Widget previewUserInfoView() => UserInfoView(logic: UserInfoLogic());
