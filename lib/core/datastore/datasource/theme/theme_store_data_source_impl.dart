import '../../../util/storage/storage_util.dart';
import 'theme_store_data_source.dart';

/// 主题模式本地存储数据源实现
///
/// 基于 [StorageUtil] 持久化主题模式索引。
class ThemeStoreDataSourceImpl implements ThemeStoreDataSource {
  /// 主题模式存储键
  static const String _themeModeKey = 'theme_mode';

  /// 主题颜色存储键
  static const String _themeColorKey = 'theme_color';

  /// 保存主题模式索引
  ///
  /// [modeIndex] `ThemeMode.values` 对应的索引。
  @override
  Future<void> saveThemeModeIndex(int modeIndex) async {
    await StorageUtil.setInt(_themeModeKey, modeIndex);
  }

  /// 读取主题模式索引
  ///
  /// 不存在时返回 `null`。
  @override
  Future<int?> getThemeModeIndex() async {
    final modeIndex = StorageUtil.getInt(_themeModeKey, defaultValue: -1);
    return modeIndex >= 0 ? modeIndex : null;
  }

  /// 保存主题颜色名称
  ///
  /// [colorName] 主题颜色预设名称。
  @override
  Future<void> saveThemeColorName(String colorName) async {
    await StorageUtil.setString(_themeColorKey, colorName);
  }

  /// 读取主题颜色名称
  ///
  /// 不存在时返回 `null`。
  @override
  Future<String?> getThemeColorName() async {
    final colorName = StorageUtil.getString(_themeColorKey);
    return colorName.isEmpty ? null : colorName;
  }
}
