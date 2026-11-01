# Loading 加载

> 用于展示加载状态，支持圆形、点状、菊花状预设图标，以及自定义图标和文案。

> 来源：[https://tdesign.tencent.com/flutter/components/loading](https://tdesign.tencent.com/flutter/components/loading)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 基础用法

```dart
// 圆形加载（默认）
TLoading()

// 带文案
TLoading(
  text: '加载中...',
)

// 点状加载
TLoading(
  icon: TLoadingIcon.dot,
)

// 菊花状加载
TLoading(
  icon: TLoadingIcon.spike,
)

// 自定义尺寸
TLoading(
  size: 32,
)

// 自定义图标
TLoading(
  customIcon: const Icon(Icons.sync, size: 24),
)

// 自定义操作区（如"重试"）
TLoading(
  refreshWidget: TButton(
    variant: TButtonVariant.text,
    onPressed: () {},
    child: const Text('重试'),
  ),
)
```

## TLoading

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| customIcon | Widget? | - | 自定义加载图标，优先于 icon，按当前 Loading 动画时长持续旋转 | 否 |
| icon | TLoadingIcon? | TLoadingIcon.circle | 预设图标；为 null 时不显示预设图标，customIcon 不为 null 时仍优先显示 | 否 |
| key | Key? | - | 组件标识 | 否 |
| refreshWidget | Widget? | - | 文案后的自定义操作内容 | 否 |
| size | double | 20 | 外部尺寸，单位逻辑像素，必须大于 0 | 否 |
| text | String? | - | 文案 | 否 |

## TLoadingIcon

| 枚举值 | 说明 |
| --- | --- |
| circle | 圆形旋转 |
| dot | 点状加载 |
| spike | 菊花状旋转 |

## TLoadingThemeData

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| color | Color? | - | 加载指示器颜色 |
| textColor | Color? | - | 文案颜色 |

## 何时使用

用于页面或区域正在加载数据，展示等待状态。

## 相似组件

- [Skeleton 骨架屏](<../数据展示/Skeleton 骨架屏.md>)：用于页面框架加载占位。
