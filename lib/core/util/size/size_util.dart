import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/common_util.dart';

/// 屏幕尺寸工具
///
/// 统一读取屏幕、状态栏、导航栏和底部安全区域尺寸。
class SizeUtil {
  /// 获取屏幕宽度
  static double getScreenWidth() {
    return ScreenUtil().screenWidth;
  }

  /// 获取屏幕高度
  static double getScreenHeight() {
    return ScreenUtil().screenHeight;
  }

  /// 状态栏高度 刘海屏会更高
  static double getStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }

  /// 导航栏高度
  static double getNavBarHeight() {
    return AppBar().preferredSize.height;
  }

  /// 安全区域高度
  static double getSafeBarHeight() {
    return CommonUtil.isAndroid() ? 14.00 : ScreenUtil().bottomBarHeight;
  }
}
