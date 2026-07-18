import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../application.dart';
import '../core/data/repository/theme_store_repository.dart';
import '../core/design_system/theme/theme_color_preset.dart';
import 'app_initializer.dart';

/// 主题初始化器
///
/// 从本地 JSON 加载主题配置，并恢复用户上次选择的主题颜色与深浅模式。
class ThemeInitializer implements AppInitializer {
  /// 初始化主题颜色与深浅模式
  @override
  Future<void> init() async {
    TDTheme.needMultiTheme();
    final repository = ThemeStoreRepository();
    final savedColorName = await repository.getThemeColorName();
    final colorPreset = ThemeColorPreset.fromName(savedColorName);
    final themeData = await colorPreset.loadThemeData();
    if (themeData != null) {
      Application.updateTheme(themeData, colorName: colorPreset.name);
    }

    final savedModeIndex = await repository.getThemeModeIndex();
    if (savedModeIndex != null &&
        savedModeIndex >= 0 &&
        savedModeIndex < ThemeMode.values.length) {
      Application.themeMode.value = ThemeMode.values[savedModeIndex];
    }
  }
}
