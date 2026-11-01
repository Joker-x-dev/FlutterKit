# TabBar 标签栏

> 用于在不同功能模块之间进行快速切换，位于页面底部。

> 来源：[TabBar 标签栏](https://tdesign.tencent.com/flutter/components/tab-bar)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_bottom_tab_bar_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_bottom_tab_bar_page.dart)

#### 1 组件类型

纯文本标签栏

```
  Widget _textTypeTabBar(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.text,
      useVerticalDivider: false,
      navigationTabs: List.generate(2, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```


```
  Widget _textTypeTabBar3tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.text,
      indicatorAnimation: TBottomTabBarIndicatorAnimation.elastic,
      useVerticalDivider: false,
      navigationTabs: List.generate(3, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```


```
  Widget _textTypeTabBar4tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.text,
      useVerticalDivider: false,
      navigationTabs: List.generate(4, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```


```
  Widget _textTypeTabBar5tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.text,
      useVerticalDivider: false,
      navigationTabs: List.generate(5, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```

图标加文本标签栏

```
  Widget _iconTextTypeTabBar(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.iconText,
      useVerticalDivider: false,
      navigationTabs: List.generate(2, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```


```
  Widget _iconTextTypeTabBar3tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.iconText,
      useVerticalDivider: false,
      navigationTabs: List.generate(3, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```


```
  Widget _iconTextTypeTabBar4tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.iconText,
      useVerticalDivider: false,
      navigationTabs: List.generate(4, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```


```
  Widget _iconTextTypeTabBar5tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.iconText,
      useVerticalDivider: false,
      navigationTabs: List.generate(5, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
          tabText: label,
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          onTap: () {
            onTapTab(context, label);
          },
        );
      }),
    );
  }
```

纯图标标签栏

```
  Widget _iconTypeTabBar(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.icon,
      useVerticalDivider: true,
      navigationTabs: List.generate(2, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, label);
            });
      }),
    );
  }
```


```
  Widget _iconTypeTabBar3tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.icon,
      useVerticalDivider: true,
      navigationTabs: List.generate(3, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, label);
            });
      }),
    );
  }
```


```
  Widget _iconTypeTabBar4tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.icon,
      useVerticalDivider: true,
      navigationTabs: List.generate(4, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, label);
            });
      }),
    );
  }
```


```
  Widget _iconTypeTabBar5tabs(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.icon,
      useVerticalDivider: true,
      navigationTabs: List.generate(5, (index) {
        final label = '标签${index + 1}';
        return TBottomTabBarTabConfig(
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            onTap: () {
              onTapTab(context, label);
            });
      }),
    );
  }
```

双层级文本标签栏

```
  Widget _expansionPanelTypeTabBar(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.expansionPanel,
      useVerticalDivider: true,
      navigationTabs: [
        TBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        TBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        TBottomTabBarTabConfig(
            tabText: '展开项',
            onTap: () {
              // 不触发点击事件
              onTapTab(context, '展开项');
            },
            popUpButtonConfig: TBottomTabBarPopUpBtnConfig(
                popUpDialogConfig: TBottomTabBarPopUpShapeConfig(
                  radius: 10,
                  arrowWidth: 16,
                  arrowHeight: 8,
                ),
                items: ['展开项一', '展开项二', '展开项三']
                    .reversed
                    .map((e) => PopUpMenuItem(
                          value: e,
                          itemWidget: Text(
                            e,
                            style: TextStyle(
                                color: TTheme.of(context).textColorPrimary,
                                fontSize: 16),
                          ),
                        ))
                    .toList(),
                onChanged: (v) {
                  TToast.showText('点击了 $v', context: context);
                })),
      ],
    );
  }
```

#### 1 组件样式

弱选中标签栏

```
  Widget _weakSelectTextTabBar(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.text,
      componentType: TBottomTabBarComponentType.normal,
      useVerticalDivider: true,
      navigationTabs: [
        TBottomTabBarTabConfig(
          badgeConfig: BadgeConfig(
            showBadge: true,
            tBadge: const TBadge(TBadgeType.redPoint),
            badgeTopOffset: -2,
            badgeRightOffset: -10,
          ),
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        TBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        TBottomTabBarTabConfig(
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }
```


```
  Widget _weakSelectIconTabBar(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.icon,
      componentType: TBottomTabBarComponentType.normal,
      useVerticalDivider: false,
      navigationTabs: [
        TBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          badgeConfig: BadgeConfig(
            showBadge: true,
            tBadge: const TBadge(TBadgeType.redPoint),
            badgeTopOffset: -2,
            badgeRightOffset: -10,
          ),
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        TBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        TBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }
```


```
  Widget _weakSelectIconTextTabBar(BuildContext context) {
    return TBottomTabBar(
      TBottomTabBarBasicType.iconText,
      componentType: TBottomTabBarComponentType.normal,
      useVerticalDivider: false,
      navigationTabs: [
        TBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          badgeConfig: BadgeConfig(
            showBadge: true,
            tBadge: const TBadge(TBadgeType.redPoint),
            badgeTopOffset: -2,
            badgeRightOffset: -10,
          ),
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签1');
          },
        ),
        TBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签2');
          },
        ),
        TBottomTabBarTabConfig(
          selectedIcon: _selectedIcon,
          unselectedIcon: _unSelectedIcon,
          tabText: '标签',
          onTap: () {
            onTapTab(context, '标签3');
          },
        ),
      ],
    );
  }
```

悬浮胶囊标签栏

```
  Widget _capsuleTabBar(BuildContext context) {
    return TBottomTabBar(TBottomTabBarBasicType.iconText,
        componentType: TBottomTabBarComponentType.label,
        outlineType: TBottomTabBarOutlineType.capsule,
        useVerticalDivider: true,
        navigationTabs: List.generate(3, (index) {
          final label = '标签${index + 1}';
          return TBottomTabBarTabConfig(
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            tabText: label,
            onTap: () {
              onTapTab(context, label);
            },
          );
        }));
  }
```

#### 1 组件事件

长按触发

```
  Widget _capsuleTabBarOnLongPress(BuildContext context) {
    return TBottomTabBar(TBottomTabBarBasicType.iconText,
        componentType: TBottomTabBarComponentType.label,
        outlineType: TBottomTabBarOutlineType.capsule,
        useVerticalDivider: true,
        navigationTabs: List.generate(3, (index) {
          final label = '标签${index + 1}';
          return TBottomTabBarTabConfig(
            selectedIcon: _selectedIcon,
            unselectedIcon: _unSelectedIcon,
            tabText: label,
            onTap: () {
              onTapTab(context, label);
            },
            onLongPress: () {
              print('长按了${label}');
              TToast.showText('长按了 $label', context: context);
            },
          );
        }));
  }
```

## API

1. [TBottomTabBar](#tbottomtabbar)
2. [BadgeConfig](#badgeconfig)
3. [TBottomTabBarTabConfig](#tbottomtabbartabconfig)
4. [TBottomTabBarPopUpBtnConfig](#tbottomtabbarpopupbtnconfig)
5. [TBottomTabBarPopUpShapeConfig](#tbottomtabbarpopupshapeconfig)
6. [PopUpMenuItem](#popupmenuitem)
7. [TBottomTabBarBasicType](#tbottomtabbarbasictype)
8. [TBottomTabBarComponentType](#tbottomtabbarcomponenttype)
9. [TBottomTabBarOutlineType](#tbottomtabbaroutlinetype)
10. [TBottomTabBarIndicatorAnimation](#tbottomtabbarindicatoranimation)

#### TBottomTabBar

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| basicType | TBottomTabBarBasicType | - | 基本样式（纯文本、纯图标、图标+文本） |
| animationCurve | Curve | Curves.easeInOutCubic | 动画曲线 |
| animationDuration | Duration | const Duration(milliseconds: 300) | 动画时长 |
| backgroundColor | Color? | - | 背景颜色 （可选） |
| barHeight | double? | _kDefaultTabBarHeight | tab高度 |
| centerDistance | double? | - | icon与文本中间距离（可选） |
| componentType | TBottomTabBarComponentType? | TBottomTabBarComponentType.label | 选项样式 默认label |
| currentIndex | int? | - | 选中的index（可选） |
| dividerColor | Color? | - | 分割线颜色（可选） |
| dividerHeight | double? | - | 分割线高度（可选） |
| dividerThickness | double? | - | 分割线厚度（可选） |
| indicatorAnimation | TBottomTabBarIndicatorAnimation | TBottomTabBarIndicatorAnimation.none | 指示器动画类型 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| navigationTabs | List | - | tabs配置 |
| needInkWell | bool | false | 是否需要水波纹效果 |
| outlineType | TBottomTabBarOutlineType? | TBottomTabBarOutlineType.filled | 标签栏样式 默认filled |
| placeholder | bool | true | 是否添加安全区域占位 |
| selectedBgColor | Color? | - | 选中时背景颜色 |
| showTopBorder | bool? | true | 是否展示bar上边线（设置为true 但是topBorder样式未设置，则使用默认值，非胶囊型才生效） |
| topBorder | BorderSide? | - | 上边线样式 |
| unselectedBgColor | Color? | - | 未选中时背景颜色 |
| useSafeArea | bool | true | 使用安全区域 |
| useVerticalDivider | bool? | - | 是否使用竖线分隔（如果选项样式为 label，则强制为 false） |

#### BadgeConfig

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| badgeRightOffset | double? | - | 消息右侧偏移量 |
| badgeTopOffset | double? | - | 消息顶部偏移量 |
| showBadge | bool | - | 是否展示消息 |
| tBadge | TBadge? | - | 消息样式（未设置但 showBadge 为 true，则默认使用红点） |

#### TBottomTabBarTabConfig

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| allowMultipleTaps | bool | false | onTap 方法允许点击多次 |
| badgeConfig | BadgeConfig? | - | 消息配置 |
| onLongPress | GestureLongPressCallback? | - | 长按事件 |
| onTap | GestureTapCallback? | - | tab点击事件 |
| popUpButtonConfig | TBottomTabBarPopUpBtnConfig? | - | 弹窗配置 |
| selectedIcon | Widget? | - | 选中时图标 |
| selectTabTextStyle | TextStyle? | - | 文本已选择样式 basicType为text时必填 |
| tabText | String? | - | tab 文本 |
| unselectedIcon | Widget? | - | 未选中时图标 |
| unselectTabTextStyle | TextStyle? | - | 文本未选择样式 basicType为text时必填 |

#### TBottomTabBarPopUpBtnConfig

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| items | List | - | 选项list |
| onChanged | ValueChanged | - | 统一在 onChanged 中处理各item点击事件 |
| popUpDialogConfig | TBottomTabBarPopUpShapeConfig? | - | 弹窗UI配置 |

#### TBottomTabBarPopUpShapeConfig

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| arrowHeight | double? | - | 箭头高度 默认8 |
| arrowWidth | double? | - | 箭头宽度 默认13.5 |
| backgroundColor | Color? | - | 弹窗背景颜色 |
| popUpItemHeight | double? | _kDefaultMenuItemHeight | 单个选项高度 所有选项等高 不设置则使用默认值 48 |
| popUpWidth | double? | - | 弹窗宽度（不设置，默认为按钮宽度 - 20） |
| radius | double? | - | panel圆角 默认0 |

#### PopUpMenuItem

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| alignment | AlignmentGeometry | AlignmentDirectional.center | 对齐方式 |
| itemWidget | Widget? | - | 选项widget |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| value | String | - | 选项值 |

#### TBottomTabBarBasicType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| text | 单层级纯文本标签栏 |
| iconText | 文本加图标标签栏 |
| icon | 纯图标标签栏 |
| expansionPanel | 双层级纯文本标签栏 |

#### TBottomTabBarComponentType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| normal | 普通样式 |
| label | 带胶囊背景的item选中样式 |

#### TBottomTabBarOutlineType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| filled | 填充样式 |
| capsule | 胶囊样式 |

#### TBottomTabBarIndicatorAnimation

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| none | 无动画，瞬间切换 |
| linear | 线性滑动：指示器匀速从一个 tab 滑到另一个 |
| elastic | 弹性动画：指示器先拉伸后收缩 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

#### 何时使用

目标模块/视图需要从应用的任何地方直接进行访问时使用。

#### 组件搭配使用

###### 标签栏与[徽标](<../数据展示/Badge 徽标.md>)组合使用，用于告知用户该模块/视图的状态变化。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-2.png)

#### 推荐/慎用示例

###### 建议标签栏数量在2-5个之间；若多与5个，建议重新审视应用的信息架构，对信息架构进行优化。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 避免在同个状态下有不同颜色的文本和图标。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 文本是对标签的简要说明，不建议将文本进行截断或换行，所以应避免使用长文本。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

---

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [选项卡](<Tabs 选项卡.md>) | 当内容/数据需要一定的分类纬度进行区分，便于用户快速作出选择并切换时可以使用。 |
| [侧边栏](<SideBar 侧边栏.md>) | 当内容项数量较多，需要用户根据品类快速选择到目标内容项时使用。 |
