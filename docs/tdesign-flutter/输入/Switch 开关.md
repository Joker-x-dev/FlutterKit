# Switch 开关

> 用于控制某个功能的开启和关闭。

> 来源：[Switch 开关](https://tdesign.tencent.com/flutter/components/switch)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_switch_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_switch_page.dart)

#### 1 组件类型

基础开关

```
  Widget _buildSwitchWithBase(BuildContext context) {
    return const TCell(
      title: '基础开关',
      noteWidget: TSwitch(),
    );
  }
```

带描述开关

```
  Widget _buildSwitchWithText(BuildContext context) {
    return const TCell(
      title: '带文字开关',
      noteWidget: TSwitch(
        isOn: true,
        type: TSwitchType.text,
      ),
    );
  }
```


```
  Widget _buildSwitchWithIcon(BuildContext context) {
    return const TCell(
      title: '带图标开关',
      noteWidget: TSwitch(
        isOn: true,
        type: TSwitchType.icon,
      ),
    );
  }
```

自定义颜色开关

```
  Widget _buildSwitchWithColor(BuildContext context) {
    return const TCell(
      title: '自定义颜色开关',
      noteWidget: TSwitch(
        isOn: true,
        trackOnColor: Colors.green,
      ),
    );
  }
```

#### 1 组件状态

加载状态

```
  Widget _buildSwitchWithLoadingOff(BuildContext context) {
    return const TCell(
      title: '加载状态',
      noteWidget: TSwitch(
        isOn: false,
        type: TSwitchType.loading,
      ),
    );
  }
```


```
  Widget _buildSwitchWithLoadingOn(BuildContext context) {
    return const TCell(
      title: '加载状态',
      noteWidget: TSwitch(
        isOn: true,
        type: TSwitchType.loading,
      ),
    );
  }
```

禁用状态

```
  Widget _buildSwitchWithDisableOff(BuildContext context) {
    return const TCell(
      title: '禁用状态',
      noteWidget: TSwitch(
        enable: false,
        isOn: false,
      ),
    );
  }
```


```
  Widget _buildSwitchWithDisableOn(BuildContext context) {
    return const TCell(
      title: '禁用状态',
      noteWidget: TSwitch(
        enable: false,
        isOn: true,
      ),
    );
  }
```

#### 1 组件样式

开关尺寸

```
  Widget _buildSwitchWithSizeLarge(BuildContext context) {
    return const TCell(
      title: '大尺寸32',
      noteWidget: TSwitch(
        size: TSwitchSize.large,
        isOn: true,
      ),
    );
  }
```


```
  Widget _buildSwitchWithSizeMed(BuildContext context) {
    return const TCell(
      title: '中尺寸28',
      noteWidget: TSwitch(
        size: TSwitchSize.medium,
        isOn: true,
      ),
    );
  }
```


```
  Widget _buildSwitchWithSizeSmall(BuildContext context) {
    return const TCell(
      title: '小尺寸24',
      noteWidget: TSwitch(
        size: TSwitchSize.small,
        isOn: true,
      ),
    );
  }
```

## API

1. [TSwitch](#tswitch)
2. [TSwitchSize](#tswitchsize)
3. [TSwitchType](#tswitchtype)
4. [OnSwitchChanged](#onswitchchanged)

#### TSwitch

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| closeText | String? | - | 关闭文案 |
| enable | bool | true | 是否可点击 |
| isOn | bool | false | 是否打开 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| onChanged | OnSwitchChanged? | - | 改变事件 |
| openText | String? | - | 打开文案 |
| size | TSwitchSize? | TSwitchSize.medium | 尺寸：大、中、小 |
| thumbContentOffColor | Color? | - | 关闭时ThumbView的颜色 |
| thumbContentOffFont | TextStyle? | - | 关闭时ThumbView的字体样式 |
| thumbContentOnColor | Color? | - | 开启时ThumbView的颜色 |
| thumbContentOnFont | TextStyle? | - | 开启时ThumbView的字体样式 |
| trackOffColor | Color? | - | 关闭时轨道颜色 |
| trackOnColor | Color? | - | 开启时轨道颜色 |
| type | TSwitchType? | TSwitchType.fill | 类型：填充、文本、加载 |

#### TSwitchSize

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| large | - |
| medium | - |
| small | - |

#### TSwitchType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| fill | - |
| text | - |
| loading | - |
| icon | - |

#### OnSwitchChanged

##### 类型定义

```dart
typedef OnSwitchChanged = bool Function(bool value);
```

## 设计指南

1. [何时使用](#何时使用)
2. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

当需要切换某个功能的开启、关闭时使用。

#### 推荐/慎用示例

###### 开关状态的颜色使用建议符合颜色语义，尽量避免让开启、关闭状态的颜色产生混淆。

![](https://tdesign.gtimg.com/site/design/mobile-guide/switch/switch-1.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/switch/switch-2.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 若需结合文本描述开关状态，建议文案和开关状态保持一致，确保表意清晰。

![](https://tdesign.gtimg.com/site/design/mobile-guide/switch/switch-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
