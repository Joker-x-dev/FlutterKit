# Database

本地数据库模块，负责 SQLite 本地持久化。

## 目录结构

- `entity/`: 数据库表实体定义
- `datasource/`: 按业务模块组织的本地数据源接口与实现
  - `demo/`: Demo 表示例
- `provider/`: [Database] 单例提供者

## 使用方式

业务层不直接访问数据源，统一通过 `core/data/repository/DemoRepository` 操作：

```dart
final repository = DemoRepository();

// 新增
final id = await repository.createDemo('标题', description: '描述');

// 查询
final list = await repository.getAll();
final item = await repository.getById(id);

// 更新
await repository.updateDemo(item!.copyWith(title: '新标题'));

// 删除
await repository.deleteDemo(id);

// 清空
await repository.clearAll();
```

## 新增表

1. 在 `entity/` 下新增实体类。
2. 在 `datasource/` 下新增业务目录，编写接口与基于 sqflite 的实现。
3. 在 `provider/database_provider.dart` 的 `_onCreate` 中创建对应表。
4. 在 `core/data/repository/` 下新增 Repository，对外提供业务语义方法。
