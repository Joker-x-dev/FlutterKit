# Button 按钮

> 用于开启一个闭环的操作任务，如“删除”对象、“购买”商品等。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/button)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_button_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_button_page.dart)

#### 1 组件类型

基础按钮

```
  @Demo(group: 'button')
  TDButton _buildPrimaryFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildLightFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.light,
    );
  }
```


```
  TDButton _buildDefaultFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.defaultTheme,
    );
  }
```


```
  TDButton _buildPrimaryStrokeButton(BuildContext context) {
    return const TDButton(
      text: '描边按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildPrimaryTextButton(BuildContext context) {
    return const TDButton(
      text: '文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.text,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```

图标按钮

```
  TDButton _buildRectangleIconButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      icon: TDIcons.app,
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildSquareIconButton(BuildContext context) {
    return const TDButton(
      icon: TDIcons.app,
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.square,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildLoadingIconButton(BuildContext context) {
    return TDButton(
      text: '加载中',
      iconWidget: TDLoading(
        size: TDLoadingSize.small,
        icon: TDLoadingIcon.circle,
        iconColor: TDTheme.of(context).whiteColor1,
      ),
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```

幽灵按钮

```
  TDButton _buildPrimaryGhostButton(BuildContext context) {
    return const TDButton(
      text: '幽灵按钮',
      size: TDButtonSize.large,
      type: TDButtonType.ghost,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildDangerGhostButton(BuildContext context) {
    return const TDButton(
      text: '幽灵按钮',
      size: TDButtonSize.large,
      type: TDButtonType.ghost,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.danger,
    );
  }
```


```
  TDButton _buildDefaultGhostButton(BuildContext context) {
    return const TDButton(
      text: '幽灵按钮',
      size: TDButtonSize.large,
      type: TDButtonType.ghost,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.defaultTheme,
    );
  }
```

组合按钮

```
  Widget _buildCombinationButtons(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          // spacing: 16,
          children: [
            Expanded(
              child: TDButton(
                text: '填充按钮',
                size: TDButtonSize.large,
                type: TDButtonType.fill,
                shape: TDButtonShape.rectangle,
                theme: TDButtonTheme.light,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TDButton(
                text: '填充按钮',
                size: TDButtonSize.large,
                type: TDButtonType.fill,
                shape: TDButtonShape.rectangle,
                theme: TDButtonTheme.primary,
              ),
            ),
          ],
        ));
  }
```

通栏按钮

```
  TDButton _buildFilledFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      icon: TDIcons.app,
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      theme: TDButtonTheme.primary,
      isBlock: true,
    );
  }
```

#### 1 组件状态

按钮禁用状态

```
  TDButton _buildDisablePrimaryFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
      disabled: true,
    );
  }
```


```
  TDButton _buildDisableLightFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.light,
      disabled: true,
    );
  }
```


```
  TDButton _buildDisableDefaultFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.defaultTheme,
      disabled: true,
    );
  }
```


```
  TDButton _buildDisablePrimaryStrokeButton(BuildContext context) {
    return const TDButton(
      text: '描边按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
      disabled: true,
    );
  }
```


```
  TDButton _buildDisablePrimaryTextButton(BuildContext context) {
    return const TDButton(
      text: '文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.text,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
      disabled: true,
    );
  }
```

#### 1 组件主题

按钮尺寸

```
  TDButton _buildLargeButton(BuildContext context) {
    return const TDButton(
      text: '按钮48',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildMediumButton(BuildContext context) {
    return const TDButton(
      text: '按钮40',
      size: TDButtonSize.medium,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildSmallButton(BuildContext context) {
    return const TDButton(
      text: '按钮32',
      size: TDButtonSize.small,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildExtraSmallButton(BuildContext context) {
    return const TDButton(
      text: '按钮28',
      size: TDButtonSize.extraSmall,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```

按钮形状

```
  @Demo(group: 'button')
  TDButton _buildPrimaryFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildSquareIconButton(BuildContext context) {
    return const TDButton(
      icon: TDIcons.app,
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.square,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildRoundButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.round,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildCircleButton(BuildContext context) {
    return const TDButton(
      icon: TDIcons.app,
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.circle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildFilledButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.filled,
      theme: TDButtonTheme.primary,
    );
  }
```

按钮主题

```
  TDButton _buildDefaultFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.defaultTheme,
    );
  }
```


```
  TDButton _buildDefaultStrokeButton(BuildContext context) {
    return const TDButton(
      text: '描边按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.defaultTheme,
    );
  }
```


```
  TDButton _buildDefaultTextButton(BuildContext context) {
    return const TDButton(
      text: '文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.text,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.defaultTheme,
    );
  }
```


```
  @Demo(group: 'button')
  TDButton _buildPrimaryFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildPrimaryStrokeButton(BuildContext context) {
    return const TDButton(
      text: '描边按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildPrimaryTextButton(BuildContext context) {
    return const TDButton(
      text: '文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.text,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.primary,
    );
  }
```


```
  TDButton _buildDangerFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.danger,
    );
  }
```


```
  TDButton _buildDangerStrokeButton(BuildContext context) {
    return const TDButton(
      text: '描边按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.danger,
    );
  }
```


```
  TDButton _buildDangerTextButton(BuildContext context) {
    return const TDButton(
      text: '文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.text,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.danger,
    );
  }
```


```
  TDButton _buildLightFillButton(BuildContext context) {
    return const TDButton(
      text: '填充按钮',
      size: TDButtonSize.large,
      type: TDButtonType.fill,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.light,
    );
  }
```


```
  TDButton _buildLightStrokeButton(BuildContext context) {
    return const TDButton(
      text: '描边按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.light,
    );
  }
```


```
  TDButton _buildLightTextButton(BuildContext context) {
    return const TDButton(
      text: '文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.text,
      shape: TDButtonShape.rectangle,
      theme: TDButtonTheme.light,
    );
  }
```

## API

1. [TDButton](#tdbutton)
2. [TDButtonStyle](#tdbuttonstyle)

#### TDButton

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| activeStyle | TDButtonStyle? | - | 自定义点击样式，有则优先用它，没有则根据 type 和 theme 选取 |
| child | Widget? | - | 自控件 |
| disabled | bool | false | 禁止点击 |
| disableStyle | TDButtonStyle? | - | 自定义禁用样式，有则优先用它，没有则根据 type 和 theme 选取 |
| disableTextStyle | TextStyle? | - | 自定义不可点击状态文本样式 |
| gradient | Gradient? | - | 渐变背景色，优先级高于backgroundColor |
| height | double? | - | 自定义高度 |
| icon | IconData? | - | 图标icon |
| iconPosition | TDButtonIconPosition? | TDButtonIconPosition.left | 图标位置 |
| iconTextSpacing | double? | - | 自定义图标与文本之间距离 |
| iconWidget | Widget? | - | 自定义图标 icon 控件 |
| isBlock | bool | false | 是否为通栏按钮 |
| key |  | - |  |
| margin | EdgeInsetsGeometry? | - | 自定义 margin |
| onLongPress | TDButtonEvent? | - | 长按事件 |
| onTap | TDButtonEvent? | - | 点击事件 |
| padding | EdgeInsetsGeometry? | - | 自定义 padding |
| shape | TDButtonShape | TDButtonShape.rectangle | 形状：圆角，胶囊，方形，圆形，填充 |
| size | TDButtonSize | TDButtonSize.medium | 尺寸 |
| style | TDButtonStyle? | - | 自定义样式，有则优先用它，没有则根据 type 和 theme 选取。如果设置了 style，则 activeStyle 和 disableStyle 也应该设置 |
| text | String? | - | 文本内容 |
| textStyle | TextStyle? | - | 自定义可点击状态文本样式 |
| theme | TDButtonTheme? | - | 主题 |
| type | TDButtonType | TDButtonType.fill | 类型：填充，描边，文字 |
| width | double? | - | 自定义宽度 |

#### TDButtonStyle

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| frameColor | Color? | - | 边框颜色 |
| frameWidth | double? | - | 边框宽度 |
| gradient | Gradient? | - | 渐变背景色 |
| radius | BorderRadiusGeometry? | - | 自定义圆角 |
| textColor | Color? | - | 文字颜色 |

##### 工厂构造方法

| 名称 | 说明 |
| --- | --- |
| TDButtonStyle.generateFillStyleByTheme | 生成不同主题的填充按钮样式 |
| TDButtonStyle.generateGhostStyleByTheme | 生成不同主题的幽灵按钮样式 |
| TDButtonStyle.generateOutlineStyleByTheme | 生成不同主题的描边按钮样式 |
| TDButtonStyle.generateTextStyleByTheme | 生成不同主题的文本按钮样式 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

当前流程的结束或新流程的开启需要用户点击触发时使用。

#### 组件搭配使用

###### 图标按钮与[输入框](<../输入/Input 输入框.md>)组合使用，放置于输入单元格最右侧，用于触发拉起一个新的支流任务，辅助用户填入正确内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-1.png)

---

###### 不同类型的主次按钮与文字按钮组合使用，可以表达不同强调级别。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-2.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-3.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-4.png)

#### 常见用法

###### 当在填写场景，按钮通常作为当前流程的结束操作，在表单过长时通常需要吸顶或吸底处理。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-5.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-6.png)

#### 推荐/慎用示例

###### 用户在使用主、次按钮时，需要表达主次关系，突出强调的最主要操作，其他操作使用次按钮，不建议同时使用多个主按钮。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [链接](<Link 链接.md>) | 当需要外链跳转或页面底部footer链接跳转时使用。 |
