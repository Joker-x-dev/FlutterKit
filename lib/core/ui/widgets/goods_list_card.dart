import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/data/preview/goods_preview_data.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../localization/common/common_keys.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/shape.dart';
import '../../design_system/theme/size.dart';
import '../../design_system/widgets/space.dart';
import '../../model/entity/goods/goods.dart';

/// 商品卡片组件
class GoodsListCard extends StatelessWidget {
  /// 商品数据
  final Goods goods;

  /// 创建商品卡片组件
  ///
  /// [key] 组件标识。
  /// [goods] 商品展示数据。
  const GoodsListCard({super.key, required this.goods});

  /// 构建商品卡片组件
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return TDCell(
      align: TDCellAlign.top,
      bordered: false,
      imageWidget: _buildProductImage(),
      titleWidget: _buildTitle(context),
      descriptionWidget: _buildProductDescription(context),
    ).clipRadius(radiusLarge);
  }

  /// 构建商品图片
  Widget _buildProductImage() {
    // 如果有主图，显示图片
    return TDImage(imgUrl: goods.mainPic, width: spacer96, height: spacer96);
  }

  /// 构建商品描述
  ///
  /// [context] 当前构建上下文。
  Widget _buildProductDescription(BuildContext context) {
    return [
      // 副标题（如果有）
      if (goods.subTitle?.isNotEmpty == true) ...[
        TDText(
          goods.subTitle,
          font: AppTheme.of(context).fontBodySmall,
          textColor: AppTheme.of(context).textSecondary,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SpaceVerticalXSmall(),
      ],

      [
        _buildPriceInfo(context),
        TDText(
          CommonKeys.goodsSold.trArgs([goods.sold.toString()]),
          font: AppTheme.of(context).fontMarkSmall,
          textColor: AppTheme.of(context).textPlaceholder,
        ),
      ].toRowBetween(),
    ].toColumnStart();
  }

  /// 构建商品标题
  ///
  /// [context] 当前构建上下文。
  Widget _buildTitle(BuildContext context) {
    return TDText(
      goods.title,
      font: AppTheme.of(context).fontTitleMedium,
      textColor: AppTheme.of(context).textPrimary,
      fontWeight: AppTheme.of(context).fontWeightBold,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// 构建价格信息
  ///
  /// [context] 当前构建上下文。
  Widget _buildPriceInfo(BuildContext context) {
    return TDText(
      '¥${(goods.price).toStringAsFixed(2)}',
      font: AppTheme.of(context).fontTitleLarge,
      textColor: AppTheme.of(context).error,
      fontWeight: AppTheme.of(context).fontWeightBold,
    );
  }
}

/// 商品卡片组件预览
@WidgetPreview()
Widget previewGoodsListCard() => GoodsListCard(goods: previewGoods.first);
