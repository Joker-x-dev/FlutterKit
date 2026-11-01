# Text 文本

> 用于展示文本内容，支持多种样式配置和富文本。

> 来源：[Text 文本](https://tdesign.tencent.com/flutter/components/text)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 基础用法

```dart
TText('普通文本')
TText('标题', style: TTextThemeData.title)
TText('副标题', style: TTextThemeData.subtitle)
```

### 富文本

```dart
TTextSpan([
  TTextSpan(text: '普通文本', style: TextStyle(color: Colors.black)),
  TTextSpan(text: '彩色文本', style: TextStyle(color: Colors.blue)),
])
```

## TText

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| data | String | - | 文本内容（必填） |
| style | TextStyle? | - | 文本样式 |
| font | TFont? | - | TD 字体 Token |
| maxLines | int? | - | 最大行数 |
| overflow | TextOverflow | TextOverflow.clip | 溢出处理方式 |
| textAlign | TextAlign? | - | 文本对齐方式 |
| textScaler | TextScaler? | - | 文字缩放，替代旧 textScaleFactor |

## TTextSpan

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String | - | 文本内容 |
| style | TextStyle? | - | 文本样式 |

## 何时使用

用于展示单行或多行文本内容。

## 常见问题

- **文字居中**：使用 textAlign，不再使用旧版字体 padding 补偿。
- **行高调整**：使用 style 中的 height 字段或 strutStyle。
- **文字缩放**：使用 textScaler，未传时继承系统文字缩放。