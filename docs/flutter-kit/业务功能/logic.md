# Logic 规范

Logic 是页面行为层，继承 `BaseLogic` 或其网络、列表、刷新、Tab 派生类。它接收路由参数、调用 Repository 与 Service、更新 State、处理用户操作和决定导航；不承担 Widget 布局。

## 职责表

| 工作 | 放置位置 |
| --- | --- |
| 首次加载、恢复处理 | `onInit()` / `initData()` / `onResumed()` |
| 网络请求状态机 | `BaseNetworkLogic`、`BaseListLogic`、`BaseRefreshLogic` |
| 表单提交和防重复 | Logic 方法 + State 的 `RxBool` |
| 路由跳转 | 模块 Navigator |
| 跨页面用户状态 | `Get.find<UserService>()` |
| Widget 树、颜色拼装 | View / Widget |

## 普通 Logic 示例

```dart
/// 本地存储示例页 Logic。
class LocalStorageDemoLogic extends BaseLogic {
  /// Repository 在 Logic 顶部创建，整个页面复用同一个数据入口。
  final UserInfoStoreRepository _userInfoStoreRepository =
      UserInfoStoreRepository();

  /// 页面展示的用户信息。
  final Rxn<User> user = Rxn<User>();

  /// 保存演示用户并重新读取持久化结果。
  Future<void> saveUser() async {
    const User demoUser = User(
      id: 10086,
      nickName: '演示用户',
      phone: '18800000000',
    );
    await _userInfoStoreRepository.saveUserInfo(demoUser);
    await readUser();
  }

  /// 从 Repository 读取当前用户信息并更新页面状态。
  Future<void> readUser() async {
    user.value = await _userInfoStoreRepository.getUserInfo();
  }

  /// 清除持久化数据与页面展示状态。
  Future<void> clearUser() async {
    await _userInfoStoreRepository.clearUserInfo();
    user.value = null;
  }
}
```

## 基类选择

| 有什么状态 | Logic 基类 | 核心重写点 |
| --- | --- | --- |
| 普通页面 | `BaseLogic` | `initData()` |
| 一次网络请求 | `BaseNetworkLogic<T>` | `apiRequest`、`requestOk` |
| 分页 | `BaseListLogic<E>` | `apiRequest`、可选 `processDataList` |
| 下拉刷新详情 | `BaseRefreshLogic<T>` | `apiRequest`、`requestOk` |
| Tab / PageView | `BaseTabLogic` | `tabList` |

## 注意事项

- `args` 是动态类型，在 Logic 中立即转换为明确的 Params 类型。
- 仅当数据确实跨模块、跨页面时使用 Service；普通页面 State 不要放入 `GetxService`。
- 网络异常优先让 `RequestHelper` 和基础网络 Logic 统一处理，业务 Logic 只添加确有业务意义的分支。

## 关联阅读

- [基础父类](../框架核心/base.md)
- [网络状态页面](../框架核心/base-network.md)
- [导航流程](../导航/flow.md)
