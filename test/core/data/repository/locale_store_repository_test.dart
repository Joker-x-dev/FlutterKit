import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/core/data/repository/locale_store_repository.dart';
import 'package:flutter_kit/core/util/storage/storage_util.dart';

/// 语言设置本地存储仓库测试
///
/// 验证业务层通过 Repository 完成语言标识持久化。
void main() {
  late LocaleStoreRepository repository;

  /// 初始化测试存储与仓库
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageUtil.init();
    repository = LocaleStoreRepository();
  });

  /// 验证无本地数据时返回空值
  test('returns null when locale is not stored', () async {
    expect(await repository.getLocaleTag(), isNull);
  });

  /// 验证语言标识通过仓库完成读写
  test('saves and reads locale tag through repository', () async {
    await repository.saveLocaleTag('en_US');

    expect(await repository.getLocaleTag(), 'en_US');
  });
}
