# FlutterKit 框架文档

> 在线文档：[https://flutter.dusksnow.top](https://flutter.dusksnow.top)
> 归档来源：FlutterKit 文档站 `docs/help/`
> 归档范围：简介、Core、Navigation、Feature、扩展
> 同步时间：2026-07-20

本目录用于开发 FlutterKit 业务时快速查阅，目录和页面名称与在线文档侧边栏保持一致。内容以项目当前实现和在线文档为准；TDesign 组件 API 请查阅 [`docs/tdesign-flutter/`](../tdesign-flutter/README.md)。

## 按任务查阅

| 开发任务 | 建议阅读顺序 |
| --- | --- |
| 新建业务模块或页面 | [模块化设计](简介/modularization.md) → [Feature 概览](业务功能/index.md) → [创建页面](业务功能/create-page.md) → [页面模板](业务功能/templates.md) |
| 编写 View 与组件 | [完整布局规范与扩展](../../lib/core/design_system/README.md) → [View 规范](业务功能/view.md) → [设计系统](框架核心/design-system.md) → [TDesign Flutter](框架核心/tdesign.md) → 具体 TDesign 组件文档 |
| 编写 Logic 与状态 | [Logic 规范](业务功能/logic.md) → [State 规范](业务功能/state.md) → [基础父类](框架核心/base.md) → [状态管理](框架核心/state.md) |
| 接入接口或数据 | [数据层](框架核心/data.md) → [数据模型](框架核心/model.md) → [网络请求](框架核心/network.md) → [结果处理](框架核心/result.md) |
| 使用数据库或存储 | [数据层](框架核心/data.md) → [数据库](框架核心/database.md) 或 [本地存储](框架核心/datastore.md) |
| 配置路由与传参 | [导航概览](导航/index.md) → [路由配置](导航/router.md) → [参数与结果回传](导航/result.md) |
| 主题、深色与样式 | [完整布局规范与扩展](../../lib/core/design_system/README.md) → [设计系统](框架核心/design-system.md) → [主题系统](框架核心/theme.md) → [深色模式](框架核心/dark-mode.md) → [Widget 链式扩展](框架核心/widget-extensions.md) |
| 页面适配与预览 | [屏幕适配](扩展/screen-adapt.md) → [安全区适配](扩展/safe-area.md) → [预览](扩展/widget-preview.md) |

项目级高频强约束统一维护在仓库根目录 `AGENTS.md`。本目录保存完整概念、API、流程和示例；不要在多个 README 中复制同一段实现说明。

## 简介

- [FlutterKit 是什么](简介/about.md)
- [快速开始](简介/quick-start.md)
- [环境要求](简介/environment.md)
- [模块化设计](简介/modularization.md)
- [项目架构与职责](简介/architecture.md)
- [QQ群](简介/community.md)
- [AI 辅助开发](简介/ai-coding.md)

## Core / 框架核心

- [Core / 框架核心](框架核心/index.md)
- [设计系统](框架核心/design-system.md)
- [主题系统](框架核心/theme.md)
- [深色模式](框架核心/dark-mode.md)
- [国际化](框架核心/localization.md)
- [Widget 链式扩展](框架核心/widget-extensions.md)
- [动画链式扩展](框架核心/animated-extensions.md)
- [基础父类](框架核心/base.md)
- [网络父类](框架核心/base-network.md)
- [分页父类](框架核心/base-list.md)
- [刷新父类](框架核心/base-refresh.md)
- [Tab 父类](框架核心/base-tab.md)
- [底部弹窗](框架核心/base-dialog.md)
- [数据层](框架核心/data.md)
- [数据库](框架核心/database.md)
- [本地存储](框架核心/datastore.md)
- [数据模型](框架核心/model.md)
- [网络请求](框架核心/network.md)
- [结果处理](框架核心/result.md)
- [状态管理](框架核心/state.md)
- [UI 组件](框架核心/ui.md)
- [工具类](框架核心/util.md)
- [TDesign Flutter](框架核心/tdesign.md)

## Navigation / 导航

- [导航概览](导航/index.md)
- [路由配置](导航/router.md)
- [导航流程](导航/flow.md)
- [登录守卫](导航/guard.md)
- [参数与结果回传](导航/result.md)

## Feature / 业务功能

- [概览](业务功能/index.md)
- [目录与命名](业务功能/structure.md)
- [创建页面](业务功能/create-page.md)
- [View 规范](业务功能/view.md)
- [Logic 规范](业务功能/logic.md)
- [State 规范](业务功能/state.md)
- [Binding 规范](业务功能/binding.md)
- [页面模板](业务功能/templates.md)

## 扩展

- [登录逻辑](扩展/login-impl.md)
- [安全区适配](扩展/safe-area.md)
- [屏幕适配](扩展/screen-adapt.md)
- [预览](扩展/widget-preview.md)
- [图标、资源与启动页](扩展/assets.md)

## 使用约定

1. 修改代码前先按任务范围阅读对应栏目，确认职责、调用链与目录边界。
2. 编写页面 UI 前先查阅设计系统、主题、链式扩展及具体 TDesign 组件文档。
3. 文档与源码不一致时，以可运行源码和测试为准，并同步修正文档站与本归档。
