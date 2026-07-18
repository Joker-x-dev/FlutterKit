# Popover 弹出气泡

> 用于文字提示的气泡框。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/popover)
> 归档时间：2026-07-16T07:37:59.655Z

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_popover_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_popover_page.dart)

#### 1 组件类型

带箭头的弹出气泡

```
  Widget _buildPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '带箭头',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                  context: _, content: '弹出气泡内容', theme: theme);
            },
          );
        },
      ),
    );
  }
```

不带箭头的弹出气泡

```
  Widget _buildNoArrowPopover(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return TDButton(
          size: TDButtonSize.medium,
          text: '不带箭头',
          type: TDButtonType.outline,
          theme: TDButtonTheme.primary,
          onTap: () {
            TDPopover.showPopover(
                context: _, content: '弹出气泡内容', showArrow: false, theme: theme);
          },
        );
      },
    );
  }
```

自定义内容弹出气泡

```
  Widget _buildNCustomPopover(BuildContext context) {
    var textStyle = TextStyle(
        color: theme == TDPopoverTheme.light
            ? TDTheme.of(context).fontGyColor1
            : TDTheme.of(context).fontWhColor1);
    return LayoutBuilder(
      builder: (_, constrains) {
        return TDButton(
          text: '自定义内容',
          type: TDButtonType.outline,
          theme: TDButtonTheme.primary,
          onTap: () {
            TDPopover.showPopover(
              context: _,
              padding: const EdgeInsets.all(0),
              theme: theme,
              width: 108,
              height: 152,
              contentWidget: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: TDText('选项1', style: textStyle),
                  ),
                  const TDDivider(height: 0.5),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: TDText('选项2', style: textStyle),
                  ),
                  const TDDivider(height: 0.5),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: TDText('选项3', style: textStyle),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
```

#### 1 组件样式

```
  Widget _buildDarkPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '深色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildLightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '浅色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.light,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildInfoPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '品牌色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.info,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildSuccessPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '成功色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.success,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildWarningPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '警告色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.warning,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildErrorPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '错误色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.error,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildDarkPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '深色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildLightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '浅色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.light,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildInfoPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '品牌色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.info,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildSuccessPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '成功色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.success,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildWarningPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '警告色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.warning,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildErrorPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '错误色',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                theme: TDPopoverTheme.error,
              );
            },
          );
        },
      ),
    );
  }
```

顶部弹出气泡

```
  Widget _buildTopLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '顶部左',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.topLeft,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '顶部中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.top,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildTopRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '顶部右',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.topRight,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildTopLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '顶部左',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.topLeft,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '顶部中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.top,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildTopRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '顶部右',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.topRight,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```

底部弹出气泡

```
  Widget _buildBottomLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '底部左',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.bottomLeft,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '底部中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.bottom,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildBottomRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '底部右',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.bottomRight,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildBottomLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '底部左',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.bottomLeft,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '底部中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.bottom,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildBottomRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '底部右',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.bottomRight,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```

右侧弹出气泡

```
  Widget _buildRightTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '右侧上',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.rightTop,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '右侧中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.right,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildRightBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '右侧下',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.rightBottom,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildRightTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '右侧上',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.rightTop,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '右侧中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.right,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildRightBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '右侧下',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.rightBottom,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```

左侧弹出气泡

```
  Widget _buildLeftTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '左侧上',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.leftTop,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '左侧中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.left,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildLeftBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '左侧下',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.leftBottom,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildLeftTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '左侧上',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.leftTop,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '左侧中',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.left,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```


```
  Widget _buildLeftBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return TDButton(
            size: TDButtonSize.medium,
            text: '左侧下',
            type: TDButtonType.outline,
            theme: TDButtonTheme.primary,
            onTap: () {
              TDPopover.showPopover(
                context: _,
                content: '弹出气泡内容',
                placement: TDPopoverPlacement.leftBottom,
                theme: theme,
              );
            },
          );
        },
      ),
    );
  }
```

## API

1. [TDPopoverWidget](#tdpopoverwidget)
2. [TDPopover](#tdpopover)

#### TDPopoverWidget

##### 简介

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| arrowSize | double | 8 | 箭头大小 |
| content | String? | - | 显示内容 |
| contentWidget | Widget? | - | 自定义内容 |
| context | BuildContext | - | 上下文 |
| height | double? | - | 内容高度（包含padding，实际高度：height - paddingTop - paddingBottom） |
| key |  | - |  |
| offset | double | 4 | 偏移 |
| onLongTap | OnLongTap? | - | 长按事件 |
| onTap | OnTap? | - | 点击事件 |
| padding | EdgeInsetsGeometry? | - | 内容内边距 |
| placement | TDPopoverPlacement? | - | 浮层出现位置 |
| radius | BorderRadius? | - | 圆角 |
| showArrow | bool? | true | 是否显示浮层箭头 |
| theme | TDPopoverTheme? | - | 弹出气泡主题 |
| width | double? | - | 内容宽度（包含padding，实际高度：height - paddingLeft - paddingRight） |

#### TDPopover

##### 简介

##### 静态方法

| 名称 | 返回类型 | 说明 |
| --- | --- | --- |
| `showPopover` | `Future` | 显示弹出气泡。 |

###### `showPopover`

显示弹出气泡。

```dart
static Future showPopover({
  required BuildContext context,
  String? content,
  Widget? contentWidget,
  double offset = 4,
  TDPopoverTheme? theme,
  bool closeOnClickOutside = true,
  TDPopoverPlacement? placement,
  bool? showArrow = true,
  double arrowSize = 8,
  EdgeInsetsGeometry? padding,
  double? width,
  double? height,
  Color? overlayColor = Colors.transparent,
  OnTap? onTap,
  OnLongTap? onLongTap,
  BorderRadius? radius,
});
```
