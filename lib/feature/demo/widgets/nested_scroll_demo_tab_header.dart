import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/shape.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/widgets/space.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';

/// 嵌套滚动示例吸顶标签栏。
class NestedScrollDemoTabHeader extends StatelessWidget {
  /// 创建个人主页吸顶标签栏。
  ///
  /// [controller] 页面标签控制器。
  /// [titles] 标签标题。
  /// [showCornerGuard] 是否显示圆角后方的折叠背景遮罩。
  const NestedScrollDemoTabHeader({
    super.key,
    required this.controller,
    required this.titles,
    required this.showCornerGuard,
  });

  /// 页面标签控制器。
  final TabController controller;

  /// 标签标题。
  final List<String> titles;

  /// 是否显示圆角后方的折叠背景遮罩。
  final bool showCornerGuard;

  /// 构建固定高度标签栏和圆角遮罩。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    assert(titles.length == controller.length);
    final double tabBarWidth = spacer160 + spacer64 + spacer16;
    final BorderRadius sheetBorderRadius = BorderRadius.vertical(
      top: Radius.circular(radiusLarge),
    );
    return [
      const SpaceVerticalXSmall().backgroundColor(
        appTheme.primaryDark.withValues(alpha: showCornerGuard ? 1 : 0),
        key: const ValueKey<String>('nested-scroll-tab-corner-guard'),
      ),
      Theme(
            data: Theme.of(context).mergeExtension(
              TTabsBarThemeData(
                backgroundColor: appTheme.backgroundContainer,
                dividerHeight: 0,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: appTheme.primary,
                    width: spaceIndicator + spaceDivider * 2,
                  ),
                  insets: EdgeInsets.symmetric(
                    horizontal:
                        (spacer24 - (spaceIndicator + spaceDivider * 2)) / 2,
                  ),
                ),
                labelStyle: TextStyle(
                  color: appTheme.textPrimary,
                  fontSize: appTheme.fontTitleSmall?.size,
                ),
                unselectedLabelStyle: TextStyle(
                  color: appTheme.textSecondary,
                  fontSize: appTheme.fontTitleSmall?.size,
                ),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: spaceHorizontalMedium,
                ),
              ),
            ),
            child: ClipRect(
              child: Align(
                alignment: .bottomCenter,
                heightFactor: spacer40 / spacer48,
                child: TTabsBar(
                  controller: controller,
                  tabs: titles
                      .map((String title) => TTab(text: title))
                      .toList(),
                ),
              ),
            ),
          )
          .tight(width: tabBarWidth)
          .center()
          .backgroundColor(
            appTheme.backgroundContainer,
            key: const ValueKey<String>('nested-scroll-tab-bar'),
          )
          .clipRRect(sheetBorderRadius, clipBehavior: .antiAlias),
    ].toExpandedStack();
  }
}

/// 个人主页标签吸顶代理。
class NestedScrollDemoTabHeaderDelegate extends SliverPersistentHeaderDelegate {
  /// 创建标签吸顶代理。
  ///
  /// [extent] 标签栏固定高度。
  /// [child] 标签栏内容。
  const NestedScrollDemoTabHeaderDelegate({
    required this.extent,
    required this.child,
  });

  /// 标签栏固定高度。
  final double extent;

  /// 标签栏内容。
  final Widget child;

  /// 标签栏最大高度。
  @override
  double get maxExtent => extent;

  /// 标签栏最小高度。
  @override
  double get minExtent => extent;

  /// 构建吸顶标签栏。
  ///
  /// [context] 当前构建上下文。
  /// [shrinkOffset] 当前收缩位移。
  /// [overlapsContent] 是否覆盖内部内容。
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => child;

  /// 判断标签栏配置是否需要重建。
  ///
  /// [oldDelegate] 上一次标签栏代理。
  @override
  bool shouldRebuild(covariant NestedScrollDemoTabHeaderDelegate oldDelegate) {
    return oldDelegate.extent != extent || oldDelegate.child != child;
  }
}

/// 个人主页吸顶标签栏组件预览。
@WidgetPreview()
Widget previewNestedScrollDemoTabHeader() {
  return DefaultTabController(
    length: 3,
    child: Builder(
      builder: (BuildContext context) {
        return NestedScrollDemoTabHeader(
          controller: DefaultTabController.of(context),
          titles: <String>[
            DemoKeys.nestedScrollNotes.tr,
            DemoKeys.nestedScrollCollections.tr,
            DemoKeys.nestedScrollLiked.tr,
          ],
          showCornerGuard: false,
        ).tight(width: spacer160 * 2 + spacer24, height: spacer40);
      },
    ),
  );
}
