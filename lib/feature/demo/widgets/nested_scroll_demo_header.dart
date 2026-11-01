import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/widgets/space.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/generated/assets.gen.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import 'nested_scroll_demo_avatar.dart';

/// 嵌套滚动示例资料头。
class NestedScrollDemoHeader extends StatelessWidget {
  /// 创建个人主页资料头。
  const NestedScrollDemoHeader({super.key});

  /// 构建头像、用户资料和统计信息。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return [
          [
            _buildLargeAvatar(),
            [
                  TText(
                    DemoKeys.nestedScrollDemoName.tr,
                    font: appTheme.fontTitleLarge,
                    style: TextStyle(
                      color: appTheme.textAnti,
                      fontWeight: appTheme.fontWeightBold,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  TText(
                    DemoKeys.nestedScrollDemoId.tr,
                    font: appTheme.fontBodySmall,
                    style: TextStyle(
                      color: appTheme.textAnti.withValues(alpha: 0.72),
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ]
                .toColumnStart(mainAxisSize: .min, spacing: spaceVerticalXSmall)
                .expanded(),
          ].toRow(spacing: spaceHorizontalLarge),
          const SpaceVerticalMedium(),
          TText(
            DemoKeys.nestedScrollDemoBio.tr,
            font: appTheme.fontBodySmall,
            style: TextStyle(color: appTheme.textAnti.withValues(alpha: 0.72)),
            maxLines: 2,
            overflow: .ellipsis,
          ),
          const Spacer(),
          [
            _NestedScrollDemoStat(
              value: '13',
              label: DemoKeys.nestedScrollFollowing.tr,
            ),
            _NestedScrollDemoStat(
              value: '18',
              label: DemoKeys.nestedScrollFollowers.tr,
            ),
            _NestedScrollDemoStat(
              value: '342',
              label: DemoKeys.nestedScrollLikesAndSaves.tr,
            ),
          ].toRow(spacing: spaceHorizontalLarge),
        ]
        .toColumnStart()
        .padAll(spacePaddingLarge)
        .maxSize(width: spacer160 * 5 + spacer40)
        .center();
  }

  /// 构建带新增标记的大头像。
  Widget _buildLargeAvatar() {
    final double avatarExtent = spacer64 + spacer16;
    return [
      NestedScrollDemoAvatar(extent: avatarExtent, borderWidth: spaceIndicator),
      Icon(TIcons.add, size: spacer16, color: appTheme.textAnti)
          .square(spacer24)
          .decorated(
            color: appTheme.primary,
            shape: .circle,
            border: Border.all(color: appTheme.textAnti, width: spaceDivider),
          )
          .positioned(right: 0, bottom: 0),
    ].toStack(clipBehavior: .none);
  }
}

/// 个人资料统计项。
class _NestedScrollDemoStat extends StatelessWidget {
  /// 创建个人资料统计项。
  ///
  /// [value] 统计数值。
  /// [label] 统计名称。
  const _NestedScrollDemoStat({required this.value, required this.label});

  /// 统计数值。
  final String value;

  /// 统计名称。
  final String label;

  /// 构建统计数值与名称。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return [
      TText(
        value,
        font: appTheme.fontBodySmall,
        style: TextStyle(
          color: appTheme.textAnti,
          fontWeight: appTheme.fontWeightBold,
        ),
      ),
      TText(
        label,
        font: appTheme.fontBodySmall,
        style: TextStyle(color: appTheme.textAnti.withValues(alpha: 0.72)),
      ),
    ].toColumnCenter(mainAxisSize: .min, spacing: spaceVerticalXSmall);
  }
}

/// 个人主页资料头组件预览。
@WidgetPreview()
Widget previewNestedScrollDemoHeader() {
  return Builder(
    builder: (BuildContext context) {
      return [
            Assets.image.background
                .svg(fit: .cover, alignment: .topCenter)
                .decorated(
                  position: .foreground,
                  gradient: LinearGradient(
                    begin: .topCenter,
                    end: .bottomCenter,
                    colors: <Color>[
                      appTheme.primaryDark.withValues(alpha: 0),
                      appTheme.primaryDark.withValues(alpha: 0.92),
                    ],
                  ),
                ),
            const NestedScrollDemoHeader(),
          ]
          .toStack(fit: .expand)
          .tight(width: spacer160 * 2 + spacer24, height: spacer160 + spacer96);
    },
  );
}
