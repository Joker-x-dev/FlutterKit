# View 规范

View 是页面布局层：选择合适的基础 View、组合 TDesign 与模块组件、订阅可观察状态，并把用户事件转交给 Logic。View 不直接请求 Repository、不直接写入复杂业务状态，也不保存跨构建生命周期资源。

## 使用流程

1. 根据页面的数据形态选择 `BaseView`、`BaseNetworkView`、`BaseListView`、`BaseRefreshView` 或 `BaseTabView`。
2. 通过 `logic` 读取当前 Logic；正式路由由 Binding 注册，Preview 可构造注入。
3. 使用小范围 `Obx` 包住会变化的 UI。
4. 使用 `appTheme`、尺寸常量和 TDesign 组件，避免硬编码视觉 token。

## 完整示例

```dart
/// 个人资料页面布局。
class ProfileView extends BaseView<ProfileLogic> {
  ProfileView({super.key, super.logic});

  @override
  String? get navTitle => '个人资料';

  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  @override
  Widget body() {
    return Obx(() {
      // View 只读取 State；空值、加载和提交逻辑由 Logic 处理。
      final User? user = logic.state.user.value;
      return TDCellGroup(
        theme: TDCellGroupTheme.cardTheme,
        cells: [
          TDCell(title: '昵称', note: user?.nickName ?? '未设置'),
          TDCell(
            title: '编辑资料',
            arrow: true,
            // 用户事件只委托给 Logic。
            onClick: (_) => logic.openEditPage(),
          ),
        ],
      ).scrollable(padding: pageVerticalPadding);
    });
  }
}
```

## 重建范围

`Obx` 只会订阅闭包内被读取的 Rx。不要用一个顶层 `Obx` 包住整个包含长列表、导航栏和静态图片区的页面；把它缩到标题、按钮状态或列表内容等真正变化区域。

```dart
/// 静态页面骨架无需重建，只有按钮状态订阅 saving。
Widget buildSaveButton(ProfileLogic logic) {
  return Obx(
    () => TDButton(
      text: logic.state.saving.value ? '保存中' : '保存',
      // 进行中时禁用重复提交。
      onTap: logic.state.saving.value ? null : logic.save,
    ),
  );
}
```

## 页面预览

每个完整页面在 View 文件末尾提供页面预览，默认使用 `@ResponsivePreview()`，同时检查手机、折叠屏与平板。预览通过构造参数注入 Logic，不依赖路由 Binding，因此可以在编辑器中独立构建。

```dart
/// 登录页面响应式预览。
@ResponsivePreview()
Widget previewLoginView() => LoginView(logic: LoginLogic());
```

网络、分页和刷新页面还需要先向注入的 Logic 写入静态 Preview Data，并设置成功状态；禁止让预览发起真实请求。组件使用 `@WidgetPreview()`，具体设备注解、深浅色切换和静态数据写法见 [预览](../扩展/widget-preview.md)。

## 注意事项

- 页面首次请求进入 `Logic.initData()`，不是 `build()`。
- 页面级 loading、empty、error 使用网络父类，而不是在普通 View 中散落 `if`。
- 页面私有的较大子树可以拆成私有方法；多个页面复用后再提到 `widgets/`。

## 关联阅读

- [基础父类](../框架核心/base.md)
- [Logic 规范](./logic.md)
- [State 规范](./state.md)
- [预览](../扩展/widget-preview.md)
