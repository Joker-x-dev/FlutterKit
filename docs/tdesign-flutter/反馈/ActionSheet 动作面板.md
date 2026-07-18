# ActionSheet 动作面板

> 由用户操作后触发的一种特定的模态弹出框 ，呈现一组与当前情境相关的两个或多个选项。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/action-sheet)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_action_sheet_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_action_sheet_page.dart)

#### 1 组件类型

列表型动作面板

```
Widget _buildBaseListActionSheet(BuildContext context) {
  return TDButton(
    text: '常规列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: _nums.map((e) => TDActionSheetItem(label: '选项$e')).toList(),
      );
    },
  );
}
```


```
Widget _buildDescListActionSheet(BuildContext context) {
  return TDButton(
    text: '带描述列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        items: _nums.map((e) => TDActionSheetItem(label: '选项$e')).toList(),
      );
    },
  );
}
```


```
Widget _buildIconListActionSheet(BuildContext context) {
  return TDButton(
    text: '带图标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: _nums
            .map((e) => TDActionSheetItem(
                  label: '选项$e',
                  icon: const Icon(TDIcons.app),
                ))
            .toList(),
      );
    },
  );
}
```


```
Widget _buildBadgeListActionSheet(BuildContext context) {
  return TDButton(
    text: '带徽标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: [
          TDActionSheetItem(
            label: '选项一',
            badge: const TDBadge(TDBadgeType.redPoint),
          ),
          TDActionSheetItem(
            label: '选项二',
            badge: const TDBadge(TDBadgeType.message, count: '8'),
          ),
          TDActionSheetItem(
            label: '选项三',
            badge: const TDBadge(TDBadgeType.message, count: '99'),
          ),
          TDActionSheetItem(
            label: '选项四',
            badge: const TDBadge(TDBadgeType.message, count: '99+'),
          ),
        ],
      );
    },
  );
}
```


```
Widget _buildItemDescriptionListActionSheet(BuildContext context) {
  return TDButton(
    text: '带Cell描述常规列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: _nums.map((e) => TDActionSheetItem(label: '选项$e',description: '描述$e')).toList(),
      );
    },
  );
}
```

宫格型动作面板

```
Widget _buildBaseGridActionSheet(BuildContext context) {
  return TDButton(
    text: '常规宫格',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        theme: TDActionSheetTheme.grid,
        count: 8,
        items: _gridItems,
      );
    },
  );
}
```


```
Widget _buildDescGridActionSheet(BuildContext context) {
  return TDButton(
    text: '带描述宫格',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        theme: TDActionSheetTheme.grid,
        count: 8,
        description: '动作面板描述文字',
        items: _gridItems,
      );
    },
  );
}
```


```
Widget _buildPaginationGridActionSheet(BuildContext context) {
  return TDButton(
    text: '带翻页宫格',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        theme: TDActionSheetTheme.grid,
        count: 8,
        showPagination: true,
        items: [
          ..._gridItems,
          TDActionSheetItem(
            label: '安卓',
            icon: const IconWithBackground(icon: TDIcons.logo_android),
          ),
          TDActionSheetItem(
            label: 'Apple',
            icon: const IconWithBackground(icon: TDIcons.logo_apple),
          ),
          TDActionSheetItem(
            label: 'Chrome',
            icon: const IconWithBackground(icon: TDIcons.logo_chrome),
          ),
          TDActionSheetItem(
            label: 'Github',
            icon: const IconWithBackground(icon: TDIcons.logo_github),
          ),
        ],
      );
    },
  );
}
```


```
Widget _buildScrollGridActionSheet(BuildContext context) {
  return TDButton(
    text: '多行滚动宫格',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        theme: TDActionSheetTheme.grid,
        count: 8,
        scrollable: true,
        items: [
          ..._gridItems,
          TDActionSheetItem(
            label: '安卓',
            icon: const IconWithBackground(icon: TDIcons.logo_android),
          ),
          TDActionSheetItem(
            label: 'Apple',
            icon: const IconWithBackground(icon: TDIcons.logo_apple),
          ),
          TDActionSheetItem(
            label: 'Chrome',
            icon: const IconWithBackground(icon: TDIcons.logo_chrome),
          ),
          TDActionSheetItem(
            label: 'Github',
            icon: const IconWithBackground(icon: TDIcons.logo_github),
          ),
          TDActionSheetItem(
            label: 'Twitter',
            icon: const IconWithBackground(icon: TDIcons.logo_twitter),
          ),
        ],
      );
    },
  );
}
```


```
Widget _buildMultiScrollGridActionSheet(BuildContext context) {
  return TDButton(
    text: '带描述多行滚动宫格',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet.showGroupActionSheet(context, items: [
        TDActionSheetItem(
          label: 'Allen',
          icon: Image.asset('assets/img/td_action_sheet_5.png'),
          group: '分享给好友',
        ),
        TDActionSheetItem(
          label: 'Nick',
          icon: Image.asset('assets/img/td_action_sheet_6.png'),
          group: '分享给好友',
        ),
        TDActionSheetItem(
          label: 'Jacky',
          icon: Image.asset('assets/img/td_action_sheet_7.png'),
          group: '分享给好友',
        ),
        TDActionSheetItem(
          label: 'Eric',
          icon: Image.asset('assets/img/td_action_sheet_8.png'),
          group: '分享给好友',
        ),
        TDActionSheetItem(
          label: 'Johnsc',
          icon: Image.asset('assets/img/td_action_sheet_5.png'),
          group: '分享给好友',
        ),
        TDActionSheetItem(
          label: 'Kevin',
          icon: Image.asset('assets/img/td_action_sheet_6.png'),
          group: '分享给好友',
        ),
        ..._gridItems,
      ]);
    },
  );
}
```


```
Widget _buildBadgeGridActionSheet(BuildContext context) {
  return TDButton(
    text: '带徽标宫格型',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet.showGridActionSheet(context, items: [
        TDActionSheetItem(
            label: '微信',
            icon: Image.asset('assets/img/td_action_sheet_1.png'),
            badge: const TDBadge(TDBadgeType.message, count: 'NEW')),
        TDActionSheetItem(
            label: '朋友圈',
            icon: Image.asset('assets/img/td_action_sheet_2.png')),
        TDActionSheetItem(
            label: 'QQ', icon: Image.asset('assets/img/td_action_sheet_3.png')),
        TDActionSheetItem(
            label: '企业微信',
            icon: Image.asset('assets/img/td_action_sheet_4.png')),
        TDActionSheetItem(
            label: '收藏',
            icon: const IconWithBackground(icon: TDIcons.star),
            badge: const TDBadge(TDBadgeType.redPoint)),
        TDActionSheetItem(
            label: '刷新', icon: const IconWithBackground(icon: TDIcons.refresh)),
        TDActionSheetItem(
            label: '下载',
            icon: const IconWithBackground(icon: TDIcons.download),
            badge: const TDBadge(TDBadgeType.message, count: '8')),
        TDActionSheetItem(
            label: '复制', icon: const IconWithBackground(icon: TDIcons.queue)),
      ]);
    },
  );
}
```

#### 1 组件状态

列表型选项状态

```
Widget _buildBaseListStateActionSheet(BuildContext context) {
  return TDButton(
    text: '列表型选项状态',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: [
          TDActionSheetItem(
            label: '默认选项',
          ),
          TDActionSheetItem(
            label: '自定义选项',
            textStyle: TextStyle(
              color: TDTheme.of(context).brandNormalColor,
            ),
          ),
          TDActionSheetItem(
            label: '失效选项',
            disabled: true,
          ),
          TDActionSheetItem(
            label: '警告选项',
            textStyle: const TextStyle(
              color: Colors.red,
            ),
          ),
        ],
        onSelected: (item, index) {
          print('选中了：${item.label}');
        },
      );
    },
  );
}
```


```
Widget _buildIconListStateActionSheet(BuildContext context) {
  return TDButton(
    text: '列表型带图标状态',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: [
          TDActionSheetItem(
            label: '默认选项',
            icon: const Icon(TDIcons.app),
          ),
          TDActionSheetItem(
            label: '自定义选项',
            icon: const Icon(TDIcons.app),
            textStyle: TextStyle(
              color: TDTheme.of(context).brandNormalColor,
            ),
          ),
          TDActionSheetItem(
            label: '失效选项',
            icon: const Icon(TDIcons.app),
            disabled: true,
          ),
          TDActionSheetItem(
            label: '警告选项',
            icon: const Icon(TDIcons.app),
            textStyle: const TextStyle(
              color: Colors.red,
            ),
          ),
        ],
        onSelected: (item, index) {
          print('选中了：${item.label}');
        },
      );
    },
  );
}
```


```
Widget _buildBaseListStateActionSheet(BuildContext context) {
  return TDButton(
    text: '列表型选项状态',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: [
          TDActionSheetItem(
            label: '默认选项',
          ),
          TDActionSheetItem(
            label: '自定义选项',
            textStyle: TextStyle(
              color: TDTheme.of(context).brandNormalColor,
            ),
          ),
          TDActionSheetItem(
            label: '失效选项',
            disabled: true,
          ),
          TDActionSheetItem(
            label: '警告选项',
            textStyle: const TextStyle(
              color: Colors.red,
            ),
          ),
        ],
        onSelected: (item, index) {
          print('选中了：${item.label}');
        },
      );
    },
  );
}
```


```
Widget _buildIconListStateActionSheet(BuildContext context) {
  return TDButton(
    text: '列表型带图标状态',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        items: [
          TDActionSheetItem(
            label: '默认选项',
            icon: const Icon(TDIcons.app),
          ),
          TDActionSheetItem(
            label: '自定义选项',
            icon: const Icon(TDIcons.app),
            textStyle: TextStyle(
              color: TDTheme.of(context).brandNormalColor,
            ),
          ),
          TDActionSheetItem(
            label: '失效选项',
            icon: const Icon(TDIcons.app),
            disabled: true,
          ),
          TDActionSheetItem(
            label: '警告选项',
            icon: const Icon(TDIcons.app),
            textStyle: const TextStyle(
              color: Colors.red,
            ),
          ),
        ],
        onSelected: (item, index) {
          print('选中了：${item.label}');
        },
      );
    },
  );
}
```

#### 1 组件样式

列表型对齐方式

```
Widget _buildBadgeListCenterActionSheet(BuildContext context) {
  return TDButton(
    text: '居中带徽标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        items: [
          TDActionSheetItem(
            label: '选项一',
            badge: const TDBadge(TDBadgeType.redPoint),
          ),
          TDActionSheetItem(
            label: '选项二',
            badge: const TDBadge(
              TDBadgeType.message,
              count: '8',
            ),
          ),
          TDActionSheetItem(
            label: '选项三',
            badge: const TDBadge(
              TDBadgeType.message,
              count: '99',
            ),
          ),
        ],
      );
    },
  );
}
```


```
Widget _buildIconListCenterActionSheet(BuildContext context) {
  return TDButton(
    text: '居中带图标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        items: _nums
            .map((e) => TDActionSheetItem(
                  label: '选项$e',
                  icon: const Icon(TDIcons.app),
                ))
            .toList(),
      );
    },
  );
}
```


```
Widget _buildBadgeListLeftActionSheet(BuildContext context) {
  return TDButton(
    text: '左对齐带徽标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        align: TDActionSheetAlign.left,
        items: _nums
            .map((e) => TDActionSheetItem(
                  label: '选项$e',
                  badge: const TDBadge(TDBadgeType.redPoint),
                ))
            .toList(),
      );
    },
  );
}
```


```
Widget _buildIconListLeftActionSheet(BuildContext context) {
  return TDButton(
    text: '左对齐带图标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        align: TDActionSheetAlign.left,
        items: _nums
            .map((e) => TDActionSheetItem(
                  label: '选项$e',
                  icon: const Icon(TDIcons.app),
                ))
            .toList(),
      );
    },
  );
}
```


```
Widget _buildBadgeListCenterActionSheet(BuildContext context) {
  return TDButton(
    text: '居中带徽标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        items: [
          TDActionSheetItem(
            label: '选项一',
            badge: const TDBadge(TDBadgeType.redPoint),
          ),
          TDActionSheetItem(
            label: '选项二',
            badge: const TDBadge(
              TDBadgeType.message,
              count: '8',
            ),
          ),
          TDActionSheetItem(
            label: '选项三',
            badge: const TDBadge(
              TDBadgeType.message,
              count: '99',
            ),
          ),
        ],
      );
    },
  );
}
```


```
Widget _buildIconListCenterActionSheet(BuildContext context) {
  return TDButton(
    text: '居中带图标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        items: _nums
            .map((e) => TDActionSheetItem(
                  label: '选项$e',
                  icon: const Icon(TDIcons.app),
                ))
            .toList(),
      );
    },
  );
}
```


```
Widget _buildBadgeListLeftActionSheet(BuildContext context) {
  return TDButton(
    text: '左对齐带徽标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        align: TDActionSheetAlign.left,
        items: _nums
            .map((e) => TDActionSheetItem(
                  label: '选项$e',
                  badge: const TDBadge(TDBadgeType.redPoint),
                ))
            .toList(),
      );
    },
  );
}
```


```
Widget _buildIconListLeftActionSheet(BuildContext context) {
  return TDButton(
    text: '左对齐带图标列表',
    isBlock: true,
    type: TDButtonType.outline,
    theme: TDButtonTheme.primary,
    size: TDButtonSize.large,
    onTap: () {
      TDActionSheet(
        context,
        visible: true,
        description: '动作面板描述文字',
        align: TDActionSheetAlign.left,
        items: _nums
            .map((e) => TDActionSheetItem(
                  label: '选项$e',
                  icon: const Icon(TDIcons.app),
                ))
            .toList(),
      );
    },
  );
}
```

## API

1. [TDActionSheet](#tdactionsheet)
2. [TDActionSheetItem](#tdactionsheetitem)

#### TDActionSheet

##### 简介

动作面板

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| align | TDActionSheetAlign | TDActionSheetAlign.center | 对齐方式 |
| cancelText | String? | - | 取消按钮的文本 |
| closeOnOverlayClick | bool | true | 点击蒙层时是否关闭 |
| context | BuildContext | context | 上下文 |
| count | int | 8 | 每页显示的项目数 |
| description | String? | - | 描述文本 |
| itemHeight | double | 96.0 | 项目的行高 |
| itemMinWidth | double | 80.0 | 项目的最小宽度 |
| items | List | - | ActionSheet的项目列表 |
| onCancel | VoidCallback? | - | 取消按钮的回调函数 |
| onClose | VoidCallback? | - | 关闭时的回调函数 |
| onSelected | TDActionSheetItemCallback? | - | 选择项目时的回调函数 |
| rows | int | 2 | 显示的行数 |
| scrollable | bool | false | 是否可以横向滚动 |
| showCancel | bool | true | 是否显示取消按钮 |
| showOverlay | bool | true | 是否显示遮罩层 |
| showPagination | bool | false | 是否显示分页 |
| theme | TDActionSheetTheme | TDActionSheetTheme.list | 主题样式 |
| useSafeArea | bool | true | 使用安全区域 |
| visible | bool | false | 是否立即显示 |

##### 静态方法

| 名称 | 返回类型 | 说明 |
| --- | --- | --- |
| `showGridActionSheet` | `void` | 显示宫格类型面板。 |
| `showGroupActionSheet` | `void` | 显示分组类型面板。 |
| `showListActionSheet` | `void` | 显示列表类型面板。 |

###### `showGridActionSheet`

显示宫格类型面板。

```dart
static void showGridActionSheet(
  BuildContext context, {
  required List<TDActionSheetItem> items,
  TDActionSheetAlign align = TDActionSheetAlign.center,
  String? cancelText,
  bool showCancel = true,
  TDActionSheetItemCallback? onSelected,
  bool showOverlay = true,
  bool closeOnOverlayClick = true,
  int count = 8,
  int rows = 2,
  double itemHeight = 96.0,
  double itemMinWidth = 80.0,
  bool scrollable = false,
  bool showPagination = false,
  VoidCallback? onCancel,
  String? description,
  VoidCallback? onClose,
  bool useSafeArea = true,
});
```

###### `showGroupActionSheet`

显示分组类型面板。

```dart
static void showGroupActionSheet(
  BuildContext context, {
  required List<TDActionSheetItem> items,
  TDActionSheetAlign align = TDActionSheetAlign.left,
  String? cancelText,
  bool showCancel = true,
  TDActionSheetItemCallback? onSelected,
  bool showOverlay = true,
  bool closeOnOverlayClick = true,
  double itemHeight = 96.0,
  double itemMinWidth = 80.0,
  VoidCallback? onCancel,
  VoidCallback? onClose,
  bool useSafeArea = true,
});
```

###### `showListActionSheet`

显示列表类型面板。

```dart
static void showListActionSheet(
  BuildContext context, {
  required List<TDActionSheetItem> items,
  TDActionSheetAlign align = TDActionSheetAlign.center,
  String? cancelText,
  bool showCancel = true,
  VoidCallback? onCancel,
  TDActionSheetItemCallback? onSelected,
  bool showOverlay = true,
  bool closeOnOverlayClick = true,
  VoidCallback? onClose,
  bool useSafeArea = true,
});
```

#### TDActionSheetItem

##### 简介

动作面板项目

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| badge | TDBadge? | - | 角标 |
| description | String? | - | 描述信息 |
| disabled | bool | false | 是否禁用 |
| group | String? | - | 分组，用于带描述多行滚动宫格 |
| icon | Widget? | - | 图标 |
| iconSize | double? | - | 图标大小 |
| label | String | - | 标题 |
| textStyle | TextStyle? | - | 标题样式 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

#### 何时使用

需要提供一组与当前场景操作相关的关联操作时使用。

#### 组件搭配使用

###### 动作面板与[按钮](<../基础/Button 按钮.md>)组合使用，通过按钮点击唤起动作面板。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-1.png)

#### 常见用法

###### 当用户完成一个事件可以通过若干种方式达成，可以用动态面板来承载这若干种方式的操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-2.png)

---

###### 当页面中有一组操作因低频/空间不足不希望外露时，但却必要存在，可以用动作面板来承载，通过“更多”按钮触发

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-3.png)

#### 推荐/慎用示例

###### 动作面板中不建议提供太多操作项，若过多项在小屏手机中导致需纵向滚动，体验将会受损。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

###### 动作面板中的操作项不建议用icon完成替代文字。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [抽屉](<../导航/Drawer 抽屉.md>) | 需要收折展示一组数量较多的菜单时使用。 |
| [对话框](<Dialog 对话框.md>) | 需要用户做一些决定，或这提供完成某个任务是需要的一些额外信息时使用。 |
| [下拉菜单](<DropdownMenu 下拉菜单.md>) | 当内容较多时，需要通过筛选快速定位某一类内容时使用。 |
| [选择器](<../输入/Picker 选择器.md>) | 当需要在有限的空间展示大量选项供用户选择，或者一组选项由递进层级构成需要用户逐级选择时使用。 |
