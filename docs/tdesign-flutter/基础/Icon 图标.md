# Icon 图标

> TDesign Flutter 提供一套符合 TDesign 设计规范的图标库，通过 TIcon 组件展示。

> 来源：[Icon 图标](https://tdesign.tencent.com/flutter/components/icon)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 基础用法

```dart
// 使用 TIcon + TIcons
TIcon(TIcons.add, size: 24, color: TTheme.of(context).brandNormalColor)

// 使用 Flutter 原生 Icon（推荐在业务中使用）
const Icon(Icons.add, size: 24)
```

### 图标列表

```dart
// 查看所有可用图标
TIcons.allIconsMap
```

## TIcon

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| icon | TIcons | - | 图标常量，从 tdesign_flutter_icons 包导入 |
| size | double? | 24 | 图标尺寸，默认 24dp |
| color | Color? | - | 图标颜色 |

## TIcons

TDesign Flutter 图标常量集合，导入方式：

```dart
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
```

常用图标常量：

| 常量 | 说明 |
| --- | --- |
| TIcons.add | 添加 |
| TIcons.close | 关闭 |
| TIcons.check | 确认 |
| TIcons.arrow_back | 返回 |
| TIcons.search | 搜索 |
| TIcons.more | 更多 |
| TIcons.settings | 设置 |
| TIcons.home | 首页 |
| TIcons.user | 用户 |

## 何时使用

在按钮、导航栏、标签等组件中需要展示图标语义时使用。

## 相似组件

- [Button 按钮](<../基础/Button 按钮.md>)：按钮可携带图标。
- [NavBar 导航栏](<../导航/Navbar 导航栏.md>)：导航栏操作项可使用图标。