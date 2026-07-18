import 'package:sqflite/sqflite.dart';

import '../../entity/demo_entity.dart';
import '../../provider/database_provider.dart';
import 'demo_local_data_source.dart';

/// Demo 本地数据源实现
///
/// 基于 sqflite 封装 Demo 表的增删改查，通过 [DatabaseProvider] 获取数据库实例。
class DemoLocalDataSourceImpl implements DemoLocalDataSource {
  /// Demo 数据表名称
  static const String _tableName = 'demo_items';

  /// 本地数据库提供者
  final DatabaseProvider _databaseProvider;

  /// 创建 Demo 本地数据源实现
  ///
  /// [databaseProvider] 可选数据库提供者；为空时使用默认单例实现。
  DemoLocalDataSourceImpl({DatabaseProvider? databaseProvider})
    : _databaseProvider = databaseProvider ?? DatabaseProvider();

  /// 获取已初始化的数据库实例
  Future<Database> get _database async => _databaseProvider.database;

  /// 新增 Demo 记录
  ///
  /// [title] 记录标题。
  /// [description] 可选记录描述。
  ///
  /// 返回新记录的数据库主键。
  @override
  Future<int> createItem(String title, {String? description}) async {
    final now = DateTime.now().toIso8601String();
    final db = await _database;

    return db.insert(_tableName, {
      'title': title,
      'description': description ?? '',
      'createdAt': now,
      'updatedAt': now,
    });
  }

  /// 更新指定 Demo 记录
  ///
  /// [entity] 包含主键和最新字段值的 Demo 实体。
  ///
  /// 主键为空时抛出 [ArgumentError]。
  @override
  Future<void> updateItem(DemoEntity entity) async {
    final id = entity.id;
    if (id == null) {
      throw ArgumentError('更新记录时主键 id 不能为空');
    }

    final now = DateTime.now().toIso8601String();
    final db = await _database;

    await db.update(
      _tableName,
      entity.toMap(includeId: false)..['updatedAt'] = now,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 按主键删除 Demo 记录
  ///
  /// [id] 记录主键。
  @override
  Future<void> deleteById(int id) async {
    final db = await _database;

    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  /// 清空 Demo 数据表
  ///
  /// 返回受影响的记录数量。
  @override
  Future<int> clearAll() async {
    final db = await _database;

    return db.delete(_tableName);
  }

  /// 查询全部 Demo 记录
  ///
  /// 返回按更新时间和创建时间倒序排列的记录列表。
  @override
  Future<List<DemoEntity>> getAllItems() async {
    final db = await _database;

    final maps = await db.query(
      _tableName,
      orderBy: 'updatedAt DESC, createdAt DESC',
    );

    return maps.map((map) => DemoEntity.fromMap(map)).toList();
  }

  /// 按主键查询 Demo 记录
  ///
  /// [id] 记录主键。
  ///
  /// 返回匹配记录；不存在时返回 `null`。
  @override
  Future<DemoEntity?> getItemById(int id) async {
    final db = await _database;

    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) {
      return null;
    }

    return DemoEntity.fromMap(maps.first);
  }
}
