# Dialog 对话框

> 用于显示重要提示或请求用户进行重要操作，一种打断当前操作的模态视图。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/dialog)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_dialog_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_dialog_page.dart)

#### 1 组件类型

反馈类对话框

```
  Widget _buildFeedbackNormal(BuildContext context) {
    return TDButton(
      text: '反馈类-带标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildFeedbackNoTitle(BuildContext context) {
    return TDButton(
      text: '反馈类-无标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDConfirmDialog(
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildFeedbackOnlyTitle(BuildContext context) {
    return TDButton(
      text: '反馈类-纯标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDConfirmDialog(
              title: _dialogTitle,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildFeedbackLongContent(BuildContext context) {
    return TDButton(
      text: '反馈类-内容超长',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDConfirmDialog(
              title: _dialogTitle,
              content: _longContent,
              contentMaxHeight: 300,
            );
          },
        );
      },
    );
  }
```

确认类对话框

```
  Widget _buildConfirmNormal(BuildContext context) {
    return TDButton(
      text: '确认类-带标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDAlertDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildConfirmNoTitle(BuildContext context) {
    return TDButton(
      text: '确认类-无标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDAlertDialog(
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildConfirmOnlyTitle(BuildContext context) {
    return TDButton(
      text: '确认类-纯标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDAlertDialog(
              title: _dialogTitle,
            );
          },
        );
      },
    );
  }
```

输入类对话框

```
  Widget _buildInputNormal(BuildContext context) {
    return TDButton(
      text: '输入类-带描述',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDInputDialog(
              textEditingController: TextEditingController(),
              title: _dialogTitle,
              content: _commonContent,
              hintText: _inputHint,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildInputNoContent(BuildContext context) {
    return TDButton(
      text: '输入类-无描述',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDInputDialog(
              textEditingController: TextEditingController(),
              title: _dialogTitle,
              hintText: _inputHint,
            );
          },
        );
      },
    );
  }
```

带图片的对话框

```
  Widget _buildImageTop(BuildContext context) {
    return TDButton(
      text: '图片置顶-带标题描述',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDImageDialog(
              image: _demoImage,
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildImageTopNoTitle(BuildContext context) {
    return TDButton(
      text: '图片置顶-无标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDImageDialog(
              image: _demoImage,
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildImageTopOnlyTitle(BuildContext context) {
    return TDButton(
      text: '图片置顶-纯标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDImageDialog(
              image: _demoImage,
              title: _dialogTitle,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildImageMiddle(BuildContext context) {
    return TDButton(
      text: '图片居中-带标题描述',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDImageDialog(
              image: _demoImage,
              title: _dialogTitle,
              content: _commonContent,
              imagePosition: TDDialogImagePosition.middle,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildImageMiddleOnlyTitle(BuildContext context) {
    return TDButton(
      text: '图片居中-纯标题',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDImageDialog(
              image: _demoImage,
              title: _dialogTitle,
              imagePosition: TDDialogImagePosition.middle,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildImageMiddleOnlyImage(BuildContext context) {
    return TDButton(
      text: '图片居中-纯图片',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDImageDialog(
              image: _demoImage,
              imagePosition: TDDialogImagePosition.middle,
            );
          },
        );
      },
    );
  }
```

#### 1 组件类型

文字按钮

```
  Widget _buildTextButtonSingle(BuildContext context) {
    return TDButton(
      text: '单个文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
              buttonStyle: TDDialogButtonStyle.text,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildTextButtonDouble(BuildContext context) {
    return TDButton(
      text: '左右文字按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDAlertDialog(
              title: _dialogTitle,
              content: _commonContent,
              buttonStyle: TDDialogButtonStyle.text,
            );
          },
        );
      },
    );
  }
```

横向基础按钮

```
  Widget _buildNormalButtonSingle(BuildContext context) {
    return TDButton(
      text: '单个横向基础按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```


```
  Widget _buildNormalButtonDouble(BuildContext context) {
    return TDButton(
      text: '左右横向基础按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDAlertDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }
```

纵向基础按钮

```
  Widget _buildVerticalButtonDouble(BuildContext context) {
    return TDButton(
      text: '两个纵向基础按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDAlertDialog.vertical(
                title: _dialogTitle,
                content: _commonContent,
                buttons: [
                  TDDialogButtonOptions(
                      title: '主要按钮',
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: TDButtonTheme.primary),
                  TDDialogButtonOptions(
                      title: '次要按钮',
                      titleColor: TDTheme.of(context).brandColor7,
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: TDButtonTheme.light),
                ]);
          },
        );
      },
    );
  }
```


```
  Widget _buildVerticalButtonTriple(BuildContext context) {
    return TDButton(
      text: '三个纵向基础按钮',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDAlertDialog.vertical(
                title: _dialogTitle,
                content: _commonContent,
                buttons: [
                  TDDialogButtonOptions(
                      title: '主要按钮',
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: TDButtonTheme.primary),
                  TDDialogButtonOptions(
                      title: '次要按钮',
                      titleColor: TDTheme.of(context).brandColor7,
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: TDButtonTheme.light),
                  TDDialogButtonOptions(
                      title: '次要按钮',
                      titleColor: TDTheme.of(context).brandColor7,
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: TDButtonTheme.light),
                ]);
          },
        );
      },
    );
  }
```

带关闭按钮的对话框

```
  Widget _buildDialogWithCloseButton(BuildContext context) {
    return TDButton(
      text: '带关闭按钮的对话框',
      size: TDButtonSize.large,
      type: TDButtonType.outline,
      theme: TDButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return TDConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
              showCloseButton: true,
            );
          },
        );
      },
    );
  }
```

## API

1. [TDDialogScaffold](#tddialogscaffold)
2. [TDDialogTitle](#tddialogtitle)
3. [TDDialogContent](#tddialogcontent)
4. [TDDialogInfoWidget](#tddialoginfowidget)
5. [HorizontalNormalButtons](#horizontalnormalbuttons)
6. [HorizontalTextButtons](#horizontaltextbuttons)
7. [TDDialogButton](#tddialogbutton)
8. [TDDialogButtonOptions](#tddialogbuttonoptions)
9. [TDInputDialog](#tdinputdialog)
10. [TDConfirmDialog](#tdconfirmdialog)
11. [TDImageDialog](#tdimagedialog)
12. [TDAlertDialog](#tdalertdialog)

#### TDDialogScaffold

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景色 |
| body | Widget | - | Dialog主体 |
| key |  | - |  |
| radius | double | 12.0 | 圆角 |
| showCloseButton | bool? | - | 显示右上角关闭按钮 |
| width | double? | - | 弹窗宽度 |

#### TDDialogTitle

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| key |  | - |  |
| title | String? | - | 标题文字 |
| titleColor | Color? | - | 标题颜色 |

#### TDDialogContent

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| content | String? | - | 标题文字 |
| contentColor | Color? | - | 标题颜色 |
| key |  | - |  |

#### TDDialogInfoWidget

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| content | String? | - | 内容 |
| contentColor | Color? | - | 内容颜色 |
| contentMaxHeight | double | 0 | 内容的最大高度，默认为0，也就是不限制高度 |
| contentWidget | Widget? | - | 内容Widget |
| key |  | - |  |
| padding | EdgeInsetsGeometry? | const EdgeInsets.fromLTRB(24, 32, 24, 0) | 内容的内边距 |
| title | String? | - | 标题 |
| titleAlignment | AlignmentGeometry? | - | 标题对齐模式 |
| titleColor | Color? | - | 标题颜色 |

#### HorizontalNormalButtons

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| key |  | - |  |
| leftBtn | TDDialogButtonOptions | - | 左按钮 |
| rightBtn | TDDialogButtonOptions | - | 右按钮 |

#### HorizontalTextButtons

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| key |  | - |  |
| leftBtn | TDDialogButtonOptions | - | 左按钮 |
| rightBtn | TDDialogButtonOptions | - | 右按钮 |

#### TDDialogButton

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| buttonStyle | TDButtonStyle? | - | 按钮样式 |
| buttonText | String? | - | 按钮文字 |
| buttonTextColor | Color? | - | 按钮文字颜色 |
| buttonTextFontWeight | FontWeight? | FontWeight.w600 | 按钮文字粗细 |
| buttonTextSize | double? | - | 按钮文字大小 |
| buttonTheme | TDButtonTheme? | - | 按钮主题 |
| buttonType | TDButtonType? | - | 按钮类型 |
| height | double? | 40.0 | 按钮高度 |
| isBlock | bool | true | 按钮高度 |
| key |  | - |  |
| onPressed | Function() | - | 点击 |
| width | double? | - | 按钮宽度 |

#### TDDialogButtonOptions

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| action | Function()? | - | 点击操作 |
| fontWeight | FontWeight? | - | 字体粗细 |
| height | double? | - | 按钮高度 |
| style | TDButtonStyle? | - | 按钮样式 |
| theme | TDButtonTheme? | - | 按钮类型 |
| title | String | - | 标题内容 |
| titleColor | Color? | - | 标题颜色 |
| titleSize | double? | - | 字体大小 |
| type | TDButtonType? | - | 按钮类型 |

#### TDInputDialog

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| buttonWidget | Widget? | - | 自定义按钮 |
| content | String? | - | 内容 |
| contentColor | Color? | - | 内容颜色 |
| contentWidget | Widget? | - | 内容Widget |
| customInputWidget | Widget? | - | 自定义输入框 |
| hintText | String? | '' | 输入提示 |
| key |  | - |  |
| leftBtn | TDDialogButtonOptions? | - | 左侧按钮配置 |
| padding | EdgeInsets? | const EdgeInsets.fromLTRB(24, 32, 24, 0) | 内容内边距 |
| radius | double | 12.0 | 圆角 |
| rightBtn | TDDialogButtonOptions? | - | 右侧按钮配置 |
| showCloseButton | bool? | - | 显示右上角关闭按钮 |
| textEditingController | TextEditingController | - | 输入controller |
| title | String? | - | 标题 |
| titleAlignment | AlignmentGeometry? | - | 标题对齐模式 |
| titleColor | Color? | - | 标题颜色 |

#### TDConfirmDialog

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| action | Function()? | - | 点击 |
| backgroundColor | Color? | - | 背景颜色 |
| buttonStyle | TDDialogButtonStyle | TDDialogButtonStyle.normal | 按钮样式 |
| buttonStyleCustom | TDButtonStyle? | - | 按钮自定义样式属性，背景色、边框... |
| buttonText | String? | - | 按钮文字 |
| buttonTextColor | Color? | - | 按钮文字颜色 |
| buttonWidget | Widget? | - | 自定义按钮 |
| content | String? | - | 内容 |
| contentColor | Color? | - | 内容颜色 |
| contentMaxHeight | double | 0 | 内容的最大高度，默认为0，也就是不限制高度 |
| contentWidget | Widget? | - | 内容Widget |
| key |  | - |  |
| padding | EdgeInsets? | const EdgeInsets.fromLTRB(24, 32, 24, 0) | 内容内边距 |
| radius | double | 12.0 | 圆角 |
| showCloseButton | bool? | - | 右上角关闭按钮 |
| title | String? | - | 标题 |
| titleAlignment | AlignmentGeometry? | - | 标题对齐模式 |
| titleColor | Color? | - | 标题颜色 |
| width |  | - |  |

#### TDImageDialog

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| buttonWidget | Widget? | - | 自定义按钮 |
| content | String? | - | 内容 |
| contentColor | Color? | - | 内容颜色 |
| contentWidget | Widget? | - | 内容Widget |
| image | Image | - | 图片 |
| imagePosition | TDDialogImagePosition? | TDDialogImagePosition.top | 图片位置 |
| key |  | - |  |
| leftBtn | TDDialogButtonOptions? | - | 左侧按钮配置 |
| padding | EdgeInsets? | - | 内容内边距 |
| radius | double | 12.0 | 圆角 |
| rightBtn | TDDialogButtonOptions? | - | 右侧按钮配置 |
| showCloseButton | bool? | - | 显示右上角关闭按钮 |
| title | String? | - | 标题 |
| titleAlignment | AlignmentGeometry? | - | 标题对齐模式 |
| titleColor | Color? | - | 标题颜色 |

#### TDAlertDialog

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| buttonStyle |  | TDDialogButtonStyle.normal |  |
| buttonWidget | Widget? | - | 自定义按钮 |
| content | String? | - | 内容 |
| contentColor | Color? | - | 内容颜色 |
| contentMaxHeight | double | 0 | 内容的最大高度，默认为0，也就是不限制高度 |
| contentWidget | Widget? | - | 内容Widget |
| key |  | - |  |
| leftBtn | TDDialogButtonOptions? | - | 左侧按钮配置 |
| leftBtnAction | Function()? | - | 左侧按钮默认点击 |
| padding | EdgeInsets? | const EdgeInsets.fromLTRB(24, 32, 24, 0) | 内容内边距 |
| radius | double | 12.0 | 圆角 |
| rightBtn | TDDialogButtonOptions? | - | 右侧按钮配置 |
| rightBtnAction | Function()? | - | 右侧按钮默认点击 |
| showCloseButton | bool? | - | 显示右上角关闭按钮 |
| title | String? | - | 标题 |
| titleAlignment | AlignmentGeometry? | - | 标题对齐模式 |
| titleColor | Color? | - | 标题颜色 |

##### 工厂构造方法

| 名称 | 说明 |
| --- | --- |
| TDAlertDialog.vertical | 纵向按钮排列的对话框 |

[buttons]参数是必须的，纵向按钮默认样式都是[TDButtonTheme.primary] |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

需要用户做一些决定，或提供完成某个任务需要的一些额外信息时使用。

#### 组件搭配使用

###### 与输入类组合使用，用于帮助用户完成一些快捷的输入或选择；但不建议一个对话框内有多种不同的输入类组件。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-2.png)

#### 常见用法

###### 用于较为重要的信息提示。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-3.png)

---

###### 用于较为重要的信息提示，且需要用户决定。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-5.png)

#### 推荐/慎用示例

###### 确认类对话框通常用于较危险操作的二次确认，建议对话框按钮文本的涉及需要清楚地表明操作后果，加强感知避免误操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [轻提示](<Toast 轻提示.md>) | 当需要对用户进行轻量反馈或提示，且不需要用户进行操作时使用，轻提示会在一段时间后自动消失。 |
