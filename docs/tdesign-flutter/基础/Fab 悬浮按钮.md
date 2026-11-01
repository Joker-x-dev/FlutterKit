# Fab 悬浮按钮

> 浮动操作按钮，通常用于页面的主要操作，置于页面右下角。

> 来源：[Fab 悬浮按钮](https://tdesign.tencent.com/flutter/components/fab)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 组件类型

**基础 FAB**

```dart
TFab(
  icon: const Icon(Icons.add),
  onPressed: () {},
)
```

**带标签的 FAB**

```dart
TFab(
  icon: const Icon(Icons.add),
  label: const Text('新建'),
  onPressed: () {},
)
```

**扩展 FAB**

```dart
TFab.extended(
  icon: const Icon(Icons.add),
  label: const Text('新建'),
  onPressed: () {},
)
```

## TFab

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| icon | Widget? | - | 图标，使用 TIcon 或 Icon | 否 |
| label | Widget? | - | 标签文字 | 否 |
| onPressed | VoidCallback? | - | 点击回调，null 表示禁用 | 否 |
| mini | bool | false | 是否为迷你尺寸 | 否 |
| xBounds | List<double>? | - | 水平拖动边界 |
| yBounds | List<double>? | - | 垂直拖动边界 |

## 何时使用

用于页面的主要操作，通常位于页面右下角，如"新建"、"编辑"等高频操作。

## 相似组件

- [Button 按钮](<../基础/Button 按钮.md>)：基础操作按钮。
- [Popup 弹出层](<../反馈/Popup 弹出层.md>)：FAB 常配合弹出层使用。