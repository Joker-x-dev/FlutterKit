---
name: fkit-nav
description: 配置和维护 FlutterKit 模块化导航，覆盖 Routes、Pages、Navigator、Binding、Params、Result、Guard 与跨模块跳转。用户要求新增路由、页面跳转、传参、结果回传、登录拦截或修复导航状态时使用。
---

# FKit Navigation

## 必读资料

先阅读 `AGENTS.md` 和以下导航专题：

- `docs/flutter-kit/导航/index.md`
- `docs/flutter-kit/导航/router.md`
- `docs/flutter-kit/导航/flow.md`
- `docs/flutter-kit/导航/guard.md`
- `docs/flutter-kit/导航/result.md`
- `docs/flutter-kit/业务功能/binding.md`

## 工作流

1. 检查目标模块现有 Routes、Pages、Navigator、Binding 和测试，保持命名与注册方式一致。
2. 将路由常量、`GetPage` 配置和对外 Navigator 分离，统一汇总到应用路由入口。
3. 将参数和返回值建模为明确的 Params/Result 类型，在 Logic 入口尽早转换，避免页面散落 dynamic Map。
4. 跨 Feature 跳转调用目标模块 Navigator，不直接 import 目标模块 View、Logic 或 State。
5. Guard 只负责路由决策，认证状态读取统一 Service，不在 Guard 重复恢复或写入用户状态。
6. 横竖屏或响应式布局切换时保持当前导航索引和页面实例一致，不在 build 中重建页面状态。

## 验证

检查路由名称唯一、Binding 正确注册、参数和 Result 类型安全、Guard 登录与未登录分支。运行导航、Guard 和受影响页面测试，再执行静态分析与 `git diff --check`。
