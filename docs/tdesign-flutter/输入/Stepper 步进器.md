# Stepper 步进器

> 用于数量的增减。

> 来源：[Stepper 步进器](https://tdesign.tencent.com/flutter/components/stepper)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_stepper_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_stepper_page.dart)

#### 1 组件类型

基础步进器

```
  Widget _buildStepperWithBase(BuildContext context) {
    return _buildRow(context, [
      const TStepper(
        theme: TStepperTheme.filled,
      )
    ]);
  }
```

#### 1 组件状态

最大最小状态

```
  Widget _buildStepperWithMaxMinStatus(BuildContext context) {
    return _buildRow(context, [
      const TStepper(theme: TStepperTheme.filled, value: 0, min: 0),
      const TStepper(theme: TStepperTheme.filled, value: 999, max: 999),
    ]);
  }
```

禁用状态

```
  Widget _buildStepperWithDisableStatus(BuildContext context) {
    return _buildRow(context, [
      const TStepper(
        theme: TStepperTheme.filled,
        disabled: true,
      ),
      const TStepper(
        theme: TStepperTheme.outline,
        disabled: true,
      ),
      const TStepper(
        theme: TStepperTheme.normal,
        disabled: true,
      ),
    ]);
  }
```

#### 1 组件样式

步进器样式

```
  Widget _buildStepperWithTheme(BuildContext context) {
    return _buildRow(context, [
      const TStepper(theme: TStepperTheme.filled, value: 3),
      const TStepper(theme: TStepperTheme.outline, value: 3),
      const TStepper(theme: TStepperTheme.normal, value: 3),
    ]);
  }
```

步进器尺寸

```
  Widget _buildStepperWithSize(BuildContext context) {
    return _buildRow(context, [
      const TStepper(
          size: TStepperSize.large, theme: TStepperTheme.filled, value: 3),
      const TStepper(
          size: TStepperSize.medium, theme: TStepperTheme.filled, value: 3),
      const TStepper(
          size: TStepperSize.small, theme: TStepperTheme.filled, value: 3),
    ]);
  }
```

## API

1. [TStepper](#tstepper)
2. [TStepperSize](#tsteppersize)
3. [TStepperTheme](#tsteppertheme)
4. [TStepperIconType](#tsteppericontype)
5. [TStepperOverlimitType](#tstepperoverlimittype)
6. [TStepperEventType](#tsteppereventtype)
7. [TStepperOverlimitFunction](#tstepperoverlimitfunction)
8. [TTapFunction](#ttapfunction)

#### TStepper

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| controller | TStepperController? | - | Stepper控制器 |
| defaultValue | int? | 0 | 默认值 |
| disabled | bool | false | 禁用全部操作 |
| disableInput | bool | false | 禁用输入框 |
| eventController | StreamController? | - | 事件控制器 |
| inputWidth | double? | - | 禁用全部操作 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| max | int | 100 | 最大值 |
| min | int | 0 | 最小值 |
| onBlur | VoidCallback? | - | 输入框失去焦点时触发 |
| onChange | ValueChanged? | - | 数值发生变更时触发 |
| onOverlimit | TStepperOverlimitFunction? | - | 数值超出限制时触发 |
| size | TStepperSize | TStepperSize.medium | 组件尺寸 |
| step | int | 1 | 步长 |
| theme | TStepperTheme | TStepperTheme.normal | 组件风格 |
| value | int? | 0 | 值 |

#### TStepperSize

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| small | - |
| medium | - |
| large | - |

#### TStepperTheme

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| normal | - |
| filled | - |
| outline | - |

#### TStepperIconType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| remove | - |
| add | - |

#### TStepperOverlimitType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| minus | - |
| plus | - |

#### TStepperEventType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| cleanValue | - |

#### TStepperOverlimitFunction

##### 类型定义

```dart
typedef TStepperOverlimitFunction = void Function(TStepperOverlimitType type);
```

#### TTapFunction

##### 类型定义

```dart
typedef TTapFunction = void Function();
```

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

需要进行数量选择时使用

#### 常见用法

###### 通常用于数量选择，如选择人数、天数、商品数量等

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-1.png)

---

###### 用户可通过“+”“-”按钮调整数值，或点击数字输入框来输入具体的数值

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-2.png)

#### 推荐/慎用示例

###### 点击“+”“-”按钮时，数值增减的步长相同，不建议进行不同步长的变化

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-3.gif)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-4.gif)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [滑动选择器](<Slider 滑动选择器.md>) | 当用户需要快捷地进行数值/程度选择时使用。 |
| [输入框](<Input 输入框.md>) | 需要进行文字输入，且需填写的字数较少时使用。 |
