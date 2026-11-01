import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_config.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_extension.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';

import '../data/nested_scroll_demo_data.dart';
import '../states/nested_scroll_demo_state.dart';
import 'nested_scroll_demo_post_card.dart';

/// 嵌套滚动示例单个标签列表。
class NestedScrollDemoGridTab extends StatelessWidget {
  /// 创建个人主页标签列表。
  ///
  /// [posts] 当前标签帖子数据。
  /// [tabIndex] 标签下标。
  /// [scrollPhysics] EasyRefresh 注入的内部滚动物理效果。
  const NestedScrollDemoGridTab({
    super.key,
    required this.posts,
    required this.tabIndex,
    required this.scrollPhysics,
  });

  /// 当前标签帖子数据。
  final List<NestedScrollDemoPostItem> posts;

  /// 标签下标。
  final int tabIndex;

  /// EasyRefresh 注入的内部滚动物理效果。
  final ScrollPhysics scrollPhysics;

  /// 构建带重叠补偿的 Grid。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    final SliverOverlapAbsorberHandle overlapHandle =
        NestedScrollView.sliverOverlapAbsorberHandleFor(context);
    return NestedScrollDemoPostGrid(
      posts: posts,
      tabIndex: tabIndex,
      scrollPhysics: scrollPhysics,
      overlapHandle: overlapHandle,
    );
  }
}

/// 嵌套滚动示例响应式帖子 Grid。
class NestedScrollDemoPostGrid extends StatelessWidget {
  /// 创建响应式帖子 Grid。
  ///
  /// [posts] 当前标签帖子数据。
  /// [tabIndex] 标签下标，用于持久化滚动位置与子项 Key。
  /// [scrollPhysics] 列表滚动物理效果。
  /// [overlapHandle] 嵌套滚动吸顶区域的重叠补偿句柄。
  /// [primary] 是否使用主滚动控制器。
  const NestedScrollDemoPostGrid({
    super.key,
    required this.posts,
    required this.tabIndex,
    required this.scrollPhysics,
    this.overlapHandle,
    this.primary = true,
  });

  /// 当前标签帖子数据。
  final List<NestedScrollDemoPostItem> posts;

  /// 标签下标。
  final int tabIndex;

  /// 列表滚动物理效果。
  final ScrollPhysics scrollPhysics;

  /// 嵌套滚动吸顶区域的重叠补偿句柄。
  final SliverOverlapAbsorberHandle? overlapHandle;

  /// 是否使用主滚动控制器。
  final bool primary;

  /// 构建手机双列和宽屏三列布局。
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final BreakpointType breakpoint = BreakpointType.fromWidth(
          constraints.maxWidth,
        );
        final int columnCount = breakpoint.bp(xs: 2, sm: 2, md: 3, lg: 3);
        final double maxContentWidth = spacer160 * 5 + spacer40;
        final double sideInset = math.max(
          spacePaddingXSmall,
          (constraints.maxWidth - maxContentWidth) / 2 + spacePaddingXSmall,
        );
        final double cardExtent = breakpoint.bp(
          xs: spacer160 + spacer96,
          sm: spacer160 + spacer96,
          md: spacer160 + spacer96 + spacer32,
          lg: spacer160 + spacer96 + spacer32,
        );
        return <Widget>[
          if (overlapHandle != null)
            SliverOverlapInjector(handle: overlapHandle!),
          SliverGrid(
            key: ValueKey<String>('nested-scroll-grid-sliver-$tabIndex'),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columnCount,
              mainAxisExtent: cardExtent,
              mainAxisSpacing: spaceVerticalXSmall,
              crossAxisSpacing: spaceHorizontalXSmall,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return NestedScrollDemoPostCard(
                key: ValueKey<String>('nested-scroll-post-$tabIndex-$index'),
                item: posts[index],
              );
            }, childCount: posts.length),
          ).sliverPadding(
            EdgeInsets.fromLTRB(
              sideInset,
              spaceVerticalXSmall,
              sideInset,
              MediaQuery.paddingOf(context).bottom + spaceVerticalLarge,
            ),
          ),
        ].customScroll(
          key: PageStorageKey<String>('nested-scroll-grid-$tabIndex'),
          primary: primary,
          physics: scrollPhysics,
        );
      },
    );
  }
}

/// 个人主页响应式帖子 Grid 组件预览。
@WidgetPreview()
Widget previewNestedScrollDemoPostGrid() {
  return Builder(
    builder: (BuildContext context) {
      final List<NestedScrollDemoPostItem> posts =
          NestedScrollDemoData.createPosts(
            startOffset: 0,
          ).take(6).toList(growable: false);
      return NestedScrollDemoPostGrid(
        posts: posts,
        tabIndex: 0,
        scrollPhysics: const ClampingScrollPhysics(),
        primary: false,
      ).tight(width: spacer160 * 2 + spacer24, height: spacer160 * 3);
    },
  );
}
