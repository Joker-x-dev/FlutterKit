# Drawer 抽屉

> 侧滑面板，从屏幕边缘滑出，用于承载导航、设置或辅助功能。

> 来源：[Drawer 抽屉](https://tdesign.tencent.com/flutter/components/drawer)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 基础用法

```dart
// 打开抽屉
void showDrawer(BuildContext context) {
  showTDrawer(
    context,
    drawer: TDrawer(
      title: const Text('抽屉标题'),
      items: const [
        TDrawerItem(label: '选项一', onTap: () {}),
        TDrawerItem(label: '选项二', onTap: () {}),
      ],
      footer: const Text('底部内容'),
    ),
  );
}
```

### 抽屉方向

```dart
TDrawer(
  placement: TDrawerPlacement.left, // left / right / top / bottom
  items: [...],
)
```

## TDrawer

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| title | Widget? | - | 标题 |
| items | List<TDrawerItem>? | - | 菜单项列表 |
| footer | Widget? | - | 底部内容 |
| placement | TDrawerPlacement | TDrawerPlacement.left | 抽屉方向 |
| width | double? | - | 抽屉宽度（left/right 时生效） |
| height | double? | - | 抽屉高度（top/bottom 时生效） |

## TDrawerItem

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| label | Widget? | - | 菜单项文字 |
| icon | Widget? | - | 菜单项图标 |
| onTap | VoidCallback? | - | 点击回调，null 表示禁用 |

## 何时使用

用于页面级别的导航或辅助功能，不常用操作可放入抽屉。

## 相似组件

- [SideBar 侧边栏](<../导航/SideBar 侧边栏.md>)：侧边栏用于长期展示的导航。