import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_initializer.dart';

/// 系统 UI 样式初始化器
///
/// 配置状态栏、导航栏等系统 UI 样式
class SystemUiInitializer implements AppInitializer {
  @override
  Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        // 导航栏背景色
        statusBarColor: Colors.transparent,
        // 导航栏图标颜色
        statusBarIconBrightness: Brightness.dark,
        // 适配安卓小横条
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
}
