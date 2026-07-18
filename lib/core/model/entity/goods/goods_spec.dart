import 'package:json_annotation/json_annotation.dart';

part 'goods_spec.g.dart';

/// 规格模型
@JsonSerializable()
class GoodsSpec {
  /// ID
  final int id;

  /// 商品ID
  final int goodsId;

  /// 名称
  final String name;

  /// 价格
  final int price;

  /// 库存
  final int stock;

  /// 排序
  final int sortNum;

  /// 图片
  final List<String>? images;

  /// 创建时间
  final String? createTime;

  /// 更新时间
  final String? updateTime;

  /// 创建商品规格模型
  ///
  /// [id] 规格 ID。
  /// [goodsId] 所属商品 ID。
  /// [name] 规格名称。
  /// [price] 规格价格。
  /// [stock] 规格库存。
  /// [sortNum] 规格排序值。
  /// [images] 可选规格图片列表。
  /// [createTime] 可选创建时间。
  /// [updateTime] 可选更新时间。
  const GoodsSpec({
    this.id = 0,
    this.goodsId = 0,
    this.name = '',
    this.price = 0,
    this.stock = 0,
    this.sortNum = 0,
    this.images,
    this.createTime,
    this.updateTime,
  });

  /// 从 JSON 创建商品规格模型
  ///
  /// [json] 商品规格 JSON 数据。
  ///
  /// 返回解析后的 [GoodsSpec]。
  factory GoodsSpec.fromJson(Map<String, dynamic> json) =>
      _$GoodsSpecFromJson(json);

  /// 将商品规格模型转换为 JSON
  ///
  /// 返回当前商品规格的 JSON 数据。
  Map<String, dynamic> toJson() => _$GoodsSpecToJson(this);
}
