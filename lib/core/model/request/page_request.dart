import 'package:json_annotation/json_annotation.dart';

part 'page_request.g.dart';

/// 通用分页请求模型
@JsonSerializable()
class PageRequest {
  /// 页码
  final int page;

  /// 每页大小
  final int size;

  /// 创建通用分页请求
  ///
  /// [page] 页码。
  /// [size] 每页数量。
  const PageRequest({this.page = 1, this.size = 10});

  /// 从 JSON 创建通用分页请求
  ///
  /// [json] 分页请求 JSON 数据。
  ///
  /// 返回解析后的 [PageRequest]。
  factory PageRequest.fromJson(Map<String, dynamic> json) =>
      _$PageRequestFromJson(json);

  /// 将通用分页请求转换为 JSON
  ///
  /// 返回当前分页请求的 JSON 数据。
  Map<String, dynamic> toJson() => _$PageRequestToJson(this);
}
