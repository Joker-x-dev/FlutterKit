# 创建页面

本节以 `GoodsList` 为例创建一个可导航、可预览的普通页面。网络、分页和 Tab 页面只需在第三步替换为相应基础父类，路由、Binding、命名和 Preview 流程不变。

## 1. 创建 State

```dart
/// 商品列表页面展示状态。
class GoodsListState {
  /// 页面标题，示例中使用响应式字段演示 View 更新。
  final RxString title = '商品列表'.obs;
}
```

## 2. 创建 Logic

```dart
/// 商品列表页面业务控制器。
class GoodsListLogic extends BaseLogic {
  /// 页面私有状态。
  final GoodsListState state = GoodsListState();

  @override
  void initData() {
    // 首帧可展示后初始化；真实请求在此调用 Repository。
    state.title.value = '全部商品';
  }
}
```

## 3. 创建 View

```dart
/// 商品列表页面。
class GoodsListView extends BaseView<GoodsListLogic> {
  GoodsListView({super.key, super.logic});

  @override
  String? get navTitle => '商品';

  @override
  Widget body() {
    // 仅标题区域订阅 Rx，页面其他静态部分无需重建。
    return Obx(() => Center(child: TDText(logic.state.title.value)));
  }
}
```

## 4. 创建 Binding

```dart
/// 商品列表路由的 Logic 注册器。
class GoodsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoodsListLogic>(GoodsListLogic.new);
  }
}
```

## 5. 注册 Routes、Pages、Navigator

```dart
/// 模块路由常量，避免业务层散落字符串。
class GoodsRoutes {
  static const String list = '/goods/list';
}

/// 模块 GetPage 配置。
final List<GetPage<void>> goodsPages = [
  GetPage(
    name: GoodsRoutes.list,
    page: GoodsListView.new,
    binding: GoodsListBinding(),
  ),
];

/// 对外暴露的模块导航入口。
class GoodsNavigator {
  GoodsNavigator._();

  static Future<T?>? toList<T>() => toPage<T>(GoodsRoutes.list);
}
```

将模块 `goodsPages` 展开到 `AppPages.routes` 后，其他 Feature 通过 `GoodsNavigator.toList()` 进入页面。不要在调用处直接写 `Get.toNamed('/goods/list')`。

## 6. 加入 Preview

```dart
/// 普通页面预览，显式注入 Logic 避免依赖 GetX 注册容器。
@ResponsivePreview()
Widget previewGoodsListView() {
  final GoodsListLogic logic = GoodsListLogic();
  // 预览状态由静态数据直接提供，不执行 initData 中的真实请求。
  logic.state.title.value = '预览商品';
  return GoodsListView(logic: logic);
}
```

## 检查清单

- 文件位于对应模块的 `views / logics / states / bindings`。
- View 泛型、Binding 注册泛型和 Logic 类型完全一致。
- 路由常量、`GetPage`、模块 Navigator 和 `AppPages.routes` 均已接入。
- 有页面 Preview；网络页使用静态 Preview Data。

## 关联阅读

- [页面模板](./templates.md)
- [路由配置](../导航/router.md)
- [Widget Preview](../扩展/widget-preview.md)
