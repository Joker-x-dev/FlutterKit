import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' hide Response;
import 'package:flutter_kit/core/config/app_config.dart';
import 'package:flutter_kit/core/localization/app_translations.dart';
import 'package:flutter_kit/core/network/exception/error_exception.dart';
import 'package:flutter_kit/core/network/interceptor/interceptor.dart';

class _TestResponseHandler extends ResponseInterceptorHandler {
  Response<dynamic>? nextResponse;
  DioException? rejected;

  @override
  void next(Response<dynamic> response) {
    nextResponse = response;
  }

  @override
  void reject(DioException error, [bool? callFollowingErrorInterceptor]) {
    rejected = error;
  }
}

class _TestErrorHandler extends ErrorInterceptorHandler {
  DioException? nextError;

  @override
  void next(DioException error) {
    nextError = error;
  }
}

void main() {
  setUpAll(() {
    // 初始化 GetX 翻译，避免错误处理中 .tr 调用异常
    Get.testMode = true;
    Get.addTranslations(AppTranslations().keys);
  });

  group('HttpInterceptor', () {
    final interceptor = HttpInterceptor();

    test('HTTP 200 且业务成功码时继续传递响应', () {
      final handler = _TestResponseHandler();
      final response = Response<dynamic>(
        requestOptions: RequestOptions(path: '/test'),
        data: {'code': AppConfig.successCode, 'msg': 'ok'},
        statusCode: 200,
      );

      interceptor.onResponse(response, handler);

      expect(handler.nextResponse, same(response));
      expect(handler.rejected, isNull);
    });

    test('HTTP 200 但业务错误码时 reject DioException', () {
      final handler = _TestResponseHandler();
      final response = Response<dynamic>(
        requestOptions: RequestOptions(path: '/test'),
        data: {'code': 400, 'msg': '业务错误'},
        statusCode: 200,
      );

      interceptor.onResponse(response, handler);

      expect(handler.nextResponse, isNull);
      expect(handler.rejected, isNotNull);
      expect(handler.rejected!.type, DioExceptionType.badResponse);
      expect(handler.rejected!.error, isA<BaseError>());
      final error = handler.rejected!.error! as BaseError;
      expect(error.code, 400);
      expect(error.message, '业务错误');
    });

    test('非 200 HTTP 状态码时 reject DioException', () {
      final handler = _TestResponseHandler();
      final response = Response<dynamic>(
        requestOptions: RequestOptions(path: '/test'),
        data: {'code': 200},
        statusCode: 500,
      );

      interceptor.onResponse(response, handler);

      expect(handler.nextResponse, isNull);
      expect(handler.rejected, isNotNull);
      expect(handler.rejected!.type, DioExceptionType.badResponse);
    });

    test('onError 继续传递异常', () {
      final handler = _TestErrorHandler();
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionError,
      );

      interceptor.onError(error, handler);

      expect(handler.nextError, same(error));
    });
  });
}
