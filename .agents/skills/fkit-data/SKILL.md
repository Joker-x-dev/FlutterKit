---
name: fkit-data
description: 实现和维护 FlutterKit 数据访问链路，覆盖实体、请求、响应、Repository、网络、数据库、本地存储、RequestHelper、分页与全局 Service。用户要求接入接口、持久化数据、创建模型、处理请求结果或实现网络列表时使用。
---

# FKit Data

## 必读资料

先阅读 `AGENTS.md`，再根据数据来源读取：

- 总体边界：`docs/flutter-kit/框架核心/data.md`
- 模型：`docs/flutter-kit/框架核心/model.md`
- 网络：`docs/flutter-kit/框架核心/network.md`、`docs/flutter-kit/框架核心/result.md`
- 数据库：`docs/flutter-kit/框架核心/database.md`
- 键值存储：`docs/flutter-kit/框架核心/datastore.md`
- 全局状态：`docs/flutter-kit/框架核心/state.md`
- 页面状态机：对应 `docs/flutter-kit/框架核心/base-network.md`、`docs/flutter-kit/框架核心/base-list.md` 或 `docs/flutter-kit/框架核心/base-refresh.md`

## 选择数据链路

- 网络：Model → Network DataSource → Repository → `RequestHelper` 或网络父类 → Logic/State。
- SQLite：Database Entity/Provider → Local DataSource → Repository → Logic/Service。
- 键值存储：Store DataSource → Store Repository → Logic/Service。
- 长期状态：Repository 恢复持久化数据 → Core Service 维护跨模块状态。

Feature 只能依赖 Repository 或 Service，不直接依赖具体 DataSource 实现。

## 工作流

1. 从真实契约确定 Entity、Request、Response、可空性、成功码和分页字段。
2. 复用现有基础模型和数据源结构，保持接口、实现和 Repository 单一职责。
3. 使用完整领域名声明 Repository 字段，不使用 `_repository`。
4. 网络结果交给 `RequestHelper` 或网络父类统一处理；不要在 Logic 重复制造复杂 try/catch、Toast 和 loading 生命周期。
5. 页面展示状态写入 Feature State；持久化状态通过 Repository/DataSource；跨模块长期状态才进入 Core Service。
6. 修改注解或 Retrofit 声明后运行代码生成，不手工修改 `*.g.dart`。

## 验证

为 DataSource、Repository、Result 或 Service 补充成功、业务失败、异常、空值和分页边界测试。运行代码生成、相关测试、静态分析和 `git diff --check`，确认 Feature 未绕过 Repository。
