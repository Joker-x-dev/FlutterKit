import '../../../util/storage/storage_util.dart';
import 'locale_store_data_source.dart';

/// 语言设置本地存储数据源实现
///
/// 基于 [StorageUtil] 持久化语言标识。
class LocaleStoreDataSourceImpl implements LocaleStoreDataSource {
  /// 语言设置存储键
  static const String _localeTagKey = 'locale_tag';

  /// 保存语言标识
  ///
  /// [localeTag] 语言与地区标识。
  @override
  Future<void> saveLocaleTag(String localeTag) async {
    await StorageUtil.setString(_localeTagKey, localeTag);
  }

  /// 读取语言标识
  @override
  Future<String?> getLocaleTag() async {
    final localeTag = StorageUtil.getString(_localeTagKey);
    return localeTag.isEmpty ? null : localeTag;
  }
}
