# Link 链接

> 用于页面跳转或触发操作，支持前缀/后缀图标和下划线样式。

> 来源：[Link 链接](https://tdesign.tencent.com/flutter/components/link)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 基础用法

```dart
TLink(
  child: const Text('链接文本'),
  onPressed: () {},
)
```

### 带图标

```dart
TLink(
  prefixIcon: const Icon(Icons.info_outline),
  child: const Text('更多信息'),
  onPressed: () {},
)

TLink(
  suffixIcon: const Icon(Icons.arrow_forward),
  child: const Text('查看详情'),
  onPressed: () {},
)
```

### 下划线样式

```dart
TLink(
  underline: true,
  child: const Text('带下划线'),
  onPressed: () {},
)
```

## TLink

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget? | - | 链接内容，通常为 TText 或 Text | 否 |
| onPressed | VoidCallback? | - | 点击回调，null 表示禁用 | 否 |
| prefixIcon | Widget? | - | 前缀图标 |
| suffixIcon | Widget? | - | 后缀图标 |
| underline | bool | false | 是否显示下划线 |
| disabled | bool | false | 是否禁用 |

## 何时使用

用于文本级别的跳转或操作触发，区别于按钮（按钮用于主要操作入口）。

## 相似组件

- [Button 按钮](<../基础/Button 按钮.md>)：按钮用于主要操作入口。