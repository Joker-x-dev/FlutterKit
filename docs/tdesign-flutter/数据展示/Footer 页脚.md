# Footer 页脚

> 用于展示App的版权声明、联系信息、重要页面链接和其他相关内容等信息。

> 来源：[Footer 页脚](https://tdesign.tencent.com/flutter/components/footer)
> 归档时间：2026-10-30T16:00:00+08:00

## 示例

![](https://img.shields.io/badge/coverages%3A%20lines-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20functions-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20statements-100%25-blue)![](https://img.shields.io/badge/coverages%3A%20branches-83%25-blue)

### 引入

在tdesign_flutter/tdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

[td_footer_page.dart](https://github.com/Tencent/tdesign-flutter/blob/main/tdesign-component/example/lib/page/td_footer_page.dart)

#### 1 组件类型

基础页脚

```
  Widget _buildFooter(BuildContext context) {
    return const TFooter(
      TFooterType.text,
      text: 'Copyright © 2019-2023 TDesign.All Rights Reserved.',
    );
  }
```

基础加链接页脚

```
  Widget _buildSingleLinkFooter(BuildContext context) {
    return TFooter(
      TFooterType.link,
      links: [
        TLink(
          label: '底部链接',
          style: TLinkStyle.primary,
          type: TLinkType.withSuffixIcon,
          uri: Uri.parse('https://example.com'),
          linkClick: (link) {
            print('点击了链接 $link');
          },
        ),
      ],
      text: 'Copyright © 2019-2023 TDesign.All Rights Reserved.',
    );
  }
```


```
  Widget _buildLinksFooter(BuildContext context) {
    return TFooter(
      TFooterType.link,
      links: [
        TLink(
          label: '底部链接1',
          style: TLinkStyle.primary,
          uri: Uri.parse('https://example.com'),
          linkClick: (link) {
            print('点击了链接1 $link');
          },
        ),
        TLink(
          label: '底部链接2',
          style: TLinkStyle.primary,
          uri: Uri.parse('https://example.com'),
          linkClick: (link) {
            print('点击了链接2 $link');
          },
        ),
      ],
      text: 'Copyright © 2019-2023 TDesign.All Rights Reserved.',
    );
  }
```

品牌页脚

```
  Widget _buildBrandFooter(BuildContext context) {
    return const TFooter(
      TFooterType.brand,
      logo: 'assets/img/t_brand.png',
      width: 204,
    );
  }
```

## API

1. [TFooter](#tfooter)
2. [TFooterType](#tfootertype)

#### TFooter

##### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| type | TFooterType | - | 样式 |
| height | double? | - | 自定义图片高 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 |
| links | List | const [] | 链接 |
| logo | String? | - | 品牌图片 |
| text | String | '' | 文字 |
| width | double? | - | 自定义图片宽 |

#### TFooterType

##### 枚举值

| 名称 | 说明 |
| --- | --- |
| text | 文字样式 |
| link | 链接样式 |
| brand | 品牌样式 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [常见用法](#常见用法)

#### 何时使用

当页面底部需要放置一些补充信息和链接时使用。

#### 与页面布局相关

###### 页脚通常位于网站每个页面底部或主体内容下方的区域。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-1.png)

#### 常见用法

###### 用于承载版权、隐私政策和使用条款等信息，它们是法律保护所需的。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-2.png)

---

###### 用于承载网站、产品的联系方式，便于用户在页脚查找联系信息或查找获得客户支持的方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-3.png)

---

###### 用于承载网站导航。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-4.png)

---

###### 用于承载相关公司/品牌列表，让用户能认知合作或者旗下的品牌/公司，并提供找到他们的方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-5.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-6.png)
