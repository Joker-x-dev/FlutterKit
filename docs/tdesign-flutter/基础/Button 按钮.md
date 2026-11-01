# Button 按钮

> 用于开启一个闭环的操作任务，如"删除"对象、"购买"商品等。

> 来源：[Button 按钮](https://tdesign.tencent.com/flutter/components/button)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 组件类型

**基础按钮**

```dart
// 填充按钮
TButton(
  variant: TButtonVariant.fill,
  colorPreset: TButtonColorPreset.primary,
  onPressed: () {},
  child: const Text('填充按钮'),
)

// 描边按钮
TButton(
  variant: TButtonVariant.outline,
  colorPreset: TButtonColorPreset.primary,
  onPressed: () {},
  child: const Text('描边按钮'),
)

// 文字按钮
TButton(
  variant: TButtonVariant.text,
  colorPreset: TButtonColorPreset.primary,
  onPressed: () {},
  child: const Text('文字按钮'),
)
```

**图标按钮**

```dart
// 矩形图标按钮
TButton(
  icon: const Icon(Icons.add),
  child: const Text('填充按钮'),
  variant: TButtonVariant.fill,
  colorPreset: TButtonColorPreset.primary,
  onPressed: () {},
)

// 方形图标按钮
TButton(
  icon: const Icon(Icons.add),
  variant: TButtonVariant.fill,
  shape: TButtonShape.square,
  colorPreset: TButtonColorPreset.primary,
  onPressed: () {},
)
```

**幽灵按钮**

```dart
TButton(
  variant: TButtonVariant.ghost,
  colorPreset: TButtonColorPreset.primary,
  onPressed: () {},
  child: const Text('幽灵按钮'),
)
```

**组合按钮**

```dart
TButton(
  icon: const Icon(Icons.save),
  child: const Text('保存'),
  iconPosition: TButtonIconPosition.left,
  variant: TButtonVariant.fill,
  colorPreset: TButtonColorPreset.primary,
  onPressed: () {},
)
```

**通栏按钮**

```dart
// 父容器使用 SizedBox.expand 实现通栏
SizedBox(
  width: double.infinity,
  child: TButton(
    variant: TButtonVariant.fill,
    colorPreset: TButtonColorPreset.primary,
    onPressed: () {},
    child: const Text('通栏按钮'),
  ),
)
```

### 组件状态

**按钮禁用态**

```dart
// onPressed 为 null 表示禁用
TButton(
  onPressed: null,
  child: const Text('禁用按钮'),
)
```

### 组件样式

**按钮尺寸**

```dart
TButton(size: TButtonSize.large, onPressed: () {}, child: const Text('大按钮'))
TButton(size: TButtonSize.medium, onPressed: () {}, child: const Text('中按钮'))
TButton(size: TButtonSize.small, onPressed: () {}, child: const Text('小按钮'))
TButton(size: TButtonSize.mini, onPressed: () {}, child: const Text('迷你按钮'))
```

**按钮形状**

```dart
TButton(shape: TButtonShape.rectangle, onPressed: () {}, child: const Text('矩形'))
TButton(shape: TButtonShape.rounded, onPressed: () {}, child: const Text('圆角'))
TButton(shape: TButtonShape.circle, onPressed: () {}, child: const Icon(Icons.add))
TButton(shape: TButtonShape.square, onPressed: () {}, child: const Icon(Icons.add))
```

**按钮主题（配色预设）**

```dart
TButton(colorPreset: TButtonColorPreset.defaultTheme, onPressed: () {}, child: const Text('默认'))
TButton(colorPreset: TButtonColorPreset.primary, onPressed: () {}, child: const Text('品牌'))
TButton(colorPreset: TButtonColorPreset.danger, onPressed: () {}, child: const Text('危险'))
TButton(colorPreset: TButtonColorPreset.success, onPressed: () {}, child: const Text('成功'))
TButton(colorPreset: TButtonColorPreset.warning, onPressed: () {}, child: const Text('警告'))
TButton(colorPreset: TButtonColorPreset.info, onPressed: () {}, child: const Text('信息'))
```

## TButton

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget? | - | 按钮内容，纯文案可使用 Text('...') 或 TText('...')。内容文字默认使用按钮尺寸、配色与当前状态解析的文案样式 | 否 |
| colorPreset | TButtonColorPreset? | - | 内置配色预设；未传时使用 TButtonColorPreset.defaultTheme | 否 |
| icon | Widget? | - | 图标（Widget 类型，IconData 需包裹为 Icon(...)） | 否 |
| iconPosition | TButtonIconPosition | TButtonIconPosition.left | 图标位置 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态 | 否 |
| onLongPress | VoidCallback? | - | 长按回调，仅在 onPressed 非空时生效 | 否 |
| onPressed | VoidCallback? | - | 点击回调，null 表示禁用 | 否 |
| shape | TButtonShape | TButtonShape.rectangle | 按钮结构形状；纯图标的 square/circle 同时决定等宽高布局 | 否 |
| size | TButtonSize? | - | 尺寸，未传时使用 TButtonSize.medium（默认 48dp） | 否 |
| style | ButtonStyle? | - | 完整 ButtonStyle 视觉配置入口，不影响其他按钮 | 否 |
| variant | TButtonVariant? | - | 变体（fill / outline / text / ghost），未传时使用 TButtonVariant.fill | 否 |

## TButtonColorPreset

| 枚举值 | 说明 |
| --- | --- |
| defaultTheme | 默认配色 |
| primary | 品牌主色 |
| danger | 危险色 |
| success | 成功色 |
| warning | 警告色 |
| info | 信息色 |

## TButtonSize

| 枚举值 | 说明 |
| --- | --- |
| large | 大尺寸（48dp） |
| medium | 中尺寸（40dp） |
| small | 小尺寸（32dp） |
| mini | 迷你尺寸（28dp） |

## TButtonVariant

| 枚举值 | 说明 |
| --- | --- |
| fill | 填充按钮 |
| outline | 描边按钮 |
| text | 文字按钮 |
| ghost | 幽灵按钮 |

## TButtonIconPosition

| 枚举值 | 说明 |
| --- | --- |
| left | 图标在左侧 |
| right | 图标在右侧 |

## TButtonShape

| 枚举值 | 说明 |
| --- | --- |
| rectangle | 矩形 |
| rounded | 圆角矩形 |
| circle | 圆形 |
| square | 方形 |

## TButtonThemeData

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| disabledBackgroundColor | Color? | - | 禁用背景色 |
| disabledForegroundColor | Color? | - | 禁用前景色 |
| highlightColor | Color? | - | 高亮颜色 |
| splashColor | Color? | - | 水波纹颜色 |

## 何时使用

需要触发一个操作、提交表单、跳转到新页面或执行命令时使用。

## 组件搭配使用

与 TIcon、TLoading 组合使用，用于展示带图标的操作按钮或加载中状态。

## 推荐/慎用示例

**推荐**：明确的操作语义，使用 appropriate colorPreset。

**慎用**：同一行出现超过 3 个主要操作按钮；禁用态按钮不应传递空函数而非 null。

## 相似组件

- [Fab 悬浮按钮](<../基础/Fab 悬浮按钮.md>)：适用于浮动操作，常置于页面右下角。
