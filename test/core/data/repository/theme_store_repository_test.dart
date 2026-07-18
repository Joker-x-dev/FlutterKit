import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/core/data/repository/theme_store_repository.dart';
import 'package:flutter_kit/core/util/storage/storage_util.dart';

/// 主题模式本地存储仓库测试
///
/// 验证业务层通过 Repository 完成主题模式持久化。
void main() {
  late ThemeStoreRepository repository;

  /// 初始化测试存储与仓库
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageUtil.init();
    repository = ThemeStoreRepository();
  });

  /// 验证无本地数据时返回空值
  test('returns null when theme mode is not stored', () async {
    expect(await repository.getThemeModeIndex(), isNull);
  });

  /// 验证主题模式索引通过仓库完成读写
  test('saves and reads theme mode index through repository', () async {
    await repository.saveThemeModeIndex(2);

    expect(await repository.getThemeModeIndex(), 2);
  });

  /// 验证无本地数据时主题颜色名称返回空值
  test('returns null when theme color is not stored', () async {
    expect(await repository.getThemeColorName(), isNull);
  });

  /// 验证主题颜色名称通过仓库完成读写
  test('saves and reads theme color name through repository', () async {
    await repository.saveThemeColorName('green');

    expect(await repository.getThemeColorName(), 'green');
  });
}
