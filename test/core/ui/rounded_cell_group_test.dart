import 'package:flutter_test/flutter_test.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/ui/widgets/rounded_cell_group.dart';

import '../../support/test_environment.dart';

/// 圆角单元格组首尾裁剪语义测试。
void main() {
  setUp(initializeCoreTestEnvironment);
  tearDown(resetCoreTestEnvironment);

  testWidgets('多项列表仅裁剪首尾单元格的外侧圆角', (tester) async {
    await tester.pumpWidget(
      buildCoreTestApp(
        home: const RoundedCellGroup(
          cells: <TCell>[
            TCell(title: Text('第一项')),
            TCell(title: Text('第二项')),
          ],
        ),
      ),
    );

    final TCellGroup group = tester.widget<TCellGroup>(find.byType(TCellGroup));
    final BorderRadius borderRadius = BorderRadius.circular(
      appTheme.tdTheme.radiusDefault,
    );
    final List<ClipRRect> clips = _cellClips(tester);

    expect(group.variant, TCellGroupVariant.card);
    expect(clips, hasLength(2));
    expect(
      clips.first.borderRadius,
      BorderRadius.only(
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
      ),
    );
    expect(
      clips.last.borderRadius,
      BorderRadius.only(
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      ),
    );
  });

  testWidgets('单项列表裁剪单元格四角', (tester) async {
    await tester.pumpWidget(
      buildCoreTestApp(
        home: const RoundedCellGroup(cells: <TCell>[TCell(title: Text('唯一项'))]),
      ),
    );

    final BorderRadius borderRadius = BorderRadius.circular(
      appTheme.tdTheme.radiusDefault,
    );
    final List<ClipRRect> clips = _cellClips(tester);

    expect(clips, hasLength(1));
    expect(clips.single.borderRadius, borderRadius);
  });
}

/// 获取直接包裹 TDesign 单元格的裁剪组件。
///
/// [tester] 当前 Widget 测试控制器。
///
/// 返回单元格对应的裁剪组件列表。
List<ClipRRect> _cellClips(WidgetTester tester) {
  return tester
      .widgetList<ClipRRect>(find.byType(ClipRRect))
      .where((ClipRRect clip) => clip.child is TCell)
      .toList();
}
