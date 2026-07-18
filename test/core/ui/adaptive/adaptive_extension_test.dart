import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_config.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_extension.dart';

/// 断点适配扩展测试
void main() {
  group('BreakpointType.fromWidth', () {
    test('宽度 319.9 应为 xs', () {
      expect(BreakpointType.fromWidth(319.9), BreakpointType.xs);
    });

    test('宽度 320 应为 sm', () {
      expect(BreakpointType.fromWidth(320), BreakpointType.sm);
    });

    test('宽度 599.9 应为 sm', () {
      expect(BreakpointType.fromWidth(599.9), BreakpointType.sm);
    });

    test('宽度 600 应为 md', () {
      expect(BreakpointType.fromWidth(600), BreakpointType.md);
    });

    test('宽度 839.9 应为 md', () {
      expect(BreakpointType.fromWidth(839.9), BreakpointType.md);
    });

    test('宽度 840 应为 lg', () {
      expect(BreakpointType.fromWidth(840), BreakpointType.lg);
    });
  });

  group('AdaptiveExtension 断点判断', () {
    testWidgets('宽度 300 时 currentBreakpoint 为 xs', (tester) async {
      final context = await _pumpContext(tester, size: const Size(300, 800));
      expect(context.currentBreakpoint, BreakpointType.xs);
      expect(context.isXS, true);
    });

    testWidgets('宽度 400 时 currentBreakpoint 为 sm', (tester) async {
      final context = await _pumpContext(tester, size: const Size(400, 800));
      expect(context.currentBreakpoint, BreakpointType.sm);
      expect(context.isSM, true);
    });

    testWidgets('宽度 700 时 currentBreakpoint 为 md', (tester) async {
      final context = await _pumpContext(tester, size: const Size(700, 800));
      expect(context.currentBreakpoint, BreakpointType.md);
      expect(context.isMD, true);
    });

    testWidgets('宽度 900 时 currentBreakpoint 为 lg', (tester) async {
      final context = await _pumpContext(tester, size: const Size(900, 800));
      expect(context.currentBreakpoint, BreakpointType.lg);
      expect(context.isLG, true);
    });
  });

  group('AdaptiveExtension.bp 正常取值与回退', () {
    testWidgets('当前断点有直接值时返回当前断点值', (tester) async {
      final context = await _pumpContext(tester, size: const Size(400, 800));
      expect(context.bp<int>(xs: 1, sm: 2, md: 3, lg: 4), 2);
    });

    testWidgets('当前断点为空时向更小的断点回退', (tester) async {
      final context = await _pumpContext(tester, size: const Size(400, 800));
      expect(context.bp<int>(xs: 1, md: 3, lg: 4), 1);
    });

    testWidgets('当前断点及更小断点均为空时向更大的断点回退', (tester) async {
      final context = await _pumpContext(tester, size: const Size(400, 800));
      expect(context.bp<int>(md: 3, lg: 4), 3);
    });

    testWidgets('断点值全部为空时使用 defaultValue', (tester) async {
      final context = await _pumpContext(tester, size: const Size(400, 800));
      expect(context.bp<int>(defaultValue: 99), 99);
    });

    testWidgets('未提供 defaultValue 时返回首个非空断点值', (tester) async {
      final context = await _pumpContext(tester, size: const Size(400, 800));
      expect(context.bp<int>(lg: 4), 4);
    });

    testWidgets('全部为空且无 defaultValue 时抛出异常', (tester) async {
      final context = await _pumpContext(tester, size: const Size(400, 800));
      expect(() => context.bp<int>(), throwsArgumentError);
    });
  });

  group('AdaptiveExtension.bpByOptions', () {
    testWidgets('通过配置对象按断点取值', (tester) async {
      final context = await _pumpContext(tester, size: const Size(700, 800));
      const options = BreakpointValueOptions<String>(
        xs: 'xs-value',
        sm: 'sm-value',
        md: 'md-value',
        lg: 'lg-value',
      );
      expect(context.bpByOptions(options), 'md-value');
    });

    testWidgets('配置对象支持 defaultValue 兜底', (tester) async {
      final context = await _pumpContext(tester, size: const Size(700, 800));
      const options = BreakpointValueOptions<String>(xs: 'xs-value');
      expect(context.bpByOptions(options, defaultValue: 'default'), 'xs-value');
    });
  });

  group('BreakpointValueExtension.bp', () {
    test('指定断点可以脱离 BuildContext 解析响应式值', () {
      expect(BreakpointType.lg.bp<int>(xs: 2, sm: 2, md: 3, lg: 4), 4);
    });

    test('指定断点支持向更小断点回退', () {
      expect(BreakpointType.md.bp<int>(xs: 1, sm: 2), 2);
    });
  });
}

/// 构建一个已知尺寸的测试上下文
///
/// [size] 为逻辑尺寸（已包含 devicePixelRatio）
Future<BuildContext> _pumpContext(
  WidgetTester tester, {
  required Size size,
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1.0;

  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });

  await tester.pumpWidget(
    const MaterialApp(home: Scaffold(body: SizedBox.shrink())),
  );

  return tester.element(find.byType(SizedBox));
}
