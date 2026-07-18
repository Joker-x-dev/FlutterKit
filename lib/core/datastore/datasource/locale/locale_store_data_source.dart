/// 语言设置本地存储数据源接口
///
/// 定义语言标识的读写契约。
abstract class LocaleStoreDataSource {
  /// 保存语言标识
  ///
  /// [localeTag] 语言与地区标识，例如 `zh_CN`。
  Future<void> saveLocaleTag(String localeTag);

  /// 读取语言标识
  ///
  /// 不存在时返回 `null`。
  Future<String?> getLocaleTag();
}
