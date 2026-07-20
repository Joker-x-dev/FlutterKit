# 本地存储

`lib/core/datastore/` 用于 Token、账号、主题、语言和用户信息等轻量持久化。每类数据都以 DataSource 抽象加实现的形式封装 `StorageUtil`；Repository 对上暴露 `saveToken`、`getUserInfo` 这类业务语义，而不是原始存储 key。

## 介绍

本地存储模块保存 Token、账号、主题、语言和用户信息等简单数据。它使用 DataSource 接口与实现封装 `StorageUtil`，再通过 StoreRepository 供业务使用；存储 key、JSON 转换和默认值都不应进入 Feature。

## 设计思路

| 适合 | 不适合 |
| --- | --- |
| Token、主题名称、ThemeMode、语言标签 | 大型关联数据与复杂条件查询 |
| 账号、轻量用户缓存、开关和偏好 | 需要事务、索引、版本迁移的数据 |
| 启动时恢复的小型状态 | 未经安全设计的敏感明文长期保存 |

需要复杂查询的数据应使用 [数据库](./database.md)；需要与服务端同步的数据仍通过 Repository 与网络 DataSource 管理。

## 模块结构

```text
core/datastore/datasource/
├── token/       # TokenStoreDataSource
├── account/     # AccountStoreDataSource
├── auth/        # AuthStoreDataSource
├── locale/      # LocaleStoreDataSource
├── theme/       # ThemeStoreDataSource
└── userinfo/    # UserInfoStoreDataSource

Feature Logic → StoreRepository → StoreDataSource → StorageUtil
```

## 数据源接口示例

文件：`lib/core/datastore/datasource/token/`

```dart
/// Token 存储契约。
abstract class TokenStoreDataSource {
  /// 持久化访问令牌。
  Future<void> setToken(String token);

  /// 读取令牌；不存在时返回空字符串。
  Future<String> getToken();

  /// 删除已保存令牌。
  Future<void> clearToken();
}

```

## 数据源实现示例

文件：`lib/core/datastore/datasource/token/token_store_data_source_impl.dart`

```dart
/// Token 存储实现，隐藏 StorageUtil 与具体 key。
class TokenStoreDataSourceImpl implements TokenStoreDataSource {
  /// 访问令牌专属存储键，不向 Repository 和 Feature 暴露。
  static const String _accessTokenKey = 'access_token';

  @override
  Future<void> setToken(String token) {
    return StorageUtil.setString(_accessTokenKey, token);
  }

  @override
  Future<String> getToken() {
    return StorageUtil.getString(_accessTokenKey);
  }

  @override
  Future<void> clearToken() {
    return StorageUtil.delete(_accessTokenKey);
  }
}
```

## 仓库实现示例

文件：`lib/core/data/repository/token_store_repository.dart`

```dart
/// Token 仓库，向上提供业务动作。
class TokenStoreRepository {
  TokenStoreRepository({TokenStoreDataSource? dataSource})
      // 测试可传 fake；正式使用默认实现。
      : _dataSource = dataSource ?? TokenStoreDataSourceImpl();

  /// Token 数据源抽象。
  final TokenStoreDataSource _dataSource;

  /// 保存登录后的访问令牌。
  Future<void> saveToken(String token) => _dataSource.setToken(token);

  /// 恢复启动时保存的令牌。
  Future<String> loadToken() => _dataSource.getToken();

  /// 登出时清理令牌。
  Future<void> clearToken() => _dataSource.clearToken();
}
```

## 复杂对象：用户 JSON 缓存

`UserInfoStoreDataSourceImpl` 通过 `jsonEncode(user.toJson())` 存入 `user_info`，读取时 `jsonDecode` 后调用 `User.fromJson`。缺失内容或解析异常会返回 `null`；更新字段时只在已有 JSON 上合并，值为 `null` 的字段会删除，并在解析失败时保留原始数据。

文件：`lib/core/datastore/datasource/userinfo/user_info_store_data_source_impl.dart`

```dart
/// 用户 JSON 存储的关键读写逻辑。
class UserInfoStoreDataSourceImpl implements UserInfoStoreDataSource {
  /// 整个用户对象只占用一个存储键。
  static const String _userInfoKey = 'user_info';

  @override
  Future<void> saveUserInfo(User user) async {
    // Entity 自己提供 toJson，数据源只负责持久化序列化结果。
    await StorageUtil.setString(_userInfoKey, jsonEncode(user.toJson()));
  }

  @override
  Future<User?> getUserInfo() async {
    final String jsonString = StorageUtil.getString(_userInfoKey);
    if (jsonString.isEmpty) {
      return null;
    }
    try {
      // 损坏缓存不向页面抛解析异常，按无缓存处理。
      return User.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
    } on Exception {
      return null;
    }
  }
}
```

```dart
/// 保存与读取用户缓存。
Future<void> saveAndReadUser(User user) async {
  final UserInfoStoreRepository repository = UserInfoStoreRepository();
  // Repository 隐藏 JSON 序列化与 user_info 存储键。
  await repository.saveUserInfo(user);
  final User? cachedUser = await repository.getUserInfo();
  // cachedUser 为 null 时由调用方决定空态或重新请求。
}
```

## Logic 使用示例

文件：`lib/feature/demo/logics/local_storage_demo_logic.dart`

```dart
/// 本地存储示例页 Logic。
class LocalStorageDemoLogic extends BaseLogic {
  /// 用户信息业务存储入口。
  final UserInfoStoreRepository _userInfoStoreRepository =
      UserInfoStoreRepository();

  /// 页面显示的当前缓存用户。
  final Rxn<User> user = Rxn<User>();

  /// 写入演示用户后立即回读，验证持久化结果。
  Future<void> saveUser() async {
    const User demoUser = User(id: 10086, nickName: '演示用户');
    await _userInfoStoreRepository.saveUserInfo(demoUser);
    await readUser();
  }

  /// 清除持久化内容与内存展示状态。
  Future<void> clearUser() async {
    await _userInfoStoreRepository.clearUserInfo();
    user.value = null;
  }
}
```

## 与数据层的关系

- DataSource 只负责基于 StorageUtil 的读写与序列化。
- TokenStoreRepository、UserInfoStoreRepository 等负责向 Feature 暴露业务方法。
- LocalStorageDemoLogic 只依赖 UserInfoStoreRepository，不读取 key 或 JSON。

## 如何新增本地存储

1. 判断是否确实是轻量键值数据；复杂数据优先建表。
2. 在 `core/datastore/datasource/<domain>/` 定义抽象方法和实现，key 仅存在实现中。
3. 在 `core/data/repository/` 新增 StoreRepository，并允许构造注入 DataSource。
4. 启动恢复场景接入对应 Initializer / Service，而不是等待页面首次 build。
5. 测试默认值、保存、覆盖、清除、损坏 JSON 和迁移旧 key。

## 注意事项

- `StorageUtil` 是底层工具，Feature 不直接引用；读写统一经 DataSource / Repository。
- 当前账号密码 DataSource 以普通键值存储实现；正式产品处理密码、token 等敏感数据前需要评估安全存储和加密策略。
- 主题、语言切换必须同时更新 `Application` 内存状态与 Repository 持久化，不能只写一侧。

## 关联阅读

- [数据层](./data.md)
- [主题系统](./theme.md)
- [数据层](./data.md)
