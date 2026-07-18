import 'package:json_annotation/json_annotation.dart';

import 'id.dart';

part 'base_entity.g.dart';

/// 通用基础实体类
@JsonSerializable()
class BaseEntity extends Id {
  /// 创建时间
  final String? createTime;

  /// 更新时间
  final String? updateTime;

  /// 创建通用基础实体
  ///
  /// [id] 实体 ID。
  /// [createTime] 可选创建时间。
  /// [updateTime] 可选更新时间。
  const BaseEntity({super.id = 0, this.createTime, this.updateTime});

  /// 从 JSON 创建通用基础实体
  ///
  /// [json] 实体 JSON 数据。
  ///
  /// 返回解析后的 [BaseEntity]。
  factory BaseEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseEntityFromJson(json);

  /// 将通用基础实体转换为 JSON
  ///
  /// 返回当前实体的 JSON 数据。
  Map<String, dynamic> toJson() => _$BaseEntityToJson(this);
}
