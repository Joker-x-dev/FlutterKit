# 工具类

`core/util/` 提供跨模块、无业务归属的通用操作：Alert、Common、Log、Route、Size、Storage、Toast。工具类解决重复基础动作；一旦包含领域规则、页面状态或数据访问，应回到 Logic、Service 或 Repository。

## 常用工具

| 工具 | 适用场景 |
| --- | --- |
| `AlertUtil` | 通用确认、提示交互 |
| `CommonUtil` | 空值、集合等通用判断与关闭弹层 |
| `LogUtil` | 分级调试与错误日志 |
| `RouteUtil` | `toPage`、`back` 等统一 GetX 路由入口 |
| `SizeUtil` | 屏幕与安全区尺寸 |
| `StorageUtil` | DataSource 底层键值读写 |
| `ToastUtil` | 成功、失败、提示反馈 |

```dart
/// Logic 内组合通用反馈与模块导航。
Future<void> saveAndOpenDemo() async {
  LogUtil.d('开始保存 Demo 数据');
  await repository.save();
  ToastUtil.success('保存成功');
  // 业务层仍通过模块 Navigator 调用，避免跨模块引用路由字符串。
  await DemoNavigator.toDatabaseDemo<void>();
}
```

## 注意事项

- `StorageUtil` 是底层能力，Feature 通常应经业务 DataSource / Repository 调用。
- Alert 和 Toast 是 UI 反馈，不代替异常处理与请求状态管理。
- Log 不记录 token、密码和用户敏感信息；错误信息应有足够上下文但避免泄露数据。

## 关联阅读

- [结果处理](./result.md)
- [导航流程](../导航/flow.md)
- [本地存储](./datastore.md)
