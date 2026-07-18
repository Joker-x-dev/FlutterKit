# Env 环境配置

提供应用程序的环境配置管理，支持开发、测试、预生产和生产环境。

环境参数直接维护在 Dart 源码中：

- `env_dev.dart`：开发环境
- `env_test.dart`：测试环境
- `env_pre.dart`：预生产环境
- `env_prod.dart`：生产环境

当前环境由构建命令通过 `--dart-define=ENV=xxx` 注入。Release 构建默认使用生产环境，其他构建默认使用开发环境；非法环境标识会直接抛出配置错误。

## 环境判断

```dart
Env.isDev     // 是否开发环境
Env.isTest    // 是否测试环境
Env.isPre     // 是否预生产环境
Env.isProd    // 是否生产环境
Env.isNotProduction // 是否不是生产环境
```

## 获取当前环境配置

```dart
Env.baseUrl   // 当前环境的基础域名
```

## 切换环境

### 命令行

```bash
flutter run --dart-define=ENV=prod
```

### Android Studio / IntelliJ

在 **Run Configuration** 的 **Additional run args** 中添加：

```
--dart-define=ENV=prod
```

### VS Code

使用 `.vscode/launch.json` 中预置的启动配置。

## 新增环境或修改配置

1. 修改对应环境的 Dart 文件（如 `env_prod.dart`）。
2. 如需新增环境，在 `env.dart` 的 [baseUrl] 等 switch 分支中添加对应处理。

## 注意事项

1. 环境配置是编译期常量，切换环境需要重新编译。
2. 生产环境相关的敏感配置不要硬编码在源码中，建议通过 CI 注入。
