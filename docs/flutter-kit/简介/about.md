---
title: "FlutterKit"
---

<p align="center"><img alt="FlutterKit Logo" src="/logo.png" width="100"></p>

# FlutterKit

FlutterKit 是基于 Flutter、Dart、GetX 与 TDesign Flutter 的跨平台项目脚手架。它提供可运行的网络、分页、刷新、数据库、存储、主题、国际化、导航、登录、屏幕适配和 Widget Preview 示例；目标不是替代 Flutter 官方 API，而是让项目从第一天开始有一致的分层与可验证示例。

## 适用场景

- 需要 Android、iOS、Web、macOS、Linux、Windows 共用业务代码。
- 希望按 `View / Logic / State / Binding` 分工，同时保留 GetX 的路由和响应式能力。
- 希望网络、主题、路由、存储与数据库有明确入口，不在页面中重复搭架子。
- 需要在编辑器内同时检查手机、折叠屏、平板以及深浅色页面预览。

## 从哪里开始

1. 按 [快速开始](./quick-start.md) 跑起 `feature/demo/`。
2. 阅读 [项目架构与职责](./architecture.md) 了解 `bootstrap / core / routes / feature` 边界。
3. 新业务页面从 [创建页面](../业务功能/create-page.md) 与 [基础父类总览](../框架核心/base.md) 开始。
4. 使用 [Widget Preview](../扩展/widget-preview.md) 验证页面与组件。

![FlutterKit 架构图](/diagrams/architecture.svg)

## 不包含什么

FlutterKit 不强制后端协议、不替代 TDesign 官方组件文档，也不通过构建命令的 `--dart-define` 切换环境。环境、主题和语言的运行时行为以当前 Dart 源码和应用内设置为准。

## 关联阅读

- [快速开始](./quick-start.md)
- [模块化设计](./modularization.md)
- [社区](./community.md)
