# ActionSheet 动作面板

> 在当前场景下向用户呈现一组可选操作。

> 来源：[ActionSheet 动作面板](https://tdesign.tencent.com/flutter/components/action-sheet)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

### 引入

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 使用场景

ActionSheet 通过 `TActionSheet.showList`、`showGrid` 和 `showGroup` 命令式打开，适合文件操作、分享方式和图片编辑等短流程操作。选择项目后会自动关闭面板，并通过 `onChanged` 返回被选中的项目。

```dart
TActionSheet.showList(
  context,
  subtitle: '报告-2026-Q3.pdf',
  items: [
    TActionSheetItem(label: '编辑内容', icon: const Icon(TIcons.edit)),
    TActionSheetItem(label: '复制链接', icon: const Icon(TIcons.link)),
    TActionSheetItem(label: '移动到文件夹', icon: const Icon(TIcons.folder)),
    TActionSheetItem(
      label: '删除文件',
      icon: const Icon(TIcons.delete),
      disabled: true,
    ),
  ],
  onChanged: (item, index) {
    // 执行业务操作
  },
);
```

### 宫格与分组

`icon` 是完整的 Widget 插槽。普通 `Icon` 会继承 ActionSheet 的默认字号和颜色；渠道图标、品牌图标或带背景的工具图标由调用方直接构造完整 Widget，组件不会强制缩放。

```dart
TActionSheet.showGrid(
  context,
  subtitle: '选择分享方式',
  items: [
    TActionSheetItem(
      label: '消息',
      icon: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: context.tTheme.successLightColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          TIcons.chat,
          size: 24,
          color: context.tTheme.successNormalColor,
        ),
      ),
    ),
    TActionSheetItem(label: '邮件', icon: const Icon(TIcons.mail)),
    TActionSheetItem(label: '复制链接', icon: const Icon(TIcons.link)),
    TActionSheetItem(label: '生成二维码', icon: const Icon(TIcons.qrcode)),
  ],
  onChanged: (item, index) {},
);

TActionSheet.showGroup(
  context,
  items: [
    TActionSheetItem(
      label: '旋转',
      group: '图片处理',
      icon: const Icon(TIcons.rotate),
    ),
    TActionSheetItem(
      label: '裁剪',
      group: '图片处理',
      icon: const Icon(TIcons.cut),
    ),
    TActionSheetItem(
      label: '滤镜',
      group: '图片处理',
      icon: const Icon(TIcons.filter),
    ),
    TActionSheetItem(
      label: '删除图片',
      group: '危险操作',
      icon: const Icon(TIcons.delete),
    ),
  ],
  onChanged: (item, index) {},
);
```

### API 摘要

- `TActionSheetItem`：`label`、`icon`、`subtitle`、`badge`、`disabled` 和 `group`。
- `icon` 是 Widget 插槽；背景、形状和显式尺寸由该 Widget 自己控制。
- `showList`：列表动作面板，支持副标题、取消按钮和禁用项。
- `showGrid`：宫格动作面板，支持分页、滚动、行数和每页数量。
- `showGroup`：按 `group` 分组并横向滚动展示动作。
- 三种入口均返回 `TPopupHandle`，可设置 `showOverlay`、`closeOnOverlayClick`、`useSafeArea`、`onCancel` 和 `onClosed`。

`TActionSheetThemeData` 提供 `iconSize`、`gridIconExtent` 和 `iconColor` 等视觉默认值。解析优先级为自定义 Widget 显式样式 > ThemeExtension > TDesign token；ThemeExtension 缺失时组件直接使用 token。

示例源码：[t_action_sheet_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/t_action_sheet_page.dart)

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
