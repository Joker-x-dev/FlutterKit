import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/shape.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/widgets/space.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/generated/assets.gen.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/main_keys.dart';
import '../logics/about_demo_logic.dart';
import '../models/about_link_item.dart';

/// 关于示例页
///
/// 展示应用信息、版本号与项目说明。
class AboutDemoView extends BaseView<AboutDemoLogic> {
  /// 创建关于示例页
  /// [logic] 外部注入的关于示例 Logic 一般用于测试和预览。
  AboutDemoView({super.key, super.logic});

  /// 隐藏 Tab 页面返回按钮
  @override
  bool get navBackBtn => false;

  /// 首页标题栏高度
  @override
  double get navHeight => 56;

  /// 导航栏标题
  @override
  String? get navTitle => MainKeys.tabAbout.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建应用信息
  @override
  Widget body() {
    return <Widget>[_buildHeader(), _buildLinks()]
        .toColumnStretch(spacing: spaceVerticalLarge)
        .scrollable(padding: pageVerticalPadding);
  }

  /// 构建关于页面头部
  Widget _buildHeader() {
    return <Widget>[
          Assets.image.logo
              .image(semanticLabel: MainKeys.aboutAppName.tr)
              .square(spacer64 + spacer8),
          const SpaceVerticalSmall(),
          TDText(
            MainKeys.aboutAppName.tr,
            font: appTheme.fontHeadlineMedium,
            textColor: appTheme.textPrimary,
            fontWeight: appTheme.fontWeightBold,
            textAlign: TextAlign.center,
          ),
          const SpaceVerticalSmall(),
          TDText(
            MainKeys.aboutDescription.tr,
            font: appTheme.fontBodyMedium,
            textColor: appTheme.textSecondary,
            textAlign: TextAlign.center,
          ),
        ]
        .toColumnCenter()
        .padAll(spacePaddingLarge)
        .backgroundColor(appTheme.backgroundContainer)
        .clipRadius(radiusExtraLarge)
        .padHorizontal(spaceHorizontalLarge);
  }

  /// 构建关于页面链接列表
  Widget _buildLinks() {
    return TDCellGroup(
      theme: TDCellGroupTheme.cardTheme,
      cells: List<TDCell>.generate(logic.links.length, (int index) {
        final AboutLinkItem item = logic.links[index];
        return TDCell(
          title: item.localizedTitle,
          description: item.url,
          arrow: true,
          bordered: index != logic.links.length - 1,
          onClick: (_) => unawaited(logic.openLink(item)),
        );
      }),
    );
  }
}

/// 关于示例页面预览
@ResponsivePreview()
Widget previewAboutDemoView() => AboutDemoView(logic: AboutDemoLogic());
