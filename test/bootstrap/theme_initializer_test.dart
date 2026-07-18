import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/bootstrap/theme_initializer.dart';
import 'package:flutter_kit/core/data/repository/theme_store_repository.dart';
import 'package:flutter_kit/core/util/storage/storage_util.dart';

/// 主题初始化器测试
///
/// 验证应用启动时恢复已保存的主题颜色与深浅模式。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  /// 初始化测试存储与应用主题状态
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageUtil.init();
    Application.themeColorName.value = 'theme';
    Application.themeMode.value = ThemeMode.system;
  });

  /// 恢复应用全局主题状态
  tearDown(() {
    Application.themeColorName.value = 'theme';
    Application.themeMode.value = ThemeMode.system;
  });

  /// 验证主题颜色和深浅模式在启动时恢复
  test('restores saved theme color and brightness mode', () async {
    final repository = ThemeStoreRepository();
    await repository.saveThemeColorName('green');
    await repository.saveThemeModeIndex(ThemeMode.dark.index);

    await ThemeInitializer().init();

    expect(Application.themeColorName.value, 'green');
    expect(Application.themeMode.value, ThemeMode.dark);
    expect(Application.themeData.value.dark, isNotNull);
  });
}
