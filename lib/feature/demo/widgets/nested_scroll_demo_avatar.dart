import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/generated/assets.gen.dart';

/// 嵌套滚动示例头像组件。
class NestedScrollDemoAvatar extends StatelessWidget {
  /// 创建个人主页头像。
  ///
  /// [extent] 头像边长。
  /// [borderWidth] 头像描边宽度。
  const NestedScrollDemoAvatar({
    super.key,
    required this.extent,
    required this.borderWidth,
  });

  /// 头像边长。
  final double extent;

  /// 头像描边宽度。
  final double borderWidth;

  /// 构建带反色描边的圆形头像。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return Assets.image.avatar
        .image(
          width: extent - borderWidth * 4,
          height: extent - borderWidth * 4,
          fit: .cover,
        )
        .clipOval()
        .padAll(borderWidth)
        .decorated(
          shape: .circle,
          border: Border.all(color: appTheme.textAnti, width: borderWidth),
        )
        .square(extent);
  }
}

/// 个人主页头像组件预览。
@WidgetPreview()
Widget previewNestedScrollDemoAvatar() {
  return Builder(
    builder: (BuildContext context) {
      return NestedScrollDemoAvatar(
        extent: spacer64 + spacer16,
        borderWidth: spaceIndicator,
      ).padAll(spacePaddingLarge).backgroundColor(appTheme.primaryDark);
    },
  );
}
