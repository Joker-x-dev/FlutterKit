# Binding 规范

Binding 是 Feature 页面依赖的唯一注册位置。GetX 在匹配 `GetPage` 时执行 Binding，随后构建 View；`BaseView.controller` 才能从容器取得对应 Logic。页面、Navigator 和 Logic 不应自行 `Get.put` 页面专属 Logic。

## 最小写法

```dart
/// 商品列表页面依赖注册器。
class GoodsListBinding extends Bindings {
  @override
  void dependencies() {
    // 懒创建：用户真正进入页面时才实例化 Logic。
    Get.lazyPut<GoodsListLogic>(GoodsListLogic.new);
  }
}
```

## 与路由的关系

```dart
/// GetPage 将页面与其 Binding 成对注册。
GetPage(
  name: GoodsRoutes.list,
  // View 由 GetX 在路由进入时创建。
  page: GoodsListView.new,
  // View 构建前注册 GoodsListLogic。
  binding: GoodsListBinding(),
);
```

## 注册选择

| 需求 | 推荐方式 | 原因 |
| --- | --- | --- |
| 单个页面 Logic | `Get.lazyPut<T>(T.new)` | 延迟创建，符合路由生命周期 |
| 多个页面共用的全局状态 | 启动阶段 `Get.put(Service)` | Service 生命周期独立于页面 |
| 同页多个依赖 | 一个 Binding 内顺序注册 | 依赖关系集中可审查 |
| Preview / Widget 测试 | `View(logic: instance)` | 不污染 GetX 全局容器 |

## 注意事项

- Binding 类型必须与 `BaseView<T>` 的 `T` 一致，否则 `super.controller` 查找会失败。
- 预览使用外部注入 Logic 时无需执行 Binding；正式路由不要同时制造第二个 Logic 实例。
- Repository 通常自行构造或通过其依赖规则提供，只有需要全局共享或可替换实现时再在 Binding 中注册。

## 关联阅读

- [路由配置](../导航/router.md)
- [View 规范](./view.md)
- [Widget Preview](../扩展/widget-preview.md)
