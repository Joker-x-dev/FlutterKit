# 导航流程

模块 Navigator 封装 `toPage`，让 Feature 只面对有含义的方法名和类型参数。GetX 负责匹配路由、运行 Binding、创建 View；页面返回值通过 Future 回到调用处。

## 当前项目的跳转写法

```dart
/// Demo 模块导航器。
class DemoNavigator {
  DemoNavigator._();

  /// 进入网络请求示例页。
  static Future<T?>? toNetworkDemo<T>() {
    // toPage 是 core/util/route/route_util.dart 的统一跳转入口。
    return toPage<T>(DemoRoutes.networkDemo);
  }

  /// 进入带商品参数的页面。
  static Future<T?>? toNavigationWithArgs<T>(int goodsId) {
    return toPage<T>(
      DemoRoutes.navigationWithArgs,
      // 传递明确 Params 类型，不传无结构 Map。
      arguments: DemoParams(goodsId: goodsId),
    );
  }
}
```

## 从 Logic 发起跳转

```dart
/// 商品列表页面的用户操作。
Future<void> openGoods(int goodsId) async {
  // Logic 调用 Navigator，View 只转发点击事件。
  await DemoNavigator.toNavigationWithArgs<void>(goodsId);
  // 返回后可按业务需要刷新当前页。
}
```

## 执行顺序

1. 用户点击触发 View 的回调，回调调用 Logic 方法。
2. Logic 调用模块 Navigator，Navigator 通过 `toPage` 请求 GetX 跳转。
3. GetX 查找 `AppPages.routes` 中匹配的 `GetPage`。
4. Binding 注册目标 Logic，View 构建时从 `BaseView.controller` 获取它。
5. 目标页调用 `back(result)` 后，Navigator Future 完成。

## 排查

| 现象 | 首先检查 |
| --- | --- |
| 页面找不到 | Routes 常量、`GetPage.name`、`AppPages.routes` 是否一致 |
| View 找不到 Logic | `BaseView<T>` 泛型与 Binding `Get.lazyPut<T>` 是否一致 |
| 参数为空或类型错误 | Navigator 是否传 `arguments`，Logic 是否尽早转换 Params |
| 返回值为空 | 目标页面是否调用 `back(result)`，调用方泛型是否匹配 |

## 关联阅读

- [路由配置](./router.md)
- [参数与结果回传](./result.md)
