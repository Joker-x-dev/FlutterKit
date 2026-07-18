# Tag 标签

> 用于表明主体的类目，属性或状态

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/tag)
> 归档时间：2026-07-16T07:37:59.655Z

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
  TDTag _buildSimpleFillTag(BuildContext context) {
    return const TDTag('标签文字');
  }
```


```
  TDTag _buildSimpleOutlineTag(BuildContext context) {
    return const TDTag(
      '标签文字',
      isOutline: true,
    );
  }
```

圆弧标签

```
  Widget _buildCircleFillTag(BuildContext context) {
    return const TDTag(
      '标签文字',
      shape: TDTagShape.round,
    );
  }
```


```
  Widget _buildCircleOutlineTag(BuildContext context) {
    return const TDTag(
      '标签文字',
      shape: TDTagShape.round,
      isOutline: true,
    );
  }
```

Mark标签

```
  Widget _buildMarkFillTag(BuildContext context) {
    return const TDTag(
      '标签文字',
      shape: TDTagShape.mark,
    );
  }
```


```
  Widget _buildMarkOutlineTag(BuildContext context) {
    return const TDTag(
      '标签文字',
      shape: TDTagShape.mark,
      isOutline: true,
    );
  }
```

带图标的标签

```
  Widget _buildIconFillTag(BuildContext context) {
    return const TDTag(
      '标签文字',
      icon: TDIcons.discount,
    );
  }
```


```
  Widget _buildIconOutlineTag(BuildContext context) {
    return const TDTag(
      '标签文字',
      icon: TDIcons.discount,
      isOutline: true,
    );
  }
```

可关闭的标签

```
  Widget _buildCloseFillTag(BuildContext context) {
    return TDTag(
      '标签文字',
      needCloseIcon: true,
      onCloseTap: () {
        TDToast.showText('点击关闭', context: context);
      },
    );
  }
```


```
  Widget _buildCloseOutlineTag(BuildContext context) {
    return TDTag('标签文字', needCloseIcon: true, isOutline: true, onCloseTap: () {
      TDToast.showText('点击关闭', context: context);
    });
  }
```

可选中的标签

```
  Widget _buildDarkSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TDSelectTag(
        '未选中态',
        theme: TDTagTheme.primary,
      ),
      TDSelectTag(
        '已选中态',
        theme: TDTagTheme.primary,
        isSelected: true,
      ),
      TDSelectTag(
        '不可选态',
        theme: TDTagTheme.primary,
        disableSelect: true,
      ),
    ]);
  }
```


```
  Widget _buildLightSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TDSelectTag(
        '未选中态',
        theme: TDTagTheme.primary,
        isLight: true,
      ),
      TDSelectTag(
        '已选中态',
        theme: TDTagTheme.primary,
        isLight: true,
        isSelected: true,
      ),
      TDSelectTag(
        '不可选态',
        theme: TDTagTheme.primary,
        isLight: true,
        disableSelect: true,
      ),
    ]);
  }
```


```
  Widget _buildOutlineSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TDSelectTag(
        '未选中态',
        theme: TDTagTheme.primary,
        isOutline: true,
      ),
      TDSelectTag(
        '已选中态',
        theme: TDTagTheme.primary,
        isOutline: true,
        isSelected: true,
      ),
      TDSelectTag(
        '不可选态',
        theme: TDTagTheme.primary,
        isOutline: true,
        disableSelect: true,
      ),
    ]);
  }
```


```
  Widget _buildLightOutlineSelectTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TDSelectTag(
        '未选中态',
        theme: TDTagTheme.primary,
        isOutline: true,
        isLight: true,
      ),
      TDSelectTag(
        '已选中态',
        theme: TDTagTheme.primary,
        isOutline: true,
        isLight: true,
        isSelected: true,
      ),
      TDSelectTag(
        '不可选态',
        theme: TDTagTheme.primary,
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
        TDTag('默认', isLight: true),
        TDTag(
          '主要',
          isLight: true,
          theme: TDTagTheme.primary,
        ),
        TDTag(
          '警告',
          isLight: true,
          theme: TDTagTheme.warning,
        ),
        TDTag(
          '危险',
          isLight: true,
          theme: TDTagTheme.danger,
        ),
        TDTag(
          '成功',
          isLight: true,
          theme: TDTagTheme.success,
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
        TDTag('默认'),
        TDTag(
          '主要',
          theme: TDTagTheme.primary,
        ),
        TDTag(
          '警告',
          theme: TDTagTheme.warning,
        ),
        TDTag(
          '危险',
          theme: TDTagTheme.danger,
        ),
        TDTag(
          '成功',
          theme: TDTagTheme.success,
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
        TDTag('默认', isOutline: true),
        TDTag(
          '主要',
          isOutline: true,
          theme: TDTagTheme.primary,
        ),
        TDTag(
          '警告',
          isOutline: true,
          theme: TDTagTheme.warning,
        ),
        TDTag(
          '危险',
          isOutline: true,
          theme: TDTagTheme.danger,
        ),
        TDTag(
          '成功',
          isOutline: true,
          theme: TDTagTheme.success,
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
        TDTag('默认', isOutline: true, isLight: true),
        TDTag(
          '主要',
          isOutline: true,
          isLight: true,
          theme: TDTagTheme.primary,
        ),
        TDTag(
          '警告',
          isOutline: true,
          isLight: true,
          theme: TDTagTheme.warning,
        ),
        TDTag(
          '危险',
          isOutline: true,
          isLight: true,
          theme: TDTagTheme.danger,
        ),
        TDTag(
          '成功',
          isOutline: true,
          isLight: true,
          theme: TDTagTheme.success,
        ),
      ],
    );
  }
```

#### 1 组件尺寸

```
  Widget _buildAllSizeTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TDTag(
        '加大尺寸',
        size: TDTagSize.extraLarge,
      ),
      TDTag(
        '大尺寸',
        size: TDTagSize.large,
      ),
      TDTag(
        '中尺寸',
        size: TDTagSize.medium,
      ),
      TDTag(
        '小尺寸',
        size: TDTagSize.small,
      ),
    ]);
  }
```


```
  Widget _buildAllSizeCloseTags(BuildContext context) {
    return const Wrap(spacing: 8, children: [
      TDTag(
        '加大尺寸',
        needCloseIcon: true,
        size: TDTagSize.extraLarge,
      ),
      TDTag(
        '大尺寸',
        needCloseIcon: true,
        size: TDTagSize.large,
      ),
      TDTag(
        '中尺寸',
        needCloseIcon: true,
        size: TDTagSize.medium,
      ),
      TDTag(
        '小尺寸',
        needCloseIcon: true,
        size: TDTagSize.small,
      ),
    ]);
  }
```

## API

1. [TDTagStyle](#tdtagstyle)
2. [TDSelectTag](#tdselecttag)
3. [TDTag](#tdtag)

#### TDTagStyle

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

##### 工厂构造方法

| 名称 | 说明 |
| --- | --- |
| TDTagStyle.generateDisableSelectStyle | 根据主题生成禁用Tag样式 |
| TDTagStyle.generateFillStyleByTheme | 根据主题生成填充Tag样式 |
| TDTagStyle.generateOutlineStyleByTheme | 根据主题生成描边Tag样式 |

#### TDSelectTag

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| disableSelect | bool | false | 是否禁用选择 |
| disableSelectStyle | TDTagStyle? | - | 不可选标签样式 |
| fixedWidth | double? | - | 标签的固定宽度 |
| forceVerticalCenter | bool | true | 是否强制中文文字居中 |
| icon | IconData? | - | 图标内容，可随状态改变颜色 |
| iconWidget | Widget? | - | 自定义图标内容，需自处理颜色 |
| isLight | bool | false | 是否为浅色 |
| isOutline | bool | false | 是否为描边类型，默认不是 |
| isSelected | bool | false | 是否选中 |
| key |  | - |  |
| needCloseIcon | bool | false | 关闭图标 |
| onCloseTap | GestureTapCallback? | - | 关闭图标点击事件 |
| onSelectChanged | ValueChanged? | - | 标签点击，选中状态改变时的回调 |
| padding | EdgeInsets? | - | 自定义模式下的间距 |
| selectStyle | TDTagStyle? | - | 选中的标签样式 |
| shape | TDTagShape | TDTagShape.square | 标签形状 |
| size | TDTagSize | TDTagSize.medium | 标签大小 |
| text | String | text | 标签内容 |
| theme | TDTagTheme? | - | 主题 |
| unSelectStyle | TDTagStyle? | - | 未选中标签样式 |

#### TDTag

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
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
| key |  | - |  |
| needCloseIcon | bool | false | 关闭图标 |
| onCloseTap | GestureTapCallback? | - | 关闭图标点击事件 |
| overflow | TextOverflow? | - | 文字溢出处理 |
| padding | EdgeInsets? | - | 自定义模式下的间距 |
| shape | TDTagShape | TDTagShape.square | 标签形状 |
| size | TDTagSize | TDTagSize.medium | 标签大小 |
| style | TDTagStyle? | - | 标签样式 |
| text | String | text | 标签内容 |
| textColor | Color? | - | 文字颜色，优先级高于style的textColor |
| theme | TDTagTheme? | - | 主题 |

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
