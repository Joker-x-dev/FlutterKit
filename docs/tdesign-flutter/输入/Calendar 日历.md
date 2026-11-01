# Calendar 日历

> 按照日历形式展示数据或日期的容器。

> 来源：[Calendar 日历](https://tdesign.tencent.com/flutter/components/calendar)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_calendar_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_calendar_page.dart)

#### 1 组件类型

```
Widget _buildSimple(BuildContext context) {
  return const _SimpleDemo();
}
```

#### 1 组件样式

自定义副标题、按钮、单元格

```
Widget _buildStyle(BuildContext context) {
  return const _StyleDemo();
}
```


```
Widget _buildStyle(BuildContext context) {
  return const _StyleDemo();
}
```

农历日历

```
Widget _buildLunar(BuildContext context) {
  return const _LunarCalendarDemo();
}
```


```
Widget _buildLunar(BuildContext context) {
  return const _LunarCalendarDemo();
}
```

## API

1. [TCalendar](#tcalendar)
2. [TCalendarStyle](#tcalendarstyle)
3. [TCalendarCellModel](#tcalendarcellmodel)
4. [TCalendarSubtitleContext](#tcalendarsubtitlecontext)
5. [DateSelectType](#dateselecttype)
6. [CalendarType](#calendartype)
7. [TCalendarSubtitleBuilder](#tcalendarsubtitlebuilder)
8. [TCalendarCellBuilder](#tcalendarcellbuilder)
9. [TCalendarMonthTitleBuilder](#tcalendarmonthtitlebuilder)

#### TCalendar

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| anchorDate | DateTime? | - | 滚动锚点日期：将列表定位到该日**所在月份**的首屏位置。 **不**自动把该日设为选中。运行期更新本参数会重新滚动（见 `animateTo`）。 未设置时：有非空 `initialValue` 则滚到其中最早一日所在月，否则滚到 `minDate` 首月。 |
| animateTo | bool | false | `anchorDate` 或首屏定位变更导致滚动时，是否使用动画，默认 false。 |
| cellBuilder | TCalendarCellBuilder? | - | 整格自定义构建器；返回非 null 时替换该格默认布局（主数字 + 副标题均不渲染）。 与 `subtitleBuilder` 互斥：需要只改副标题时请用 `subtitleBuilder`。 |
| firstDayOfWeek | int | 0 | 第一天从星期几开始，0 = 周日，1 = 周一，…，6 = 周六。默认 0（周日）。 |
| height | double? | - | 高度，不传时自动按 5 行日期计算 |
| initialValue | List? | - | 初始选中日期列表，**仅在组件首次挂载时**写入内部选中态，运行期变更不会同步。 若需从外部重置选中，请为 `TCalendar` 指定新的 `Key` 或销毁后重新创建实例 （例如弹层关闭再打开）。不传时内部选中为空列表，首屏滚动见 `anchorDate`。 列表长度与 `type` 对应： - `CalendarType.single`：1 个元素（选中日期） - `CalendarType.multiple`：N 个元素（所有选中日期） - `CalendarType.range`：2 个元素（起始、结束日期） |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| maxDate | DateTime? | - | 最大可选的日期，默认 2100-12-31 |
| minDate | DateTime? | - | 最小可选的日期，默认 1970-01-01 |
| monthTitleBuilder | TCalendarMonthTitleBuilder? | - | 月标题构建器，参数 `DateTime` 为当月 1 日（仅年月有效）。 |
| onChange | ValueChanged<List> | - | 选中结果变化时触发（单选立即触发；多选每次切换；区间在端点变化时触发）。 用于同步业务侧 State 或 `ValueNotifier`；勿依赖运行期回写 `initialValue` 驱动 UI。 组件挂载时不会调用本回调。点击禁用格或单选重复点已选格时不触发。 |
| onMonthChanged | ValueChanged? | - | 可见月份变化时触发（用户滑动或程序化滚动结束后），参数为当月 1 日。 外置控制栏可只更新自身文案，避免为同步月份对 `TCalendar` 整组件 `setState`。 |
| style | TCalendarStyle? | - | 自定义样式（包含 cellHeight、monthTitleHeight 等布局参数） |
| subtitleBuilder | TCalendarSubtitleBuilder? | - | 副标题构建器，在日期主数字下方渲染自定义内容。 `TCalendarSubtitleContext.date` 为当前格日期； `TCalendarSubtitleContext.selectType` 为选中/区间/禁用等态。返回 null 不显示副标题行。 |
| type | CalendarType | CalendarType.single | 日历的选择模式，决定点击日期后的选中行为： - `CalendarType.single`：单选，点击新日期取消旧选中 - `CalendarType.multiple`：多选，点击切换选中/取消 - `CalendarType.range`：区间选择，依次选起止日期 |

#### TCalendarStyle

##### 静态方法

###### TCalendarStyle.generateStyle

生成默认样式

返回类型：`TCalendarStyle`

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| context | BuildContext? | - | - |

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| bodyPadding | double? | - | 内边距 |
| cellDecoration | BoxDecoration? | - | 日期单元格装饰（选中状态） |
| cellHeight | double | 60 | 日期单元格高度，默认 60 |
| centreColor | Color? | - | 区间中间格背景与格间衔接条颜色；`forSelectType` 中设为 `TTheme.brandLightColor`。 |
| dayStyle | TextStyle? | - | 日期数字样式 |
| decoration | BoxDecoration? | - | 组件容器装饰 |
| monthTitleHeight | double | 22 | 月份标题高度，默认 22 |
| monthTitleStyle | TextStyle? | - | 月份标题文字样式 |
| subtitleStyle | TextStyle? | - | 副标题样式 |
| todayDayStyle | TextStyle? | - | 今天日期数字样式 |
| verticalGap | double? | - | 日期格垂直间距，水平间距为 `verticalGap` / 2 |
| weekdayGap | double? | - | 星期之间的水平间距 |
| weekdayStyle | TextStyle? | - | 星期文字样式 |

#### TCalendarCellModel

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| date | DateTime | - | - |
| isLastDayOfMonth | bool | - | - |
| typeNotifier | DateSelectTypeNotifier | - | - |

#### TCalendarSubtitleContext

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| date | DateTime | - | 当前格子的阳历日期（仅年月日，无时分秒）。 |
| selectType | DateSelectType | - | 当前格的选中/区间/禁用等展示状态，便于按态设置副标题样式。 |

#### DateSelectType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| selected | 单选 / 多选下的选中 |
| disabled | 不可选（超出 `TCalendar.minDate` / `TCalendar.maxDate`） |
| start | 区间起点 |
| centre | 区间中间日期 |
| end | 区间终点 |
| empty | 未选中且可选 |

#### CalendarType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| single | 单选：点击新日期时自动取消旧日期的选中状态 |
| multiple | 多选：点击日期切换选中/取消，可同时选中多个日期 |
| range | 区间选择：两次点击定区间；终点须晚于起点，否则以新点击重开区间 |

#### TCalendarSubtitleBuilder

##### 类型定义

```dart
typedef TCalendarSubtitleBuilder = Widget? Function(BuildContext context, TCalendarSubtitleContext subtitleContext);
```

#### TCalendarCellBuilder

##### 类型定义

```dart
typedef TCalendarCellBuilder = Widget? Function(BuildContext context, TCalendarCellModel cell);
```

#### TCalendarMonthTitleBuilder

##### 类型定义

```dart
typedef TCalendarMonthTitleBuilder = Widget Function(BuildContext context, DateTime monthDate);
```

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用](#推荐-慎用)
4. [相似组件](#相似组件)

#### 何时使用

需要在页面间跳转、返回，或需承载少量辅助功能时使用。

#### 组件搭配使用

###### 通常和[单元格](<../数据展示/Cell 单元格.md>)搭配使用，点击后唤起日历。

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-1.png)

#### 推荐/慎用

###### 日期与描述结合时，通常与价格结合，不建议描述过长、或承载过复杂的信息。

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 区间选择尽量使用在较短时间的场景中，当涉及的时间通常在数月、数年的长度时，建议使用其它方式让用户输入。

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [时间选择器](<DateTimePicker 时间选择器.md>) | 在表单中需要输入单个日期或时间时使用。 |
