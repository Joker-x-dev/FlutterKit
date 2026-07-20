# 参数与结果回传

路由参数与返回结果属于导航协议，放在对应模块的 `lib/routes/<module>/`，例如当前 Demo 模块的 `demo_params.dart` 与 `demo_result.dart`。明确类型可以让调用方、目标 Logic 与返回处共享同一份编译期契约。

## 定义协议

```dart
/// Demo 模块跳转参数。
class DemoParams {
  const DemoParams({required this.goodsId});

  /// 目标页面需要加载的商品标识。
  final int goodsId;
}

/// Demo 模块页面关闭时返回的数据。
class DemoResult {
  const DemoResult({required this.id, required this.message});

  /// 业务结果标识。
  final int id;

  /// 结果说明。
  final String message;
}
```

## 传递参数

```dart
/// 模块导航器将参数统一封装后交给 GetX。
static Future<T?>? toNavigationWithArgs<T>(int goodsId) {
  return toPage<T>(
    DemoRoutes.navigationWithArgs,
    // BaseLogic.args 将接收到同一个对象。
    arguments: DemoParams(goodsId: goodsId),
  );
}

/// 目标页面 Logic 在生命周期早期完成类型转换。
class NavigationWithArgsLogic extends BaseLogic {
  /// 类型错误应尽早暴露，避免把 dynamic 传入 Repository。
  late final DemoParams params = args as DemoParams;
}
```

## 返回结果

```dart
/// 调用方等待明确的结果类型。
Future<void> openResultPage() async {
  final DemoResult? result = await DemoNavigator.toNavigationResult();
  if (result == null) return;

  // 仅在目标页明确返回结果后处理后续业务。
  ToastUtil.success(result.message);
}

/// 目标页完成操作后关闭页面并携带结果。
void finishSelection() {
  back(const DemoResult(id: 1, message: '选择完成'));
}
```

## 注意事项

- 不要将 `Map<String, dynamic>` 作为跨页面长期协议；字段新增、重命名和类型变化无法得到可靠重构支持。
- `Get.arguments` 可能为空，参数可选场景应使用安全类型判断或明确默认 Params。
- Result 的 `null` 同时可能代表用户返回、路由取消或未传结果，调用方必须按业务语义处理。

## 关联阅读

- [导航流程](./flow.md)
- [Logic](../业务功能/logic.md)
- [路由配置](./router.md)
