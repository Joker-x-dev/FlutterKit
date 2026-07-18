import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/shape.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/widgets/space.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_config.dart';
import 'package:flutter_kit/core/ui/adaptive/adaptive_extension.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/screen_adapt_demo_logic.dart';

/// 屏幕适配示例页
///
/// 展示当前断点、网格列数、列表列数以及响应式尺寸。
class ScreenAdaptDemoView extends BaseView<ScreenAdaptDemoLogic> {
  /// 创建屏幕适配示例页面
  ///
  /// [logic] 外部注入的屏幕适配示例 Logic 一般用于测试和预览。
  ScreenAdaptDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleScreenAdaptDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建响应式布局示例内容
  @override
  Widget body() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final BreakpointType breakpoint = BreakpointType.fromWidth(
          constraints.maxWidth,
        );
        final int gridColumns = breakpoint.bp(xs: 2, sm: 2, md: 3, lg: 4);
        final int listColumns = breakpoint.bp(xs: 1, sm: 1, md: 2, lg: 2);
        final int sampleTextSize = breakpoint.bp(
          xs: 14,
          sm: 14,
          md: 16,
          lg: 22,
        );
        final double sampleBoxSize = breakpoint.bp(
          xs: 80,
          sm: 80,
          md: 96,
          lg: 120,
        );

        return <Widget>[
          _buildSectionTitle(DemoKeys.adaptBreakpoint.tr),
          _buildBreakpointCard(breakpoint.name),
          _buildSectionTitle(DemoKeys.adaptGridSection.tr),
          _buildResponsiveItems(
            items: List<int>.generate(6, (int index) => index + 1),
            columns: gridColumns,
            titleBuilder: (int item) =>
                DemoKeys.adaptGridItem.trParams({'index': '$item'}),
            description: DemoKeys.adaptGridItemDesc.tr,
          ),
          _buildSectionTitle(DemoKeys.adaptListSection.tr),
          _buildResponsiveItems(
            items: List<int>.generate(4, (int index) => index + 1),
            columns: listColumns,
            titleBuilder: (int item) =>
                DemoKeys.adaptListItem.trParams({'index': '$item'}),
            description: DemoKeys.adaptListItemDesc.tr,
          ),
          _buildSectionTitle(DemoKeys.adaptTextSection.tr),
          _buildTextAdaptCard(sampleTextSize),
          _buildSectionTitle(DemoKeys.adaptSizeSection.tr),
          _buildSizeAdaptCard(sampleBoxSize),
        ].toListViewSeparated(
          padding: pagePadding,
          itemBuilder: (context, index, item) => item,
          separatorBuilder: (context, index) => const SpaceVerticalLarge(),
        );
      },
    );
  }

  /// 构建区块标题
  ///
  /// [title] 区块标题。
  Widget _buildSectionTitle(String title) {
    return TDText(
      title,
      font: appTheme.fontTitleLarge,
      textColor: appTheme.textPrimary,
      fontWeight: appTheme.fontWeightBold,
    );
  }

  /// 构建断点信息卡片
  ///
  /// [breakpointCode] 当前断点编码。
  Widget _buildBreakpointCard(String breakpointCode) {
    return _buildAdaptiveCard(<Widget>[
      _buildCardTitle(DemoKeys.adaptBreakpoint.tr),
      const SpaceVerticalSmall(),
      TDText(
        breakpointCode,
        font: appTheme.fontTitleLarge,
        textColor: appTheme.primary,
        fontWeight: appTheme.fontWeightBold,
        textAlign: TextAlign.center,
      ),
    ], crossAxisAlignment: CrossAxisAlignment.center);
  }

  /// 构建响应式网格内容
  ///
  /// [items] 展示数据。
  /// [columns] 当前断点列数。
  /// [titleBuilder] 子项标题构建器。
  /// [description] 子项说明。
  Widget _buildResponsiveItems({
    required List<int> items,
    required int columns,
    required String Function(int item) titleBuilder,
    required String description,
  }) {
    return items.toGridView(
      crossAxisCount: columns,
      mainAxisSpacing: spaceVerticalSmall,
      crossAxisSpacing: spaceHorizontalSmall,
      mainAxisExtent: spacer96 + spaceVerticalLarge,
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index, item) {
        return _buildAdaptiveCard(
          <Widget>[
            _buildCardTitle(titleBuilder(item)),
            const SpaceVerticalSmall(),
            _buildCardDescription(description),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
        );
      },
    );
  }

  /// 构建文本适配卡片
  ///
  /// [sampleTextSize] 当前断点文本尺寸。
  Widget _buildTextAdaptCard(int sampleTextSize) {
    return _buildAdaptiveCard(<Widget>[
      <Widget>[
        _buildCardDescription(DemoKeys.adaptTextLabel.tr),
        TDText(
          DemoKeys.adaptTextSample.tr,
          font: appTheme.fontBodyLarge?.withSize(sampleTextSize),
          textColor: appTheme.textPrimary,
          textAlign: TextAlign.center,
        ),
      ].toCenteredWrap(
        spacing: spaceHorizontalSmall,
        runSpacing: spaceVerticalSmall,
      ),
    ], crossAxisAlignment: CrossAxisAlignment.center);
  }

  /// 构建尺寸适配卡片
  ///
  /// [sampleBoxSize] 当前断点方块尺寸。
  Widget _buildSizeAdaptCard(double sampleBoxSize) {
    return _buildAdaptiveCard(<Widget>[
      _buildCardTitle(DemoKeys.adaptSizeTitle.tr),
      const SpaceVerticalSmall(),
      _buildCardDescription(
        DemoKeys.adaptSizeDesc.tr,
        textAlign: TextAlign.center,
      ),
      const SpaceVerticalLarge(),
      <Widget>[
        _buildCardDescription(
          DemoKeys.adaptSampleSize.trParams({
            'size': sampleBoxSize.toInt().toString(),
          }),
        ).expanded(),
        const SizedBox.shrink()
            .square(sampleBoxSize)
            .backgroundColor(appTheme.primary.withValues(alpha: 0.2))
            .clipRadius(radiusSmall),
      ].toRow(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: spaceHorizontalSmall,
      ),
    ], crossAxisAlignment: CrossAxisAlignment.stretch);
  }

  /// 构建通用适配卡片
  ///
  /// [children] 卡片内容。
  /// [mainAxisAlignment] 主轴对齐方式。
  /// [crossAxisAlignment] 交叉轴对齐方式。
  /// [mainAxisSize] 主轴尺寸策略。
  Widget _buildAdaptiveCard(
    List<Widget> children, {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.min,
  }) {
    return children
        .toColumn(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: mainAxisSize,
        )
        .padAll(spacePaddingLarge)
        .backgroundColor(appTheme.backgroundContainer)
        .clipRadius(radiusExtraLarge);
  }

  /// 构建卡片标题
  ///
  /// [title] 卡片标题。
  Widget _buildCardTitle(String title) {
    return TDText(
      title,
      font: appTheme.fontBodyLarge,
      textColor: appTheme.textPrimary,
      fontWeight: appTheme.fontWeightMedium,
      textAlign: TextAlign.center,
    );
  }

  /// 构建卡片说明
  ///
  /// [text] 说明文本。
  /// [textAlign] 文本对齐方式。
  Widget _buildCardDescription(
    String text, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return TDText(
      text,
      font: appTheme.fontBodyMedium,
      textColor: appTheme.textSecondary,
      textAlign: textAlign,
    );
  }
}

/// 屏幕适配示例页面预览
@ResponsivePreview()
Widget previewScreenAdaptDemoView() =>
    ScreenAdaptDemoView(logic: ScreenAdaptDemoLogic());
