import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 本地数据库提供者
///
/// 管理 [Database] 单例的创建与初始化，业务层通过 [database] 获取已打开的数据库实例。
class DatabaseProvider {
  /// 数据库提供者单例
  static final DatabaseProvider _instance = DatabaseProvider._internal();

  /// 工厂构造函数，返回单例实例
  factory DatabaseProvider() => _instance;

  /// 创建数据库提供者单例
  DatabaseProvider._internal();

  /// 已打开的数据库实例
  Database? _database;

  /// 数据库文件名称
  static const String _databaseName = 'app_database.db';

  /// 数据库结构版本
  static const int _databaseVersion = 1;

  /// Demo 数据表名称
  static const String _tableDemoItems = 'demo_items';

  /// 获取已初始化的数据库实例
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  /// 初始化并打开本地数据库
  ///
  /// 返回可用的数据库实例。
  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);

    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  /// 创建初始数据库表结构
  ///
  /// [db] 待初始化的数据库实例。
  /// [version] 当前数据库版本。
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableDemoItems (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
  }
}
