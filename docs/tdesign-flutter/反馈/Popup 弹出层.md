# Popup 弹出层

> 由其他控件触发，屏幕滑出或弹出一块自定义内容区域

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/popup)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_popup_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_popup_page.dart)

#### 1 组件类型

```
  Widget _buildPopFromTop(BuildContext context) {
    return TDButton(
      text: '顶部弹出',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.top,
              open: () {
                print('open');
              },
              opened: () {
                print('opened');
              },
              builder: (context) {
                return Container(
                  color: TDTheme.of(context).bgColorContainer,
                  height: 240,
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromLeft(BuildContext context) {
    return TDButton(
      text: '左侧弹出',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.left,
              builder: (context) {
                return Container(
                  color: TDTheme.of(context).bgColorContainer,
                  width: 280,
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromCenter(BuildContext context) {
    return TDButton(
      text: '中间弹出',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.center,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    color: TDTheme.of(context).bgColorContainer,
                    borderRadius:
                        BorderRadius.circular(TDTheme.of(context).radiusLarge),
                  ),
                  width: 240,
                  height: 240,
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromBottom(BuildContext context) {
    return TDButton(
      text: '底部弹出',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: (context) {
                return Container(
                  color: TDTheme.of(context).bgColorContainer,
                  height: 240,
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromRight(BuildContext context) {
    return TDButton(
      text: '右侧弹出',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.right,
              builder: (context) {
                return Container(
                  color: TDTheme.of(context).bgColorContainer,
                  width: 280,
                );
              }),
        );
      },
    );
  }
```

#### 1 组件示例

```
  Widget _buildPopFromBottomWithOperationAndTitle(BuildContext context) {
    return TDButton(
      text: '底部弹出层-带标题及操作',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
            slideTransitionFrom: SlideTransitionFrom.bottom,
            builder: (context) {
              return TDPopupBottomConfirmPanel(
                title: '标题文字',
                leftClick: () {
                  Navigator.maybePop(context);
                },
                rightClick: () {
                  TDToast.showText('确定', context: context);
                  Navigator.maybePop(context);
                },
                child: Container(height: 200),
              );
            },
          ),
        );
      },
    );
  }
```


```
  Widget _buildPopFromBottomWithOperation(BuildContext context) {
    return TDButton(
      text: '底部弹出层-带操作',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(TDSlidePopupRoute(
            modalBarrierColor: TDTheme.of(context).fontGyColor2,
            slideTransitionFrom: SlideTransitionFrom.bottom,
            builder: (context) {
              return TDPopupBottomConfirmPanel(
                leftClick: () {
                  Navigator.maybePop(context);
                },
                rightClick: () {
                  TDToast.showText('确定', context: context);
                  Navigator.maybePop(context);
                },
                child: Container(
                  height: 200,
                ),
              );
            }));
      },
    );
  }
```


```
  Widget _buildPopFromBottomWithCloseAndTitle(BuildContext context) {
    return TDButton(
      text: '底部弹出层-带标题及关闭',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: (context) {
                return TDPopupBottomDisplayPanel(
                  title: '标题文字',
                  closeClick: () {
                    Navigator.maybePop(context);
                  },
                  child: Container(height: 200),
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromBottomWithCloseAndLeftTitle(BuildContext context) {
    return TDButton(
      text: '底部弹出层-带左边标题及关闭',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: (context) {
                return TDPopupBottomDisplayPanel(
                  title: '标题文字',
                  titleLeft: true,
                  closeClick: () {
                    Navigator.maybePop(context);
                  },
                  child: Container(height: 200),
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromBottomWithClose(BuildContext context) {
    return TDButton(
      text: '底部弹出层-带关闭',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: (context) {
                return TDPopupBottomDisplayPanel(
                  closeClick: () {
                    Navigator.maybePop(context);
                  },
                  child: Container(height: 200),
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromBottomWithTitle(BuildContext context) {
    return TDButton(
      text: '底部弹出层-仅标题',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: (context) {
                return TDPopupBottomDisplayPanel(
                  title: '标题文字',
                  hideClose: true,
                  // closeClick: () {
                  //   Navigator.maybePop(context);
                  // },
                  child: Container(height: 200),
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromCenterWithClose(BuildContext context) {
    return TDButton(
      text: '居中弹出层-带关闭',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              isDismissible: false,
              slideTransitionFrom: SlideTransitionFrom.center,
              builder: (context) {
                return TDPopupCenterPanel(
                  closeClick: () {
                    Navigator.maybePop(context);
                  },
                  child: const SizedBox(width: 240, height: 240),
                );
              }),
        );
      },
    );
  }
```


```
  Widget _buildPopFromCenterWithUnderClose(BuildContext context) {
    return TDButton(
      text: '居中弹出层-关闭在下方',
      isBlock: true,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      size: TDButtonSize.large,
      onTap: () {
        Navigator.of(context).push(
          TDSlidePopupRoute(
              isDismissible: false,
              slideTransitionFrom: SlideTransitionFrom.center,
              builder: (context) {
                return TDPopupCenterPanel(
                  closeUnderBottom: true,
                  closeClick: () {
                    Navigator.maybePop(context);
                  },
                  child: const SizedBox(width: 240, height: 240),
                );
              }),
        );
      },
    );
  }
```

## API

1. [TDSlidePopupRoute](#tdslidepopuproute)
2. [TDPopupBottomDisplayPanel](#tdpopupbottomdisplaypanel)
3. [TDPopupBottomConfirmPanel](#tdpopupbottomconfirmpanel)
4. [TDPopupCenterPanel](#tdpopupcenterpanel)

#### TDSlidePopupRoute

##### 简介

从屏幕的某个方向滑动弹出的Dialog框的路由，比如从顶部、底部、左、右滑出页面

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| barrierClick | VoidCallback? | - | 蒙层点击事件，仅在[modalBarrierFull]为false时触发 |
| barrierLabel |  | - |  |
| builder | WidgetBuilder | - | 控件构建器 |
| close | VoidCallback? | - | 关闭前事件 |
| focusMove | bool | false | 是否有输入框获取焦点时整体平移避免输入框被遮挡 |
| isDismissible | bool | true | 点击蒙层能否关闭 |
| modalBarrierColor | Color? | Colors.black54 | 蒙层颜色 |
| modalBarrierFull | bool | false | 是否全屏显示蒙层 |
| modalHeight | double? | - | 弹出框高度 |
| modalLeft | double? | 0 | 弹出框左侧距离 |
| modalTop | double? | 0 | 弹出框顶部距离 |
| modalWidth | double? | - | 弹出框宽度 |
| open | VoidCallback? | - | 打开前事件 |
| opened | VoidCallback? | - | 打开后事件 |
| slideTransitionFrom | SlideTransitionFrom | SlideTransitionFrom.bottom | 设置从屏幕的哪个方向滑出 |

#### TDPopupBottomDisplayPanel

##### 简介

右上角带关闭的底部浮层面板

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor |  | - |  |
| child |  | - |  |
| closeClick | PopupClick? | - | 关闭按钮点击回调 |
| closeColor | Color? | - | 关闭按钮颜色 |
| closeSize | double? | - | 关闭按钮图标尺寸 |
| draggable |  | - |  |
| hideClose | bool | false | 是否隐藏关闭按钮 |
| key |  | - |  |
| maxHeightRatio |  | - |  |
| minHeightRatio |  | - |  |
| radius |  | - |  |
| title |  | - |  |
| titleColor |  | - |  |
| titleFontSize | double? | - | 标题字体大小 |
| titleLeft | bool | false | 标题是否靠左 |

#### TDPopupBottomConfirmPanel

##### 简介

带确认的底部浮层面板

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor |  | - |  |
| child |  | - |  |
| draggable |  | - |  |
| key |  | - |  |
| leftClick | PopupClick? | - | 左边文本点击回调 |
| leftText | String? | - | 左边文本 |
| leftTextColor | Color? | - | 左边文本颜色 |
| leftTextFontSize | double? | - | 左边文本字体大小 |
| maxHeightRatio |  | - |  |
| minHeightRatio |  | - |  |
| radius |  | - |  |
| rightClick | PopupClick? | - | 右边文本点击回调 |
| rightText | String? | - | 右边文本 |
| rightTextColor | Color? | - | 右边文本颜色 |
| rightTextFontSize | double? | - | 右边文本字体大小 |
| title |  | - |  |
| titleColor |  | - |  |
| titleFontSize | double? | - | 标题字体大小 |

#### TDPopupCenterPanel

##### 简介

居中浮层面板

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 |
| child | Widget | - | 子控件 |
| closeClick | PopupClick? | - | 关闭按钮点击回调 |
| closeColor | Color? | - | 关闭按钮颜色 |
| closeSize | double? | - | 关闭按钮图标尺寸 |
| closeUnderBottom | bool | false | 关闭按钮是否在视图框下方 |
| key |  | - |  |
| radius | double? | - | 圆角 |

## 设计指南

1. [常见用法](#常见用法)

#### 常见用法

###### 在筛选的场景，若筛选条件外露，通常会使用顶部弹出的弹出层；若为筛选入口，则通常触发使用右侧弹出的弹出层。

![](https://tdesign.gtimg.com/site/design/mobile-guide/popup/popup-1.png)

---

![](https://tdesign.gtimg.com/site/design/mobile-guide/popup/popup-2.png)

---

###### 承载页面中某个任务操作流程，通常会使用底部弹出的弹出层。

![](https://tdesign.gtimg.com/site/design/mobile-guide/popup/popup-3.png)

---

###### 承载重要提示且可能需要用户做出一些重要决策时，通常会使用中间弹出的弹出层。

![](https://tdesign.gtimg.com/site/design/mobile-guide/popup/popup-4.png)

---

###### 承载较为重要的运营活动入口（如拍脸图）时，通常会使用中间弹出的弹出层。

![](https://tdesign.gtimg.com/site/design/mobile-guide/popup/popup-5.png)

---

###### 承载网站、应用收折起来的导航菜单时，通常会使用左侧弹出的弹出层。

![](https://tdesign.gtimg.com/site/design/mobile-guide/popup/popup-6.png)
