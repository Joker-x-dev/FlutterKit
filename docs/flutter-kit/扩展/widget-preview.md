# 预览

FlutterKit 基于 Flutter Widget Preview 为页面和组件提供编辑器内预览。项目注解位于 `lib/core/ui/preview/app_preview_annotations.dart`：页面使用响应式屏幕预览，组件使用普通组件预览。预览函数是可维护的 UI 示例，不是把真实网络请求跑进 IDE 的临时入口。

## 注解与选择

| 注解 | 用途 | 适用对象 |
| --- | --- | --- |
| `@WidgetPreview()` | 单一默认尺寸预览 | 小组件、卡片、列表项 |
| `@MobilePreview()` | 手机屏幕预览 | 仅需验证手机页面 |
| `@TabletPreview()` | 平板屏幕预览 | 仅需验证宽屏页面 |
| `@FoldablePreview()` | 折叠屏预览 | 仅需验证折叠屏布局 |
| `@ResponsivePreview()` | 手机、折叠屏、平板三组预览 | 所有完整页面的默认选择 |

Widget Preview 工具栏可切换深浅色，因此不需要为同一个页面额外复制浅色、深色两个注解。预览函数使用 `previewXxx` 命名；页面和组件分别放在其源码文件末尾，IDE 才能按当前文件聚焦展示。

## 普通页面

```dart
/// 登录页面响应式预览。
@ResponsivePreview()
Widget previewLoginView() {
  // 显式注入页面 Logic，不依赖 GetX 路由 Binding。
  final LoginLogic logic = LoginLogic();
  return LoginView(logic: logic);
}
```

`BaseView` 的构造参数会优先使用注入的 Logic；正式路由没有传入 Logic 时才从 `GetView.controller` 获取 Binding 注册的实例。这样同一个 View 同时服务正式导航、测试和 Preview。

## 网络页面：静态数据而不是真实请求

网络 Preview 必须先写入静态 Preview Data，再把网络状态切为成功。否则 `BaseNetworkLogic.onReady()` 的初始化请求可能在预览环境访问真实接口，导致错误、超时或不可重复的截图。

```dart
/// 商品详情响应式预览。
@ResponsivePreview()
Widget previewNetworkDemoView() {
  final NetworkDemoLogic logic = NetworkDemoLogic();
  // Preview Data 位于 core/data/preview，和正式网络数据模型保持一致。
  logic.networkDemoState.goods.value = previewGoods.first;
  // 让 BaseNetworkView 直接进入 bodyContent，而不是展示 loading。
  logic.setStatusSuccess();
  return NetworkDemoView(logic: logic);
}

/// 商品分页列表响应式预览。
@ResponsivePreview()
Widget previewNetworkListDemoView() {
  final NetworkListDemoLogic logic = NetworkListDemoLogic();
  // 向父类维护的 RxList 写入稳定列表数据。
  logic.listState.dataList.assignAll(previewGoods);
  logic.setStatusSuccess();
  return NetworkListDemoView(logic: logic);
}
```

## 组件预览

```dart
/// 商品列表卡片组件预览。
@WidgetPreview()
Widget previewGoodsListCard() {
  // 使用和页面 Preview 相同的静态实体，避免组件创建自己的假模型。
  return GoodsListCard(goods: previewGoods.first);
}
```

组件不应为了预览增加无意义的点击回调参数；只有组件真实业务需要回调时才传入。对于依赖主题的组件，预览注解提供的应用壳会建立主题上下文，组件仍应从 `AppTheme.of(context)` 或 TDesign Theme 读取语义色。

## 从零补 Preview 的流程

1. 在 View 或 Widget 文件末尾定义顶层 `Widget previewXxx()`。
2. 页面默认使用 `@ResponsivePreview()`；纯组件使用 `@WidgetPreview()`。
3. 普通页面构造并注入 Logic；不要依赖路由 Binding。
4. 网络、列表、刷新页面填充 `core/data/preview` 的静态模型并设置成功状态。
5. Tab 页面按源码示例执行必要初始化，例如 `BaseTabDemoLogic()..onInit()`。
6. 在 Android Studio 打开当前文件的 Widget Preview，分别检查手机、折叠屏、平板和深浅色。

## 常见问题

| 现象 | 原因与处理 |
| --- | --- |
| 预览找不到 Logic | 页面没有注入 Logic，或 Preview 依赖 Binding；改为 `View(logic: logic)` |
| 一直 loading / error | 未填 Preview Data、未调用 `setStatusSuccess()`，或触发真实网络请求 |
| Tab 报控制器未初始化 | Preview 中没有执行 `onInit()` 创建 TabController |
| 右侧出现太多预览 | Widget Preview 按当前源码文件查看；函数命名清晰并将页面与组件分开 |
| 深色样式异常 | 组件写死颜色或没有通过项目主题语义色读取 |

## 注意事项

- Preview Data 是可复用的静态业务数据，不应只为 IDE 而散落在 View 内。
- 预览函数不承载测试断言；交互、状态恢复和网络转换仍需在 test 中验证。
- 完整页面统一用 `ResponsivePreview`，不要遗漏平板和折叠屏布局。

## 关联阅读

- [基础父类](../框架核心/base.md)
- [BaseNetwork](../框架核心/base-network.md)
- [屏幕适配](./screen-adapt.md)
