# DataStore

本地键值存储模块，用于保存 Token、账号密码等简单数据。

## 目录结构

- `datasource/`: 按业务模块组织的本地存储数据源接口与实现
  - `token/`: Token 存储
  - `account/`: 账号密码存储
  - `auth/`: 认证信息存储
  - `userinfo/`: 用户信息存储
  - `theme/`: 主题模式存储
  - `locale/`: 应用语言存储

## 使用方式

业务层不直接访问数据源，统一通过 `core/data/repository/` 下的仓库操作：

```dart
// Token
final tokenRepo = TokenStoreRepository();
await tokenRepo.saveToken('access_token');
final token = await tokenRepo.loadToken();
await tokenRepo.clearToken();

// 账号密码
final accountRepo = AccountStoreRepository();
await accountRepo.saveAccount('user@example.com');
await accountRepo.savePassword('password');
final account = await accountRepo.loadAccount();
```

## 新增本地存储

1. 在 `datasource/` 下新增业务目录。
2. 编写数据源接口与实现，内部调用 [StorageUtil]。
3. 在 `core/data/repository/` 下新增 Repository。
4. 在对应的 `DataSourceImpl` 内使用私有常量维护存储键名。
