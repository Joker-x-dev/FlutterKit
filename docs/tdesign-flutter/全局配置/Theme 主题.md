# Theme 主题

> 来源：[Theme 主题](https://tdesign.tencent.com/flutter/components/theme)
> 归档时间：2026-10-30T16:00:00+08:00

Theme 主题页面展示 TDesign Flutter 的颜色 Token、字体规格和组件默认样式，并提供主题 API 查询。页面中的色板会根据当前上下文重新读取主题。

## 代码演示

### 颜色示例

#### 功能色
- brandNormalColor：品牌主色
- brandRequiredColor：品牌必填色
- successColor：成功色
- warningColor：警告色
- dangerColor：危险色
- infoColor：信息色

#### 文字 & 图标颜色
- textColorPrimary：主要文字
- textColorSecondary：次要文字
- textColorPlaceholder：占位文字
- textColorDisabled：禁用文字
- iconColor：图标颜色
- iconColorBlended：混合图标颜色

#### 中性色板
- grayColor1 ~ grayColor11：中性色渐变阶梯

## TThemeData

主题数据类，承载全局 Token 配置。

### 构造方法
- TThemeData.fromJson(String name, String json, {String? darkName})

### 属性
| 属性 | 类型 | 说明 |
| --- | --- | --- |
| name | String | 主题名称 |
| colorMap | Map<String, Color> | 颜色 Token 集合 |
| fontMap | Map<String, Font> | 字体 Token 集合 |
| radiusMap | Map<String, double> | 圆角 Token 集合 |
| shadowMap | Map<String, TShadow> | 阴影 Token 集合 |
| fontFamilyMap | Map<String, String> | 字体族 Token 集合 |
| spacerMap | Map<String, double> | 间距 Token 集合 |

### 静态方法
- TThemeData.defaultData()：返回默认主题配置
- TThemeData.fromJson(name, json, {darkName})：从 JSON 字符串构建主题

### 实例方法
- copyWith({name, colorMap, fontMap, ...})：复制并修改主题

## Font / FontFamily

字体 Token 相关类。

## TResourceManager

资源管理器，管理多语言文案。

## TResourceDelegate

资源代理基类，子类需重写各文案 getter。

## TStyleResolver

样式解析器。

## TMaterialThemeBuilder / TThemeBuilder

主题构建器，将 TThemeData 转为 Flutter ThemeData。

- TThemeBuilder.light(tokens)：构建浅色主题
- TThemeBuilder.dark(tokens)：构建深色主题
- TThemeBuilder.merged(context, extensions)：合并子树主题扩展

## 何时使用

当应用需要使用 TDesign 设计体系的视觉规范时，通过 TThemeBuilder 在 MaterialApp 中配置 theme / darkTheme。

Web 预览用于体验交互效果；设备端运行方式见[快速开始](<../开始/快速开始.md>)
