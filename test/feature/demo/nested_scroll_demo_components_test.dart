import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_kit/feature/demo/widgets/nested_scroll_refresh_ball.dart';
import 'package:flutter_kit/feature/demo/widgets/nested_scroll_demo_avatar.dart';
import 'package:flutter_kit/feature/demo/widgets/nested_scroll_demo_grid.dart';
import 'package:flutter_kit/feature/demo/widgets/nested_scroll_demo_header.dart';
import 'package:flutter_kit/feature/demo/widgets/nested_scroll_demo_page_body.dart';
import 'package:flutter_kit/feature/demo/widgets/nested_scroll_demo_post_card.dart';
import 'package:flutter_kit/feature/demo/widgets/nested_scroll_demo_tab_header.dart';
import 'package:flutter_kit/feature/demo/widgets/nested_scroll_demo_top_bar.dart';

import '../../support/test_environment.dart';

/// 嵌套滚动示例拆分组件与 Preview 测试。
void main() {
  setUp(initializeCoreTestEnvironment);
  tearDown(resetCoreTestEnvironment);

  final List<(String, Widget Function(), Type)> previews =
      <(String, Widget Function(), Type)>[
        ('头像', previewNestedScrollDemoAvatar, NestedScrollDemoAvatar),
        ('资料头', previewNestedScrollDemoHeader, NestedScrollDemoHeader),
        ('吸顶标签栏', previewNestedScrollDemoTabHeader, NestedScrollDemoTabHeader),
        ('折叠顶栏', previewNestedScrollDemoTopBar, NestedScrollDemoTopBar),
        ('帖子卡片', previewNestedScrollDemoPostCard, NestedScrollDemoPostCard),
        ('帖子 Grid', previewNestedScrollDemoPostGrid, NestedScrollDemoPostGrid),
        ('刷新球', previewNestedScrollRefreshBall, NestedScrollRefreshBall),
        ('嵌套滚动主体', previewNestedScrollDemoPageBody, NestedScrollDemoPageBody),
      ];

  for (final Brightness brightness in Brightness.values) {
    for (final (name, previewBuilder, componentType) in previews) {
      testWidgets('$name Preview 可在 $brightness 主题独立渲染', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          buildCoreTestApp(
            home: Scaffold(body: previewBuilder()),
            brightness: brightness,
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(componentType), findsWidgets);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
