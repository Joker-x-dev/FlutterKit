import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../design_system/theme/app_theme.dart';
import '../preview/app_preview_annotations.dart';

/// 带有完整卡片圆角的 TDesign 单元格组。
///
/// 保留 [TCellGroup] 的卡片布局与主题解析，并对首尾单元格补充内层裁剪。
class RoundedCellGroup extends StatelessWidget {
  /// 创建带有完整卡片圆角的单元格组。
  ///
  /// [cells] 单元格列表。
  /// [title] 分组标题。
  /// [scrollable] 是否由单元格组承载滚动。
  const RoundedCellGroup({
    super.key,
    required this.cells,
    this.title,
    this.scrollable = false,
  });

  /// 单元格列表。
  final List<TCell> cells;

  /// 分组标题。
  final Widget? title;

  /// 是否由单元格组承载滚动。
  final bool scrollable;

  /// 构建 TDesign 卡片单元格组。
  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(
      appTheme.tdTheme.radiusDefault,
    );

    return TCellGroup(
      title: title,
      variant: TCellGroupVariant.card,
      cells: cells,
      scrollable: scrollable,
      builder: (BuildContext context, TCell cell, int index) {
        return _clipCell(cell, index, borderRadius);
      },
    );
  }

  /// 裁剪首尾单元格的外侧圆角。
  ///
  /// [cell] 当前单元格。
  /// [index] 当前单元格下标。
  /// [borderRadius] 单元格组卡片圆角。
  Widget _clipCell(TCell cell, int index, BorderRadius borderRadius) {
    final bool isFirst = index == 0;
    final bool isLast = index == cells.length - 1;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: isFirst ? borderRadius.topLeft : Radius.zero,
        topRight: isFirst ? borderRadius.topRight : Radius.zero,
        bottomLeft: isLast ? borderRadius.bottomLeft : Radius.zero,
        bottomRight: isLast ? borderRadius.bottomRight : Radius.zero,
      ),
      child: cell,
    );
  }
}

/// 圆角单元格组预览。
@WidgetPreview()
Widget previewRoundedCellGroup() {
  return const RoundedCellGroup(
    title: Text('分组标题'),
    cells: <TCell>[
      TCell(title: Text('第一项')),
      TCell(title: Text('第二项')),
    ],
  );
}
