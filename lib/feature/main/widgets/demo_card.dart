import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../core/design_system/theme/app_theme.dart';
import '../../../core/design_system/theme/shape.dart';
import '../../../core/design_system/theme/size.dart';
import '../../../core/ui/preview/app_preview_annotations.dart';

/// Demo 卡片组件
///
/// 展示 Demo 功能入口的标题、说明、图标与操作区域。
class DemoCard extends StatelessWidget {
  /// 标题
  final String title;

  /// 描述
  final String description;

  /// 图标
  final IconData icon;

  /// 点击回调
  final VoidCallback? onTap;

  /// 右侧内容组件，可选
  ///
  /// 未传入时显示默认箭头图标。
  final Widget? trailing;

  /// 创建 Demo 卡片组件
  ///
  /// [title] 标题。
  /// [description] 说明。
  /// [icon] 图标。
  /// [onTap] 点击回调。
  /// [trailing] 右侧自定义内容。
  const DemoCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
    this.trailing,
  });

  /// 构建 Demo 卡片
  @override
  Widget build(BuildContext context) {
    return buildCell(
      context,
      title: title,
      description: description,
      icon: icon,
      onTap: onTap,
      trailing: trailing,
      bordered: false,
    ).clipRadius(radiusExtraLarge);
  }

  /// 构建 TDesign 示例单元格
  ///
  /// [context] 构建上下文。
  /// [title] 示例标题。
  /// [description] 示例说明。
  /// [icon] 示例图标。
  /// [onTap] 点击回调。
  /// [trailing] 右侧自定义组件。
  /// [bordered] 是否显示组内分割线。
  ///
  /// 返回可直接放入 [TDCellGroup] 的单元格。
  static TDCell buildCell(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    VoidCallback? onTap,
    Widget? trailing,
    bool bordered = true,
  }) {
    final appTheme = AppTheme.of(context);
    return TDCell(
      bordered: bordered,
      leftIconWidget: Icon(icon, color: appTheme.primary, size: spacer24)
          .tight(height: spacer40, width: spacer40)
          .backgroundColor(appTheme.primary.withValues(alpha: 0.08))
          .clipRadius(radiusDefault),
      titleWidget: TDText(
        title,
        font: appTheme.fontBodyLarge,
        textColor: appTheme.textPrimary,
        fontWeight: appTheme.fontWeightMedium,
      ),
      descriptionWidget: TDText(
        description,
        font: appTheme.fontBodySmall,
        textColor: appTheme.textSecondary,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      rightIconWidget:
          trailing ??
          Icon(
            TDIcons.chevron_right,
            color: appTheme.textPlaceholder,
            size: spacer24,
          ),
      onClick: onTap == null ? null : (_) => onTap(),
    );
  }
}

// ==================== 预览 ====================

/// 构建 Demo 卡片预览
///
/// 返回包含示例文案、图标与应用主题的卡片组件。
@WidgetPreview()
Widget previewDemoCard() {
  return DemoCard(
    title: '网络分页列表示例',
    description: '展示分页加载、下拉刷新与加载更多状态',
    icon: TDIcons.list,
  );
}
