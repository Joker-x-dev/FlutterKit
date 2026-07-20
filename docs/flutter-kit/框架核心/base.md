# 基础父类

FlutterKit 的页面不是把所有能力塞进一个 `BaseView`。页面类型由「数据来源」和「交互结构」决定：静态页面使用 `BaseView`，单次请求使用 `BaseNetworkView`，可分页列表使用 `BaseListView`，可下拉刷新的非分页内容使用 `BaseRefreshView`，顶部分类切换使用 `BaseTabView`，底部弹层使用 `BaseDialog`。

这些父类均位于 `lib/core/base/`。它们只负责通用生命周期、状态切换和界面骨架；页面自身的字段与业务规则仍放在 Feature 的 `states/`、`logics/` 和 `views/` 中。

## 选择父类

| 需求 | 使用父类 | 成功内容入口 | 不适用的情况 |
| --- | --- | --- | --- |
| 无统一请求状态的普通页面 | `BaseView<T>` | `body()` | 需要加载、错误、空数据占位的请求页 |
| 首次进入请求一份数据 | `BaseNetworkView<T>` | `bodyContent()` | 要分页或只需局部刷新 |
| 下拉刷新、上拉加载更多 | `BaseListView<T, E>` | `itemWidget()` | 内容不是同构列表 |
| 下拉刷新一个详情/配置页面 | `BaseRefreshView<T>` | `pageContent()` | 需要加载更多 |
| Tab 与 `PageView` 联动 | `BaseTabView<T>` | `pageViewChildren()` | 单页或复杂自定义 Tab 动画 |
| 统一底部弹窗 | `BaseDialog` | `body(BuildContext)` | 居中对话框或全屏路由 |

## 继承关系

```text
BaseLogic (GetX SuperController)
├─ BaseNetworkLogic<T>
│  ├─ BaseListLogic<E>
│  └─ BaseRefreshLogic<T>
└─ BaseTabLogic

BaseView<T>
├─ BaseNetworkView<T>
│  ├─ BaseListView<T, E>
│  └─ BaseRefreshView<T>
└─ BaseTabView<T>

BaseDialog (StatelessWidget)
```

## BaseLogic

`BaseLogic` 继承 GetX `SuperController<dynamic>`，为普通页面提供路由感知生命周期和统一的首次数据入口。页面无网络状态机、分页、刷新或 Tab 控制器时，Logic 直接继承它。

| 成员 | 时机 / 默认行为 | 适用职责 |
| --- | --- | --- |
| `args` | 创建时读取 `Get.arguments` | 路由参数；进入 Logic 后转换为明确 Params 类型 |
| `onInit()` | Logic 创建后 | 创建控制器、读取轻量参数、注册监听 |
| `onReady()` | 首帧完成后 | 父类调用 `initData()`，通常无需重复重写 |
| `initData()` | `onReady()` 内，默认空实现 | 首次请求、初始化页面数据 |
| `onDetached()` / `onInactive()` | 页面与视图树分离或失活 | 暂停仅与页面相关的监听 |
| `onPaused()` / `onResumed()` | 页面离开、恢复 | 保存或恢复短暂状态 |
| `onHidden()` | 页面不可见 | 停止昂贵操作 |
| `onClose()` | Logic 销毁 | 释放自身创建的 controller、worker、stream |

`initData()` 可以是 `async`，但 `onReady()` 不会等待其完成。需要 loading、empty、error 的页面不在普通 Logic 中重复造状态，而应使用 [网络父类](./base-network.md)。

## BaseView

`BaseView<T>` 基于 `GetView<T>`，统一页面 `Scaffold`、TDesign 导航栏、底部区域、悬浮按钮、保活与主题访问。正常路由由 Binding 注册 Logic；Preview 和测试可以通过构造参数注入 Logic。

| 重写点或成员 | 默认值 | 用途 |
| --- | --- | --- |
| `logic` 构造参数 | `null` | 非空时优先使用注入实例；否则从 GetX 查找 Controller |
| `logic` getter | `controller` | 页面业务代码读取当前 Logic 的推荐名称 |
| `appTheme` | 当前 `AppTheme` | 获取语义色、字体和尺寸 |
| `navTitle` | `null` | `TDNavBar` 标题 |
| `navBackBtn` / `useDefaultBack` | `true` / `true` | 返回按钮显示与默认行为 |
| `navHeight` | `44` | 导航栏高度 |
| `rightBarItems` / `navBottomWidget` | `null` | 右侧操作与导航栏下方内容 |
| `isHiddenNav` | `false` | 是否隐藏导航栏 |
| `body()` | 必须实现 | 页面主体 |
| `bottom()` / `floatingAction()` | `null` | 底部导航区域与悬浮操作 |
| `keepAlive` | `false` | 是否保留 body 状态 |
| `backgroundColor` | `null` | 页面背景；为空时使用 Material 主题 |
| `bottomBackgroundColor` | 容器背景色 | 底部区域与安全区背景 |

`BaseView` 适合普通页面。详情、列表等需要页面级网络状态时，View 应改继承网络、分页或刷新父类。

## 页面 State

基础父类不定义通用 `BaseState`。页面状态归属于 Feature 的 `states/`：普通页面使用自己的 State；网络、分页、刷新和 Tab 父类分别持有 `BaseNetworkState`、`BaseListState`、`BaseRefreshState`、`BaseTabState`。子页面只增加业务字段，不重复维护父类已有的 loading、页码、刷新控制器或 TabController。

## 页面职责边界

| 层 | 放置内容 | 不应放置内容 |
| --- | --- | --- |
| `View` | Widget 组合、父类重写点、用户事件转发 | Repository 调用、复杂状态计算 |
| `Logic` | 生命周期、请求、状态转换、用户操作 | 大段页面布局 |
| `State` | 可观察字段、表单值、页面数据 | `BuildContext`、请求实现 |
| `Binding` | 注册 Logic 及依赖 | 页面初始化业务 |

## 普通页面使用示例

```dart
/// 商品页状态仅保存页面展示需要的数据。
class GoodsState {
  /// 商品名称，使用 Rx 使依赖它的 Obx 自动刷新。
  final RxString name = ''.obs;
}

/// 商品页业务控制器负责初始化和用户操作。
class GoodsLogic extends BaseLogic {
  /// 页面私有状态，不交给 View 直接修改。
  final GoodsState state = GoodsState();

  /// 控制器进入可展示状态后由 BaseLogic.onReady 调用。
  @override
  void initData() {
    // 示例数据；正式页面可在此发起一次初始化请求。
    state.name.value = 'FlutterKit';
  }
}

/// 路由进入时创建并注册 GoodsLogic。
class GoodsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoodsLogic>(GoodsLogic.new);
  }
}

/// 页面只组织布局并读取 Logic 状态。
class GoodsView extends BaseView<GoodsLogic> {
  GoodsView({super.key, super.logic});

  @override
  String? get navTitle => '商品';

  @override
  Widget body() => Obx(() => Center(child: Text(logic.state.name.value)));
}
```

## 使用约定

- 正常路由页面由 `Binding` 注册 Logic，`BaseView.controller` 从 GetX 查找。
- Widget Preview 或测试可通过 `View(logic: logic)` 注入实例，避免注册全局依赖。
- `initData()` 已由 `BaseLogic.onReady()` 触发；不要再在 View 的 `build()` 中重复请求。
- 网络页通过 `NetState` 决定整个内容区，不要手工在 `bodyContent()` 外再堆一套 loading 判断。

## 关联阅读

- [网络父类](./base-network.md)
- [分页父类](./base-list.md)
- [刷新父类](./base-refresh.md)
- [Tab 父类](./base-tab.md)
- [Widget Preview](../扩展/widget-preview.md)
