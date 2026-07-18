import '../../datastore/datasource/theme/theme_store_data_source.dart';
import '../../datastore/datasource/theme/theme_store_data_source_impl.dart';

/// 主题模式本地存储仓库
///
/// 作为主题模式持久化的统一业务入口。
class ThemeStoreRepository {
  /// 主题设置本地数据源
  final ThemeStoreDataSource _dataSource;

  /// 创建主题模式本地存储仓库
  ///
  /// [dataSource] 可选，未传入时使用默认本地数据源实现。
  ThemeStoreRepository({ThemeStoreDataSource? dataSource})
    : _dataSource = dataSource ?? ThemeStoreDataSourceImpl();

  /// 保存主题模式索引
  ///
  /// [modeIndex] `ThemeMode.values` 对应的索引。
  Future<void> saveThemeModeIndex(int modeIndex) {
    return _dataSource.saveThemeModeIndex(modeIndex);
  }

  /// 读取主题模式索引
  ///
  /// 不存在时返回 `null`。
  Future<int?> getThemeModeIndex() {
    return _dataSource.getThemeModeIndex();
  }

  /// 保存主题颜色名称
  ///
  /// [colorName] 主题颜色预设名称。
  Future<void> saveThemeColorName(String colorName) {
    return _dataSource.saveThemeColorName(colorName);
  }

  /// 读取主题颜色名称
  ///
  /// 不存在时返回 `null`。
  Future<String?> getThemeColorName() {
    return _dataSource.getThemeColorName();
  }
}
