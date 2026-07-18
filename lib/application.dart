import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'bootstrap/app_initializer.dart';
import 'bootstrap/debug_network_initializer.dart';
import 'bootstrap/locale_initializer.dart';
import 'bootstrap/service_initializer.dart';
import 'bootstrap/storage_initializer.dart';
import 'bootstrap/system_ui_initializer.dart';
import 'bootstrap/theme_initializer.dart';
import 'core/data/repository/locale_store_repository.dart';
import 'core/data/repository/theme_store_repository.dart';

/// 应用全局入口配置
///
/// 负责聚合所有 [AppInitializer] 并按顺序执行，避免初始化逻辑集中在本类中
class Application {
  Application._();

  /// 主题 - 使用响应式变量
  static final Rx<TDThemeData> themeData = TDThemeData.defaultData().obs;

  /// 主题模式 - 默认跟随系统
  static final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  /// 主题颜色名称 - 默认主题
  static final RxString themeColorName = 'theme'.obs;

  /// 应用语言 - 默认简体中文
  static final Rx<Locale> locale = const Locale('zh', 'CN').obs;

  /// 初始化器列表，按顺序执行
  ///
  /// 测试时可替换为 mock 实现
  static List<AppInitializer> initializers = [
    SystemUiInitializer(),
    StorageInitializer(),
    LocaleInitializer(),
    DebugNetworkInitializer(),
    ServiceInitializer(),
    ThemeInitializer(),
  ];

  /// 页面初始化
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    for (final initializer in initializers) {
      await initializer.init();
    }
  }

  /// 更新主题
  ///
  /// [newTheme] 目标主题配置。
  /// [colorName] 可选主题颜色名称。
  static void updateTheme(TDThemeData newTheme, {String? colorName}) {
    themeData.value = newTheme;
    if (colorName != null) {
      themeColorName.value = colorName;
    }
  }

  /// 更新主题颜色并持久化
  ///
  /// [newTheme] 目标主题配置。
  /// [colorName] 主题颜色预设名称。
  static Future<void> updateThemeColor(
    TDThemeData newTheme,
    String colorName,
  ) async {
    updateTheme(newTheme, colorName: colorName);
    await ThemeStoreRepository().saveThemeColorName(colorName);
  }

  /// 更新主题模式并持久化
  ///
  /// [mode] 目标主题模式
  static Future<void> updateThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    await ThemeStoreRepository().saveThemeModeIndex(mode.index);
  }

  /// 更新应用语言并持久化
  ///
  /// [newLocale] 目标应用语言。
  static Future<void> updateLocale(Locale newLocale) {
    // 同步国际化语言，确保后续组件重建时 `.tr` 读取目标语言
    Get.locale = newLocale;
    locale.value = newLocale;
    final localeTag = '${newLocale.languageCode}_${newLocale.countryCode}';
    // 刷新未直接监听语言状态的存量路由页面
    unawaited(Get.forceAppUpdate());
    return LocaleStoreRepository().saveLocaleTag(localeTag);
  }
}
