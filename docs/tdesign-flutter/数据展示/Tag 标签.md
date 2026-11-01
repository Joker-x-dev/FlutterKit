# Tag 标签

> 用于表明主体的类目，属性或状态

> 来源：[Tag 标签](https://tdesign.tencent.com/flutter/components/tag)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_tag_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_tag_page.dart)

#### 1 组件类型

基础标签

```
  TTag _buildSimpleFillTag(BuildContext context) {
    return const TTag('标签文字');
  }
```


```
  TTag _buildSimpleOutlineTag(BuildContext context) {
    return const TTag(
      '标签文字',
      isOutline: true,
    );
  }
```

圆弧标签

```
  Widget _buildCircleFillTag(BuildContext context) {
    return const TTag(
      '标签文字',
      shape: TTagShape.round,
    );
  }
```


```
  Widget _buildCircleOutlineTag(BuildContext context) {
    return const TTag(
      '标签文字',
      shape: TTagShape.round,
      isOutline: true,
    );
  }
```

Mark标签

```
  Widget _buildMarkFillTag(BuildContext context) {
    return const TTag(
      '标签文字',
      shape: TTagShape.mark,
    );
  }
```


```
  Widget _buildMarkOutlineTag(BuildContext context) {
    return const TTag(
      '标签文字',
      shape: TTagShape.mark,
      isOutline: true,
    );
  }
```

带图标的标签

```
  Widget _buildIconFillTag(BuildContext context) {
    return const TTag(
      '标签文字',
      icon: TIcons.discount,
    );
  }
```


```
  Widget _buildIconOutlineTag(BuildContext context) {
    return const TTag(
      '标签文字',
      icon: TIcons.discount,
      isOutline: true,
    );
  }
```

可关闭的标签

```
  Widget _buildCloseFillTag(BuildContext context) {
    return TTag(
      '标签文字',
      needCloseIcon: true,
      onCloseTap: () {
        TToast.showText('点击关闭', context: context);
      },
    );
  }
```


```
  Widget _buildCloseOutlineTag(BuildContext context) {
    return TTag('标签文字', needCloseIcon: true, isOutline: true, onCloseTap: () {
      TToast.showText('点击关闭', context: context);
    });
  }
```

可选中的标签

```
  Widget _buildDarkSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TSelectTag(
        '未选中态',
        theme: TTagTheme.primary,
      ),
      TSelectTag(
        '已选中态',
        theme: TTagTheme.primary,
        isSelected: true,
      ),
      TSelectTag(
        '不可选态',
        theme: TTagTheme.primary,
        disableSelect: true,
      ),
    ]);
  }
```


```
  Widget _buildLightSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TSelectTag(
        '未选中态',
        theme: TTagTheme.primary,
        isLight: true,
      ),
      TSelectTag(
        '已选中态',
        theme: TTagTheme.primary,
        isLight: true,
        isSelected: true,
      ),
      TSelectTag(
        '不可选态',
        theme: TTagTheme.primary,
        isLight: true,
        disableSelect: true,
      ),
    ]);
  }
```


```
  Widget _buildOutlineSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TSelectTag(
        '未选中态',
        theme: TTagTheme.primary,
        isOutline: true,
      ),
      TSelectTag(
        '已选中态',
        theme: TTagTheme.primary,
        isOutline: true,
        isSelected: true,
      ),
      TSelectTag(
        '不可选态',
        theme: TTagTheme.primary,
        isOutline: true,
        disableSelect: true,
      ),
    ]);
  }
```


```
  Widget _buildLightOutlineSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TSelectTag(
        '未选中态',
        theme: TTagTheme.primary,
        isOutline: true,
        isLight: true,
      ),
      TSelectTag(
        '已选中态',
        theme: TTagTheme.primary,
        isOutline: true,
        isLight: true,
        isSelected: true,
      ),
      TSelectTag(
        '不可选态',
        theme: TTagTheme.primary,
        isOutline: true,
        isLight: true,
        disableSelect: true,
      ),
    ]);
  }
```

#### 1 组件状态（主题）

展示型标签

```
  Widget _buildLightShowTags(BuildContext context) {
    return const Wrap(
      spacing: 8,
      children: [
        TTag('默认', isLight: true),
        TTag(
          '主要',
          isLight: true,
          theme: TTagTheme.primary,
        ),
        TTag(
          '警告',
          isLight: true,
          theme: TTagTheme.warning,
        ),
        TTag(
          '危险',
          isLight: true,
          theme: TTagTheme.danger,
        ),
        TTag(
          '成功',
          isLight: true,
          theme: TTagTheme.success,
        ),
      ],
    );
  }
```


```
  Widget _buildDarkShowTags(BuildContext context) {
    return const Wrap(
      spacing: 8,
      children: [
        TTag('默认'),
        TTag(
          '主要',
          theme: TTagTheme.primary,
        ),
        TTag(
          '警告',
          theme: TTagTheme.warning,
        ),
        TTag(
          '危险',
          theme: TTagTheme.danger,
        ),
        TTag(
          '成功',
          theme: TTagTheme.success,
        ),
      ],
    );
  }
```


```
  Widget _buildOutlineShowTags(BuildContext context) {
    return const Wrap(
      spacing: 8,
      children: [
        TTag('默认', isOutline: true),
        TTag(
          '主要',
          isOutline: true,
          theme: TTagTheme.primary,
        ),
        TTag(
          '警告',
          isOutline: true,
          theme: TTagTheme.warning,
        ),
        TTag(
          '危险',
          isOutline: true,
          theme: TTagTheme.danger,
        ),
        TTag(
          '成功',
          isOutline: true,
          theme: TTagTheme.success,
        ),
      ],
    );
  }
```


```
  Widget _buildLightOutlineShowTags(BuildContext context) {
    return const Wrap(
      spacing: 8,
      children: [
        TTag('默认', isOutline: true, isLight: true),
        TTag(
          '主要',
          isOutline: true,
          isLight: true,
          theme: TTagTheme.primary,
        ),
        TTag(
          '警告',
          isOutline: true,
          isLight: true,
          theme: TTagTheme.warning,
        ),
        TTag(
          '危险',
          isOutline: true,
          isLight: true,
          theme: TTagTheme.danger,
        ),
        TTag(
          '成功',
          isOutline: true,
          isLight: true,
          theme: TTagTheme.success,
        ),
      ],
    );
  }
```

#### 1 组件尺寸

```
  Widget _buildAllSizeTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TTag(
        '加大尺寸',
        size: TTagSize.extraLarge,
      ),
      TTag(
        '大尺寸',
        size: TTagSize.large,
      ),
      TTag(
        '中尺寸',
        size: TTagSize.medium,
      ),
      TTag(
        '小尺寸',
        size: TTagSize.small,
      ),
    ]);
  }
```


```
  Widget _buildAllSizeCloseTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TTag(
        '加大尺寸',
        needCloseIcon: true,
        size: TTagSize.extraLarge,
      ),
      TTag(
        '大尺寸',
        needCloseIcon: true,
        size: TTagSize.large,
      ),
      TTag(
        '中尺寸',
        needCloseIcon: true,
        size: TTagSize.medium,
      ),
      TTag(
        '小尺寸',
        needCloseIcon: true,
        size: TTagSize.small,
      ),
    ]);
  }
```

## API

1. [TTag](#ttag)
2. [TSelectTag](#tselecttag)
3. [TTagStyle](#ttagstyle)
4. [TTagTheme](#ttagtheme)
5. [TTagSize](#ttagsize)
6. [TTagShape](#ttagshape)

#### TTag

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| text | String | - | 标签内容 |
| backgroundColor | Color? | - | 背景颜色，优先级高于style的backgroundColor |
| disable | bool | false | 是否为禁用状态 |
| fixedWidth | double? | - | 标签的固定宽度 |
| font | Font? | - | 字体尺寸，优先级高于style的font |
| fontWeight | FontWeight? | - | 字体粗细，优先级高于style的fontWeight |
| forceVerticalCenter | bool | true | 是否强制中文文字居中 |
| icon | IconData? | - | 图标内容，可随状态改变颜色 |
| iconWidget | Widget? | - | 自定义图标内容，需自处理颜色 |
| isLight | bool | false | 是否为浅色 |
| isOutline | bool | false | 是否为描边类型，默认不是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| needCloseIcon | bool | false | 关闭图标 |
| onCloseTap | GestureTapCallback? | - | 关闭图标点击事件 |
| overflow | TextOverflow? | - | 文字溢出处理 |
| padding | EdgeInsets? | - | 自定义模式下的间距 |
| shape | TTagShape | TTagShape.square | 标签形状 |
| size | TTagSize | TTagSize.medium | 标签大小 |
| style | TTagStyle? | - | 标签样式 |
| textColor | Color? | - | 文字颜色，优先级高于style的textColor |
| theme | TTagTheme? | - | 主题 |

#### TSelectTag

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| text | String | - | 标签内容 |
| disableSelect | bool | false | 是否禁用选择 |
| disableSelectStyle | TTagStyle? | - | 不可选标签样式 |
| fixedWidth | double? | - | 标签的固定宽度 |
| forceVerticalCenter | bool | true | 是否强制中文文字居中 |
| icon | IconData? | - | 图标内容，可随状态改变颜色 |
| iconWidget | Widget? | - | 自定义图标内容，需自处理颜色 |
| isLight | bool | false | 是否为浅色 |
| isOutline | bool | false | 是否为描边类型，默认不是 |
| isSelected | bool | false | 是否选中 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| needCloseIcon | bool | false | 关闭图标 |
| onCloseTap | GestureTapCallback? | - | 关闭图标点击事件 |
| onSelectChanged | ValueChanged? | - | 标签点击，选中状态改变时的回调 |
| padding | EdgeInsets? | - | 自定义模式下的间距 |
| selectStyle | TTagStyle? | - | 选中的标签样式 |
| shape | TTagShape | TTagShape.square | 标签形状 |
| size | TTagSize | TTagSize.medium | 标签大小 |
| theme | TTagTheme? | - | 主题 |
| unSelectStyle | TTagStyle? | - | 未选中标签样式 |

#### TTagStyle

##### 工厂构造方法

###### TTagStyle.generateDisableSelectStyle

根据主题生成禁用Tag样式

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| context | BuildContext | - | 上下文，方便获取主题内容 |
| isLight | bool | - | - |
| isOutline | bool | - | - |
| shape | TTagShape | - | - |

###### TTagStyle.generateFillStyleByTheme

根据主题生成填充Tag样式

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| context | BuildContext | - | 上下文，方便获取主题内容 |
| theme | TTagTheme? | - | - |
| light | bool | - | - |
| shape | TTagShape | - | - |

###### TTagStyle.generateOutlineStyleByTheme

根据主题生成描边Tag样式

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| context | BuildContext | - | 上下文，方便获取主题内容 |
| theme | TTagTheme? | - | - |
| light | bool | - | - |
| shape | TTagShape | - | - |

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| border | double | 0 | 线框粗细 |
| borderColor | Color? | - | 边框颜色 |
| borderRadius | BorderRadiusGeometry? | - | 圆角 |
| context | BuildContext? | - | 上下文，方便获取主题内容 |
| font | Font? | - | 字体尺寸 |
| fontWeight | FontWeight? | - | 字体粗细 |
| textColor | Color? | - | 文字颜色 |

##### 公开属性

| 属性 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| closeIconColor | Color? | - | 关闭图标颜色 |

#### TTagTheme

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| defaultTheme | 默认 |
| primary | 常规 |
| warning | 警告 |
| danger | 危险 |
| success | 成功 |

#### TTagSize

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| extraLarge | - |
| large | - |
| medium | - |
| small | - |
| custom | - |

#### TTagShape

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| square | - |
| round | - |
| mark | - |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当需要展示内容本身的属性、状态、类别、营销情况时作为纯展示使用；或者当大量的内容数据需要根据类型进行选择筛选时使用。

#### 组件搭配使用

###### 与[图片](<Image 图片.md>)组合使用，图片作为内容、商品等对象的详情入口时，可通过添加标签来展示该对象的属性、状态、类别、营销情况等。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-2.png)

---

###### 与[下拉菜单](<../反馈/DropdownMenu 下拉菜单.md>)组合使用，作为菜单面板下拉后的选项，供用户进行选择。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-3.png)

#### 常见用法

###### 常用于展示对象本身的属性、状态、类别、营销情况等信息，且仅作为展示使用。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-5.png)

---

###### 常用于内容数据基于某个维度或某些维度的检索、筛选。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-6.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-7.png)

#### 推荐/慎用示例

###### 标签颜色和字体颜色在明度、色相上要避免难以区分，保证标签的可读性。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 标签文案需要经过概括和提炼，不建议过长。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-9.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [徽标](<Badge 徽标.md>) | 当需要展示特定对象的状态变化或承载运营性质提示时使用。 |
