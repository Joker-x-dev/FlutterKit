# State 规范

State 保存“页面此刻要展示什么”：实体、列表、选中项、输入值和提交标记。它不负责请求、导航、Toast 或 Widget 构建。复杂状态以命名 State 类型集中，避免 Logic 内散落几十个 Rx 字段。

## 示例

```dart
/// 个人资料页面展示状态。
class ProfileState {
  /// 用户资料；null 表示尚未取得或没有资料。
  final Rxn<User> user = Rxn<User>();

  /// 保存请求进行中，用于禁用重复点击。
  final RxBool saving = false.obs;

  /// 当前编辑名称，由输入框双向或单向同步。
  final RxString nickname = ''.obs;
}
```

## 选择 Rx 类型

| 数据形态 | 推荐类型 | 更新方式 |
| --- | --- | --- |
| 可空实体 | `Rxn<T>()` | `value = entity` |
| 非空标记 | `false.obs`、`0.obs`、`''.obs` | `value = next` |
| 可变集合 | `RxList<T>` | `assignAll`、`addAll`、`refresh` |
| 页面网络状态 | 父类 `BaseNetworkState.uiState` | `setStatus*()` |
| 分页状态 | 父类 `BaseListState` | 使用 List Logic 方法 |

## 数据归属

`BaseNetworkState`、`BaseListState`、`BaseRefreshState`、`BaseTabState` 已维护对应的通用控制状态。子页面 State 只存放业务数据，例如商品详情、筛选条件和表单值；不要重复定义 `loading`、页码、`TabController` 等同类字段。

## 注意事项

- 通过 `Obx` 读取 Rx 时，替换对象用 `.value =`；修改对象内部字段后若 UI 未刷新，需要赋值新对象或按模型能力触发刷新。
- State 不持有 `BuildContext`、`Widget`、`Repository` 和 `TextEditingController` 等生命周期资源。
- Preview 可以向 State 写入静态数据，但禁止由 Preview 发起真实网络请求。

## 关联阅读

- [Logic 规范](./logic.md)
- [BaseList](../框架核心/base-list.md)
- [Widget Preview](../扩展/widget-preview.md)
