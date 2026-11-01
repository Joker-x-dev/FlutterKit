import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:get/get.dart';

import '../localization/demo_keys.dart';
import 'nested_scroll_demo_avatar.dart';

/// 嵌套滚动示例折叠顶栏。
class NestedScrollDemoTopBar extends StatelessWidget {
  /// 创建个人主页折叠顶栏。
  ///
  /// [statusBarHeight] 系统状态栏高度。
  /// [opacity] 顶栏背景不透明度。
  /// [showSmallAvatar] 是否显示中央小头像。
  /// [onBack] 返回操作。
  const NestedScrollDemoTopBar({
    super.key,
    required this.statusBarHeight,
    required this.opacity,
    required this.showSmallAvatar,
    required this.onBack,
  });

  /// 小头像显隐动画时长。
  static const Duration _avatarAnimationDuration = Duration(milliseconds: 300);

  /// 系统状态栏高度。
  final double statusBarHeight;

  /// 顶栏背景不透明度。
  final double opacity;

  /// 是否显示中央小头像。
  final bool showSmallAvatar;

  /// 返回操作。
  final VoidCallback onBack;

  /// 构建左右操作和中央头像。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    final Widget smallAvatar =
        NestedScrollDemoAvatar(
              key: const ValueKey<String>('nested-scroll-small-avatar'),
              extent: spacer24,
              borderWidth: spaceDivider,
            )
            .animatedTranslateY(showSmallAvatar ? 0 : spacer48)
            .animatedOpacity(showSmallAvatar ? 1 : 0)
            .animate(
              duration: _avatarAnimationDuration,
              curve: Curves.easeOutBack,
            )
            .keyed(
              const ValueKey<String>('nested-scroll-small-avatar-visibility'),
            );
    return [
          _buildAction(
            tooltip: DemoKeys.nestedScrollBack.tr,
            icon: Icons.arrow_back_rounded,
            onPressed: onBack,
          ).alignment(.centerLeft),
          smallAvatar,
          _buildAction(
            tooltip: DemoKeys.nestedScrollShare.tr,
            icon: Icons.share_rounded,
          ).alignment(.centerRight),
        ]
        .toCenterStack()
        .keyed(const ValueKey<String>('nested-scroll-small-avatar-clip'))
        .clipRect()
        .padTop(statusBarHeight)
        .backgroundColor(appTheme.primaryDark.withValues(alpha: opacity));
  }

  /// 构建尺寸和字形风格一致的顶栏操作按钮。
  ///
  /// [tooltip] 按钮辅助说明。
  /// [icon] Material Rounded 图标。
  /// [onPressed] 点击回调。
  Widget _buildAction({
    required String tooltip,
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      tooltip: tooltip,
      style: IconButton.styleFrom(
        fixedSize: Size.square(spacer48),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: spacer24, color: appTheme.textAnti),
    );
  }
}

/// 个人主页折叠顶栏组件预览。
@WidgetPreview()
Widget previewNestedScrollDemoTopBar() {
  return Builder(
    builder: (BuildContext context) {
      return NestedScrollDemoTopBar(
        statusBarHeight: 0,
        opacity: 1,
        showSmallAvatar: true,
        onBack: () {},
      ).tight(width: spacer160 * 2 + spacer24, height: spacer48);
    },
  );
}
