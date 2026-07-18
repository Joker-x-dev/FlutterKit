import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kit/generated/assets.gen.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 应用主题颜色预设
///
/// 统一维护主题名称、资源文件、深色主题键与预览颜色。
@immutable
class ThemeColorPreset {
  /// 主题名称
  final String name;

  /// 主题资源路径
  final String assetPath;

  /// 深色主题键
  final String darkName;

  /// 主题预览颜色
  final Color previewColor;

  /// 创建主题颜色预设
  const ThemeColorPreset({
    required this.name,
    required this.assetPath,
    required this.darkName,
    required this.previewColor,
  });

  /// 绿色主题
  static final ThemeColorPreset green = ThemeColorPreset(
    name: 'green',
    assetPath: Assets.json.green,
    darkName: 'greenDark',
    previewColor: const Color(0xff45c58b),
  );

  /// 红色主题
  static final ThemeColorPreset red = ThemeColorPreset(
    name: 'red',
    assetPath: Assets.json.red,
    darkName: 'redDark',
    previewColor: const Color(0xfff36d78),
  );

  /// 蓝色主题
  static final ThemeColorPreset blue = ThemeColorPreset(
    name: 'blue',
    assetPath: Assets.json.blue,
    darkName: 'blueDark',
    previewColor: const Color(0xff2196f3),
  );

  /// 默认主题
  static final ThemeColorPreset defaultTheme = ThemeColorPreset(
    name: 'theme',
    assetPath: Assets.json.theme,
    darkName: 'themeDark',
    previewColor: const Color(0xff0052d9),
  );

  /// 可选主题颜色列表
  static final List<ThemeColorPreset> values = List.unmodifiable([
    defaultTheme,
    green,
    red,
    blue,
  ]);

  /// 根据主题名称获取预设
  ///
  /// [name] 已保存的主题名称。
  ///
  /// 未匹配到预设时返回默认主题。
  static ThemeColorPreset fromName(String? name) {
    return values.firstWhere(
      (preset) => preset.name == name,
      orElse: () => defaultTheme,
    );
  }

  /// 从资源文件加载明暗主题配置
  ///
  /// 返回解析后的 TDesign 主题数据；资源内容无效时返回 `null`。
  Future<TDThemeData?> loadThemeData() async {
    final jsonString = await rootBundle.loadString(assetPath);
    return TDThemeData.fromJson(name, jsonString, darkName: darkName);
  }
}
