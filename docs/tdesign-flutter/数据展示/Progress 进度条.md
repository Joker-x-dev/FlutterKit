# Progress 进度条

> 用于展示任务当前的进度

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/progress)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_progress_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_progress_page.dart)

#### 1 组件类型

线性进度条

```
  Widget _buildRightLabelLinear(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      value: value,
      strokeWidth: 6,
      progressLabelPosition: TDProgressLabelPosition.right,
    );
  }
```

百分比内显

```
  Widget _buildInsideLabelLinear(BuildContext context) {
    return TDProgress(type: TDProgressType.linear, value: value);
  }
```

环形进度条

```
  Widget _buildCircle(BuildContext context) {
    return TDProgress(type: TDProgressType.circular, value: value);
  }
```

微型环形进度条

```
  Widget _buildMicro(BuildContext context) {
    return TDProgress(type: TDProgressType.micro, value: value);
  }
```

按钮进度条

```
  Widget _buildButton(BuildContext context) {
    return TDProgress(
      type: TDProgressType.button,
      onTap: _toggleProgress,
      onLongPress: _resetProgress,
      value: progressValue,
      label: buttonLabel,
    );
  }
```

微型按钮进度条

```
  Widget _buildMicroButton(BuildContext context) {
    return TDProgress(
      type: TDProgressType.micro,
      value: microProgressValue,
      onTap: _toggleMicroProgress,
      label: TDIconLabel(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: TDTheme.of(context).brandNormalColor,
      ),
    );
  }
```

#### 1 组件状态

线性进度条

```
  Widget _buildPrimary(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.primary,
      value: value,
      strokeWidth: 6,
      progressLabelPosition: TDProgressLabelPosition.right,
    );
  }
```


```
  Widget _buildWarning(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.warning,
      value: value,
      strokeWidth: 6,
      progressLabelPosition: TDProgressLabelPosition.right,
    );
  }
```


```
  Widget _buildDanger(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.danger,
      value: value,
      strokeWidth: 6,
      progressLabelPosition: TDProgressLabelPosition.right,
    );
  }
```


```
  Widget _buildSuccess(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.success,
      value: 1,
      strokeWidth: 6,
      progressLabelPosition: TDProgressLabelPosition.right,
    );
  }
```


```
  Widget _buildPrimaryInside(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.primary,
      value: value,
      progressLabelPosition: TDProgressLabelPosition.inside,
    );
  }
```


```
  Widget _buildWarningInside(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.warning,
      value: value,
      progressLabelPosition: TDProgressLabelPosition.inside,
    );
  }
```


```
  Widget _buildDangerInside(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.danger,
      value: value,
      progressLabelPosition: TDProgressLabelPosition.inside,
    );
  }
```


```
  Widget _buildSuccessInside(BuildContext context) {
    return TDProgress(
      type: TDProgressType.linear,
      progressStatus: TDProgressStatus.success,
      value: 1,
      progressLabelPosition: TDProgressLabelPosition.inside,
    );
  }
```

环形进度条

```
  Widget _buildCirclePrimary(BuildContext context) {
    return TDProgress(
      type: TDProgressType.circular,
      progressStatus: TDProgressStatus.primary,
      value: value,
    );
  }
```


```
  Widget _buildCircleWarning(BuildContext context) {
    return TDProgress(
      type: TDProgressType.circular,
      progressStatus: TDProgressStatus.warning,
      value: value,
    );
  }
```


```
  Widget _buildCircleDanger(BuildContext context) {
    return TDProgress(
      type: TDProgressType.circular,
      progressStatus: TDProgressStatus.danger,
      value: value,
    );
  }
```


```
  Widget _buildCircleSuccess(BuildContext context) {
    return TDProgress(
      type: TDProgressType.circular,
      progressStatus: TDProgressStatus.success,
      value: 1,
    );
  }
```

## API

1. [TDProgress](#tdprogress)

#### TDProgress

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| animationDuration | int? | 300 | 动画持续时间（正整数，单位为毫秒） |
| backgroundColor | Color? | - | 进度条背景颜色 |
| circleRadius | double? | - | 环形进度条半径（正数） |
| color | Color? | - | 进度条颜色 |
| customProgressLabel | Widget? | - | 自定义标签 |
| key |  | - |  |
| label | TDLabelWidget? | - | 进度条标签 |
| labelWidgetAlignment | Alignment? | - | 自定义标签对齐方式 |
| labelWidgetWidth | double? | - | 自定义标签宽度 |
| linearBorderRadius | BorderRadiusGeometry? | - | 条形进度条末端形状 |
| onLongPress | VoidCallback? | - | 长按事件 |
| onTap | VoidCallback? | - | 点击事件 |
| progressLabelPosition | TDProgressLabelPosition | TDProgressLabelPosition.inside | 标签显示位置 |
| progressStatus | TDProgressStatus | TDProgressStatus.primary | 进度条状态 |
| showLabel | bool | true | 是否显示标签 |
| strokeWidth | double? | - | 进度条粗细（正数） |
| type | TDProgressType | - | 进度条类型 |
| value | double? | - | 进度值（0.0 到 1.0 之间的正数） |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当有一项系统任务正在进行，需要向用户展示该任务的当前进度时使用。

#### 与页面布局相关

###### 当展示页面、模块的加载进度时，通常进度条放置在页面、模块的正中间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-2.png)

#### 常见用法

###### 通常用于任务周期较长的场景中，配有文字或图标显示进度和状态。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-3.png)

---

###### 当任务时间较短、或难以预估剩余时间时，通常弱化进度的百分比信息，如使用隐藏数值进度条、或微型的环形进度条。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-5.png)

#### 推荐/慎用示例

###### 若任务需要等待的时间很长，可以提供大概的时间估计，让用户更有预期。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [加载](<../反馈/Loading 加载.md>) | 当打开新页面或操作完成后，等待加载时使用。 |
