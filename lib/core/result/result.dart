/// 请求结果处理模块
///
/// 提供统一的链式请求辅助类 [RequestHelper] 与错误格式化工具 [ErrorFormatter]，
/// 用于处理从 Repository 返回的 `Future<BaseResponse<T>>` 结果。
library;

export 'error_formatter.dart';
export 'request_helper.dart';
