import '../../entity/demo_entity.dart';

/// Demo 本地数据源接口
///
/// 定义 Demo 表的本地 CRUD 能力，由 [DemoLocalDataSourceImpl] 实现。
abstract class DemoLocalDataSource {
  /// 新增一条 Demo 记录
  ///
  /// [title] 标题
  /// [description] 描述，可选
  /// 返回新建记录主键
  Future<int> createItem(String title, {String? description});

  /// 更新 Demo 记录
  ///
  /// [entity] 待更新实体
  Future<void> updateItem(DemoEntity entity);

  /// 按主键删除 Demo 记录
  ///
  /// [id] 记录主键
  Future<void> deleteById(int id);

  /// 清空 Demo 表
  ///
  /// 返回受影响行数
  Future<int> clearAll();

  /// 查询全部 Demo 记录，默认按更新时间倒序
  ///
  /// 返回 Demo 列表
  Future<List<DemoEntity>> getAllItems();

  /// 根据主键查询单条记录
  ///
  /// [id] 记录主键
  /// 返回匹配到的 Demo 或 null
  Future<DemoEntity?> getItemById(int id);
}
