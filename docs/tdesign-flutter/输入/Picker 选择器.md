# Picker 选择器

> 用于一组预设数据中的选择。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/picker)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_picker_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_picker_page.dart)

#### 1 组件类型

基础选择器--地区

```
  Widget buildArea(BuildContext context) {
    const title = '选择地区';
    return TDCell(
      title: title,
      note: selected_1.isEmpty ? '请选择' : selected_1,
      arrow: true,
      onClick: (click) {
        TDPicker.showMultiPicker(
          context,
          title: title,
          onConfirm: (selected) {
            setState(() {
              selected_1 = '${data_1[selected[0]]}';
            });
            Navigator.of(context).pop();
          },
          data: [data_1],
        );
      },
    );
  }
```

基础选择器--时间

```
  Widget buildTime(BuildContext context) {
    const title = '选择时间';
    return TDCell(
      title: title,
      note: selected_2.isEmpty ? '请选择' : selected_2,
      arrow: true,
      onClick: (click) {
        TDPicker.showMultiPicker(
          context,
          title: title,
          onConfirm: (selected) {
            print('selected ${selected}');
            setState(() {
              selected_2 =
                  '${data_2[0][selected[0]]} ${data_2[1][selected[1]]}';
            });
            Navigator.of(context).pop();
          },
          data: data_2,
        );
      },
    );
  }
```

基础选择器--地区--联动

```
  Widget buildMultiArea(BuildContext context) {
    const title = '选择地区';
    return TDCell(
      title: title,
      note: selected_3.isEmpty ? '请选择' : selected_3,
      arrow: true,
      onClick: (click) {
        TDPicker.showMultiLinkedPicker(
          context,
          title: title,
          onConfirm: (selected) {
            setState(() {
              selected_3 = '${selected[0]} ${selected[1]} ${selected[2]}';
            });
            Navigator.of(context).pop();
          },
          data: dataTest,
          columnNum: 3,
          initialData: ['浙江省', '杭州市', '西湖区'],
        );
      },
    );
  }
```

#### 1 组件样式

带标题选择器

```
  Widget buildAreaWithTitle(BuildContext context) {
    const title = '选择地区';
    return TDCell(
      title: title,
      note: selected_4.isEmpty ? '请选择' : selected_4,
      arrow: true,
      onClick: (click) {
        TDPicker.showMultiPicker(
          context,
          title: '带标题选择器',
          onConfirm: (selected) {
            setState(() {
              selected_4 = '${data_1[selected[0]]}';
            });
            Navigator.of(context).pop();
          },
          data: [data_1],
        );
      },
    );
  }
```

无标题选择器

```
  Widget buildAreaWithoutTitle(BuildContext context) {
    return TDCell(
      title: '选择地区',
      note: selected_5.isEmpty ? '请选择' : selected_5,
      arrow: true,
      onClick: (click) {
        TDPicker.showMultiPicker(
          context,
          // 不传或传空字符串、null，则不显示标题
          // title: '',
          onConfirm: (selected) {
            setState(() {
              selected_5 = '${data_1[selected[0]]}';
            });
            Navigator.of(context).pop();
          },
          data: [data_1],
        );
      },
    );
  }
```

不使用弹窗、不带顶部内容

```
  Widget buildWithoutHeader(BuildContext context) {
    return TDMultiPicker(
      /// 不显示header内容
      header: false,
      /// todo onChange
      onConfirm: (selected) {
        setState(() {
          selected_5 = '${data_1[selected[0]]}';
        });
        Navigator.of(context).pop();
      },
      data: [data_1],
    );
  }
```

## API

1. [TDPicker](#tdpicker)
2. [TDMultiPicker](#tdmultipicker)
3. [TDMultiLinkedPicker](#tdmultilinkedpicker)
4. [MultiLinkedPickerModel](#multilinkedpickermodel)

#### TDPicker

##### 静态方法

| 名称 | 返回类型 | 说明 |
| --- | --- | --- |
| `showDatePicker` | `void` | 显示时间选择器。 |
| `showMultiLinkedPicker` | `void` | 显示多级联动选择器。 |
| `showMultiPicker` | `void` | 显示多级选择器。 |

###### `showDatePicker`

显示时间选择器。

```dart
static void showDatePicker(
  context, {
  String? title,
  double? titleHeight,
  Color? titleDividerColor,
  required DatePickerCallback? onConfirm,
  DatePickerCallback? onCancel,
  DatePickerCallback? onChange,
  Function(int wheelIndex, int index)? onSelectedItemChanged,
  String? leftText,
  TextStyle? leftTextStyle,
  TextStyle? centerTextStyle,
  String? rightText,
  TextStyle? rightTextStyle,
  EdgeInsets? padding,
  double? leftPadding,
  double? topPadding,
  double? rightPadding,
  double? topRadius,
  Color? backgroundColor,
  Widget? customSelectWidget,
  bool useYear = true,
  bool useMonth = true,
  bool useDay = true,
  bool useHour = false,
  bool useMinute = false,
  bool useSecond = false,
  bool useWeekDay = false,
  List<int> dateStart = const [1970, 1, 1],
  List<int>? dateEnd,
  List<int>? initialDate,
  List<int> Function(DateTypeKey key, List<int> nums)? filterItems,
  double pickerHeight = 200,
  int pickerItemCount = 5,
  bool isTimeUnit = true,
  ItemBuilderType? itemBuilder,
  Color? barrierColor,
  Duration duration = const Duration(milliseconds: 100),
});
```

###### `showMultiLinkedPicker`

显示多级联动选择器。

```dart
static void showMultiLinkedPicker(
  context, {
  String? title,
  required MultiPickerCallback? onConfirm,
  MultiPickerCallback? onCancel,
  required List initialData,
  required Map data,
  required int columnNum,
  double pickerHeight = 200,
  int pickerItemCount = 5,
  Widget? customSelectWidget,
  String? rightText,
  String? leftText,
  TextStyle? leftTextStyle,
  TextStyle? centerTextStyle,
  TextStyle? rightTextStyle,
  double? titleHeight,
  double? topPadding,
  double? leftPadding,
  double? rightPadding,
  Color? titleDividerColor,
  Color? backgroundColor,
  double? topRadius,
  EdgeInsets? padding,
  ItemBuilderType? itemBuilder,
  bool keepSameSelection = false,
  Color? barrierColor,
  Duration duration = const Duration(milliseconds: 100),
});
```

###### `showMultiPicker`

显示多级选择器。

```dart
static void showMultiPicker(
  context, {
  String? title,
  required MultiPickerCallback? onConfirm,
  MultiPickerCallback? onCancel,
  required List<List<String>> data,
  double pickerHeight = 200,
  int pickerItemCount = 5,
  List<int>? initialIndexes,
  String? rightText,
  String? leftText,
  TextStyle? leftTextStyle,
  TextStyle? centerTextStyle,
  TextStyle? rightTextStyle,
  double? titleHeight,
  double? topPadding,
  double? leftPadding,
  double? rightPadding,
  Color? titleDividerColor,
  Color? backgroundColor,
  double? topRadius,
  EdgeInsets? padding,
  Widget? customSelectWidget,
  ItemBuilderType? itemBuilder,
  Duration duration = const Duration(milliseconds: 100),
  Color? barrierColor,
});
```

#### TDMultiPicker

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| centerTextStyle | TextStyle? | - | 自定义中间文案样式 |
| customSelectWidget | Widget? | - | 自定义选择框样式 |
| data | Map | - | 总的数据 |
| header | bool | true | 是否显示头部内容 |
| initialIndexes | List? | - | 若为null表示全部从零开始 |
| itemBuilder | ItemBuilderType? | - | 自定义item构建 |
| itemDistanceCalculator | ItemDistanceCalculator? | - | 不同距离自选项计算策略 |
| key |  | - |  |
| leftPadding | double? | - | 左边填充 |
| leftText | String? | - | 左侧按钮文案 |
| leftTextStyle | TextStyle? | - | 自定义左侧文案样式 |
| onCancel | MultiPickerCallback? | - | 选择器取消按钮回调 |
| onChange | MultiPickerCallback? | - | todo 选择器数据改变时回调 |
| onConfirm | MultiPickerCallback? | - | 选择器确认按钮回调 |
| padding | EdgeInsets? | - | 适配padding |
| pickerHeight | double | 200 |  |
| pickerItemCount | int | 5 | 选择器List视窗中item个数，pickerHeight / pickerItemCount，即item高度 |
| rightPadding | double? | - | 右边填充 |
| rightText | String? | - | 右侧按钮文案 |
| rightTextStyle | TextStyle? | - | 自定义右侧文案样式 |
| title | String? | - | 选择器标题 |
| titleDividerColor | Color? | - | 标题分割线颜色 |
| titleHeight | double? | - | 标题高度 |
| topPadding | double? | - | 顶部填充 |
| topRadius | double? | - | 顶部圆角 |

#### TDMultiLinkedPicker

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| centerTextStyle | TextStyle? | - | 自定义中间文案样式 |
| columnNum | int | - | 总列数 |
| customSelectWidget | Widget? | - | 自定义选择框样式 |
| data | Map | - | 总的数据 |
| header | bool | true | 是否显示头部内容 |
| itemBuilder | ItemBuilderType? | - | 自定义item构建 |
| itemDistanceCalculator | ItemDistanceCalculator? | - | 不同距离自选项计算策略 |
| keepSameSelection | bool | false | 是否保留相同选项 |
| key |  | - |  |
| leftPadding | double? | - | 左边填充 |
| leftText | String? | - | 左侧按钮文案 |
| leftTextStyle | TextStyle? | - | 自定义左侧文案样式 |
| onCancel | MultiPickerCallback? | - | 选择器取消按钮回调 |
| onChange | MultiPickerCallback? | - | todo 选择器数据改变时回调 |
| onConfirm | MultiPickerCallback? | - | 选择器确认按钮回调 |
| padding | EdgeInsets? | - | 适配padding |
| pickerHeight | double | 200 |  |
| pickerItemCount | int | 5 | 选择器List视窗中item个数，pickerHeight / pickerItemCount，即item高度 |
| rightPadding | double? | - | 右边填充 |
| rightText | String? | - | 右侧按钮文案 |
| rightTextStyle | TextStyle? | - | 自定义右侧文案样式 |
| selectedData | List | - | 选中数据 |
| title | String? | - | 选择器标题 |
| titleDividerColor | Color? | - | 标题分割线颜色 |
| titleHeight | double? | - | 标题高度 |
| topPadding | double? | - | 顶部填充 |
| topRadius | double? | - | 顶部圆角 |

#### MultiLinkedPickerModel

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| columnNum | int | - | 总列数 |
| data | Map | - | 总的数据 |
| initialData |  | - |  |
| keepSameSelection | bool | false | 是否保留相同选项 |

## 设计指南

1. [何时使用](#何时使用)
2. [推荐/慎用示例](#推荐-慎用示例)
3. [相似组件](#相似组件)

#### 何时使用

当需要在有限的空间展示大量选项供用户选择，或者一组选项由递进层级构成需要用户逐级选择时使用。

#### 推荐/慎用示例

###### 选择器若为一组有层级关系的选项时，选项层级不宜超过4层，层级过多时应调整数据结构或改用其他交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/picker/picker-1.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 选择器若为一组有层级关系的选项时，各层级选项的归属关系应具备逻辑相关性，数据层级由大到小，避免归属关系混乱。

![](https://tdesign.gtimg.com/site/design/mobile-guide/picker/picker-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/picker/picker-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [时间选择器](<DateTimePicker 时间选择器.md>) | 在表单中需要输入单个日期或时间时使用。 |
