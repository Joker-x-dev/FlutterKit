---
name: fkit-feature
description: 创建、修改和重构 FlutterKit 业务模块与页面，覆盖基础父类选择、View、Logic、State、Binding、按需目录、国际化、路由接入和预览。用户要求新增 Feature、页面、模块目录、页面模板或调整页面分层时使用。
---

# FKit Feature

## 必读资料

先阅读仓库根目录 `AGENTS.md`，再按任务读取：

- `docs/flutter-kit/业务功能/index.md`
- `docs/flutter-kit/业务功能/structure.md`
- `docs/flutter-kit/业务功能/create-page.md`
- `docs/flutter-kit/业务功能/templates.md`
- 当前层对应的 `view.md`、`logic.md`、`state.md`、`binding.md`
- `docs/flutter-kit/框架核心/base.md` 及所选父类专题

涉及 UI、导航、数据或预览时继续遵守对应 FKit Skill 与项目文档。

## 工作流

1. 检查目标 Feature、相邻页面、路由和测试，确认现有命名与依赖方式。
2. 根据数据形态选择普通、网络、分页、刷新或 Tab 父类，禁止在普通页面复制父类状态机。
3. 按真实复杂度创建 View、Logic、State、Binding；不要为了目录完整创建空文件。
4. 将单页模型、静态数据、小型 Widget、Skeleton 和行为留在页面附近。同一模块多页面复用时才提升到模块级按需目录，跨 Feature 复用时才进入 Core。
5. 让 View 只布局、订阅和转发事件；让 Logic 处理生命周期、Repository/Service、状态与导航；让 State 只保存展示状态；让 Binding 只注册依赖。
6. 将用户可见文案写入模块 `localization/`，并接入路由、Navigator 和 Preview。
7. 补充对应测试，检查 Feature 未直接依赖其他 Feature 的内部实现。

## 关键约束

- Feature `data/` 只保存模块共享静态配置、展示数据或提供器，不创建第二套 Repository/DataSource。
- Repository 字段使用完整领域名称，例如 `_userInfoStoreRepository`，不用 `_repository`。
- 模块 Service 只服务本模块多个路由；应用级跨模块状态才进入 `core/service/`。
- 单页私有 Widget 优先作为 View 私有方法或相邻文件，不提前提升到模块 `widgets/`。
- 修改现有页面时保留公开行为和路由契约，除非任务明确要求变更。

## 验证

格式化本次涉及的 Dart 文件，运行最小相关测试、必要的 Preview 测试、`flutter analyze` 相关范围和 `git diff --check`。确认没有手工修改生成文件。
