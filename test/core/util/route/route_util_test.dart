import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/util/route/route_util.dart';
import 'package:flutter_kit/routes/demo/demo_result.dart';

/// 路由工具测试
///
/// 验证 GetX 命名路由支持类型安全的页面结果回传。
void main() {
  /// 清理 GetX 测试状态
  tearDown(() {
    Get.reset();
  });

  /// 验证动态命名路由可以返回指定业务类型
  testWidgets('named route returns typed result without route cast error', (
    tester,
  ) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: const Scaffold(body: Text('Home')),
        getPages: [
          GetPage<void>(
            name: '/result',
            page: () => const Scaffold(body: Text('Result Page')),
          ),
        ],
      ),
    );

    final resultFuture = toPage<DemoResult>('/result');
    await tester.pumpAndSettle();

    expect(find.text('Result Page'), findsOneWidget);
    back<DemoResult>(const DemoResult(id: 9527, message: '回传结果'));
    await tester.pumpAndSettle();

    final result = await resultFuture;
    expect(result?.id, 9527);
    expect(result?.message, '回传结果');
    expect(tester.takeException(), isNull);
  });
}
