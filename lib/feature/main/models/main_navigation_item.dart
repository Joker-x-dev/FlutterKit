import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 主导航项数据模型
///
/// 保存导航文案、默认图标、选中图标与页面下标。
class MainNavigationItem {
  /// 创建主导航项数据
  ///
  /// [label] 国际化文案键名。
  /// [icon] 未选中图标。
  /// [selectedIcon] 选中图标。
  /// [index] 页面下标。
  const MainNavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.index,
  });

  /// 国际化文案键名
  final String label;

  /// 未选中图标
  final IconData icon;

  /// 选中图标
  final IconData selectedIcon;

  /// 页面下标
  final int index;

  /// 当前语言对应的导航文案
  String get localizedLabel => label.tr;
}
