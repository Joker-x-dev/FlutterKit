# Radio 单选框

> 来源：[Radio 单选框](https://tdesign.tencent.com/flutter/components/radio)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_radio_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_radio_page.dart)

#### 1 组件类型

纵向单选框

```
  Widget _verticalRadios(BuildContext context) {
    return TCell(
      title: '单选标题',
      hover: false,
      required: true,
      descriptionWidget: TRadioGroup(
        selectId: '0',
        direction: Axis.horizontal,
        directionalTdRadios: const [
          TRadio(
            id: '0',
            title: '单选标题0',
            showDivider: false,
          ),
          TRadio(
            id: '1',
            title: '单选标题1',
            showDivider: false,
          ),
        ],
      ),
    );
  }
```

横向单选框

```
  Widget _horizontalRadios(BuildContext context) {
    return TRadioGroup(
      selectId: 'index:1',
      direction: Axis.horizontal,
      directionalTdRadios: const [
        TRadio(
          id: '0',
          title: '单选标题',
          radioStyle: TRadioStyle.circle,
          showDivider: false,
        ),
        TRadio(
          id: '1',
          title: '单选标题',
          radioStyle: TRadioStyle.circle,
          showDivider: false,
        ),
        TRadio(
          id: '2',
          title: '上限四字',
          radioStyle: TRadioStyle.circle,
          showDivider: false,
        ),
      ],
    );
  }
```

横向单选框-换行

```
  Widget _horizontalRadiosWrap(BuildContext context) {
    return TRadioGroup(
      selectId: '0',
      direction: Axis.horizontal,
      rowCount: 4,
      directionalTdRadios: const [
        TRadio(id: '0', title: '单0'),
        TRadio(id: '1', title: '单1'),
        TRadio(id: '3', title: '单2'),
        TRadio(id: '4', title: '单3'),
        TRadio(id: '5', title: '单4'),
        TRadio(id: '6', title: '单5'),
      ],
    );
  }
```

#### 1 组件状态

单选框状态

```
  Widget _radioStatus(BuildContext context) {
    return TRadioGroup(
      contentDirection: TContentDirection.right,
      selectId: '0',
      child: const Column(
        children: [
          TRadio(
            id: '0',
            title: '选项禁用-已选',
            radioStyle: TRadioStyle.circle,
            enable: false,
          ),
          TRadio(
            id: '1',
            title: '选项禁用-默认',
            radioStyle: TRadioStyle.circle,
            enable: false,
          ),
        ],
      ),
    );
  }
```

#### 1 组件样式

勾选样式

```
  Widget _checkStyle(BuildContext context) {
    return Column(
      children: [
        TRadioGroup(
          radioCheckStyle: TRadioStyle.check,
          selectId: 'index:0',
          child: const TRadio(
            id: 'index:0',
            title: '单选',
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        TRadioGroup(
          radioCheckStyle: TRadioStyle.hollowCircle,
          selectId: 'index:0',
          child: const TRadio(
            id: 'index:0',
            title: '单选',
          ),
        )
      ],
    );
  }
```

勾选显示位置

```
  Widget _checkPosition(BuildContext context) {
    return Column(
      children: [
        TRadioGroup(
          contentDirection: TContentDirection.right,
          selectId: 'index:0',
          child: const TRadio(
            id: 'index:0',
            title: '单选',
          ),
        ),
        TRadioGroup(
          contentDirection: TContentDirection.left,
          selectId: 'index:0',
          child: const TRadio(
            id: 'index:0',
            title: '单选',
            showDivider: false,
          ),
        )
      ],
    );
  }
```

非通栏单选样式

```
  Widget _passThroughStyle(BuildContext context) {
    return TRadioGroup(
      selectId: 'index:0',
      passThrough: true,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var title = '单选';
          return TRadio(
            id: 'index:$index',
            title: title,
            size: TCheckBoxSize.large,
          );
        },
        itemCount: 4,
      ),
    );
  }
```

#### 1 特殊样式

纵向卡片单选框

```
  Widget _verticalCardStyle(BuildContext context) {
    return TRadioGroup(
      selectId: 'index:1',
      cardMode: true,
      direction: Axis.vertical,
      directionalTdRadios: const [
        TRadio(
          id: 'index:0',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        TRadio(
          id: 'index:1',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        TRadio(
          id: 'index:2',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        TRadio(
          id: 'index:3',
          title: '单选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
      ],
    );
  }
```

横向卡片单选框

```
  Widget _horizontalCardStyle(BuildContext context) {
    return TRadioGroup(
      selectId: 'index:1',
      cardMode: true,
      direction: Axis.horizontal,
      rowCount: 2,
      directionalTdRadios: const [
        TRadio(
          id: 'index:0',
          title: '单选',
          cardMode: true,
        ),
        TRadio(
          id: 'index:1',
          title: '单选',
          cardMode: true,
        ),
        TRadio(
          id: 'index:2',
          title: '单选',
          cardMode: true,
        ),
        TRadio(
          id: 'index:3',
          title: '单选',
          cardMode: true,
        ),
      ],
    );
  }
```

## API

1. [TRadio](#tradio)
2. [TRadioGroup](#tradiogroup)
3. [TRadioStyle](#tradiostyle)
4. [OnRadioGroupChange](#onradiogroupchange)

#### TRadio

##### 简介

单选框按钮,继承自TCheckbox，字段含义与父类一致

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | - |
| cardMode | bool? | - | - |
| checkBoxLeftSpace | double? | - | - |
| contentDirection | TContentDirection | TContentDirection.right | - |
| customContentBuilder | ContentBuilder? | - | - |
| customIconBuilder | IconBuilder? | - | - |
| customSpace | EdgeInsetsGeometry? | - | - |
| disableColor | Color? | - | - |
| enable | bool | true | - |
| id | String? | - | - |
| insetSpacing | double? | - | - |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| radioStyle | TRadioStyle | TRadioStyle.circle | 单选框按钮样式 |
| selectColor | Color? | - | - |
| showDivider | bool? | - | - |
| size | TCheckBoxSize | TCheckBoxSize.small | - |
| spacing | double? | - | - |
| subTitle | String? | - | - |
| subTitleColor | Color? | - | - |
| subTitleFont | Font? | - | - |
| subTitleMaxLine | int | 1 | - |
| title | String? | - | - |
| titleColor | Color? | - | - |
| titleFont | Font? | - | - |
| titleMaxLine | int | 1 | - |

#### TRadioGroup

##### 简介

RadioGroup分组对象，继承自TCheckboxGroup，字段含义与父类一致
RadioGroup应该嵌套在RadioGroup内，所有在RadioGroup的RadioButton只能有一个被选中
cardMode: 使用卡片样式，需要配合direction 和 directionalTdRadios 使用，
组合为横向、纵向卡片，同时需要在每个TRadio上设置cardMode参数。

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| cardMode | bool | false | - |
| child | Widget? | - | - |
| contentDirection | TContentDirection? | - | - |
| controller | TCheckboxGroupController? | - | - |
| customContentBuilder | ContentBuilder? | - | - |
| customIconBuilder | IconBuilder? | - | - |
| direction | Axis? | - | - |
| directionalTdRadios | List? | - | - |
| divider | Widget? | - | 自定义下划线 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| onRadioGroupChange | OnRadioGroupChange? | - | - |
| passThrough | bool? | - | - |
| radioCheckStyle | TRadioStyle? | - | 勾选样式 |
| rowCount | int | 1 | 每行几列 |
| selectId | String? | - | - |
| showDivider | bool | false | 是否显示下划线 |
| spacing | double? | - | - |
| strictMode | bool | true | 严格模式下，用户不能取消勾选，只能切换选择项， |
| titleMaxLine | int? | - | - |

#### TRadioStyle

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| circle | - |
| square | - |
| check | - |
| hollowCircle | - |

#### OnRadioGroupChange

##### 类型定义

```dart
typedef OnRadioGroupChange = void Function(String? selectedId);
```

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当用户需要从一组数据选择一个选项时使用。

#### 组件搭配使用

###### 单选框与[索引](<../导航/Indexes 索引.md>)、[搜索框](<Search 搜索框.md>)组合使用，便于用户从大量的选项中，快速地找到目标选项。

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-2.png)

#### 推荐/慎用示例

###### 带有详情信息的选项，建议就近展开相关内容，不太建议用单选框触发一个弹窗。

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 不建议用单选框开启/关闭一个功能，建议使用开关组件。

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [多选框](<CheckBox 多选框.md>) | 当用户需要从一组数据选择多个选项时使用。 |
