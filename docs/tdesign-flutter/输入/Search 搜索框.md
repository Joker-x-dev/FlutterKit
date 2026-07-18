# Search 搜索框

> 用于一组预设数据中的选择。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/search)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_search_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_search_page.dart)

#### 1 组件类型

基础搜索框

```
  Widget _buildDefaultSearchBar(BuildContext context) {
    return TDSearchBar(
      placeHolder: '搜索预设文案',
      onTextChanged: (String text) {
        setState(() {
          inputText = text;
        });
      },
    );
  }
```

获取焦点后显示取消按钮

```
  Widget _buildFocusSearchBar(BuildContext context) {
    return const TDSearchBar(
      placeHolder: '搜索预设文案',
      needCancel: true,
      autoFocus: true,
    );
  }
```

#### 1 组件样式

搜索框形状

```
  Widget _buildSearchBarWithShape(BuildContext context) {
    return Column(
      // spacing: 16,
      children: [
        TDSearchBar(
          placeHolder: '搜索预设文案',
          // 方形
          style: TDSearchStyle.square,
          onTextChanged: (String text) {
            setState(() {
              inputText = text;
            });
          },
        ),
        const SizedBox(height: 16),
        TDSearchBar(
          placeHolder: '搜索预设文案',
          // 圆形
          style: TDSearchStyle.round,
          onTextChanged: (String text) {
            setState(() {
              inputText = text;
            });
          },
        ),
      ],
    );
  }
```

默认状态其他对齐方式

```
  Widget _buildCenterSearchBar(BuildContext context) {
    return TDSearchBar(
      placeHolder: '搜索预设文案',
      alignment: TDSearchAlignment.center,
      onTextChanged: (String text) {
        setState(() {
          inputText = text;
        });
      },
    );
  }
```

## API

1. [TDSearchBar](#tdsearchbar)

#### TDSearchBar

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| action | String | '' | 自定义操作文字 |
| alignment | TDSearchAlignment? | TDSearchAlignment.left | 对齐方式，居中或这头部对齐 |
| autoFocus | bool | false | 是否自动获取焦点 |
| autoHeight | bool | false | 是否自动计算高度 |
| backgroundColor | Color? | - | 背景颜色 |
| controller | TextEditingController? | - | 控制器 |
| cursorHeight | double? | - | 光标的高 |
| enabled | bool? | - | 是否禁用 |
| focusNode | FocusNode? | - | 自定义焦点 |
| inputAction | TextInputAction? | - | 键盘动作类型 |
| key |  | - |  |
| mediumStyle | bool | false | 是否在导航栏中的样式 |
| needCancel | bool | false | 是否需要取消按钮 |
| onActionClick | TDSearchBarEvent? | - | 自定义操作回调 |
| onClearClick | TDSearchBarClearEvent? | - | 自定义操作回调 |
| onEditComplete | TDSearchBarCallBack? | - | 编辑完成回调 |
| onInputClick | GestureTapCallback? | - | 输入框点击事件 |
| onSubmitted | TDSearchBarEvent? | - | 提交回调 |
| onTapOutside | TapRegionCallback? | - | 点击输入框外部回调 |
| onTextChanged | TDSearchBarEvent? | - | 文字改变回调 |
| padding | EdgeInsets | const EdgeInsets.symmetric(horizontal: 16, vertical: 8) | 内部填充 |
| placeHolder | String? | - | 预设文案 |
| readOnly | bool? | - | 是否只读 |
| style | TDSearchStyle? | TDSearchStyle.square | 样式 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [常见用法](#常见用法)
4. [相似组件](#相似组件)

#### 何时使用

当需要从海量信息中准确提取准确的内容时使用。

#### 与页面布局相关

###### 位于页面或内容模块的最上方，通过搜索框、搜索icon等方式承载和触发功能。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-2.png)

#### 常见用法

###### 在可搜索内容类型较为单一的场景下，可直接在原页面激活搜索态进行搜索，并通过高亮命中字符的方式展示搜索结果，页面内容组织结构保持不变。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-3.png)

---

###### 在可搜索内容类型较丰富的场景下，通过模态承载搜索态，并在新页面中按分类呈现搜索结果。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-4.png)

---

###### 在用户触发搜索后，对用户即将搜索的内容进行预判和推荐，并需要满足营销的诉求。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-5.png)

#### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [输入框](<Input 输入框.md>) | 需要进行文字输入，且需填写的字数较少时使用。 |
