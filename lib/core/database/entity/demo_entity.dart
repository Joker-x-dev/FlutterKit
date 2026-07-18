/// Demo 表实体
///
/// 对应本地数据库表 demo_items，演示基础字段映射与数据转换。
class DemoEntity {
  /// 主键 ID
  final int? id;

  /// 标题
  final String title;

  /// 描述
  final String? description;

  /// 创建时间
  final String? createdAt;

  /// 更新时间
  final String? updatedAt;

  /// 创建 Demo 表实体
  ///
  /// [id] 可选主键 ID。
  /// [title] 记录标题。
  /// [description] 可选记录描述。
  /// [createdAt] 可选创建时间。
  /// [updatedAt] 可选更新时间。
  const DemoEntity({
    this.id,
    this.title = '',
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  /// 基于当前实例创建新实例
  ///
  /// [id] 新主键 ID。
  /// [title] 新标题。
  /// [description] 新描述。
  /// [createdAt] 新创建时间。
  /// [updatedAt] 新更新时间。
  ///
  /// 未提供的字段沿用当前实例值。
  DemoEntity copyWith({
    int? id,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) => DemoEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  /// 转换为数据库映射
  ///
  /// [includeId] 为 false 时排除主键，用于更新操作
  Map<String, dynamic> toMap({bool includeId = true}) => {
    if (includeId) 'id': id,
    'title': title,
    'description': description,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };

  /// 从数据库映射创建实例
  ///
  /// [map] 数据库字段映射。
  factory DemoEntity.fromMap(Map<String, dynamic> map) => DemoEntity(
    id: map['id'] as int?,
    title: (map['title'] as String?) ?? '',
    description: map['description'] as String?,
    createdAt: map['createdAt'] as String?,
    updatedAt: map['updatedAt'] as String?,
  );
}
