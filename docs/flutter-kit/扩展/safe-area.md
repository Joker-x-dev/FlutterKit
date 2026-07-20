# 安全区适配

Flutter 使用 `MediaQuery`、`SafeArea` 与 `Scaffold` 处理刘海、状态栏、手势导航和横屏挖孔。FlutterKit 的页面父类还会为底部导航区域应用容器背景色，使底部安全区不会出现与页面割裂的色块。

## 常用选择

| 场景 | 使用方式 | 原因 |
| --- | --- | --- |
| 普通滚动页顶部内容 | `Scaffold.appBar` / `BaseView.head()` | AppBar 自动避开状态栏 |
| 全屏沉浸内容 | `SafeArea` 或 `MediaQuery.paddingOf` | 只为实际内容补边距 |
| 底部操作按钮 | `SafeArea(top: false, child: ...)` | 保证不被手势区遮挡 |
| 横屏侧边导航 | 仅内容区处理需要的边 | 不把顶部/底部安全区错误加给侧栏 |
| BottomSheet | `BaseDialog` | 父类计算可用高度与底部安全区 |

## 底部操作区

```dart
/// 页面底部确认按钮，仅保留底部安全区。
Widget buildBottomAction(VoidCallback onSubmit) {
  return SafeArea(
    top: false,
    // 横向与内部间距由按钮区域自身的设计规范控制。
    child: TDButton(text: '提交', onTap: onSubmit),
  );
}
```

`BaseView.bottom()` 会将底部区域放在 `Scaffold.bottomNavigationBar`，并使用 `bottomBackgroundColor`（默认 `appTheme.backgroundContainer`）绘制背景。需要统一卡片/导航栏色时重写 getter，不要通过页面背景色间接修补安全区。

## 横屏注意点

横屏时摄像头或挖孔可能位于左侧。左侧导航栏应保持设计规定的完整背景，不能把整个 `MediaQuery.padding` 机械套到侧栏顶部和底部；需要避开状态栏时间的首个内容项才对内容区域补对应方向 padding。竖屏转横屏再转回时，选中页面状态应归 Main State，而不是由导航 Widget 私有保存。

## 注意事项

- `SafeArea` 只包住需要避让的内容，过大的包裹会在横屏产生不必要空白。
- `extendBodyBehindAppBar: true` 时，body 需要自行处理顶部视觉与点击区域，不能依赖默认 AppBar 留白。
- 通过真实设备检查刘海、打孔、手势条和横屏，不以模拟器单一状态作为验收。

## 关联阅读

- [基础父类](../框架核心/base.md)
- [BaseDialog](../框架核心/base-dialog.md)
- [屏幕适配](./screen-adapt.md)
