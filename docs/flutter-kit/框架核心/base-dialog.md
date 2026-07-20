# 底部弹窗

`BaseDialog` 位于 `lib/core/base/base_dialog/base_dialog.dart`，是基于 `Get.bottomSheet` 的 `StatelessWidget` 抽象。它统一弹窗标题栏、关闭按钮、圆角、内容滚动、底部操作区、最大高度、安全区和 Android 物理返回键行为。

## API

| 重写点或字段 | 默认值 | 说明 |
| --- | --- | --- |
| `title` | 空字符串 | 导航栏标题 |
| `close` | `true` | 是否显示右侧关闭按钮 |
| `isDismissible` | `true` | 点击遮罩是否关闭 |
| `enableDrag` | `true` | 是否允许向下拖拽关闭 |
| `enablePhysicalBack` | `true` | Android 物理返回键是否关闭 |
| `head()` | `TDNavBar` | 顶部栏；返回 `null` 可隐藏 |
| `body(context)` | 必须实现 | 返回内容区 Widget 列表 |
| `bottom(context)` | `null` | 底部操作区 |
| `init()` | 空实现 | 展示时的轻量初始化入口 |
| `show()` | `Get.bottomSheet` | 展示当前弹窗 |

弹窗最大高度按照屏幕高度减去顶部安全区、底部安全区与预留边距计算；内容区由父类包装为可滚动 Column，底部操作区会补齐底部安全区。

## 完整示例

```dart
/// 删除确认底部弹窗。
class DeleteGoodsDialog extends BaseDialog {
  const DeleteGoodsDialog({required this.onConfirm, super.key});

  /// 确认删除后由调用方执行实际业务操作。
  final VoidCallback onConfirm;

  @override
  String get title => '删除商品';

  @override
  bool get isDismissible => false;

  @override
  List<Widget> body(BuildContext context) {
    return const [
      // 内容区只返回多个区块，父类负责滚动和页边距。
      Text('删除后不可恢复，是否继续？'),
    ];
  }

  @override
  Widget? bottom(BuildContext context) {
    return Row(
      children: [
        Expanded(child: OutlinedButton(onPressed: Get.back, child: const Text('取消'))),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            onPressed: () {
              // 先关闭当前 BottomSheet，再通知业务层提交删除。
              Get.back();
              onConfirm();
            },
            child: const Text('删除'),
          ),
        ),
      ],
    );
  }
}

/// 页面事件中展示弹窗。
Future<void> showDeleteDialog() => DeleteGoodsDialog(
  onConfirm: () {
    // Logic.deleteGoods()。
  },
).show();
```

## 注意事项

- `init()` 在 `build()` 中调用；不要在其中发起会导致状态反复变化的请求，也不要把它当作 StatefulWidget 的一次性 `initState()`。
- `body()` 已被滚动容器包装，内部避免再无约束地嵌套主滚动列表。
- 对不可丢失的编辑内容，同时关闭 `isDismissible`、`enableDrag` 与 `enablePhysicalBack`，并提供明确取消操作。
- 需要居中 Dialog、系统 Alert 或完整路由时，应使用对应 Flutter / TDesign 组件，而不是强行继承底部弹窗。

## 关联阅读

- [基础父类](./base.md)
- [TDesign Flutter](./tdesign.md)
- [安全区适配](../扩展/safe-area.md)
