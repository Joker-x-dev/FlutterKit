# Feature 模块概览

## 介绍

`lib/feature/` 承载 FlutterKit 的具体业务实现。Feature 不提供网络、数据库、主题、通用 UI 等基础能力；它只组合 `core/` 已有能力，完成一个业务领域中的页面、交互流程和模块内复用组件。

FlutterKit 的业务页面采用 `View / Logic / State / Binding` 分层：View 负责渲染，Logic 负责页面生命周期和用户操作，State 保存可订阅的页面状态，Binding 负责在路由进入前注册 Logic。路由定义独立放在 `lib/routes/`，不放进 Feature 模块。

## 页面结构

一个带状态的普通页面通常由以下文件组成：

```text
lib/
├── feature/
│   └── goods/                              # 商品业务模块
│       ├── bindings/
│       │   └── goods_list_binding.dart     # 注册 GoodsListLogic
│       ├── data/                           # 模块内多个页面共享的数据（按需创建）
│       │   └── goods_filter_data.dart
│       ├── localization/                   # 商品模块的多语言文案（按需创建）
│       │   ├── goods_keys.dart
│       │   ├── goods_zh.dart
│       │   └── goods_en.dart
│       ├── logics/
│       │   └── goods_list_logic.dart       # 页面初始化、请求和交互
│       ├── mixins/                         # 模块内多个页面共享的行为（按需创建）
│       │   └── goods_filter_mixin.dart
│       ├── models/                         # 模块内多个页面共享的 UI/业务模型（按需创建）
│       │   └── goods_filter_item.dart
│       ├── skeletons/                      # 页面骨架屏（按需创建）
│       │   └── goods_list_skeleton.dart
│       ├── services/                       # 模块内跨页面业务能力（按需创建）
│       │   └── goods_cart_service.dart
│       ├── states/
│       │   └── goods_list_state.dart       # 页面响应式展示状态
│       ├── views/
│       │   └── goods_list_view.dart        # 页面布局与页面 Preview
│       └── widgets/
│           └── goods_list_card.dart        # 模块内可复用组件及其 Preview
└── routes/
    └── goods/
        ├── goods_routes.dart               # 路由常量
        ├── goods_pages.dart                # GetPage 与 Binding 接入
        └── goods_navigator.dart            # 其他模块调用的跳转入口
```

并非每个模块都必须创建全部目录。`data/`、`models/`、`mixins/`、`skeletons/`、`services/`、`widgets/`、`states/`、`localization/` 都是按需目录：例如页面状态很简单时可以直接由 Logic 持有，只有单页使用的私有 Widget 不需要提升到 `widgets/`。当前 `auth`、`demo`、`main`、`user` 模块正是按业务复杂度使用这些目录，而不是为了目录完整而创建空文件。

## 各层职责

| 位置 | 负责内容 | 不负责内容 |
| --- | --- | --- |
| `views/` | Widget 布局、`Obx` 订阅、页面/组件 Preview、调用 Logic 的公开动作 | 网络请求、数据库读写、跨页面业务编排 |
| `logics/` | 生命周期、用户操作、调用 Repository/Service、发起导航、更新 State | 大段 Widget 树和通用 UI 封装 |
| `states/` | `Rx` 字段、表单内容、加载标记和纯展示数据 | 请求、持久化、路由跳转和生命周期 |
| `bindings/` | `Get.lazyPut` 等依赖注册 | 预加载业务数据和页面布局 |
| `data/` | 同一模块多个页面共用的静态配置、展示数据或数据提供器 | Repository、DataSource、跨模块共享数据 |
| `models/` | 同一模块多个页面共用的 UI 模型、筛选项、页面参数等 | 服务端通用实体和跨模块业务模型 |
| `mixins/` | 同一模块多个页面共用且可横向组合的页面行为 | 单一页面逻辑、跨模块通用能力和业务数据容器 |
| `skeletons/` | 数据加载时展示的模块级页面骨架 | 默认加载动画、无固定布局的通用 Loading |
| `services/` | 同一模块多个路由共享的业务协调、模块级状态或能力 | 单页生命周期逻辑、应用全局状态 |
| `widgets/` | 当前模块多个页面可复用的业务 UI | 跨模块通用组件和单页私有布局 |
| `localization/` | 文案 key 与各语言映射 | 接口返回文本和动态业务数据 |
| `routes/<module>/` | 路由常量、`GetPage` 配置、模块 Navigator | 页面布局、业务状态和 Repository 调用 |

## 模块级目录的提升边界

`data/` 和 `models/` 不是“只要叫数据就放进去”的目录。是否提升取决于复用范围：

```text
只被一个页面使用
  → 放在该页面的 State、Logic 或页面相邻文件

同一 Feature 的多个页面使用
  → feature/<module>/data、models、mixins、skeletons、services 或 widgets

多个 Feature 都会使用
  → core/model、core/data、core/mixin、core/ui 或 core/design_system
```

`feature/<module>/data` 只放模块内部共享的静态数据、菜单配置、筛选配置或展示数据提供器。网络、数据库、存储的访问链路仍属于 `core/data` 的 Repository 与 DataSource，Feature 不在 `data/` 中再创建第二套 Repository。

`feature/<module>/models` 用于模块内多个页面共享的 UI 模型或业务辅助模型，例如筛选项、页面展示项、模块内部参数。接口请求体、响应体、跨模块实体则遵循 [数据模型](../框架核心/model.md) 的 Core 边界。

## Logic、模块 Service 与 Core Service

Service 也是按需目录，不能因为使用 GetX 就为每个模块创建 `services/`。选择依据是状态与能力的复用范围：

| 位置 | 使用场景 | 生命周期与注册位置 |
| --- | --- | --- |
| 页面 `Logic` | 只服务一个路由的初始化、点击事件、加载状态和页面导航 | 由该页面的 Binding 注册，随页面依赖生命周期管理 |
| `feature/<module>/services` | 同一模块多个路由共同使用的购物车草稿、筛选协调、模块会话等业务能力 | 由模块内 Binding 或模块入口按实际访问范围注册，不放入启动初始化器 |
| `core/service/` | 登录态、全局计数、跨模块共享且应用生命周期内存在的状态 | 在 `ServiceInitializer` 启动注册，例如 `UserService`、`DemoCounterService` |

模块 Service 只面向当前 Feature，不被其他 Feature 直接 import；如果另一模块也需要同一能力，应将它抽象并提升到 `core/service/` 或 `core/data/`。模块 Service 不等同于 `GetxService`：只有确实需要应用级长期存活、并由启动阶段注册的服务，才应采用 `core/service/` 的全局 Service 形式。

## Loading 与骨架屏

网络父类的初始状态默认显示 `TDLoading` 圆形加载动画；`BaseNetworkView.loadWidget()` 是唯一需要覆盖的入口。页面不需要骨架屏时不建立 `skeletons/`，直接复用该默认行为。

当接口返回前的页面布局稳定、首屏等待明显且骨架可被同模块多个页面或多个状态复用时，再在 `feature/<module>/skeletons/` 定义骨架屏，并由对应 View 覆盖 `loadWidget()`：

```dart
/// 商品列表网络页面。
class GoodsListView extends BaseNetworkView<GoodsListLogic> {
  GoodsListView({super.key, super.logic});

  /// 数据加载期间显示与列表结构一致的模块骨架屏。
  @override
  Widget loadWidget() => const GoodsListSkeleton();
}
```

骨架屏只描述加载中的视觉结构，不承载请求、状态切换或重试逻辑；这些职责仍由网络父类和 Logic 处理。仅被一个页面使用且结构很小的骨架 Widget 可以与对应 View 放在一起，不必为了目录形式额外创建 `skeletons/`。

## Mixin 的使用边界

Mixin 用于抽取可横向组合的行为，而不是替代 Logic 或 State。模块内多个页面共同使用的筛选、滚动联动或表单辅助行为可以放在 `feature/<module>/mixins/`；Mixin 不应成为请求状态、业务数据或页面导航的隐式容器。

跨多个 Feature 都适用的无业务行为才提升到 `core/mixin/`。`core/mixin/` 中的代码不能 import 任一 `feature/` 模块，也不能依赖模块专属模型；否则会反向破坏 Core 与 Feature 的依赖方向。当前 `core/mixin/` 作为跨模块 Mixin 的预留位置，只有出现真实复用时才新增文件。

## 页面运行关系

页面进入时，路由先执行 Binding 注册 Logic；`BaseView<T>` 再从 GetX 容器取得对应的 `T`，View 通过 `logic.state` 读取状态。用户操作从 View 调用 Logic，Logic 调用 Repository 或 Service，并更新 State；`Obx` 只重建订阅到变化字段的界面区域。

```text
模块 Navigator
  → GetPage（routes/<module>/<module>_pages.dart）
  → Binding 注册 Logic
  → BaseView<Logic> 取得 Logic
  → View 使用 Obx 渲染 State

用户点击 View
  → Logic 执行业务动作
  → Repository / Service 访问 Core 能力
  → Logic 更新 State
  → Obx 刷新对应界面
```

`View → Logic → Repository / Service → Core DataSource` 是业务数据访问方向；State 只是 Logic 与 View 之间的展示状态，不直接访问数据源。

## 与 Core、Routes 的边界

### 与 Core 的关系

- `core/base/` 提供 `BaseView`、`BaseLogic` 及网络、分页、刷新、Tab 等基础父类。
- `core/data/`、`core/network/`、`core/database/`、`core/datastore/` 提供数据访问链路；Feature 只依赖 Repository 或 Service，不直接依赖具体 DataSource 实现。
- `core/design_system/`、`core/ui/` 提供主题、尺寸、扩展和通用 UI；可复用到多个模块的组件应下沉到 Core。
- `core/mixin/` 用于多个 Feature 均可复用的无业务 Mixin；只属于单一业务模块的 Mixin 保留在对应 Feature。
- `core/service/` 仅存放跨模块、应用级长期存在的 Service；模块内共享 Service 仍保留在对应 Feature。
- `core/service/` 保存全局业务状态和应用级能力；页面私有状态仍应保留在 Feature 的 State 中。

### 与其他 Feature 的关系

- Feature 之间不直接 import 对方的 View、Logic、State 或模块内 Widget。
- 进入其他模块统一调用目标模块的 `Navigator`，例如 `AuthNavigator.toLogin()`。
- 多个模块共同使用的模型、数据访问能力或通用 UI，按复用范围提升到 `core/model`、`core/data` 或 `core/ui`，不能复制到各个 Feature。

## 推荐开发流程

1. 明确页面类型，选择 `BaseView`、网络、分页、刷新或 Tab 基础父类。
2. 在目标 Feature 创建 View、Logic，按需要创建 State、Binding、模块 Service、Widget、Skeleton、数据/模型、Mixin 与多语言文件。
3. 将数据读取和业务动作放到 Logic，通过具体名称的 Repository 或 Service 字段访问 Core 能力。
4. 在 `routes/<module>/` 创建路由常量、`GetPage`、Binding 和模块 Navigator，并汇总到 `AppPages.routes`。
5. 为页面和模块 Widget 添加预览；网络页面使用静态 Preview Data，预览中不发起真实请求。
6. 补齐单元测试和页面相关文案，再检查模块之间没有直接依赖。

## 当前模块

| 模块 | 业务职责 | 代表页面 |
| --- | --- | --- |
| `auth` | 登录与认证入口 | `LoginView`、`LoginLogic` |
| `demo` | 基类、网络、存储、主题、导航和适配示例 | `NetworkDemoView`、`ThemeDemoView` |
| `main` | 应用主框架、主导航、核心示例和关于页 | `MainView`、`AboutDemoView` |
| `user` | 用户业务页面 | 用户模块的 View、Logic 与路由 |

## 关联阅读

- [目录与命名](./structure.md)
- [创建页面](./create-page.md)
- [View 规范](./view.md)、[Logic 规范](./logic.md)、[State 规范](./state.md)、[Binding 规范](./binding.md)
- [基础父类](../框架核心/base.md)
- [路由配置](../导航/router.md)
- [预览](../扩展/widget-preview.md)
