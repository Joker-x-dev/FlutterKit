# Rate 评分

> 用于对某行为/事物进行打分。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/rate)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_rate_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_rate_page.dart)

#### 1 组件类型

实心评分

```
  Widget _buildFilledRate(BuildContext context) {
    return const TDCell(title: '实心评分', noteWidget: TDRate(value: 3));
  }
```

自定义评分

```
  Widget _buildCusRate(BuildContext context) {
    return const TDCell(
        title: '自定义评分', noteWidget: TDRate(value: 3, icon: [TDIcons.thumb_up]));
  }
```

自定义评分数量

```
  Widget _buildNumRate(BuildContext context) {
    return const TDCell(
        title: '自定义评分数量',
        noteWidget: TDRate(
          value: 2,
          count: 3,
        ));
  }
```

带描述评分

```
  Widget _buildMsgRate(BuildContext context) {
    return const TDCellGroup(cells: [
      TDCell(
          title: '带描述评分',
          noteWidget: TDRate(
              value: 3, showText: true, texts: ['1分', '2分', '3分', '4分', '5分'])),
      TDCell(title: '带描述评分', noteWidget: TDRate(value: 3, showText: true))
    ]);
  }
```

评分弹框位置

```
  Widget _buildDRate(BuildContext context) {
    return const TDCellGroup(cells: [
      TDCell(title: '顶部显示', noteWidget: TDRate(placement: PlacementEnum.top)),
      TDCell(title: '不显示', noteWidget: TDRate(placement: PlacementEnum.none)),
      TDCell(
          title: '底部显示', noteWidget: TDRate(placement: PlacementEnum.bottom)),
    ]);
  }
```

#### 1 组件状态

只可选全星时

```
  Widget _buildFullRate(BuildContext context) {
    return const TDCell(title: '点击活滑动', noteWidget: TDRate(value: 3));
  }
```

可选半星时

```
  Widget _buildHalfRate(BuildContext context) {
    return const TDCell(
        title: '点击活滑动',
        noteWidget: TDRate(
          value: 3,
          allowHalf: true,
          onChange: print,
        ));
  }
```

#### 1 组件样式

评分大小

```
  Widget _buildSizeRate(BuildContext context) {
    return const TDCellGroup(cells: [
      TDCell(title: '默认尺寸24', noteWidget: TDRate(value: 3)),
      TDCell(title: '小尺寸20', noteWidget: TDRate(value: 3, size: 20)),
    ]);
  }
```

设置评分颜色

```
  Widget _buildColorRate(BuildContext context) {
    return const TDCellGroup(cells: [
      TDCell(
          title: '填充评分',
          noteWidget: TDRate(
            value: 2.5,
            allowHalf: true,
            color: [Color(0xFFFFC51C), Color(0xFFE8E8E8)],
          )),
      TDCell(
          title: '线描评分',
          noteWidget:
              TDRate(value: 2.5, allowHalf: true, color: [Color(0xFF00A870)])),
    ]);
  }
```

#### 1 特殊样式

竖向带描述评分

```
  Widget _buildOtherRate(BuildContext context) {
    var texts = ['非常糟糕', '有些糟糕', '可以尝试', '可以前往', '推荐前往'];
    return Container(
      width: double.infinity,
      child: Center(
        child: TDRate(
          value: 2,
          size: 30,
          showText: true,
          // texts: ['非常糟糕', '有些糟糕', '可以尝试', '可以前往', '推荐前往'],
          direction: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.center,
          // textWidth: 64,
          builderText: (context, value) {
            return value == 0
                ? const SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: TDTheme.of(context).spacer8),
                    child: TDText(
                      texts[(value - 1).toInt()],
                      font: TDTheme.of(context).fontTitleMedium,
                      textColor: TDTheme.of(context).warningColor5,
                    ),
                  );
          },
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: TDTheme.of(context).bgColorContainer,
    );
  }
```

## API

1. [TDRate](#tdrate)

#### TDRate

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| allowHalf | bool? | false | 是否允许半选 |
| builderText | Widget Function(BuildContext context, double value)? | - | 评分等级对应的辅助文字自定义构建，优先级高于[texts] |
| color | List? | - | 评分图标的颜色，示例：[选中颜色] / [选中颜色，未选中颜色]，默认：[TDTheme.of(context).warningColor5, TDTheme.of(context).grayColor4] |
| count | int? | 5 | 评分的数量 |
| crossAxisAlignment | CrossAxisAlignment? | CrossAxisAlignment.center | 评分图标与辅助文字的交叉轴对齐方式 |
| direction | Axis? | Axis.horizontal | 评分图标与辅助文字的布局方向 |
| disabled | bool? | false | 是否禁用评分 |
| gap | double? | - | 评分图标的间距，默认：TDTheme.of(context).spacer8 |
| icon | List? | - | 自定义评分图标，[选中和未选中图标] / [选中图标，未选中图标]，默认：[TDIcons.star_filled] |
| iconTextGap | double? | - | 评分图标与辅助文字的间距，默认：[TDTheme.of(context).spacer16] |
| key |  | - |  |
| mainAxisAlignment | MainAxisAlignment? | MainAxisAlignment.start | 评分图标与辅助文字的主轴对齐方式 |
| mainAxisSize | MainAxisSize? | MainAxisSize.min | 评分图标与辅助文字主轴方向上如何占用空间 |
| onChange | void Function(double value)? | - | 评分数改变时触发 |
| placement | PlacementEnum? | PlacementEnum.top | 选择评分弹框的位置，值为[PlacementEnum.none]表示不显示评分弹框。 |
| showText | bool? | false | 是否显示对应的辅助文字 |
| size | double? | 24.0 | 评分图标的大小 |
| texts | List? | const ['极差', '失望', '一般', '满意', '惊喜'] | 评分等级对应的辅助文字， |
| textWidth | double? | 48.0 | 评分等级对应的辅助文字宽度 |
| value | double? | 0 | 选择评分的值 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

当需要对某行为/事物进行简单的星级评定时使用。

#### 组件搭配使用

###### 通常结合多行文本框、标签使用，常见于评论场景，用户对某事物进行星级评定后，可选择预设的文本标签、或在文本框中撰写内容来进行更详细的评价。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-1.png)

#### 常见用法

###### 在较为严谨的评论场景，通常结合辅助文字，帮助用户更好地理解每个星级的含义，避免个体的打分标准不统一。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-2.png)

#### 推荐/慎用示例

###### 可结合业务场景自定义评分图标，如使用品牌的icon，增强品牌透出，但不建议使用过于复杂的图形作为评分图标。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 在同一个评论场景中，评分机制应保持一致，不建议将半星、整星的评分机制混用。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
