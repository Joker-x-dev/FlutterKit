---
title: AI 辅助开发
---

# AI 辅助开发

FlutterKit 将 AI 辅助开发所需的项目规则、专项工作流和技术文档一同维护在仓库中。支持仓库级 `AGENTS.md` 与项目 Skill 的 AI 开发工具，可以先理解框架的分层、组件和验证方式，再执行具体任务，减少 API 猜测、目录误用和重复实现。

AI 不是独立于工程之外的代码生成器。FlutterKit 的目标是让 AI 与开发者遵循同一套架构约束，并以当前源码、测试和项目文档作为实现依据。

## Skill 快速索引

项目 Skill 位于 `.agents/skills/`，会随 FlutterKit 源码一同分发。明确指定 Skill 可以让 AI 更快进入对应工作流；未指定时，支持 Skill 自动匹配的工具也可以根据任务内容选择。

| Skill | 适用任务 | 调用示例 |
| --- | --- | --- |
| `fkit-setup` | 修改应用名称、Dart 包名、多端 Bundle ID、Logo、图标和启动页 | `使用 $fkit-setup 初始化新的应用项目` |
| `fkit-feature` | 新建或重构 Feature、View、Logic、State、Binding | `使用 $fkit-feature 创建商品详情页面` |
| `fkit-ui` | 编写页面与组件、统一设计系统、响应式布局和安全区 | `使用 $fkit-ui 重构个人中心布局` |
| `fkit-data` | 接口、模型、Repository、数据库、存储、分页和 Service | `使用 $fkit-data 接入商品分页接口` |
| `fkit-nav` | 路由、Navigator、Binding、参数、结果和登录守卫 | `使用 $fkit-nav 接入商品详情路由` |
| `fkit-preview` | 页面与组件 Preview、静态预览数据和 Logic 注入 | `使用 $fkit-preview 为登录页补充预览` |
| `fkit-theme` | 主题、深色模式、颜色预设、国际化和持久化恢复 | `使用 $fkit-theme 新增主题颜色预设` |
| `fkit-native` | 多端原生配置、资源生成、图标、启动页和发布构建 | `使用 $fkit-native 生成六端应用图标` |
| `fkit-audit` | 架构、命名、注释、UI、预览、测试和多端配置审查 | `使用 $fkit-audit 审查 feature/main` |

一个需求可以组合多个 Skill。例如，新增带网络数据、路由和预览的页面时，可以同时指定 `fkit-feature`、`fkit-data`、`fkit-nav`、`fkit-ui` 与 `fkit-preview`。

## AI 上下文由什么组成

```text
FlutterKit/
├── AGENTS.md                         # 项目级编码规则与资料优先级
├── .agents/skills/                   # 按任务拆分的 AI 工作流
├── docs/flutter-kit/                 # 架构、父类、数据、导航和 Feature 文档
├── docs/tdesign-flutter/             # TDesign Flutter 本地组件文档
├── lib/core/design_system/README.md  # 完整布局规范与 Widget 扩展说明
├── lib/                              # 当前可运行实现
└── test/                             # 行为与边界的验证依据
```

### `AGENTS.md`

`AGENTS.md` 是所有开发任务共享的仓库级规则，定义技术栈、架构边界、文档优先级、UI 检查顺序、命名、注释、生成文件和验证要求。AI 开始工作前应先读取该文件，不应只根据一段需求直接生成代码。

### 项目 Skill

Skill 将通用规则进一步收敛为某类任务的执行清单。例如 `fkit-ui` 会要求先查 TDesign 组件和项目扩展，`fkit-data` 会检查 Model、DataSource、Repository 与结果处理链路，`fkit-preview` 会禁止预览触发真实网络请求。

Skill 负责“如何完成任务”，项目文档负责解释“能力如何设计和使用”，源码与测试负责确认“当前版本实际如何运行”。三者不能互相替代。

## 推荐工作流

```text
明确需求与验收条件
        ↓
读取 AGENTS.md
        ↓
选择对应 fkit-* Skill
        ↓
读取专项文档与相邻实现
        ↓
核对源码、调用关系和测试
        ↓
实施、格式化、分析与测试
        ↓
检查差异并报告验证结果
```

推荐在请求中同时写清目标、范围、限制和验收条件：

```text
使用 $fkit-feature、$fkit-data、$fkit-nav 和 $fkit-preview。

目标：新增商品分页列表页面，并支持进入商品详情。
范围：仅修改 feature/goods、对应 routes 和相关测试。
约束：复用分页父类与 TDesign 组件，预览使用静态商品数据，不发起真实请求。
验收：手机、平板和折叠屏预览无溢出，相关测试与 flutter analyze 通过。
```

这种写法不会限制 AI 的实现能力，反而能减少对业务意图的猜测。应用名称、包名、接口契约、跳转参数等关键输入缺失时，应先补充明确值，再允许 AI 写入工程。

## 常见任务组合

| 开发目标 | 推荐 Skill |
| --- | --- |
| 拉取模板后创建自己的应用 | `fkit-setup`、`fkit-native` |
| 新增普通业务页面 | `fkit-feature`、`fkit-ui`、`fkit-nav`、`fkit-preview` |
| 新增网络分页页面 | `fkit-feature`、`fkit-data`、`fkit-ui`、`fkit-nav`、`fkit-preview` |
| 修改主题或新增语言 | `fkit-theme`、`fkit-ui` |
| 统一补充页面和组件预览 | `fkit-preview`、`fkit-audit` |
| 发布前检查工程质量 | `fkit-audit`、`fkit-native` |

## 使用边界

- 不根据其他平台、旧版本文档或组件名称猜测 Flutter/TDesign API。
- 不绕过 Repository、模块 Navigator、设计系统或基础父类另建一套实现。
- 不手工修改 `*.g.dart`、`*.freezed.dart` 与 `lib/generated/`。
- 不用全仓库字符串替换完成包名、多端标识或品牌迁移。
- 不在未授权的情况下顺带重构无关模块或覆盖工作区已有修改。
- 不以“代码已生成”作为完成标准；必须执行与风险相匹配的格式化、静态分析和测试。

## 从哪里继续

- 第一次使用模板：阅读[快速开始](./quick-start.md)与[项目架构与职责](./architecture.md)。
- 新建页面：阅读[创建页面](../业务功能/create-page.md)与[页面模板](../业务功能/templates.md)。
- 编写界面：阅读[设计系统](../框架核心/design-system.md)、[Widget 链式扩展](../框架核心/widget-extensions.md)与 [TDesign Flutter](../框架核心/tdesign.md)。
- 接入数据：阅读[数据层](../框架核心/data.md)、[网络请求](../框架核心/network.md)与[结果处理](../框架核心/result.md)。
- 提交前检查：先运行相关测试，再执行 `flutter analyze`、`flutter test` 与 `git diff --check`。
