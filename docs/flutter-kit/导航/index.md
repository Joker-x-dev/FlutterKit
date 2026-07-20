# Navigation / 导航

FlutterKit 基于 GetX Navigation，但业务层不直接散落路由字符串。每个模块在 `lib/routes/<module>/` 中维护四类文件：路由常量、`GetPage` 集合、模块 Navigator，以及在需要时使用的 Params / Result。`AppPages.routes` 汇总所有模块页面。

```text
View / Logic
  → <Module>Navigator
  → core/util/route/toPage()
  → GetX 匹配 GetPage
  → Binding 注册 Logic
  → 构建目标 View
  → Get.back(result: ...)
```

## 目录

```text
lib/routes/demo/
├── demo_routes.dart       # 路径常量
├── demo_pages.dart        # GetPage 配置
├── demo_navigator.dart    # 模块级类型化跳转入口
├── demo_params.dart       # 跳转参数
└── demo_result.dart       # 返回结果
```

## 约定

- View 和 Logic 调用 `DemoNavigator`、`AuthNavigator` 等模块 Navigator。
- `GetPage` 与 Feature Binding 一一配对，保证 View 查找 Logic 的时机正确。
- 参数和结果使用模块路由目录下的命名类型，不把 `Map` 与 `dynamic` 扩散为长期接口。
- 访问控制放进 `GetPage.middlewares`，而不是每个 View `build()` 中判断登录态。

## 关联阅读

- [路由配置](./router.md)
- [导航流程](./flow.md)
- [登录守卫](./guard.md)
- [参数与结果回传](./result.md)
