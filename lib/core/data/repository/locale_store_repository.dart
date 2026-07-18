import '../../datastore/datasource/locale/locale_store_data_source.dart';
import '../../datastore/datasource/locale/locale_store_data_source_impl.dart';

/// 语言设置本地存储仓库
///
/// 作为语言设置持久化的统一业务入口。
class LocaleStoreRepository {
  /// 语言设置本地数据源
  final LocaleStoreDataSource _dataSource;

  /// 创建语言设置本地存储仓库
  ///
  /// [dataSource] 可选，未传入时使用默认本地数据源实现。
  LocaleStoreRepository({LocaleStoreDataSource? dataSource})
    : _dataSource = dataSource ?? LocaleStoreDataSourceImpl();

  /// 保存语言标识
  ///
  /// [localeTag] 语言与地区标识。
  Future<void> saveLocaleTag(String localeTag) {
    return _dataSource.saveLocaleTag(localeTag);
  }

  /// 读取语言标识
  Future<String?> getLocaleTag() {
    return _dataSource.getLocaleTag();
  }
}
