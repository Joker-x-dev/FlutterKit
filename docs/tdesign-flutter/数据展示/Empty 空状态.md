# Empty 空状态

> 用于空状态时的占位提示。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/empty)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_empty_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_empty_page.dart)

#### 1 组件类型

图标空状态

```
  Widget _iconEmpty(BuildContext context) {
    return const TDEmpty(
      type: TDEmptyType.plain,
      emptyText: '描述文字',
    );
  }
```

自定义图标空状态

```
  Widget _iconEmptyCustom(BuildContext context) {
    return const TDEmpty(
      type: TDEmptyType.plain,
      icon: Icons.hourglass_empty_sharp,
      emptyText: '描述文字',
    );
  }
```

自定义图片空状态

```
  Widget _imageEmpty(BuildContext context) {
    return TDEmpty(
      type: TDEmptyType.plain,
      emptyText: '描述文字',
      image: Container(
        decoration: BoxDecoration(
          color: TDTheme.of(context).bgColorComponent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const TDImage(
          width: 120,
          assetUrl: 'assets/img/empty.png',
          type: TDImageType.fitWidth,
        ),
      ),
    );
  }
```

带操作空状态

```
  Widget _operationEmpty(BuildContext context) {
    return const TDEmpty(
      type: TDEmptyType.operation,
      operationText: '操作按钮',
      emptyText: '描述文字',
    );
  }
```

自定义带操作空状态

```
  Widget _operationCustomEmpty(BuildContext context) {
    return TDEmpty(
      type: TDEmptyType.operation,
      emptyText: '描述文字',
      customOperationWidget: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: TDButton(
          text: '自定义操作按钮',
          size: TDButtonSize.medium,
          theme: TDButtonTheme.danger,
          width: 160,
          onTap: () {},
        ),
      ),
    );
  }
```

## API

1. [TDEmpty](#tdempty)

#### TDEmpty

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| customOperationWidget | Widget? | - | 自定义操作按钮 |
| emptyText | String? | - | 描述文字 |
| emptyTextColor | Color? | - | 描述文字颜色 |
| emptyTextFont | Font? | - | 描述文字大小 |
| icon | IconData? | TDIcons.info_circle_filled | 图标 |
| image | Widget? | - | 展示图片 |
| key |  | - |  |
| onTapEvent | TDTapEvent? | - | 点击事件 |
| operationText | String? | - | 操作按钮文案 |
| operationTheme | TDButtonTheme? | - | 操作按钮文案主题色 |
| type | TDEmptyType | TDEmptyType.plain | 类型，为operation有操作按钮，plain无按钮 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)

#### 何时使用

当页面或模块数据为空时使用。

#### 与页面布局相关

###### 用于整个页面或某个独立模块的状态展示，在页面、模块内居中。

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-2.png)

#### 组件搭配使用

###### 空状态与[步骤条](<../导航/Steps 步骤条.md>)组合使用，通过步骤展示提示用户如何新建/添加。

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-3.png)

---

###### 空状态与[按钮](<../基础/Button 按钮.md>)组合使用，引导用户直接新建/添加。

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-4.png)
