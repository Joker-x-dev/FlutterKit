import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/shape.dart';
import '../../design_system/theme/size.dart';
import '../../design_system/widgets/space.dart';
import '../../localization/common/common_keys.dart';

/// 商品详情内容组件
///
/// 统一展示商品轮播图、基础信息、价格销量与详情图片。
class GoodsDetailContent extends StatelessWidget {
  /// 商品信息
  final Goods goods;

  /// 创建商品详情内容组件
  ///
  /// [key] 组件标识。
  /// [goods] 商品信息。
  const GoodsDetailContent({super.key, required this.goods});

  /// 构建商品详情内容
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final images = _resolvePreviewImages();
    final contentImages = goods.contentPics ?? const <String>[];

    return [
      _GoodsImageCarousel(
        images: images,
      ).height(340).clipRadius(radiusExtraLarge),
      const SpaceVerticalLarge(),
      _buildSummaryCard(appTheme),
      const SpaceVerticalLarge(),
      _buildDetailCard(appTheme, contentImages),
    ].toColumnStretch();
  }

  /// 解析商品预览图片
  ///
  /// 优先使用商品图片列表，列表为空时使用商品主图。
  List<String> _resolvePreviewImages() {
    final images =
        goods.pics?.where((imageUrl) => imageUrl.trim().isNotEmpty).toList() ??
        <String>[];
    if (images.isNotEmpty) {
      return images;
    }
    if (goods.mainPic.trim().isNotEmpty) {
      return [goods.mainPic];
    }
    return const <String>[];
  }

  /// 构建商品摘要卡片
  ///
  /// [appTheme] 当前应用主题。
  Widget _buildSummaryCard(AppTheme appTheme) {
    return <Widget>[
          TDText(
            goods.title,
            font: appTheme.fontTitleLarge,
            textColor: appTheme.textPrimary,
            fontWeight: appTheme.fontWeightBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (goods.subTitle?.isNotEmpty == true) ...[
            const SpaceVerticalSmall(),
            TDText(
              goods.subTitle,
              font: appTheme.fontBodyMedium,
              textColor: appTheme.textSecondary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SpaceVerticalLarge(),
          [
            TDText(
              '¥${goods.price.toStringAsFixed(2)}',
              font: appTheme.fontTitleLarge,
              textColor: appTheme.error,
              fontWeight: appTheme.fontWeightBold,
            ),
            TDText(
              CommonKeys.goodsSold.trArgs([goods.sold.toString()]),
              font: appTheme.fontBodyMedium,
              textColor: appTheme.textSecondary,
            ),
          ].toRowBetween(crossAxisAlignment: CrossAxisAlignment.end),
        ]
        .toColumnStart()
        .padAll(spacePaddingLarge)
        .backgroundColor(appTheme.backgroundContainer)
        .clipRadius(radiusExtraLarge);
  }

  /// 构建商品详情卡片
  ///
  /// [appTheme] 当前应用主题。
  /// [contentImages] 商品详情图片列表。
  Widget _buildDetailCard(AppTheme appTheme, List<String> contentImages) {
    return <Widget>[
          TDText(
            CommonKeys.goodsDetail.tr,
            font: appTheme.fontTitleMedium,
            textColor: appTheme.textPrimary,
            fontWeight: appTheme.fontWeightBold,
          ).pad(horizontal: spacePaddingLarge, vertical: spacePaddingMedium),
          ...contentImages.map(
            (imageUrl) => TDImage(
              imgUrl: imageUrl,
              type: TDImageType.fitWidth,
              width: double.infinity,
            ),
          ),
        ]
        .toColumnStart()
        .backgroundColor(appTheme.backgroundContainer)
        .clipRadius(radiusExtraLarge);
  }
}

/// 商品图片轮播组件
///
/// 使用 [PageView] 展示商品图片并同步显示页码指示器。
class _GoodsImageCarousel extends StatefulWidget {
  /// 商品图片列表
  final List<String> images;

  /// 创建商品图片轮播组件
  ///
  /// [images] 商品图片列表。
  const _GoodsImageCarousel({required this.images});

  /// 创建轮播组件状态
  @override
  State<_GoodsImageCarousel> createState() => _GoodsImageCarouselState();
}

/// 商品图片轮播组件状态
class _GoodsImageCarouselState extends State<_GoodsImageCarousel> {
  /// 商品图片 PageView 控制器
  final PageController _controller = PageController();

  /// 当前展示的商品图片下标
  int _currentIndex = 0;

  /// 释放轮播控制器
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 构建商品图片轮播
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    if (widget.images.isEmpty) {
      return Icon(
        Icons.image_outlined,
        size: spacer48,
        color: appTheme.textPlaceholder,
      ).center().backgroundColor(appTheme.backgroundComponent);
    }

    return <Widget>[
      PageView.builder(
        controller: _controller,
        itemCount: widget.images.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) {
          return TDImage(imgUrl: widget.images[index], fit: BoxFit.cover);
        },
      ),
      if (widget.images.length > 1)
        List<Widget>.generate(
          widget.images.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: spaceHorizontalXSmall),
            width: _currentIndex == index ? spacer16 : spacer8,
            height: spacer8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radiusSmall),
              color: _currentIndex == index
                  ? appTheme.primary
                  : appTheme.textDisabled,
            ),
          ),
        ).toRowCenter().positioned(
          bottom: spacePaddingMedium,
          left: 0,
          right: 0,
        ),
    ].toStack(fit: StackFit.expand);
  }
}
