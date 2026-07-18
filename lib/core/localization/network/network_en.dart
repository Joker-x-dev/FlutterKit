import 'network_keys.dart';

/// 网络模块文案 - 英文
final Map<String, String> networkEn = {
  NetworkKeys.errorUnauthorized: 'Not logged in or session expired',
  NetworkKeys.errorNotFound: 'Requested resource not found',
  NetworkKeys.errorServer: 'Server error',
  NetworkKeys.errorUnknown: 'Unknown error',
  NetworkKeys.errorBusinessUnknown: 'Unknown business error',
  NetworkKeys.errorNetwork:
      'Network connection error: please check your network',
  NetworkKeys.errorTimeout:
      'Request timeout: server response timed out, please try again later',
  NetworkKeys.errorServerTemplate: 'Server error: %s',
  NetworkKeys.errorUnknownTemplate: 'Unknown error: %s',
  NetworkKeys.errorParseEntity: 'Unknown entity',
  NetworkKeys.errorParseField: 'Unknown field',
  NetworkKeys.errorParseTypeMismatch: "Expected type '%s', actual type '%s'",
  NetworkKeys.errorParseTemplate: "JSON parse error: entity '%s' - %s",
};
