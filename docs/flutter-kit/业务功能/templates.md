# 页面模板

普通页面由 View、Logic、State、Binding 四个文件组成。以下模板按文件职责拆分，分别复制到对应目录后替换 `${PAGE_NAME}` 与 `${CN_NAME}`；页面预览属于 View 文件，因此放在 View 模板中。

网络、分页、刷新、Tab 页面不应从普通模板叠加状态字段，而应直接选择对应基础父类，具体差异见 [基础父类](../框架核心/base.md)。

## View 模板

文件：`feature/<module>/views/${page_name}_view.dart`

```dart
/// ${CN_NAME} 页面。
class ${PAGE_NAME}View extends BaseView<${PAGE_NAME}Logic> {
  /// 创建 ${CN_NAME} 页面。
  ///
  /// [logic] 外部注入的页面 Logic，供测试和预览使用。
  ${PAGE_NAME}View({super.key, super.logic});

  /// 页面导航栏标题。
  @override
  String? get navTitle => '${CN_NAME}';

  /// 构建页面主体，只订阅真正会变化的 State 字段。
  @override
  Widget body() {
    return Obx(() => Center(child: TDText(logic.state.title.value)));
  }
}

/// ${CN_NAME} 页面响应式预览。
@ResponsivePreview()
Widget preview${PAGE_NAME}View() {
  final ${PAGE_NAME}Logic logic = ${PAGE_NAME}Logic();
  // 稳定的静态展示状态。
  logic.state.title.value = '${CN_NAME}预览';
  return ${PAGE_NAME}View(logic: logic);
}
```

## Logic 模板

文件：`feature/<module>/logics/${page_name}_logic.dart`

```dart
/// ${CN_NAME} 页面 Logic。
class ${PAGE_NAME}Logic extends BaseLogic {
  /// 页面展示状态。
  final ${PAGE_NAME}State state = ${PAGE_NAME}State();

  /// 首帧完成后初始化页面数据。
  @override
  void initData() {
    state.title.value = '${CN_NAME}';
  }
}
```

Logic 只处理页面生命周期、用户操作、Repository/Service 调用与 State 更新；Repository 字段必须使用具体领域全名，例如 `_goodsRepository`，不能命名为 `_repository`。

## State 模板

文件：`feature/<module>/states/${page_name}_state.dart`

```dart
/// ${CN_NAME} 页面展示状态。
class ${PAGE_NAME}State {
  /// 页面标题，可由 Logic 在初始化或用户操作后更新。
  final RxString title = ''.obs;
}
```

State 只保存 View 要订阅的展示状态，不保存 Repository、导航行为、`BuildContext` 或 Widget。

## Binding 模板

文件：`feature/<module>/bindings/${page_name}_binding.dart`

```dart
/// ${CN_NAME} 页面依赖注册器。
class ${PAGE_NAME}Binding extends Bindings {
  /// 注册路由进入后需要的页面 Logic。
  @override
  void dependencies() {
    Get.lazyPut<${PAGE_NAME}Logic>(${PAGE_NAME}Logic.new);
  }
}
```

Binding 与对应 `GetPage` 成对配置；Preview 和 Widget 测试通过构造参数注入 Logic，不执行 Binding。

## 父类替换参考

| 页面需求 | Logic 与 View 模板替换为 | 需要实现的核心方法 |
| --- | --- | --- |
| 单次请求 | `BaseNetworkLogic<T>` + `BaseNetworkView` | `apiRequest`、`requestOk`、`bodyContent` |
| 分页 | `BaseListLogic<E>` + `BaseListView` | `apiRequest`、`itemWidget` |
| 刷新详情 | `BaseRefreshLogic<T>` + `BaseRefreshView` | `apiRequest`、`requestOk`、`pageContent` |
| Tab | `BaseTabLogic` + `BaseTabView` | `tabList`、`pageViewChildren` |

## 关联阅读

- [View 规范](./view.md)
- [Logic 规范](./logic.md)
- [State 规范](./state.md)
- [Binding 规范](./binding.md)
- [创建页面](./create-page.md)
