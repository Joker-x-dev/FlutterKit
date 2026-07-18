import 'package:dio/dio.dart';

import '../../config/app_config.dart';
import '../../util/log/log_util.dart';
import '../exception/error_exception.dart';

/// 请求拦截
///
/// 统一处理 HTTP 状态码错误和业务错误码，异常响应通过 [handler.reject] 抛出，
/// 供上层 [RequestHelper] 或业务代码统一捕获。
class HttpInterceptor extends Interceptor {
  /// 请求前
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  /// 请求后
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    // 统一处理响应
    final error = _handleResponse(response);
    if (error != null) {
      LogUtil.e('错误代码: ${error.code}, 错误信息: ${error.message}');
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: error,
        ),
      );
    }
    return handler.next(response);
  }

  /// 请求出错
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  /// 统一返回处理
  ///
  /// [response] Dio 响应数据。
  ///
  /// 返回 null 表示响应正常，否则返回格式化后的错误对象
  BaseError? _handleResponse(Response<dynamic> response) {
    // 检查 HTTP 状态码
    if (response.statusCode != 200) {
      return CustomErrorHandler.handle(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    }

    final responseData = response.data;
    if (responseData is! Map<String, dynamic>) return null;

    // 处理业务错误
    final businessError = CustomErrorHandler.handleBusinessError(responseData);
    if (businessError.code == AppConfig.successCode) return null;

    if (businessError.code == 401) {
      // 认证失效响应由上层登录状态管理统一处理
    }

    return businessError;
  }
}
