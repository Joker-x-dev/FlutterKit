# 模块化设计

FlutterKit 不建立额外的 `foundation/` 目录。跨业务的基础能力集中在 `core`，业务按 Feature 拆分，导航契约在 `routes`。这种划分避免重复抽象层，也让读者可以从实际代码路径判断职责。

```text
lib/
├── bootstrap/       # 应用启动任务
├── core/            # 跨模块基础能力
├── feature/         # auth / demo / main / user 等业务模块
├── routes/          # 路由、导航器、参数、结果、守卫
├── application.dart # 全局状态和初始化编排
└── main.dart        # 根应用与主题路由接入
```

## 下沉判断

| 复用范围 | 推荐位置 |
| --- | --- |
| 一个页面 | 当前 View / State / 私有 Widget |
| 一个 Feature 多页面 | 该 Feature 的 widgets、models 或数据位置 |
| 多个 Feature | `core/ui`、`core/model`、`core/data`、`core/service` |
| 仅导航协议 | `routes/<module>/` Params / Result |

## 依赖规则

- Feature 只能向 core、routes 和自身内部依赖；避免 Feature A 直接依赖 Feature B。
- core 不 import Feature，否则共享层会反向绑死业务。
- Repository 只能暴露数据契约，不能返回页面 Widget；Navigator 不能创建 Feature Logic。
- 模块拆分优先按业务边界，不按“所有 View 放一起、所有 Logic 放一起”的技术目录拆分。

## 关联阅读

- [项目架构与职责](./architecture.md)
- [目录与命名](../业务功能/structure.md)
- [数据层](../框架核心/data.md)
