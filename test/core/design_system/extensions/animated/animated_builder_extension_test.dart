import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../support/extension_test_harness.dart';

/// Listenable 动画构建扩展测试。
void main() {
  testWidgets('监听值变化时重建并保留缓存子组件', (WidgetTester tester) async {
    final ValueNotifier<int> notifier = ValueNotifier<int>(0);
    addTearDown(notifier.dispose);

    final Widget widget = notifier.animatedBuilder(
      key: const ValueKey<String>('动画构建器'),
      child: const Text('缓存内容'),
      builder: (BuildContext context, Widget? child) {
        return <Widget>[Text('${notifier.value}'), child!].toColumn();
      },
    );

    await pumpExtensionTestApp(tester, widget);

    expect(find.byKey(const ValueKey<String>('动画构建器')), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('缓存内容'), findsOneWidget);

    notifier.value = 1;
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('缓存内容'), findsOneWidget);
  });

  testWidgets('未提供缓存子组件时向回调传递空值', (WidgetTester tester) async {
    final ChangeNotifier notifier = ChangeNotifier();
    addTearDown(notifier.dispose);
    Widget? receivedChild;

    await pumpExtensionTestApp(
      tester,
      notifier.animatedBuilder(
        builder: (BuildContext context, Widget? child) {
          receivedChild = child;
          return const Text('内容');
        },
      ),
    );

    expect(receivedChild, isNull);
    expect(find.text('内容'), findsOneWidget);
  });
}
