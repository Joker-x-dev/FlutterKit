# Cascader 级联选择器

> 用于多层级数据的逐级选择

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/cascader)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_cascader_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_cascader_page.dart)

#### 1 组件类型

垂直级联选择器

```
  Widget _buildVerticalCascader(BuildContext context) {
    const title = '选择地址';
    return TDCell(
        title: title,
        note: _selected_1,
        arrow: true,
        onClick: (click) {
          TDCascader.showMultiCascader(context,
              title: title,
              data: _data,
              initialData: _initData,
              theme: 'step', onChange: (List selectData) {
            setState(() {
              var result = [];
              var len = selectData.length;
              _initData = selectData[len - 1].value!;
              selectData.forEach((element) {
                result.add(element.label);
              });
              _selected_1 = result.join('/');
            });
          }, onClose: () {
            Navigator.of(context).pop();
          });
        });
  }
```

垂直级联选择器-带字母定位

```
  Widget _buildVerticalLetterCascader(BuildContext context) {
    const title = '选择地址';
    return TDCell(
        title: title,
        note: _selected_2,
        arrow: true,
        onClick: (click) {
          TDCascader.showMultiCascader(context,
              title: title,
              data: _data_2,
              initialData: _initData_2,
              theme: 'step', onChange: (List selectData) {
            setState(() {
              var result = [];
              var len = selectData.length;
              _initData_2 = selectData[len - 1].value!;
              selectData.forEach((element) {
                result.add(element.label);
              });
              _selected_2 = result.join('/');
            });
          }, onClose: () {
            Navigator.of(context).pop();
          });
        });
  }
```

水平级联选择器

```
  Widget _buildHorizontalCascader(BuildContext context) {
    const title = '选择地址';
    return TDCell(
        title: title,
        note: _selected_1,
        arrow: true,
        onClick: (click) {
          TDCascader.showMultiCascader(context,
              title: title,
              subTitles: ['请选择省份', '请选择城市', '请选择区/县'],
              data: _data,
              initialData: _initData,
              theme: 'tab', onChange: (List selectData) {
            setState(() {
              var result = [];
              var len = selectData.length;
              _initData = selectData[len - 1].value!;
              selectData.forEach((element) {
                result.add(element.label);
              });
              _selected_1 = result.join('/');
            });
          }, onClose: () {
            Navigator.of(context).pop();
          });
        });
  }
```

水平级联选择器-带字母定位

```
  Widget _buildHorizontalLetterCascader(BuildContext context) {
    const title = '选择地址';
    return TDCell(
        title: title,
        note: _selected_2,
        arrow: true,
        onClick: (click) {
          TDCascader.showMultiCascader(context,
              title: title,
              data: _data_2,
              initialData: _initData_2,
              isLetterSort: true,
              theme: 'tab', onChange: (List selectData) {
            setState(() {
              var result = [];
              var len = selectData.length;
              _initData_2 = selectData[len - 1].value!;
              selectData.forEach((element) {
                result.add(element.label);
              });
              _selected_2 = result.join('/');
            });
          }, onClose: () {
            Navigator.of(context).pop();
          });
        });
  }
```

水平级联选择器-部门

```
  Widget _buildHorizontalCompanyCascader(BuildContext context) {
    const title = '选择部门人员';
    return TDCell(
        title: title,
        note: _selected_3,
        arrow: true,
        onClick: (click) {
          TDCascader.showMultiCascader(context,
              title: title,
              data: _data_3,
              isLetterSort: true,
              initialData: _initData_3,
              theme: 'tab', onChange: (List selectData) {
            setState(() {
              var result = [];
              var len = selectData.length;
              _initData_3 = selectData[len - 1].value!;
              selectData.forEach((element) {
                result.add(element.label);
              });
              _selected_3 = result.join('/');
            });
          }, onClose: () {
            Navigator.of(context).pop();
          });
        });
  }
```

垂直级联选择器-部门

```
  Widget _buildVerticalCompanyCascader(BuildContext context) {
    const title = '选择部门人员';
    return TDCell(
        title: title,
        note: _selected_3,
        arrow: true,
        onClick: (click) {
          TDCascader.showMultiCascader(context,
              title: title,
              data: _data_3,
              isLetterSort: true,
              initialData: _initData_3,
              theme: 'step', onChange: (List selectData) {
            setState(() {
              var result = [];
              var len = selectData.length;
              _initData_3 = selectData[len - 1].value!;
              selectData.forEach((element) {
                result.add(element.label);
              });
              _selected_3 = result.join('/');
            });
          }, onClose: () {
            Navigator.of(context).pop();
          });
        });
  }
```

## API

1. [TDMultiCascader](#tdmulticascader)

#### TDMultiCascader

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| action | TDCascaderAction? | - | 自定义选择器右上角按钮 |
| backgroundColor | Color? | - | 背景颜色 |
| cascaderHeight | double | - | 选择器List的视窗高度，默认200 |
| closeText | String? | - | 关闭按钮文本 |
| data | List | - | 选择器的数据源 |
| initialData | String? | - | 初始化数据 |
| initialIndexes | List? | - | 若为null表示全部从零开始 |
| isLetterSort | bool | false | 是否开启字母排序 |
| key |  | - |  |
| onChange | MultiCascaderCallback | - | 值发生变更时触发 |
| onClose | Function? | - | 选择器关闭按钮回调 |
| subTitles | List? | - | 每级展示的次标题 |
| theme | String? | - | 展示风格 可选项：step/tab |
| title | String? | - | 选择器标题 |
| titleStyle | TextStyle? | - | 标题样式 |
| topRadius | double? | - | 顶部圆角 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当一组选项由递进层级构成，且每个层级有大量的选项需要用户逐级选择时使用。

#### 组件搭配使用

###### 级联选择器与[索引](<../导航/Indexes 索引.md>)组合使用，当每个层级选项较多时，配合索引有利于用户快速找到目标选项。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-1.png)

#### 常见用法

###### 在表单中，级联选择器可放置于表单内容需要的顺序中，通常用于地址信息的选择和填写。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-2.png)

#### 推荐/慎用示例

###### 级联选择器的层级不宜超过4层，层级过多时应调整数据结构或改用其他交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 在多层级中，各层级选项的归属关系应具备逻辑相关性，数据层级由大到小，避免归属关系混乱。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [选择器](<Picker 选择器.md>) | 当需要在有限的空间展示大量选项供用户选择，或者一组选项由递进层级构成需要用户逐级选择时使用。 |
