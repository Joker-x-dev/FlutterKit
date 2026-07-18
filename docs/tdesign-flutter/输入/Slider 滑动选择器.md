# Slider 滑动选择器

> 用于选择横轴上的数值、区间、档位。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/slider)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_slider_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_slider_page.dart)

#### 1 组件类型

单游标滑块

```
  Widget _buildSingleHandle(BuildContext context) {
    return TDSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        min: 0,
        max: 100,
      ),
      value: 10,
      onChanged: (value) {},
    );
  }
```

双游标滑块

```
  Widget _buildDoubleHandle(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        min: 0,
        max: 100,
      ),
      value: const RangeValues(10, 60),
      onChanged: (value) {},
    );
  }
```

带数值单游标滑块

```
  Widget _buildSingleHandleWithNumber(BuildContext context) {
    return TDSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        showThumbValue: true,
        scaleFormatter: (value) => value.toInt().toString(),
        min: 0,
        max: 100,
      ),
      value: 10,
      leftLabel: '0',
      rightLabel: '100',
      onChanged: (value) {},
    );
  }
```

带数值双游标滑块

```
  Widget _buildDoubleHandleWithNumber(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        showThumbValue: true,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.round().toString(),
      ),
      leftLabel: '0',
      rightLabel: '100',
      value: const RangeValues(40, 60),
      onChanged: (value) {},
    );
  }
```

带刻度单游标滑块

```
  Widget _buildSingleHandleWithScale(BuildContext context) {
    return TDSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        showScaleValue: true,
        divisions: 5,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      value: 60,
      onChanged: (value) {},
    );
  }
```

带刻度双游标滑块

```
  Widget _buildDoubleHandleWithScale(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        showScaleValue: true,
        divisions: 5,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      value: const RangeValues(40, 70),
      onChanged: (value) {},
    );
  }
```

#### 1 组件状态

禁用状态

```
  Widget _buildDisableSingleHandle(BuildContext context) {
    return TDSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        min: 0,
        max: 100,
      ),
      leftLabel: '0',
      rightLabel: '100',
      value: 40,
    );
  }
```


```
  Widget _buildDisableDoubleHandleWithNumber(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        showThumbValue: true,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      leftLabel: '0',
      rightLabel: '100',
      value: const RangeValues(20, 60),
    );
  }
```


```
  Widget _buildDisableDoubleHandleWithScale(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData(
        context: context,
        showScaleValue: true,
        divisions: 5,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      value: const RangeValues(20, 60),
    );
  }
```

#### 1 组件事件

onTap

```
  Widget _buildOnTapSingleHandle(BuildContext context) {
    var currentValue = 40.0;
    Offset? tapOffset;

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Value: ${currentValue.toStringAsFixed(1)}'),
                const SizedBox(width: 10),
                if (tapOffset != null)
                  Text(
                      'Tap at (${tapOffset!.dx.toStringAsFixed(0)}, ${tapOffset!.dy.toStringAsFixed(0)})'),
              ],
            ),
            TDSlider(
              sliderThemeData: TDSliderThemeData(
                  context: context, min: 0, max: 100, showThumbValue: true),
              leftLabel: '0',
              rightLabel: '100',
              value: currentValue,
              onChanged: (value) {},
              onTap: (offset, value) {
                setState(() {
                  currentValue = value;
                  tapOffset = offset;
                });
                print('onTap  offset: $offset, value: $value');
              },
            ),
          ],
        );
      },
    );
  }
```


```
  Widget _buildOnTapDoubleHandle(BuildContext context) {
    final displayRangeDataNotifier = ValueNotifier(
      DisplayRangeData(
        currentPosition: Position.start,
        currentTapValue: 40.0,
        tapOffset: null,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      // spacing: 10,
      children: [
        ValueListenableBuilder(
          valueListenable: displayRangeDataNotifier,
          builder: (context, data, child) {
            return Row(
              // spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Position: ${data.currentPosition}'),
                const SizedBox(width: 10),
                Text('Value: ${data.currentTapValue.toStringAsFixed(1)}'),
                const SizedBox(width: 10),
                if (data.tapOffset != null)
                  Text(
                      'Tap at (${data.tapOffset!.dx.toStringAsFixed(0)}, ${data.tapOffset!.dy.toStringAsFixed(0)})'),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        TDRangeSlider(
          sliderThemeData: TDSliderThemeData(
              context: context, min: 0, max: 100, showThumbValue: true),
          leftLabel: '0',
          rightLabel: '100',
          value: const RangeValues(10, 60),
          onChanged: (value) {},
          onTap: (position, offset, value) {
            displayRangeDataNotifier.value = DisplayRangeData(
              currentPosition: position,
              currentTapValue: value,
              tapOffset: offset,
            );
            print('onTap offset: $offset, value: $value');
          },
        ),
      ],
    );
  }
```

onThumbTextTap

```
  Widget _buildOnThumbTextTapSingleHandle(BuildContext context) {
    var currentValue = 40.0;
    Offset? tapOffset;

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          // spacing: 10,
          children: [
            Row(
              // spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Value: ${currentValue.toStringAsFixed(1)}'),
                const SizedBox(width: 10),
                if (tapOffset != null)
                  Text(
                      'Tap at (${tapOffset!.dx.toStringAsFixed(0)}, ${tapOffset!.dy.toStringAsFixed(0)})'),
              ],
            ),
            const SizedBox(height: 10),
            TDSlider(
              sliderThemeData: TDSliderThemeData(
                context: context,
                min: 0,
                max: 100,
                showThumbValue: true,
              ),
              leftLabel: '0',
              rightLabel: '100',
              value: currentValue,
              onChanged: (value) {},
              onThumbTextTap: (offset, value) {
                setState(() {
                  currentValue = value;
                  tapOffset = offset;
                });
                print('onTap  offset: $offset, value: $value');
              },
            ),
          ],
        );
      },
    );
  }
```


```
  Widget _buildOnThumbTextTapDoubleHandle(BuildContext context) {
    final displayRangeDataNotifier = ValueNotifier(
      DisplayRangeData(
        currentPosition: Position.start,
        currentTapValue: 40.0,
        tapOffset: null,
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      // spacing: 10,
      children: [
        ValueListenableBuilder(
          valueListenable: displayRangeDataNotifier,
          builder: (context, data, child) {
            return Row(
              // spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Position: ${data.currentPosition}'),
                const SizedBox(width: 10),
                Text('Value: ${data.currentTapValue.toStringAsFixed(1)}'),
                const SizedBox(width: 10),
                if (data.tapOffset != null)
                  Text(
                      'Tap at (${data.tapOffset!.dx.toStringAsFixed(0)}, ${data.tapOffset!.dy.toStringAsFixed(0)})'),
              ],
            );
          },
        ),
        const SizedBox(height: 10),
        TDRangeSlider(
          sliderThemeData: TDSliderThemeData(
            context: context,
            min: 0,
            max: 100,
            showThumbValue: true,
          ),
          leftLabel: '0',
          rightLabel: '100',
          value: const RangeValues(10, 60),
          onChanged: (value) {},
          onThumbTextTap: (position, offset, value) {
            displayRangeDataNotifier.value = DisplayRangeData(
              currentPosition: position,
              currentTapValue: value,
              tapOffset: offset,
            );
            print('onTap offset: $offset, value: $value');
          },
        ),
      ],
    );
  }
```

#### 1 特殊样式

胶囊型滑块

```
  Widget _buildCapsuleSingleHandleWithNumber(BuildContext context) {
    return TDSlider(
      sliderThemeData: TDSliderThemeData.capsule(
        context: context,
        showThumbValue: true,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      value: 40,
      onChanged: (value) {},
    );
  }
```


```
  Widget _buildCapsuleDoubleHandle(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData.capsule(
        context: context,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      value: const RangeValues(20, 60),
      onChanged: (value) {},
    );
  }
```


```
  Widget _buildCapsuleSingleHandle(BuildContext context) {
    return TDSlider(
      sliderThemeData: TDSliderThemeData.capsule(
        context: context,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      leftLabel: '0',
      rightLabel: '100',
      value: 40,
      onChanged: (value) {},
    );
  }
```


```
  Widget _buildCapsuleDoubleHandleWithNumber(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData.capsule(
        context: context,
        showThumbValue: true,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      ),
      leftLabel: '0',
      rightLabel: '100',
      value: const RangeValues(20, 60),
      onChanged: (value) {},
    );
  }
```


```
  Widget _buildCapsuleSingleHandleWithScale(BuildContext context) {
    return TDSlider(
      sliderThemeData: TDSliderThemeData.capsule(
        context: context,
        showScaleValue: true,
        divisions: 5,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      )..updateSliderThemeData((data) => data.copyWith(
          // activeTickMarkColor: TDTheme.of(context).componentBorderColor,
          // inactiveTickMarkColor: TDTheme.of(context).componentStrokeColor,
          )),
      value: 60,
      onChanged: (value) {},
    );
  }
```


```
  Widget _buildCapsuleDoubleHandleWithScale(BuildContext context) {
    return TDRangeSlider(
      sliderThemeData: TDSliderThemeData.capsule(
        context: context,
        showScaleValue: true,
        divisions: 5,
        min: 0,
        max: 100,
        scaleFormatter: (value) => value.toInt().toString(),
      )..updateSliderThemeData((data) => data.copyWith(
          // activeTickMarkColor: TDTheme.of(context).bgColorComponent,
          // inactiveTickMarkColor: TDTheme.of(context).bgColorComponent,
          )),
      value: const RangeValues(20, 60),
      onChanged: (value) {},
    );
  }
```

胶囊型滑块 - 禁用状态

```
  Widget _buildCapsule(BuildContext context) {
    return Column(
      // spacing: 16,
      children: [
        TDSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            context: context,
            showThumbValue: true,
            min: 0,
            max: 100,
            scaleFormatter: (value) => value.toInt().toString(),
          ),
          value: 40,
        ),
        const SizedBox(height: 16),
        TDRangeSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            context: context,
            min: 0,
            max: 100,
            scaleFormatter: (value) => value.toInt().toString(),
          ),
          value: const RangeValues(20, 60),
        ),
        const SizedBox(height: 16),
        TDSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            context: context,
            min: 0,
            max: 100,
            scaleFormatter: (value) => value.toInt().toString(),
          ),
          leftLabel: '0',
          rightLabel: '100',
          value: 40,
        ),
        const SizedBox(height: 16),
        TDRangeSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            context: context,
            min: 0,
            max: 100,
            showThumbValue: true,
            scaleFormatter: (value) => value.toInt().toString(),
          ),
          value: const RangeValues(20, 60),
          leftLabel: '0',
          rightLabel: '100',
        ),
        const SizedBox(height: 16),
        TDSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            context: context,
            showScaleValue: true,
            divisions: 5,
            min: 0,
            max: 100,
            scaleFormatter: (value) => value.toInt().toString(),
          )..updateSliderThemeData((data) => data.copyWith(
                activeTickMarkColor: TDTheme.of(context).componentStrokeColor,
                inactiveTickMarkColor: TDTheme.of(context).componentStrokeColor,
              )),
          value: 60,
        ),
        const SizedBox(height: 16),
        TDRangeSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            context: context,
            showScaleValue: true,
            divisions: 5,
            min: 0,
            max: 100,
            scaleFormatter: (value) => value.toInt().toString(),
          )..updateSliderThemeData((data) => data.copyWith(
                activeTickMarkColor: TDTheme.of(context).bgColorComponentActive,
                inactiveTickMarkColor: TDTheme.of(context).bgColorComponent,
              )),
          value: const RangeValues(20, 60),
        )
      ],
    );
  }
```

自定义盒子样式

```
  Widget _buildCustomDecoration(BuildContext context) {
    return Column(
      // spacing: 16,
      children: [
        TDSlider(
          sliderThemeData: TDSliderThemeData(
            context: context,
            min: 0,
            max: 100,
          ),
          value: 40,
          boxDecoration: const BoxDecoration(color: Colors.amber),
          // divisions: 5,
          onChanged: (value) {},
        ),
        const SizedBox(height: 16),
        TDRangeSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            context: context,
            min: 0,
            max: 100,
            scaleFormatter: (value) => value.toInt().toString(),
          ),
          boxDecoration: const BoxDecoration(color: Colors.deepOrangeAccent),
          value: const RangeValues(20, 60),
          onChanged: (value) {},
        ),
      ],
    );
  }
```

自定义滑轨颜色

```
  Widget _buildCustomActiveColor(BuildContext context) {
    return Column(
      // spacing: 16,
      children: [
        TDSlider(
          sliderThemeData: TDSliderThemeData(
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.green,
            context: context,
            min: 0,
            max: 100,
          ),
          value: 40,
          // divisions: 5,
          onChanged: (value) {},
        ),
        const SizedBox(height: 16),
        TDRangeSlider(
          sliderThemeData: TDSliderThemeData.capsule(
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.red,
            context: context,
            min: 0,
            max: 100,
            scaleFormatter: (value) => value.toInt().toString(),
          ),
          value: const RangeValues(20, 60),
          onChanged: (value) {},
        ),
      ],
    );
  }
```

## API

1. [TDSlider](#tdslider)
2. [TDRangeSlider](#tdrangeslider)

#### TDSlider

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| boxDecoration | Decoration? | - | 自定义盒子样式 |
| key |  | - |  |
| leftLabel | String? | - | 左侧标签 |
| onChanged | ValueChanged? | - | 滑动变化监听 |
| onChangeEnd | ValueChanged? | - | 滑动结束监听 |
| onChangeStart | ValueChanged? | - | 滑动开始监听 |
| onTap | Function(Position position, Offset offset, double value)? | - | Thumb 点击事件 位置、坐标、当前值 |
| onThumbTextTap | Function(Position position, Offset offset, double value)? | - | Thumb 点击浮标文字 位置、坐标、当前值 |
| rightLabel | String? | - | 右侧标签 |
| sliderThemeData | TDSliderThemeData? | - | 样式 |
| value | RangeValues | - | 默认值 |

#### TDRangeSlider

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| boxDecoration | Decoration? | - | 自定义盒子样式 |
| key |  | - |  |
| leftLabel | String? | - | 左侧标签 |
| onChanged | ValueChanged? | - | 滑动变化监听 |
| onChangeEnd | ValueChanged? | - | 滑动结束监听 |
| onChangeStart | ValueChanged? | - | 滑动开始监听 |
| onTap | Function(Position position, Offset offset, double value)? | - | Thumb 点击事件 位置、坐标、当前值 |
| onThumbTextTap | Function(Position position, Offset offset, double value)? | - | Thumb 点击浮标文字 位置、坐标、当前值 |
| rightLabel | String? | - | 右侧标签 |
| sliderThemeData | TDSliderThemeData? | - | 样式 |
| value | RangeValues | - | 默认值 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当用户需要快捷地进行数值/程度选择时使用。

#### 组件搭配使用

###### 滑动选择器与[单元格](<../数据展示/Cell 单元格.md>)组合使用，单元格作为承载滑动选择器的容器。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-1.png)

#### 常见用法

###### 用于可量化的数值选择，需要精确到具体某个数值/区间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-2.png)

---

###### 用于难以量化的对立数据，以此表示程度。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-3.png)

#### 推荐/慎用示例

###### 当有多个刻度区间时，避免区间数值不一致，造成滑动调整不准确。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [步进器](<Stepper 步进器.md>) | 需要进行数量选择时使用。 |
