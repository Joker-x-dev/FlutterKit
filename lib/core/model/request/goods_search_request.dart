import 'package:json_annotation/json_annotation.dart';

import 'page_request.dart';

part 'goods_search_request.g.dart';

/// 商品搜索分页请求模型
@JsonSerializable(includeIfNull: false)
class GoodsSearchRequest extends PageRequest {
  /// 商品分类ID列表
  final List<int>? typeId;

  /// 最低价格
  final String? minPrice;

  /// 最高价格
  final String? maxPrice;

  /// 搜索关键词
  final String? keyWord;

  /// 排序字段（如：sold、price等）
  final String? order;

  /// 排序方式："asc"升序，"desc"降序
  final String? sort;

  /// 推荐
  final bool? recommend;

  /// 精选
  final bool? featured;

  /// 创建商品搜索分页请求
  ///
  /// [page] 页码。
  /// [size] 每页数量。
  /// [typeId] 可选商品分类 ID 列表。
  /// [minPrice] 可选最低价格。
  /// [maxPrice] 可选最高价格。
  /// [keyWord] 可选搜索关键词。
  /// [order] 可选排序字段。
  /// [sort] 可选排序方向。
  /// [recommend] 可选推荐筛选条件。
  /// [featured] 可选精选筛选条件。
  const GoodsSearchRequest({
    super.page = 1,
    super.size = 10,
    this.typeId,
    this.minPrice,
    this.maxPrice,
    this.keyWord,
    this.order,
    this.sort,
    this.recommend,
    this.featured,
  });

  /// 从 JSON 创建商品搜索分页请求
  ///
  /// [json] 商品搜索请求 JSON 数据。
  ///
  /// 返回解析后的 [GoodsSearchRequest]。
  factory GoodsSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$GoodsSearchRequestFromJson(json);

  /// 将商品搜索分页请求转换为 JSON
  ///
  /// 返回当前请求参数的 JSON 数据。
  Map<String, dynamic> toJson() => _$GoodsSearchRequestToJson(this);
}
