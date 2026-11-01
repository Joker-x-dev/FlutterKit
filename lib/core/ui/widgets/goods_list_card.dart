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
    return TCell(
      align: TCellAlign.top,
      image: _buildProductImage(),
      title: _buildTitle(),
      subtitle: _buildProductDescription(),
    ).clipRadius(radiusLarge);
  }

  /// 构建商品图片
  Widget _buildProductImage() {
    // 如果有主图，显示图片
    return TImage(src: goods.mainPic, width: spacer96, height: spacer96);
  }

  /// 构建商品描述
  Widget _buildProductDescription() {
    return [
      // 副标题（如果有）
      if (goods.subTitle?.isNotEmpty == true) ...[
        TText(
          goods.subTitle ?? '',
          font: appTheme.fontBodySmall,
          style: TextStyle(color: appTheme.textSecondary),
          maxLines: 2,
          overflow: .ellipsis,
        ),
        const SpaceVerticalXSmall(),
      ],

      [
        _buildPriceInfo(),
        TText(
          CommonKeys.goodsSold.trArgs([goods.sold.toString()]),
          font: appTheme.fontMarkSmall,
          style: TextStyle(color: appTheme.textPlaceholder),
        ),
      ].toRowBetween(),
    ].toColumnStart();
  }

  /// 构建商品标题
  Widget _buildTitle() {
    return TText(
      goods.title,
      font: appTheme.fontTitleMedium,
      style: TextStyle(color: appTheme.textPrimary),
      maxLines: 2,
      overflow: .ellipsis,
    );
  }

  /// 构建价格信息
  Widget _buildPriceInfo() {
    return TText(
      '¥${(goods.price).toStringAsFixed(2)}',
      font: appTheme.fontTitleLarge,
      style: TextStyle(
        color: appTheme.error,
        fontWeight: appTheme.fontWeightBold,
      ),
    );
  }
}

/// 商品卡片组件预览
@WidgetPreview()
Widget previewGoodsListCard() => GoodsListCard(goods: previewGoods.first);
