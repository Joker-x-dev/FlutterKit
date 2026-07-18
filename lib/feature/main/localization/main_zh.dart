import 'main_keys.dart';

/// Main 模块文案 - 简体中文
final Map<String, String> mainZh = {
  // 底部导航
  MainKeys.tabCore: '核心',
  MainKeys.tabNavigation: '导航',
  MainKeys.tabExpand: '扩展',
  MainKeys.tabAbout: '关于',

  // 核心 Tab 卡片
  MainKeys.demoNetwork: '自动网络状态示例',
  MainKeys.demoNetworkDesc: '展示 BaseNetworkView 自动请求及加载、成功、空、错误状态',
  MainKeys.demoNetworkList: '网络分页列表示例',
  MainKeys.demoNetworkListDesc: '展示 BaseListView 分页、下拉刷新与加载更多',
  MainKeys.demoDatabase: '数据库示例',
  MainKeys.demoDatabaseDesc: '展示本地数据库的增删查能力',
  MainKeys.demoLocalStorage: '本地存储示例',
  MainKeys.demoLocalStorageDesc: '展示用户信息的本地读写',
  MainKeys.demoStateManagement: '状态管理示例',
  MainKeys.demoStateManagementDesc: '展示全局响应式计数器',
  MainKeys.demoNetworkRequest: '手动网络请求示例',
  MainKeys.demoNetworkRequestDesc: '展示页面主动调用 RequestHelper 并处理请求状态',
  MainKeys.globalCounter: '全局计数器：@count',

  // 导航 Tab 卡片
  MainKeys.demoNavigationWithArgs: '带参跳转示例',
  MainKeys.demoNavigationWithArgsDesc: '展示页面间传递对象参数',
  MainKeys.demoNavigationResult: '结果回传示例',
  MainKeys.demoNavigationResultDesc: '展示页面关闭时回传结果',
  MainKeys.demoRouteInterceptor: '路由拦截示例',
  MainKeys.demoRouteInterceptorDesc: '点击跳转用户信息页，触发登录拦截',
  MainKeys.navigationLoggedIn: '登录状态：已登录',
  MainKeys.navigationResult: '回传结果：id=@id，message=@message',

  // 扩展 Tab 卡片
  MainKeys.demoScreenAdapt: '屏幕适配示例',
  MainKeys.demoScreenAdaptDesc: '展示响应式断点与尺寸计算',

  // 关于 Tab
  MainKeys.aboutAppName: 'FlutterKit',
  MainKeys.aboutVersion: '版本 1.0.0',
  MainKeys.aboutDescription: '基于 GetX + TDesign 的 Flutter 项目模板，整合常用功能和开发实践。',
  MainKeys.aboutLinkDocs: '项目文档',
  MainKeys.aboutLinkGitHub: 'GitHub',
  MainKeys.aboutLinkGitee: 'Gitee',
  MainKeys.aboutLinkDemo: '示例 Demo',
  MainKeys.aboutLinkDesignSystem: 'TDesign Flutter 组件文档',
};
