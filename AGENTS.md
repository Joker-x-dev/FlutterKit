# Repository Guidelines

## 项目概览与技术栈

FlutterKit 是面向 Android、iOS、macOS、Linux、Windows 和 Web 的 Flutter 跨平台项目脚手架，采用模块化目录与 GetX 页面分层，内置常用基础能力和可运行 Demo。

| 领域 | 技术与用途 |
| --- | --- |
| 语言与框架 | Dart、Flutter |
| 架构与状态 | GetX，采用 View、Logic、State、Binding 分层及全局 Service |
| UI 与设计系统 | TDesign Flutter、`AppTheme`、语义化尺寸/形状、Widget 与动画链式扩展 |
| 网络与模型 | Dio、Retrofit、`json_serializable`、`RequestHelper` |
| 数据持久化 | Repository + DataSource、sqflite、shared_preferences |
| 适配与交互 | flutter_screenutil、easy_refresh、animations、bot_toast |
| 开发与质量 | build_runner、FlutterGen、Widget Preview、flutter_lints、flutter_test |

## 执行原则与资料优先级

修改前必须先阅读任务对应文档，再核对源码、调用方和测试，禁止根据类型名、其他平台实现或记忆猜测 Flutter/TDesign API。

资料优先级如下：

1. 用户当前任务与本文件的项目级强约束。
2. [FlutterKit 框架文档](docs/flutter-kit/README.md) 与 [TDesign Flutter 文档](docs/tdesign-flutter/README.md)。
3. 当前源码、同类实现、调用关系和测试用例。
4. 依赖包当前版本的源码与官方文档。

文档与代码不一致时，以可运行实现和测试结果为依据，并同步更新项目文档。不得复制过时示例或创造项目不存在的 API。

## 按任务读取文档

| 任务 | 必读文档 |
| --- | --- |
| 项目架构、模块拆分 | [项目架构与职责](docs/flutter-kit/简介/architecture.md)、[模块化设计](docs/flutter-kit/简介/modularization.md) |
| Feature 目录与页面分层 | [Feature 概览](docs/flutter-kit/业务功能/index.md)、[目录与命名](docs/flutter-kit/业务功能/structure.md)、[页面模板](docs/flutter-kit/业务功能/templates.md) |
| View、Logic、State、Binding | [View](docs/flutter-kit/业务功能/view.md)、[Logic](docs/flutter-kit/业务功能/logic.md)、[State](docs/flutter-kit/业务功能/state.md)、[Binding](docs/flutter-kit/业务功能/binding.md) |
| 基础页面、网络、列表、刷新、Tab、Dialog | [基础父类](docs/flutter-kit/框架核心/base.md) 及对应 `base-*.md` 专题 |
| UI、布局、主题、深色、扩展 | [完整布局规范与扩展](lib/core/design_system/README.md)、[扩展统一导出文件](lib/core/design_system/extensions/extensions.dart)、[Widget 扩展](docs/flutter-kit/框架核心/widget-extensions.md)、[设计系统](docs/flutter-kit/框架核心/design-system.md)、[主题系统](docs/flutter-kit/框架核心/theme.md)、[深色模式](docs/flutter-kit/框架核心/dark-mode.md) |
| TDesign 组件参数 | [TDesign 组件索引](docs/tdesign-flutter/README.md) 与具体组件页面 |
| 数据、模型、网络、结果处理 | [数据层](docs/flutter-kit/框架核心/data.md)、[数据模型](docs/flutter-kit/框架核心/model.md)、[网络请求](docs/flutter-kit/框架核心/network.md)、[结果处理](docs/flutter-kit/框架核心/result.md) |
| 数据库、本地存储、全局状态 | [数据库](docs/flutter-kit/框架核心/database.md)、[本地存储](docs/flutter-kit/框架核心/datastore.md)、[状态管理](docs/flutter-kit/框架核心/state.md) |
| 路由、参数、结果、守卫 | [导航文档](docs/flutter-kit/导航/index.md) 及对应专题 |
| 适配、预览、图标与启动页 | [扩展文档](docs/flutter-kit/README.md#扩展) 及对应专题 |

## 架构与放置边界

- `lib/bootstrap/` 只负责启动初始化；`lib/core/` 提供跨 Feature 公共能力且不得依赖 `feature/`；`lib/routes/` 管理路由、Navigator、Params、Result 与 Guard；`lib/feature/` 承载具体业务。
- Feature 之间不直接 import 对方的 View、Logic、State 或模块私有 Widget；跨模块跳转调用目标模块 Navigator。
- 单页使用的模型、数据、小型 Widget、Skeleton 和行为贴近页面；同一 Feature 多页面复用时才放模块级 `data / models / widgets / skeletons / mixins / services`；多个 Feature 复用时才提升到 Core。
- Feature `data/` 只保存模块共享的静态配置、展示数据或提供器。Repository、网络、数据库和存储 DataSource 属于 Core 数据链路。
- 单页行为放 Logic；模块多个路由共享的协调能力放 Feature Service；跨模块且应用生命周期共享的状态才放 `core/service/`。
- Mixin 只抽取可组合行为，不保存页面专属状态或替代 Logic；Skeleton 仅在固定加载结构确有价值时创建，默认复用网络父类 Loading。

## 页面与状态规范

- 根据数据形态选择 `BaseView`、`BaseNetworkView`、`BaseListView`、`BaseRefreshView` 或 `BaseTabView`，不得在普通页面重复实现父类已有的 loading、empty、error、分页、刷新和控制器状态。
- View 只负责布局、`Obx` 订阅和事件转发；Logic 负责生命周期、Repository/Service 调用、状态变更与导航；State 只保存页面展示状态；Binding 只注册依赖。
- `Obx` 缩小到真正读取 Rx 的区域。View 不直接访问 Repository/DataSource，State 不保存 Repository、Widget、`BuildContext` 或导航逻辑。
- Repository 字段使用完整类型语义命名，例如 `final UserInfoStoreRepository _userInfoStoreRepository`，禁止 `_repository` 等无法区分领域的名称。
- 用户可见文案进入对应模块 `localization/`，不在页面散落可翻译字符串。

## UI、主题与 TDesign

- 所有业务 UI 优先组合 TDesign 组件，并使用 `AppTheme`、设计系统语义常量、`Space` 和现有链式扩展；禁止硬编码颜色、间距、圆角、阴影或重复封装已有组件。
- 新建或修改布局前必须阅读[完整布局规范与扩展文档](lib/core/design_system/README.md)，并检查[扩展统一导出文件](lib/core/design_system/extensions/extensions.dart)与 `lib/core/design_system/extensions/widget/` 下的真实方法签名，确认现有扩展无法满足后才能新增。
- 组件属性先查[TDesign 完整组件列表](docs/tdesign-flutter/README.md)及具体组件页面，不得按 Web、Vue、React 或旧版本 API 猜测 Dart 参数。
- 主题值只能在已建立主题上下文的 build 流程读取，不得在全局或静态字段中缓存 `TDTheme.of`、`AppTheme.of` 及依赖它们的尺寸/形状 getter。
- 链式扩展的包装顺序会改变布局、背景、裁剪和点击范围；修改复杂链式 UI 前先阅读 Widget/动画扩展专题。
- 新增完整页面默认提供 `@ResponsivePreview()`；模块组件提供 `@WidgetPreview()`。预览函数位于当前源码文件末尾，注入 Logic；网络页面写入静态 Preview Data 并设置成功状态，禁止真实请求。

### UI 开发固定检查顺序

1. 在 TDesign 组件列表中确认是否已有对应组件，优先组合现有 `TD*` 组件。
2. 在完整布局规范和 `extensions.dart` 中确认是否已有布局、间距、装饰、裁剪、滚动、手势、文本、变换或动画扩展。
3. 查阅具体组件页面和扩展实现，确认当前版本的构造参数、返回类型、包装顺序和约束行为。
4. 使用项目主题语义与响应式能力完成组合，再补充页面或组件 Preview。

TDesign 本地组件索引包含以下分类；写 UI 前至少扫描对应分类：

| 分类 | 组件列表 |
| --- | --- |
| 基础 | Button、Divider、Fab、Icon、Link、Text |
| 导航 | BackTop、Drawer、Indexes、Navbar、SideBar、Steps、TabBar、Tabs |
| 输入 | Calendar、Cascader、CheckBox、DateTimePicker、Form、Input、Picker、Radio、Rate、Search、Slider、Stepper、Switch、Textarea、TreeSelect、Upload |
| 数据展示 | Avatar、Badge、Cell、Collapse、Empty、Footer、Image、ImageViewer、Progress、Result、Skeleton、Swiper、Table、Tag、TimeCounter |
| 反馈 | ActionSheet、Dialog、DropdownMenu、Loading、Message、NoticeBar、Popover、Popup、PullDownRefresh、SwipeCell、Toast |

## Dart、命名与注释

- 遵循 `analysis_options.yaml` 与 `dart format`。文件使用 `snake_case.dart`，类型使用 `PascalCase`，变量和方法使用 `lowerCamelCase`，私有成员以 `_` 开头。
- import 下方、主要声明前添加中文 `///` 文件职责说明。类型、显式构造函数、字段、Getter/Setter、公开与私有方法使用 `///`；参数使用 `[param]` 引用。
- 注释只描述最终职责、业务含义和设计原因。禁止人称、协作对话和“改成”“临时”“后续处理”等过程性措辞；普通局部变量与显而易见语句不机械加注释。
- 不创建 `common.dart`、`util.dart`、`manager.dart`、`data.dart` 等无法体现领域职责的文件名。

## 生成代码与资源

- 禁止手工修改 `*.g.dart`、`*.freezed.dart` 和 `lib/generated/`。
- Model、Retrofit 或运行时资源变化后执行 `dart run build_runner build --delete-conflicting-outputs`。
- 图标执行 `dart run flutter_launcher_icons`；启动页执行 `dart run flutter_native_splash:create`。同时提交 YAML、`assets/dev/` 源图和各平台生成结果。

## 验证与变更范围

- 只修改任务范围内文件，保留工作区已有改动，不顺带处理无关架构、弃用 API 或格式问题。
- 先运行受影响的测试，再按风险运行 `flutter analyze`、`flutter test` 和 `git diff --check`。测试文件使用 `*_test.dart`；逻辑使用 `test`，Widget、响应式布局和预览使用 `testWidgets`。
- 提交信息使用简短中文动宾结构并聚焦单一主题。UI 变更需验证深浅色、手机横竖屏、平板与折叠屏；PR 说明影响模块、验证命令和必要截图。
