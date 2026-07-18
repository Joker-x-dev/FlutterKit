import 'package:flutter_kit/core/database/datasource/demo/demo_local_data_source.dart';
import 'package:flutter_kit/core/database/datasource/demo/demo_local_data_source_impl.dart';
import 'package:flutter_kit/core/database/entity/demo_entity.dart';

/// Demo 仓库
///
/// 作为 Demo 本地数据的统一入口，封装 [DemoLocalDataSource] 的 CRUD 操作。
class DemoRepository {
  /// Demo 本地数据源
  final DemoLocalDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  DemoRepository({DemoLocalDataSource? dataSource})
    : _dataSource = dataSource ?? DemoLocalDataSourceImpl();

  /// 创建 Demo 记录
  ///
  /// [title] 标题
  /// [description] 描述，可选
  /// 返回新建记录主键
  Future<int> createDemo(String title, {String? description}) =>
      _dataSource.createItem(title, description: description);

  /// 更新 Demo 记录
  ///
  /// [entity] 待更新实体
  Future<void> updateDemo(DemoEntity entity) => _dataSource.updateItem(entity);

  /// 删除指定 ID 的 Demo 记录
  ///
  /// [id] 记录主键
  Future<void> deleteDemo(int id) => _dataSource.deleteById(id);

  /// 清空全部 Demo 记录
  ///
  /// 返回受影响行数
  Future<int> clearAll() => _dataSource.clearAll();

  /// 获取所有 Demo 记录
  ///
  /// 返回按更新时间倒序的 Demo 列表
  Future<List<DemoEntity>> getAll() => _dataSource.getAllItems();

  /// 根据主键查询单条 Demo 记录
  ///
  /// [id] 记录主键
  /// 返回匹配到的 Demo 或 null
  Future<DemoEntity?> getById(int id) => _dataSource.getItemById(id);
}
