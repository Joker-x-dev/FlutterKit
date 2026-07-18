import 'package:flutter/material.dart';

import '../application.dart';
import '../core/data/repository/locale_store_repository.dart';
import 'app_initializer.dart';

/// 语言设置初始化器
///
/// 从本地存储恢复用户选择的应用语言。
class LocaleInitializer implements AppInitializer {
  /// 初始化应用语言
  @override
  Future<void> init() async {
    final localeTag = await LocaleStoreRepository().getLocaleTag();
    final locale = switch (localeTag) {
      'en_US' => const Locale('en', 'US'),
      'zh_CN' => const Locale('zh', 'CN'),
      _ => null,
    };
    if (locale != null) {
      Application.locale.value = locale;
    }
  }
}
