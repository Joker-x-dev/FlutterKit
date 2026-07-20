# 路由配置

路由由 `Routes` 常量、`Pages` 配置和 `AppPages` 聚合三层组成。以当前 Demo 模块为例，`DemoPages.routes` 的每一项都把具体 View 和 Feature Binding 成对注册。

## 路由常量

```dart
/// Demo 模块路由路径。
class DemoRoutes {
  /// 网络详情示例页面路径。
  static const String networkDemo = '/demo/network-demo';
}
```

## GetPage 配置

```dart
/// Demo 模块的页面注册集合。
class DemoPages {
  DemoPages._();

  /// 模块内所有可导航页面。
  static final List<GetPage<void>> routes = [
    GetPage(
      name: DemoRoutes.networkDemo,
      // 路由进入时创建页面实例。
      page: NetworkDemoView.new,
      // 页面构建前注册 NetworkDemoLogic。
      binding: NetworkDemoBinding(),
    ),
  ];
}
```

## 应用聚合

```dart
/// 应用路由总表。
class AppPages {
  AppPages._();

  /// GetMaterialApp.getPages 使用的页面集合。
  static final routes = [
    // 每个模块集中维护自己的路由，根表只负责聚合。
    ...MainPages.routes,
    ...DemoPages.routes,
    ...AuthPages.routes,
    ...UserPages.routes,
  ];
}
```

## 新增路由检查

1. 在模块 `*_routes.dart` 新增路径常量。
2. 在 `*_pages.dart` 配置 `GetPage` 与正确 Binding。
3. 在模块 `*_navigator.dart` 添加唯一的跳转方法。
4. 确认模块 routes 已展开到 `AppPages.routes`。
5. 加入页面 Preview，独立验证布局而非依赖路由进入。

## 注意事项

- `GetPage.name` 必须使用模块 Routes 常量，避免调用端与注册端字符串不一致。
- 页面需要登录时在此配置 `middlewares: [AuthGuard()]`，不要在 View 内自行跳转。
- `page` 不传已构造的单例 Widget，而传构造函数或闭包，确保路由生命周期正确。

## 关联阅读

- [Binding](../业务功能/binding.md)
- [导航流程](./flow.md)
- [登录守卫](./guard.md)
