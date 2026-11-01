# Result 结果

> 反馈结果状态。

> 来源：[Result 结果](https://tdesign.tencent.com/flutter/components/result)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_result_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_result_page.dart)

#### 1 组件类型

基础结果

```
  TResult _buildBasicResultSuccess(BuildContext context) {
    return const TResult(
      title: '成功状态',
      theme: TResultTheme.success,
    );
  }
```


```
  TResult _buildBasicResultError(BuildContext context) {
    return const TResult(
      title: '失败状态',
      theme: TResultTheme.error,
    );
  }
```


```
  TResult _buildBasicResultWarning(BuildContext context) {
    return const TResult(
      title: '警示状态',
      theme: TResultTheme.warning,
    );
  }
```


```
  TResult _buildBasicResultDefault(BuildContext context) {
    return const TResult(
      title: '默认状态',
      theme: TResultTheme.defaultTheme,
    );
  }
```


```
  TResult _buildBasicResultSuccess(BuildContext context) {
    return const TResult(
      title: '成功状态',
      theme: TResultTheme.success,
    );
  }
```


```
  TResult _buildBasicResultError(BuildContext context) {
    return const TResult(
      title: '失败状态',
      theme: TResultTheme.error,
    );
  }
```


```
  TResult _buildBasicResultWarning(BuildContext context) {
    return const TResult(
      title: '警示状态',
      theme: TResultTheme.warning,
    );
  }
```


```
  TResult _buildBasicResultDefault(BuildContext context) {
    return const TResult(
      title: '默认状态',
      theme: TResultTheme.defaultTheme,
    );
  }
```

带描述的结果

```
  TResult _buildResultWithDescriptionSuccess(BuildContext context) {
    return const TResult(
      title: '成功状态',
      theme: TResultTheme.success,
      description: '描述文字',
    );
  }
```


```
  TResult _buildResultWithDescriptionError(BuildContext context) {
    return const TResult(
      title: '失败状态',
      theme: TResultTheme.error,
      description: '描述文字',
    );
  }
```


```
  TResult _buildResultWithDescriptionWarning(BuildContext context) {
    return const TResult(
      title: '警示状态',
      theme: TResultTheme.warning,
      description: '描述文字',
    );
  }
```


```
  TResult _buildResultWithDescriptionDefault(BuildContext context) {
    return const TResult(
      title: '默认状态',
      theme: TResultTheme.defaultTheme,
      description: '描述文字',
    );
  }
```


```
  TResult _buildResultWithDescriptionSuccess(BuildContext context) {
    return const TResult(
      title: '成功状态',
      theme: TResultTheme.success,
      description: '描述文字',
    );
  }
```


```
  TResult _buildResultWithDescriptionError(BuildContext context) {
    return const TResult(
      title: '失败状态',
      theme: TResultTheme.error,
      description: '描述文字',
    );
  }
```


```
  TResult _buildResultWithDescriptionWarning(BuildContext context) {
    return const TResult(
      title: '警示状态',
      theme: TResultTheme.warning,
      description: '描述文字',
    );
  }
```


```
  TResult _buildResultWithDescriptionDefault(BuildContext context) {
    return const TResult(
      title: '默认状态',
      theme: TResultTheme.defaultTheme,
      description: '描述文字',
    );
  }
```

自定义结果

```
  TResult _buildCustomResultContent(BuildContext context) {
    return TResult(
      title: '自定义结果',
      icon: Image.asset('assets/img/illustration.png'),
      description: '描述文字',
    );
  }
```

页面示例

```
暂无演示代码
```

## API

1. [TResult](#tresult)
2. [TResultTheme](#tresulttheme)

#### TResult

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| description | String? | - | 描述文本，用于提供额外信息 |
| icon | Widget? | - | 图标组件，用于在结果中显示一个图标 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| theme | TResultTheme | TResultTheme.defaultTheme | 主题样式，默认主题样式为defaultTheme |
| title | String | '' | 标题文本，显示结果的主要信息，默认标题为空字符串 |
| titleStyle | TextStyle? | - | 自定义字体样式，用于设置标题文本的样式 |

#### TResultTheme

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| defaultTheme | - |
| success | - |
| warning | - |
| error | - |

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [相似组件](#相似组件)

#### 何时使用

当需要向用户展示操作后的结果反馈时使用。

#### 常见用法

###### 任务本身在弹窗中进行或仅需要较为轻量的结果反馈时，可使用弹窗承载结果反馈。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-1.png)

---

###### 当任务结束并给予反馈后，需要推荐其他内容、任务、商品等给用户时，通常使用页面承载结果和推荐。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-2.png)

---

###### 当任务结果为失败时，通常会告知用户失败原因，甚至提供解决问题的操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-3.png)

---

###### 当前操作结束后，若还存在一系列用户需关注的流程进度，通常会结合步骤条将流程展示于结果页。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-4.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [空状态](<Empty 空状态.md>) | 当页面或模块数据为空时使用。 |
