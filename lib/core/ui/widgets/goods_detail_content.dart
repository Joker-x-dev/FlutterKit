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
    final images = _resolvePreviewImages();
    final contentImages = goods.contentPics ?? const <String>[];

    return [
      _GoodsImageCarousel(images: images)
          .height(340)
          .clipRadius(radiusExtraLarge),
      const SpaceVerticalLarge(),
      _buildSummaryCard(),
      const SpaceVerticalLarge(),
      _buildDetailCard(contentImages),
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
  Widget _buildSummaryCard() {
    return <Widget>[
          TText(
            goods.title,
            font: appTheme.fontTitleLarge,
            style: TextStyle(
              color: appTheme.textPrimary,
              fontWeight: appTheme.fontWeightBold,
            ),
            maxLines: 2,
            overflow: .ellipsis,
          ),
          if (goods.subTitle?.isNotEmpty == true) ...[
            const SpaceVerticalSmall(),
            TText(
              goods.subTitle ?? '',
              font: appTheme.fontBodyMedium,
              style: TextStyle(color: appTheme.textSecondary),
              maxLines: 2,
              overflow: .ellipsis,
            ),
          ],
          const SpaceVerticalLarge(),
          [
            TText(
              '¥${goods.price.toStringAsFixed(2)}',
              font: appTheme.fontTitleLarge,
              style: TextStyle(
                color: appTheme.error,
                fontWeight: appTheme.fontWeightBold,
              ),
            ),
            TText(
              CommonKeys.goodsSold.trArgs([goods.sold.toString()]),
              font: appTheme.fontBodyMedium,
              style: TextStyle(color: appTheme.textSecondary),
            ),
          ].toRowBetween(crossAxisAlignment: .end),
        ]
        .toColumnStart()
        .padAll(spacePaddingLarge)
        .backgroundColor(appTheme.backgroundContainer)
        .clipRadius(radiusExtraLarge);
  }

  /// 构建商品详情卡片
  ///
  /// [contentImages] 商品详情图片列表。
  Widget _buildDetailCard(List<String> contentImages) {
    return <Widget>[
          TText(
            CommonKeys.goodsDetail.tr,
            font: appTheme.fontTitleMedium,
            style: TextStyle(
              color: appTheme.textPrimary,
              fontWeight: appTheme.fontWeightBold,
            ),
          ).pad(horizontal: spacePaddingLarge, vertical: spacePaddingMedium),
          // 宽度占满内容区，高度按图片自身比例自适应
          ...contentImages.map(
            (imageUrl) => Image.network(
              imageUrl,
              width: double.infinity,
              fit: .fitWidth,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
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
          return TImage(src: widget.images[index], fit: .cover);
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
    ].toStack(fit: .expand);
  }
}
