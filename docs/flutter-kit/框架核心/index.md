# Core / 框架核心

`core/` 保存跨 Feature 稳定复用的基础能力。它为业务页面提供统一父类、主题和设计系统、模型和数据访问、全局 Service、UI 辅助与工具；它不承载某个具体页面的 View、单页状态或模块专属组件。

## 模块地图

| 模块 | 内容 | 首先阅读 |
| --- | --- | --- |
| `base/` | View、Logic、网络、列表、刷新、Tab、Dialog 父类 | [基础父类总览](./base.md) |
| `design_system/` | TDesign 主题适配、尺寸、形状、Space、链式扩展 | [设计系统](./design-system.md) |
| `data/` | Repository 与跨模块 Preview Data | [数据层](./data.md) |
| `database/` / `datastore/` / `network/` | 数据库、键值存储、HTTP 数据源 | [数据层](./data.md) |
| `model/` / `result/` | 实体、请求、响应、异常、请求结果处理 | [数据模型](./model.md) |
| `service/` | 跨模块长期状态 | [状态与 Service](./state.md) |
| `ui/` / `util/` | 通用 UI、适配、Preview、Alert、Log、Route 等 | [UI 组件](./ui.md) |

## 使用原则

1. 新能力先确定复用范围：一个页面留在 Feature，多个 Feature 才考虑下沉 core。
2. 变更 Core 公共 API 前检查所有调用 Feature；Core 的小改动可能影响全局页面。
3. Core 只提供通用机制与契约，不依赖 `feature/`，不反向引用业务页面。
4. 对应业务示例优先查看 `feature/demo/`，文档示例与它保持一致。

## 关联阅读

- [基础父类总览](./base.md)
- [设计系统](./design-system.md)
- [数据层](./data.md)
