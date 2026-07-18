/// 网络模块国际化键名
///
/// 网络错误、异常及解析相关文案的键名定义，供 [core/network] 各层使用。
class NetworkKeys {
  const NetworkKeys._();

  /// 未登录或登录已过期
  static const String errorUnauthorized = 'errorUnauthorized';

  /// 请求的资源未找到
  static const String errorNotFound = 'errorNotFound';

  /// 服务器错误
  static const String errorServer = 'errorServer';

  /// 未知错误
  static const String errorUnknown = 'errorUnknown';

  /// 未知业务错误
  static const String errorBusinessUnknown = 'errorBusinessUnknown';

  /// 网络连接错误: 请检查您的网络连接
  static const String errorNetwork = 'errorNetwork';

  /// 请求超时: 服务器响应超时，请稍后再试
  static const String errorTimeout = 'errorTimeout';

  /// 服务器错误: %s
  static const String errorServerTemplate = 'errorServerTemplate';

  /// 未知错误: %s
  static const String errorUnknownTemplate = 'errorUnknownTemplate';

  /// 未知实体类
  static const String errorParseEntity = 'errorParseEntity';

  /// 未知字段
  static const String errorParseField = 'errorParseField';

  /// 预期类型 '%s'，实际类型 '%s'
  static const String errorParseTypeMismatch = 'errorParseTypeMismatch';

  /// JSON解析错误: 实体 '%s' - %s
  static const String errorParseTemplate = 'errorParseTemplate';
}
