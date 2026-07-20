# 登录守卫

受保护页面通过 `AuthGuard` 统一校验登录态。它位于 `lib/routes/guards/auth_guard.dart`，继承 `RouteGuard`，而 `RouteGuard` 继承 GetX `GetMiddleware`。守卫只决定能否进入目标路由；登录成功后的用户信息恢复和持久化由 `UserService` 负责。

## 工作过程

```text
请求进入受保护 GetPage
  → AuthGuard.redirect(route)
  → Get.find<UserService>().isLoggedIn
  ├─ true：返回 null，继续进入目标页
  └─ false：返回 AuthRoutes.login，重定向登录页
```

## 配置页面

```dart
/// 用户资料页面路由。
GetPage(
  name: UserRoutes.profile,
  page: UserProfileView.new,
  binding: UserBinding(),
  // 路由解析阶段统一执行登录校验。
  middlewares: [AuthGuard()],
);
```

## 守卫实现

```dart
/// 认证路由守卫。
class AuthGuard extends RouteGuard {
  @override
  RouteSettings? redirect(String? route) {
    // UserService 在 ServiceInitializer 阶段注册并恢复本地认证状态。
    final bool loggedIn = Get.find<UserService>().isLoggedIn.value;
    if (!loggedIn) {
      // 返回登录页设置，中断原目标页面创建。
      return const RouteSettings(name: AuthRoutes.login);
    }
    // 返回 null 表示允许继续当前路由。
    return null;
  }
}
```

## 设计边界

| 位置 | 负责内容 |
| --- | --- |
| `AuthGuard` | 是否允许进入、未登录重定向 |
| `UserService` | 认证信息、用户信息、内存与本地恢复 |
| `LoginLogic` | 调用登录、成功后更新 UserService、返回页面 |
| `GetPage` | 声明哪些页面受保护 |

需要携带“登录后返回原路径”时，扩展 Guard 的 RouteSettings 参数和 Login 成功后的 Navigator 逻辑；不要在每个受保护 View 的 `build()` 中重复登录判断，否则会出现页面闪现和多处规则不一致。

## 注意事项

- `AuthGuard` 依赖 `UserService` 已注册，ServiceInitializer 必须早于用户可能导航到的路由。
- 守卫读取的是响应式值的当前快照；登录/登出后新的导航会重新检查。
- 权限、灰度、埋点等其他路由规则可继承 `RouteGuard`，保持各规则独立和可测试。

## 关联阅读

- [登录逻辑](../扩展/login-impl.md)
- [状态管理](../框架核心/state.md)
- [路由配置](./router.md)
