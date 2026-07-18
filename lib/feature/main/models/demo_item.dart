import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'demo_action.dart';

/// Demo 项目数据模型
///
/// 保存示例入口的标题、描述、图标与行为标识。
class DemoItem {
  /// 标题国际化键或无需翻译的显示文本
  final String title;

  /// 描述国际化键或无需翻译的显示文本
  final String description;

  /// 图标
  final IconData icon;

  /// 菜单行为
  final DemoAction action;

  /// 创建 Demo 项目数据
  const DemoItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.action,
  });

  /// 获取当前语言对应的标题
  String get localizedTitle => title.tr;

  /// 获取当前语言对应的描述
  String get localizedDescription => description.tr;
}
