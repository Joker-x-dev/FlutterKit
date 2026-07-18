import 'network_keys.dart';

/// 网络模块文案 - 简体中文
final Map<String, String> networkZh = {
  NetworkKeys.errorUnauthorized: '未登录或登录已过期',
  NetworkKeys.errorNotFound: '请求的资源未找到',
  NetworkKeys.errorServer: '服务器错误',
  NetworkKeys.errorUnknown: '未知错误',
  NetworkKeys.errorBusinessUnknown: '未知业务错误',
  NetworkKeys.errorNetwork: '网络连接错误: 请检查您的网络连接',
  NetworkKeys.errorTimeout: '请求超时: 服务器响应超时，请稍后再试',
  NetworkKeys.errorServerTemplate: '服务器错误: %s',
  NetworkKeys.errorUnknownTemplate: '未知错误: %s',
  NetworkKeys.errorParseEntity: '未知实体类',
  NetworkKeys.errorParseField: '未知字段',
  NetworkKeys.errorParseTypeMismatch: "预期类型 '%s'，实际类型 '%s'",
  NetworkKeys.errorParseTemplate: "JSON解析错误: 实体 '%s' - %s",
};
