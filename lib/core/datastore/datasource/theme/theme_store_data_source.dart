/// 主题模式本地存储数据源接口
///
/// 定义主题模式索引的读写契约。
abstract class ThemeStoreDataSource {
  /// 保存主题模式索引
  ///
  /// [modeIndex] `ThemeMode.values` 对应的索引。
  Future<void> saveThemeModeIndex(int modeIndex);

  /// 读取主题模式索引
  ///
  /// 不存在时返回 `null`。
  Future<int?> getThemeModeIndex();

  /// 保存主题颜色名称
  ///
  /// [colorName] 主题颜色预设名称。
  Future<void> saveThemeColorName(String colorName);

  /// 读取主题颜色名称
  ///
  /// 不存在时返回 `null`。
  Future<String?> getThemeColorName();
}
