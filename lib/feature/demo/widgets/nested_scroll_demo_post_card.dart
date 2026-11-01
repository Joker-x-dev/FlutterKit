import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/shape.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/generated/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../states/nested_scroll_demo_state.dart';

/// 嵌套滚动示例帖子卡片。
class NestedScrollDemoPostCard extends StatelessWidget {
  /// 创建个人主页帖子卡片。
  ///
  /// [item] 帖子展示数据。
  const NestedScrollDemoPostCard({super.key, required this.item});

  /// 帖子展示数据。
  final NestedScrollDemoPostItem item;

  /// 构建封面、标题和作者信息。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return [
          SvgPicture.asset(
            item.assetPath,
            fit: .cover,
            alignment: .center,
            semanticsLabel: DemoKeys.nestedScrollPostTitle.trParams(
              <String, String>{'index': '${item.titleIndex}'},
            ),
          ).expanded(),
          [
                TText(
                  DemoKeys.nestedScrollPostTitle.trParams(<String, String>{
                    'index': '${item.titleIndex}',
                  }),
                  font: appTheme.fontBodySmall,
                  style: TextStyle(
                    color: appTheme.textPrimary,
                    fontWeight: appTheme.fontWeightMedium,
                  ),
                  maxLines: 2,
                  overflow: .ellipsis,
                ),
                [
                  Assets.image.avatar
                      .image(width: spacer16, height: spacer16, fit: .cover)
                      .clipOval(),
                  TText(
                    item.author,
                    font: appTheme.fontMarkSmall,
                    style: TextStyle(color: appTheme.textPrimary),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ).expanded(),
                  Icon(
                    TIcons.heart,
                    size: spacer16,
                    color: appTheme.textSecondary,
                  ),
                  TText(
                    '${item.likes}',
                    font: appTheme.fontMarkSmall,
                    style: TextStyle(color: appTheme.textSecondary),
                  ),
                ].toRow(spacing: spaceHorizontalXSmall),
              ]
              .toColumnStart(mainAxisSize: .min, spacing: spaceVerticalXSmall)
              .padAll(spacePaddingSmall),
        ]
        .toColumnStretch()
        .backgroundColor(appTheme.backgroundContainer)
        .clipRadius(radiusLarge);
  }
}

/// 个人主页帖子卡片组件预览。
@WidgetPreview()
Widget previewNestedScrollDemoPostCard() {
  return Builder(
    builder: (BuildContext context) {
      return NestedScrollDemoPostCard(
        item: NestedScrollDemoPostItem(
          assetPath: Assets.image.grid.path,
          titleIndex: 1,
          author: 'Loren',
          likes: 128,
        ),
      ).tight(width: spacer160, height: spacer160 + spacer96);
    },
  );
}
