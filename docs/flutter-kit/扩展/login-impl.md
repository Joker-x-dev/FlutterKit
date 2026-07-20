# 登录逻辑

登录模块位于 `feature/auth/`。`LoginLogic` 负责校验或调用认证 Repository，成功后通过 `UserService.updateUserState` 更新内存与持久化认证数据；`AuthGuard` 在下一次受保护导航时读取同一份服务状态。View 只展示输入和触发登录。

## 链路

```text
LoginView 点击
  → LoginLogic.login()
  → AuthRepository（正式接口）
  → UserService.updateUserState(auth, user)
  → 持久化 token / 用户信息 + 更新 isLoggedIn
  → Toast + back()
  → AuthGuard 允许后续受保护路由
```

## 示例

```dart
/// 登录成功后的状态提交流程。
Future<void> login() async {
  // 演示实现可替换为 AuthRepository 的正式请求结果。
  final Auth auth = Auth(token: 'demo-token', refreshToken: 'demo-refresh');
  final User user = User(id: 1, nickName: '演示用户');

  // 唯一用户状态入口，同时同步内存和本地存储。
  await Get.find<UserService>().updateUserState(auth, user);
  ToastUtil.success(AuthKeys.loginSuccess.tr);
  // 登录页通常返回到来源页面；受保护页重新进入时由 Guard 放行。
  back<void>();
}
```

## 接入真实接口

1. 在 `core/model/request` 和 `entity` 定义登录请求、Auth、User 类型。
2. 在认证数据源与 Repository 定义 API。
3. LoginLogic 调用 Repository，统一处理 loading 与错误。
4. 成功后仍只调用 `UserService.updateUserState`，不要由 LoginView 分别写 token 和用户缓存。
5. 登出时通过 Service 清理内存和存储，确保 `AuthGuard` 状态一致。

## 关联阅读

- [登录守卫](../导航/guard.md)
- [状态管理](../框架核心/state.md)
- [网络请求](../框架核心/network.md)
