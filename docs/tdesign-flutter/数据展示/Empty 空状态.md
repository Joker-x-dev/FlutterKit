# Empty 空状态

> 用于空状态时的占位提示。

> 来源：[Empty 空状态](https://tdesign.tencent.com/flutter/components/empty)
> 归档时间：2026-10-30T16:00:00+08:00

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
    return const TEmpty(
      type: TEmptyType.plain,
      emptyText: '描述文字',
    );
  }
```

自定义图标空状态

```
  Widget _iconEmptyCustom(BuildContext context) {
    return const TEmpty(
      type: TEmptyType.plain,
      icon: Icons.hourglass_empty_sharp,
      emptyText: '描述文字',
    );
  }
```

自定义图片空状态

```
  Widget _imageEmpty(BuildContext context) {
    return TEmpty(
      type: TEmptyType.plain,
      emptyText: '描述文字',
      image: Container(
        decoration: BoxDecoration(
          color: TTheme.of(context).bgColorComponent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const TImage(
          width: 120,
          assetUrl: 'assets/img/empty.png',
          type: TImageType.fitWidth,
        ),
      ),
    );
  }
```

带操作空状态

```
  Widget _operationEmpty(BuildContext context) {
    return const TEmpty(
      type: TEmptyType.operation,
      operationText: '操作按钮',
      emptyText: '描述文字',
    );
  }
```

自定义带操作空状态

```
  Widget _operationCustomEmpty(BuildContext context) {
    return TEmpty(
      type: TEmptyType.operation,
      emptyText: '描述文字',
      customOperationWidget: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: TButton(
          text: '自定义操作按钮',
          size: TButtonSize.medium,
          theme: TButtonTheme.danger,
          width: 160,
          onTap: () {},
        ),
      ),
    );
  }
```

## API

1. [TEmpty](#tempty)
2. [TEmptyType](#temptytype)
3. [TTapEvent](#ttapevent)

#### TEmpty

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| customOperationWidget | Widget? | - | 自定义操作按钮 |
| emptyText | String? | - | 描述文字 |
| emptyTextColor | Color? | - | 描述文字颜色 |
| emptyTextFont | Font? | - | 描述文字大小 |
| icon | IconData? | TIcons.info_circle_filled | 图标 |
| image | Widget? | - | 展示图片 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| onTapEvent | TTapEvent? | - | 点击事件 |
| operationText | String? | - | 操作按钮文案 |
| operationTheme | TButtonTheme? | - | 操作按钮文案主题色 |
| type | TEmptyType | TEmptyType.plain | 类型，为operation有操作按钮，plain无按钮 |

#### TEmptyType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| plain | - |
| operation | - |

#### TTapEvent

##### 类型定义

```dart
typedef TTapEvent = void Function();
```

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
