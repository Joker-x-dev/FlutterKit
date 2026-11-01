# CheckBox 多选框

> 用于预设的一组选项中执行多项选择，并呈现选择结果。

> 来源：[CheckBox 多选框](https://tdesign.tencent.com/flutter/components/checkbox)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_checkbox_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_checkbox_page.dart)

#### 1 组件类型

纵向多选框

```
  Widget _verticalCheckbox(BuildContext context) {
    return TCheckboxGroupContainer(
      selectIds: const ['index:1'],
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var title = '多选';
          var subTitle = '';
          if (index == 2) {
            title = '多选标题多行多选标题多行多选标题多行多选标题多行多选标题多行多选标题多行';
          }
          if (index == 3) {
            subTitle = '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息';
          }
          return TCheckbox(
            id: 'index:$index',
            title: title,
            titleMaxLine: 2,
            subTitleMaxLine: 2,
            subTitle: subTitle,
          );
        },
        itemCount: 4,
      ),
    );
  }
```

横向多选框

```
  Widget _horizontalCheckbox(BuildContext context) {
    return TCheckboxGroupContainer(
      selectIds: const ['1'],
      direction: Axis.horizontal,
      directionalTdCheckboxes: const [
        TCheckbox(
          id: '0',
          title: '多选标题',
          style: TCheckboxStyle.circle,
          insetSpacing: 12,
          showDivider: false,
        ),
        TCheckbox(
          id: '1',
          title: '多选标题',
          style: TCheckboxStyle.circle,
          insetSpacing: 12,
          showDivider: false,
        ),
        TCheckbox(
          id: '2',
          title: '上限四字',
          style: TCheckboxStyle.circle,
          insetSpacing: 12,
          showDivider: false,
        ),
      ],
    );
  }
```

横向多选框-换行

```
  Widget _horizontalCheckboxWrap(BuildContext context) {
    return TCheckboxGroupContainer(
      selectIds: const ['0', '1'],
      direction: Axis.horizontal,
      rowCount: 2,
      directionalTdCheckboxes: const [
        TCheckbox(
          id: '0',
          title: '多选标题0',
          style: TCheckboxStyle.circle,
          insetSpacing: 12,
          showDivider: false,
        ),
        TCheckbox(
          id: '1',
          title: '多选标题1',
          style: TCheckboxStyle.circle,
          insetSpacing: 12,
          showDivider: false,
        ),
        TCheckbox(
          id: '2',
          title: '多选标题2',
          style: TCheckboxStyle.circle,
          insetSpacing: 12,
          showDivider: false,
        ),
        TCheckbox(
          id: '3',
          title: '多选标题3',
          style: TCheckboxStyle.circle,
          insetSpacing: 12,
          showDivider: false,
        ),
      ],
    );
  }
```

带全选多选框

```
  Widget _checkAllSelected(BuildContext context) {
    const itemCount = 4;
    return TCheckboxGroupContainer(
      selectIds: checkIds,
      passThrough: false,
      controller: controller,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var title = '多选';
          if (index == 0) {
            title = '全选';
            return SizedBox(
              height: 56,
              child: TCheckbox(
                id: 'index:$index',
                title: title,
                customIconBuilder: (context, checked) {
                  var length = controller!.allChecked().length -
                      (controller!.checked('index:0') ? 1 : 0);
                  var allCheck = itemCount - 1 == length;
                  var halfSelected =
                      controller != null && !allCheck && length > 0;
                  return getAllIcon(allCheck, halfSelected);
                },
                onCheckBoxChanged: (checked) {
                  if (checked) {
                    controller?.toggleAll(true);
                  } else {
                    controller?.toggleAll(false);
                  }
                },
              ),
            );
          } else {
            return SizedBox(
              height: index == itemCount - 1 ? null : 56,
              child: TCheckbox(
                id: 'index:$index',
                title: title,
                subTitle: index == itemCount - 1
                    ? '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息'
                    : null,
                subTitleMaxLine: 2,
                onCheckBoxChanged: (checked) {
                  var length = controller!.allChecked().length -
                      (controller!.checked('index:0') ? 1 : 0);
                  var allCheck = itemCount - 1 == length;
                  var halfSelected =
                      controller != null && !allCheck && length > 0;
                  controller!.toggle('index:0', allCheck);
                  getAllIcon(allCheck, halfSelected);
                },
              ),
            );
          }
        },
        itemCount: itemCount,
      ),
    );
  }
```

#### 1 组件状态

多选框状态

```
  Widget _checkboxStatus(BuildContext context) {
    return TCheckboxGroupContainer(
      contentDirection: TContentDirection.right,
      selectIds: const ['0'],
      child: const Column(
        children: [
          TCheckbox(
            id: '0',
            title: '选项禁用-已选',
            style: TCheckboxStyle.circle,
            enable: false,
          ),
          TCheckbox(
            id: '1',
            title: '选项禁用-默认',
            style: TCheckboxStyle.circle,
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
        TCheckboxGroupContainer(
          style: TCheckboxStyle.check,
          selectIds: const ['index:0'],
          child: const TCheckbox(
            id: 'index:0',
            title: '多选',
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        TCheckboxGroupContainer(
          style: TCheckboxStyle.square,
          selectIds: const ['index:0'],
          child: const TCheckbox(
            id: 'index:0',
            title: '多选',
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
        TCheckboxGroupContainer(
          contentDirection: TContentDirection.right,
          selectIds: const ['index:0'],
          child: const TCheckbox(
            id: 'index:0',
            title: '多选',
          ),
        ),
        TCheckboxGroupContainer(
          contentDirection: TContentDirection.left,
          selectIds: const ['index:0'],
          child: const TCheckbox(
            id: 'index:0',
            title: '多选',
          ),
        )
      ],
    );
  }
```

非通栏多选样式

```
  Widget _passThroughStyle(BuildContext context) {
    return TCheckboxGroupContainer(
      selectIds: const ['index:0'],
      passThrough: true,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var title = '多选';
          return TCheckbox(
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
    return TCheckboxGroupContainer(
      selectIds: const ['index:1'],
      cardMode: true,
      direction: Axis.vertical,
      directionalTdCheckboxes: const [
        TCheckbox(
          id: 'index:0',
          title: '多选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        TCheckbox(
          id: 'index:1',
          title: '多选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        TCheckbox(
          id: 'index:2',
          title: '多选',
          titleMaxLine: 2,
          subTitleMaxLine: 2,
          subTitle: '描述信息',
          cardMode: true,
        ),
        TCheckbox(
          id: 'index:3',
          title: '多选',
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
    return TCheckboxGroupContainer(
      selectIds: const ['index:1'],
      cardMode: true,
      direction: Axis.horizontal,
      directionalTdCheckboxes: const [
        TCheckbox(
          id: 'index:0',
          title: '多选',
          cardMode: true,
        ),
        TCheckbox(
          id: 'index:1',
          title: '多选',
          cardMode: true,
        ),
        TCheckbox(
          id: 'index:2',
          title: '多选',
          cardMode: true,
        ),
      ],
    );
  }
```

## API

1. [TCheckbox](#tcheckbox)
2. [TCheckboxGroup](#tcheckboxgroup)
3. [TCheckboxStyle](#tcheckboxstyle)
4. [TContentDirection](#tcontentdirection)
5. [TCheckBoxSize](#tcheckboxsize)
6. [IconBuilder](#iconbuilder)
7. [ContentBuilder](#contentbuilder)
8. [OnCheckValueChanged](#oncheckvaluechanged)
9. [OnGroupChange](#ongroupchange)
10. [OnCheckBoxGroupChange](#oncheckboxgroupchange)

#### TCheckbox

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| cardMode | bool | false | 展示为卡片模式 |
| checkBoxLeftSpace | double? | - | 选项框左侧间距 |
| checked | bool | false | 选中状态。默认为`false` 当FuiCheckBox嵌入到FuiCheckBoxGroup的时候，这个值表示初始状态，后续的状态会由Group管理 |
| contentDirection | TContentDirection | TContentDirection.right | 文字相对icon的方位 |
| customContentBuilder | ContentBuilder? | - | 完全自定义内容 |
| customIconBuilder | IconBuilder? | - | 自定义Checkbox显示样式 |
| customSpace | EdgeInsetsGeometry? | - | 自定义组件间距 |
| disableColor | Color? | - | 禁用选择颜色 |
| enable | bool | true | 不可用 |
| id | String? | - | id 当FuiCheckBox嵌入到FuiCheckBoxGroup内时，这个值需要赋值，否则不会被纳入Group管理 |
| insetSpacing | double? | 16 | 文字和非图标侧的距离 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| onCheckBoxChanged | OnCheckValueChanged? | - | 切换监听 |
| selectColor | Color? | - | 选择颜色 |
| showDivider | bool | true | 是否展示分割线 |
| size | TCheckBoxSize | TCheckBoxSize.small | 复选框大小 |
| spacing | double? | - | icon和文字的距离 |
| style | TCheckboxStyle? | - | 复选框样式：圆形或方形 |
| subTitle | String? | - | 辅助文字 |
| subTitleColor | Color? | - | 副标题文字颜色 |
| subTitleFont | Font? | - | 副标题字体大小 |
| subTitleMaxLine | int? | 1 | 辅助文字的行数 |
| title | String? | - | 文本 |
| titleColor | Color? | - | 标题文字颜色 |
| titleFont | Font? | - | 标题字体大小 |
| titleMaxLine | int? | - | 标题的行数 |

#### TCheckboxGroup

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| checkedIds | List? | - | 勾选的CheckBox id列表 |
| child | Widget | - | 可以是任意包含TCheckBox的容器，比如： `Row( children: [ TCheckBox(), TCheckBox(), ... ] )` |
| contentDirection | TContentDirection? | - | 文字相对icon的方位 |
| controller | TCheckboxGroupController? | - | 可以通过控制器操作勾选状态 |
| customContentBuilder | ContentBuilder? | - | CheckBox完全自定义内容 |
| customIconBuilder | IconBuilder? | - | 自定义选择icon的样式 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| maxChecked | int? | - | 最多可以勾选多少 |
| onChangeGroup | OnGroupChange? | - | 状态变化监听器 |
| onOverloadChecked | VoidCallback? | - | 超过最大可勾选的个数 |
| spacing | double? | - | CheckBoxicon和文字的距离 |
| style | TCheckboxStyle? | - | CheckBox复选框样式：圆形或方形 |
| titleMaxLine | int? | - | CheckBox标题的行数 |

#### TCheckboxStyle

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| circle | - |
| square | - |
| check | - |

#### TContentDirection

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| left | - |
| right | - |

#### TCheckBoxSize

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| large | - |
| small | - |

#### IconBuilder

##### 类型定义

```dart
typedef IconBuilder = Widget? Function(BuildContext context, bool checked);
```

#### ContentBuilder

##### 类型定义

```dart
typedef ContentBuilder = Widget Function(BuildContext context, bool checked, String? content);
```

#### OnCheckValueChanged

##### 类型定义

```dart
typedef OnCheckValueChanged = void Function(bool selected);
```

#### OnGroupChange

##### 类型定义

```dart
typedef OnGroupChange = void Function(List<String> checkedIds);
```

#### OnCheckBoxGroupChange

##### 类型定义

```dart
typedef OnCheckBoxGroupChange = void Function(List<String> ids);
```

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

当用户需要从一组数据选择多个选项时使用。

#### 组件搭配使用

###### 多选框与[索引](<../导航/Indexes 索引.md>)、[搜索框](<Search 搜索框.md>)组合使用，便于用户从大量的选项中，快速地找到目标选项。

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-2.png)

#### 推荐/慎用示例

###### 带有详情信息的选项，建议就近展开相关内容，不建议在触发一个弹窗。

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 在选项较多的场景下执行多选时，建议展示用户已选数量。

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [单选框](<Radio 单选框.md>) | 当用户需要从一组数据选择一个选项时使用。 |
