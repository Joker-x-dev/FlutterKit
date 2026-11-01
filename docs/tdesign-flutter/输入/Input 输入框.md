# Input 输入框

> 用于单行文本输入，支持占位符、前缀/后缀组件、清除按钮和密码模式。

> 来源：[Input 输入框](https://tdesign.tencent.com/flutter/components/input)
> 归档时间：2026-10-30T16:00:00+08:00

## 代码演示

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)。

### 基础用法

```dart
TInput(
  hintText: '请输入内容',
  onChanged: (v) {},
)
```

### 带前缀/后缀

```dart
TInput(
  hintText: '请输入用户名',
  prefix: const Icon(Icons.person),
  suffix: const Icon(Icons.visibility),
)
```

### 密码输入框

```dart
TInput(
  hintText: '请输入密码',
  obscureText: true,
  showPasswordToggle: true,
)
```

### 带清除按钮

```dart
TInput(
  hintText: '请输入内容',
  clearButtonMode: TInputClearButtonMode.always,
)
```

## TInput

| 参数 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| controller | TextEditingController? | - | 文本控制器，与 initialValue 互斥 | 否 |
| initialValue | String? | - | 内部控制器的初始文本，仅初始化一次 | 否 |
| hintText | String? | - | 占位提示文案 | 否 |
| prefix | Widget? | - | 前缀组件 | 否 |
| suffix | Widget? | - | 后缀组件 | 否 |
| obscureText | bool | false | 是否隐藏输入文本（密码模式） | 否 |
| showPasswordToggle | bool | false | 是否显示密码可见性切换按钮 | 否 |
| clearButtonMode | TInputClearButtonMode? | - | 清除按钮显示模式 | 否 |
| enabled | bool | true | 是否可交互，false 表示禁用 | 否 |
| readOnly | bool | false | 是否只读 | 否 |
| maxLength | int? | - | 最大字符数（grapheme 计数） | 否 |
| maxCharacter | int? | - | 最大字符权重（ASCII 计 1，非 ASCII 计 2） | 否 |
| maxLines | int? | 1 | 最大行数 | 否 |
| minLines | int? | - | 最小行数 | 否 |
| inputType | TextInputType | TextInputType.text | 键盘类型 | 否 |
| inputFormatters | List<TextInputFormatter>? | - | 输入格式化器 | 否 |
| autofocus | bool | false | 是否自动聚焦 | 否 |
| onChanged | ValueChanged<String>? | - | 文本变化通知 | 否 |
| onEditingComplete | VoidCallback? | - | 编辑完成回调 | 否 |
| onSubmitted | ValueChanged<String>? | - | 提交回调 | 否 |
| borderless | bool | false | 是否隐藏输入框边框 | 否 |

## TInputClearButtonMode

| 枚举值 | 说明 |
| --- | --- |
| never | 不显示清除按钮 |
| always | 始终显示（有内容时） |
| unlessEditable | 不可编辑时显示 |

## 何时使用

用于单行文本输入场景。多行输入请使用 [Textarea 多行文本框](<../输入/Textarea 多行文本框.md>)。

## 相似组件

- [Textarea 多行文本框](<../输入/Textarea 多行文本框.md>)：多行文本输入。
- [Form 表单](<../输入/Form 表单.md>)：表单容器，可包裹 Input 进行校验。