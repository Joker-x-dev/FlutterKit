# Avatar 头像

> 用于展示用户头像信息，除了纯展示也可点击进入个人详情等操作。

> 来源：[Avatar 头像](https://tdesign.tencent.com/flutter/components/avatar)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_avatar_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_avatar_page.dart)

#### 1 组件类型

图片头像

```
  Widget _buildImageAvatar(BuildContext context) {
    return const Row(
      // spacing: 32,
      children: [
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.normal,
          defaultUrl: 'assets/img/t_avatar_1.png',
        ),
        SizedBox(width: 32),
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.normal,
          shape: TAvatarShape.square,
          defaultUrl: 'assets/img/t_avatar_1.png',
        ),
      ],
    );
  }
```

字符头像

```
  Widget _buildTextAvatar(BuildContext context) {
    return const Row(
      // spacing: 32,
      children: [
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.customText,
          text: 'A',
        ),
        SizedBox(width: 32),
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.customText,
          shape: TAvatarShape.square,
          text: 'A',
        ),
      ],
    );
  }
```

图标头像

```
  Widget _buildIconAvatar(BuildContext context) {
    return const Row(
      // spacing: 32,
      children: [
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.icon,
        ),
        SizedBox(width: 32),
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.icon,
          shape: TAvatarShape.square,
        ),
      ],
    );
  }
```

带徽标头像

```
  Widget _buildBadgeAvatar(BuildContext context) {
    return const Row(
      // spacing: 32,
      children: [
        SizedBox(
          height: 51,
          width: 51,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              TAvatar(
                size: TAvatarSize.medium,
                type: TAvatarType.normal,
                defaultUrl: 'assets/img/t_avatar_1.png',
              ),
              Positioned(child: TBadge(TBadgeType.redPoint), right: 0, top: 0)
            ],
          ),
        ),
        SizedBox(width: 32),
        SizedBox(
          height: 51,
          width: 51,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              TAvatar(
                size: TAvatarSize.medium,
                type: TAvatarType.customText,
                text: 'A',
              ),
              Positioned(
                child: TBadge(TBadgeType.message, count: '8'),
                right: 0,
                top: 0,
              )
            ],
          ),
        ),
        SizedBox(width: 32),
        SizedBox(
          width: 51,
          height: 51,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              TAvatar(size: TAvatarSize.medium, type: TAvatarType.icon),
              Positioned(
                child: TBadge(TBadgeType.message, count: '12'),
                right: 0,
                top: 0,
              )
            ],
          ),
        ),
      ],
    );
  }
```

#### 1 特殊类型

纯展示的头像组

```
  Widget _buildDisplayAvatar(BuildContext context) {
    var assetUrl = 'assets/img/t_avatar_1.png';
    var assetUrl2 = 'assets/img/t_avatar_2.png';
    var avatarList = [assetUrl, assetUrl2, assetUrl, assetUrl2, assetUrl];
    return TAvatar(
      size: TAvatarSize.medium,
      type: TAvatarType.display,
      displayText: '+5',
      avatarDisplayListAsset: avatarList,
    );
  }
```

带操作的头像组

```
  Widget _buildOperationAvatar(BuildContext context) {
    var assetUrl = 'assets/img/t_avatar_1.png';
    var assetUrl2 = 'assets/img/t_avatar_2.png';
    var avatarList = [assetUrl, assetUrl2, assetUrl, assetUrl2, assetUrl];
    return TAvatar(
      size: TAvatarSize.medium,
      type: TAvatarType.operation,
      avatarDisplayListAsset: avatarList,
      onTap: () {
        TToast.showText('点击了操作', context: context);
      },
    );
  }
```

#### 1 组件尺寸

大尺寸：64px

```
  Widget _buildLargeAvatar(BuildContext context) {
    return const Row(
      // spacing: 32,
      children: [
        TAvatar(
          size: TAvatarSize.large,
          type: TAvatarType.normal,
          defaultUrl: 'assets/img/t_avatar_1.png',
        ),
        SizedBox(width: 32),
        TAvatar(
          size: TAvatarSize.large,
          type: TAvatarType.customText,
          text: 'A',
        ),
        SizedBox(width: 32),
        TAvatar(
          size: TAvatarSize.large,
          type: TAvatarType.icon,
        ),
      ],
    );
  }
```

中尺寸：48px

```
  Widget _buildMediumAvatar(BuildContext context) {
    return const Row(
      // spacing: 48,
      children: [
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.normal,
          defaultUrl: 'assets/img/t_avatar_1.png',
        ),
        SizedBox(width: 48),
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.customText,
          text: 'A',
        ),
        SizedBox(width: 48),
        TAvatar(
          size: TAvatarSize.medium,
          type: TAvatarType.icon,
        ),
      ],
    );
  }
```

小尺寸：40px

```
  Widget _buildSmallAvatar(BuildContext context) {
    return const Row(
      // spacing: 56,
      children: [
        TAvatar(
          size: TAvatarSize.small,
          type: TAvatarType.normal,
          defaultUrl: 'assets/img/t_avatar_1.png',
        ),
        SizedBox(width: 56),
        TAvatar(
          size: TAvatarSize.small,
          type: TAvatarType.customText,
          text: 'A',
        ),
        SizedBox(width: 56),
        TAvatar(
          size: TAvatarSize.small,
          type: TAvatarType.icon,
        ),
      ],
    );
  }
```

## API

1. [TAvatar](#tavatar)
2. [TAvatarSize](#tavatarsize)
3. [TAvatarType](#tavatartype)
4. [TAvatarShape](#tavatarshape)

#### TAvatar

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| avatarDisplayBorder | double | 2 | 带操作展示的头像描边宽度 |
| avatarDisplayList | List? | - | 带操作展示的头像列表 |
| avatarDisplayListAsset | List? | - | 带操作展示的头像列表（本地资源） |
| avatarDisplayWidget | Widget? | - | 带操作头像自定义操作Widget |
| avatarSize | double? | - | 自定义头像大小 |
| avatarUrl | String? | - | 头像地址 |
| backgroundColor | Color? | - | 自定义文案时背景色 |
| defaultUrl | String | '' | 默认图片（本地） |
| displayText | String? | - | 纯展示类型末尾文字 |
| fit | BoxFit? | - | 自定义图片对齐方式 |
| icon | IconData? | - | 自定义图标 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| onTap | Function()? | - | 操作点击事件 |
| radius | double? | - | 自定义圆角 |
| shape | TAvatarShape | TAvatarShape.circle | 头像形状 |
| size | TAvatarSize | TAvatarSize.medium | 头像尺寸 |
| text | String? | - | 自定义文字 |
| type | TAvatarType | TAvatarType.normal | 头像类型 |

#### TAvatarSize

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| large | - |
| medium | - |
| small | - |

#### TAvatarType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| icon | - |
| normal | - |
| customText | - |
| display | - |
| operation | - |

#### TAvatarShape

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| circle | - |
| square | - |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)

#### 何时使用

作为一个用户信息展示，或用来代表某个/某些具体用户。

#### 组件搭配使用

###### 头像与[动作面板](<../反馈/ActionSheet 动作面板.md>) 组合使用，在分享场景中利用动作面板承载用户头像，用于分享对象的选择。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-1.png)

---

###### 头像与[单元格](<Cell 单元格.md>) 组合使用，用于展示结构化的成员名称及信息，方便快速识别。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-2.png)

---

###### 头像与[徽标](<Badge 徽标.md>) 组合使用，可作为消息提示或人员数量提示等。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-3.png)

#### 常见用法

###### 多个头像可组合展示构成头像组；当页面布局空间有限，超过可外显个数时候，可将重复性较高的头像信息做隐藏收起，需要时再让用户主动触发查看。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-4.png)

#### 推荐/慎用示例

###### 对于字符型头像，需要根据场景定义最大字符数，避免字符过多影响可读性，降低可识别度。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
