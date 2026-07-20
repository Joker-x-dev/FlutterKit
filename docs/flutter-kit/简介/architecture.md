# 项目架构与职责

FlutterKit 的主架构由启动、通用能力、导航和业务 Feature 组成。`core` 不是“什么都能放”的目录；它只收纳跨模块复用的能力。单模块、单页面内容优先保留在 Feature，保持依赖方向清晰。

![FlutterKit 架构图](/diagrams/architecture.svg)

## 目录职责

| 区域 | 主要职责 | 不能承担 |
| --- | --- | --- |
| `bootstrap/` | 启动初始化器 | 业务页面请求 |
| `application.dart` | 初始化编排、主题/语言全局状态 | 大量具体初始化实现 |
| `core/` | 基类、设计系统、数据访问、Service、工具 | 单页面组件与数据 |
| `routes/` | GetPage、Navigator、Params、Result、Guard | 页面 UI 与业务实现 |
| `feature/` | View、Logic、State、Binding、模块组件、国际化 | 跨模块底层实现 |
| `main.dart` | 根 Widget、主题、语言、路由总表 | 页面业务逻辑 |

## 两条核心链路

```text
数据：View → Logic → Repository → Network / Database / Datastore
页面：Navigator → GetPage → Binding → Logic → View → State / Obx
```

网络页面额外由 `BaseNetworkLogic` 管理 loading、error、emptyData、dataSuccess；列表、刷新和 Tab 从对应父类扩展。主题从 JSON 到 `Application`、`ThemeData`、`AppTheme` 的链路见 [主题系统](../框架核心/theme.md)。

## 依赖规则

- `core` 不依赖 Feature；Feature 可以依赖 core 和 routes。
- Feature 之间通过 Navigator、Repository 或明确 Service 协作，避免直接 import 对方页面实现。
- View 不访问 DataSource；Logic 不构建大段 Widget；State 不发请求。
- 模块专属数据不提升到 core；多个模块稳定复用后再下沉。

## 关联阅读

- [模块化设计](./modularization.md)
- [Core 概览](../框架核心/index.md)
- [Feature 概览](../业务功能/index.md)
