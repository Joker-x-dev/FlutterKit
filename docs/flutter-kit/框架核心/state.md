# 状态管理

FlutterKit 使用 GetX 的 `Rx` 与 `Obx` 管理响应式状态。状态按生命周期拆分：页面临时状态放 Feature State，跨页面且长期存在的业务状态放 `GetxService`，主题与语言等应用级状态放 `Application`。状态管理不等同于把所有 Rx 放进全局 Service。

## 状态边界

| 位置 | 内容 | 示例 |
| --- | --- | --- |
| Feature `states/` | 单页展示、表单、局部交互状态 | `NetworkDemoState`、`ThemeDemoState` |
| Feature `services/` | 单一模块多个路由共享的业务协调或模块状态；按需创建 | 模块购物车草稿、模块筛选协调 |
| 父类 State | 页面结构通用状态 | `BaseNetworkState`、`BaseListState`、`BaseRefreshState`、`BaseTabState` |
| `core/service/` | 跨模块、跨路由共享业务状态 | `UserService`、`DemoCounterService` |
| `Application` | 启动即存在的应用全局状态 | 主题、语言、主题模式 |
| Repository / DataSource | 可持久化数据与访问逻辑 | 用户、认证、主题、语言存储 |

Feature State 不应保存 Repository、BuildContext、Widget 或全局服务。模块 Service 不应承载单页表单和短暂 loading；这些数据随页面销毁即可。多个 Feature 共用且应用级长期存在的 Service 才提升到 `core/service/`。

## GetX 响应式状态

`Rx` 保存可观察值，`Obx` 自动订阅闭包内读取的 Rx。将 `Obx` 缩到真正变化的 Widget，避免用一个顶层 Obx 重建整页静态布局。

```dart
/// 页面专属状态。
class ProfileState {
  /// 当前用户资料；未加载或不存在时为 null。
  final Rxn<User> user = Rxn<User>();

  /// 保存进行中标记，用于禁用重复提交。
  final RxBool saving = false.obs;
}

/// 仅按钮区域响应 saving 变化。
Widget buildSaveButton(ProfileLogic logic) {
  return Obx(
    () => TDButton(
      text: logic.state.saving.value ? '保存中' : '保存',
      onTap: logic.state.saving.value ? null : logic.save,
    ),
  );
}
```

## 全局状态服务

`GetxService` 适合应用生命周期内共享的状态。服务在 `ServiceInitializer` 中注册；使用时通过 `Get.find<T>()` 获取同一个实例。当前启动顺序先初始化存储，再恢复 `UserService`，确保路由守卫读取到的是已恢复的登录状态。

### DemoCounterService

文件：`lib/core/service/demo_counter_service.dart`

```dart
/// 跨页面共享的演示计数器。
class DemoCounterService extends GetxService {
  /// 全局可观察计数值。
  final RxInt count = 0.obs;

  /// 计数加一。
  void increase() => count.value += 1;

  /// 计数不低于零。
  void decrease() {
    count.value = (count.value - 1).clamp(0, double.maxFinite).toInt();
  }

  /// 重置共享计数。
  void reset() => count.value = 0;
}
```

### 注册与使用

文件：`lib/bootstrap/service_initializer.dart`

```dart
/// 应用启动时注册全局服务。
Future<void> init() async {
  // Demo 服务无需异步恢复，可直接注册。
  Get.put(DemoCounterService());

  // 用户服务先从本地恢复认证和用户，再放入容器。
  final UserService userService = UserService();
  await userService.initialize();
  Get.put(userService);
}
```

```dart
/// 页面 Logic 读取已注册的全局计数器。
class StateManagementDemoLogic extends BaseLogic {
  /// 当前共享服务实例。
  DemoCounterService get _counterService => Get.find<DemoCounterService>();

  /// 对外暴露页面订阅的响应式值。
  RxInt get count => _counterService.count;

  /// 用户操作委托给 Service，保持修改入口集中。
  void increment() => _counterService.increase();
}
```

## UserService 与持久化

`UserService` 同时维护 `isLoggedIn`、`userId`、`auth`、`userInfo`。`initialize()` 从认证与用户信息仓库恢复内存状态；`updateUserState()` 同步保存 Auth、User 并更新 Rx；`logout()` 同时清理本地与内存数据。登录页和 `AuthGuard` 都应使用这一服务，而不是各自维护登录标记。

## 状态管理与页面父类

网络、分页、刷新和 Tab 的通用状态由对应父类管理：

| 页面类型 | 父类 State | 子页面只添加 |
| --- | --- | --- |
| 网络详情 | `BaseNetworkState` | 业务实体与筛选字段 |
| 分页列表 | `BaseListState` | 列表项之外的业务筛选字段 |
| 下拉刷新 | `BaseRefreshState` | 刷新内容的业务数据 |
| Tab 页面 | `BaseTabState` | 每个 Tab 的业务状态 |

不要在子页面重复创建 `loading`、`EasyRefreshController`、`currentPage`、`TabController` 等父类已维护的字段。

## 注意事项

- Service 必须在使用前注册；Preview 和测试可以通过 Logic 构造参数注入替代 Service。
- 不把密码、Token 等敏感数据只留在 Rx；需要持久化时经对应 Repository / DataSource 管理。
- 全局状态变化范围广，更新方法应具有领域语义，例如 `updateUserState`、`logout`，避免页面直接逐字段赋值。
- 页面 State 的 Rx 只由 Logic 修改，View 通过 `Obx` 读取。

## 关联阅读

- [基础父类](./base.md)
- [登录守卫](../导航/guard.md)
- [数据层](./data.md)
