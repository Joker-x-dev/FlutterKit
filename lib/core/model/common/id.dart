import 'package:json_annotation/json_annotation.dart';

part 'id.g.dart';

/// ID 实体类
@JsonSerializable()
class Id {
  /// ID 值
  final int id;

  /// 创建 ID 实体
  ///
  /// [id] ID 值。
  const Id({this.id = 0});

  /// 从 JSON 创建 ID 实体
  ///
  /// [json] ID 实体 JSON 数据。
  ///
  /// 返回解析后的 [Id]。
  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  /// 将 ID 实体转换为 JSON
  ///
  /// 返回当前实体的 JSON 数据。
  Map<String, dynamic> toJson() => _$IdToJson(this);
}
