import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kit/core/config/app_config.dart';
import 'package:flutter_kit/core/model/response/base/base_response.dart';
import 'package:flutter_kit/core/util/common/common_util.dart';

void main() {
  group('CommonUtil', () {
    test('isNull 对 null 返回 true，对非 null 返回 false', () {
      expect(CommonUtil.isNull(null), isTrue);
      expect(CommonUtil.isNull(''), isFalse);
      expect(CommonUtil.isNull(0), isFalse);
      expect(CommonUtil.isNull(Object()), isFalse);
    });

    test('isNotNull 与 isNull 结果相反', () {
      expect(CommonUtil.isNotNull(null), isFalse);
      expect(CommonUtil.isNotNull('value'), isTrue);
    });

    test('isBlank 识别 null、空字符串和空集合', () {
      expect(CommonUtil.isBlank(null), isTrue);
      expect(CommonUtil.isBlank(''), isTrue);
      expect(CommonUtil.isBlank('   '), isTrue);
      expect(CommonUtil.isBlank(<String>[]), isTrue);
      expect(CommonUtil.isBlank(<String, dynamic>{}), isTrue);
      expect(CommonUtil.isBlank('hello'), isFalse);
      expect(CommonUtil.isBlank([1]), isFalse);
      expect(CommonUtil.isBlank({'k': 'v'}), isFalse);
    });

    test('isNotBlank 与 isBlank 结果相反', () {
      expect(CommonUtil.isNotBlank(null), isFalse);
      expect(CommonUtil.isNotBlank('hello'), isTrue);
    });

    test('isSuccess 在响应码为成功码时返回 true', () {
      final successResponse = BaseResponse<void>(
        code: AppConfig.successCode,
        message: 'ok',
      );
      expect(CommonUtil.isSuccess(successResponse), isTrue);
    });

    test('isSuccess 在响应码非成功码或响应为 null 时返回 false', () {
      final errorResponse = BaseResponse<void>(code: 500, message: 'error');
      expect(CommonUtil.isSuccess(errorResponse), isFalse);
      expect(CommonUtil.isSuccess(null), isFalse);
    });

    test('isError 与 isSuccess 结果相反', () {
      final successResponse = BaseResponse<void>(
        code: AppConfig.successCode,
        message: 'ok',
      );
      final errorResponse = BaseResponse<void>(code: 500, message: 'error');
      expect(CommonUtil.isError(successResponse), isFalse);
      expect(CommonUtil.isError(errorResponse), isTrue);
    });
  });
}
