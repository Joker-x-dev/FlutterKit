import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/config/app_config.dart';
import 'package:flutter_kit/core/localization/app_translations.dart';
import 'package:flutter_kit/core/model/response/base/base_response.dart';
import 'package:flutter_kit/core/result/request_helper.dart';

void main() {
  setUpAll(() {
    Get.testMode = true;
    Get.locale = const Locale('zh', 'CN');
    Get.addTranslations(AppTranslations().keys);
  });

  group('RequestHelper', () {
    test('execute 在业务成功时返回数据', () async {
      final helper = RequestHelper.repository<int>(
        Future.value(BaseResponse<int>(data: 42, code: AppConfig.successCode)),
      );

      final result = await helper.execute();

      expect(result, 42);
    });

    test('execute 在业务失败时抛出异常并触发 error 回调', () async {
      String? capturedMessage;
      final helper = RequestHelper.repository<int>(
        Future.value(
          BaseResponse<int>(code: 400, message: '业务失败'),
        ),
      ).error((message, error) {
        capturedMessage = message;
      });

      await expectLater(helper.execute(), throwsA(isA<Object>()));

      expect(capturedMessage, '业务失败');
    });

    test('execute 在请求异常时抛出格式化后的异常信息', () async {
      final helper = RequestHelper.repository<int>(
        Future<BaseResponse<int>>.error(Exception('network broken')),
      );

      await expectLater(
        helper.execute(),
        throwsA(
          predicate(
            (dynamic e) => e.toString().toLowerCase().contains('network broken'),
          ),
        ),
      );
    });

    test('response 返回完整 BaseResponse', () async {
      final response = BaseResponse<int>(data: 7, code: AppConfig.successCode);
      final helper = RequestHelper.repository<int>(Future.value(response));

      final result = await helper.response();

      expect(result.data, 7);
      expect(result.isSucceeded, isTrue);
    });

    test('start 回调在请求前被调用', () async {
      var started = false;
      final helper = RequestHelper.repository<int>(
        Future.value(BaseResponse<int>(data: 1, code: AppConfig.successCode)),
      ).start(() {
        started = true;
      });

      await helper.execute();

      expect(started, isTrue);
    });
  });
}
