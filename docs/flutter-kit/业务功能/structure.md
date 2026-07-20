# 目录与命名

[Feature 模块概览](./index.md) 已说明完整页面结构、目录职责、依赖方向与 Core 边界。本页只约束落地时的目录创建条件和文件命名，避免重复解释同一套结构。

## 目录创建条件

目录按真实复用范围创建，不建立空目录：

| 目录 | 创建条件 | 复用范围 |
| --- | --- | --- |
| `views/` | 新增可导航页面 | 当前页面 |
| `logics/` | 页面需要生命周期、交互或数据操作 | 当前页面 |
| `bindings/` | 页面通过路由进入且需要注册 Logic 或模块依赖 | 当前路由或模块 |
| `states/` | 响应式展示状态需要与 Logic 分离，或页面状态较复杂 | 当前页面 |
| `widgets/` | 同一模块至少两个页面复用同一个业务 Widget | 当前模块 |
| `data/` | 同一模块至少两个页面共享静态配置、展示数据或数据提供器 | 当前模块 |
| `models/` | 同一模块至少两个页面共享 UI 模型或业务辅助模型 | 当前模块 |
| `mixins/` | 同一模块至少两个页面需要组合相同行为 | 当前模块 |
| `skeletons/` | 稳定页面结构需要骨架屏，且骨架可被模块复用 | 当前模块 |
| `services/` | 同一模块多个路由共享业务协调或模块级状态 | 当前模块 |
| `localization/` | 模块有自己的多语言文案 | 当前模块 |

只被一个页面使用的模型、静态数据、小型 Skeleton 或私有 Widget 应紧贴该页面，而不是为了目录名称移动到模块根。多个 Feature 都使用的模型、Service、Mixin 或组件则必须提升到 `core/` 对应目录。

## 命名规则

| 类型 | 文件规则 | 类型规则 | 示例 |
| --- | --- | --- | --- |
| 页面 | `<name>_view.dart` | `<Name>View` | `goods_list_view.dart` / `GoodsListView` |
| Logic | `<name>_logic.dart` | `<Name>Logic` | `goods_list_logic.dart` / `GoodsListLogic` |
| State | `<name>_state.dart` | `<Name>State` | `goods_list_state.dart` / `GoodsListState` |
| Binding | `<name>_binding.dart` | `<Name>Binding` | `goods_list_binding.dart` / `GoodsListBinding` |
| Service | `<domain>_service.dart` | `<Domain>Service` | `goods_cart_service.dart` / `GoodsCartService` |
| Mixin | `<domain>_mixin.dart` | `<Domain>Mixin` | `goods_filter_mixin.dart` / `GoodsFilterMixin` |
| 骨架屏 | `<name>_skeleton.dart` | `<Name>Skeleton` | `goods_list_skeleton.dart` / `GoodsListSkeleton` |
| 模型 | 描述具体业务对象 | 描述具体业务对象 | `goods_filter_item.dart` / `GoodsFilterItem` |
| 数据提供器 | 描述数据领域与用途 | 描述数据领域与用途 | `goods_filter_data.dart` / `GoodsFilterData` |
| 组件 | 描述具体 UI 结构 | 描述具体 UI 结构 | `goods_list_card.dart` / `GoodsListCard` |

所有 Dart 文件使用 `snake_case.dart`。不要使用 `common.dart`、`util.dart`、`manager.dart`、`data.dart` 这类无法表达领域和职责的名称。

## 放置判断

```text
只被一个页面使用？
  → 放在页面的 State、Logic、View 私有方法或页面相邻文件

同一 Feature 的多个页面使用？
  → 放在 feature/<module>/ 对应按需目录

多个 Feature 使用？
  → 放在 core/model、core/data、core/mixin、core/service 或 core/ui
```

### Data 与 Core Data

- `feature/<module>/data`：模块内共享的静态菜单、筛选配置、展示数据或数据提供器。
- `core/data`：Repository 与跨模块数据访问契约。
- 网络、数据库、存储的 DataSource 不进入 Feature `data/`；Feature 只通过具体领域 Repository 使用它们。

### Service 与 Logic

- 只服务一个页面的操作、loading、初始化和路由跳转放 Logic。
- 同一模块多个路由共享的业务协调放模块 `services/`。
- 跨模块并在应用生命周期内共享的登录态、用户信息等放 `core/service/`，由 `ServiceInitializer` 注册。

### Skeleton 与 Mixin

- `BaseNetworkView` 默认显示 `TDLoading`；只有固定布局需要更平滑的首屏反馈时才创建 Skeleton 并覆盖 `loadWidget()`。
- 同模块可复用的骨架屏放 `skeletons/`，单页小骨架紧贴页面。
- 同模块可复用的横向行为放 `mixins/`；跨模块、无业务依赖的行为放 `core/mixin/`。
- Mixin 不保存页面专属状态，也不能代替 Logic。

## 关联阅读

- [Feature 模块概览](./index.md)
- [创建页面](./create-page.md)
- [数据模型](../框架核心/model.md)
- [状态管理](../框架核心/state.md)
- [模块化设计](../简介/modularization.md)
