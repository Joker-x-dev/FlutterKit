import 'main_keys.dart';

/// Main 模块文案 - 英文
final Map<String, String> mainEn = {
  // 底部导航
  MainKeys.tabCore: 'Core',
  MainKeys.tabNavigation: 'Navigation',
  MainKeys.tabExpand: 'Expand',
  MainKeys.tabAbout: 'About',

  // 核心 Tab 卡片
  MainKeys.demoNetwork: 'Automatic Network State Demo',
  MainKeys.demoNetworkDesc:
      'Show BaseNetworkView auto request and state switching',
  MainKeys.demoNetworkList: 'Paginated Network List Demo',
  MainKeys.demoNetworkListDesc:
      'Show BaseListView pull-to-refresh and load more',
  MainKeys.demoDatabase: 'Database Demo',
  MainKeys.demoDatabaseDesc: 'Show local database CRUD operations',
  MainKeys.demoLocalStorage: 'Local Storage Demo',
  MainKeys.demoLocalStorageDesc: 'Show local read/write of user info',
  MainKeys.demoStateManagement: 'State Management Demo',
  MainKeys.demoStateManagementDesc: 'Show global reactive counter',
  MainKeys.demoNetworkRequest: 'Manual Network Request Demo',
  MainKeys.demoNetworkRequestDesc:
      'Show explicit requests and request state handling via RequestHelper',
  MainKeys.globalCounter: 'Global counter: @count',

  // 导航 Tab 卡片
  MainKeys.demoNavigationWithArgs: 'Navigation With Args',
  MainKeys.demoNavigationWithArgsDesc: 'Show passing object args between pages',
  MainKeys.demoNavigationResult: 'Navigation Result',
  MainKeys.demoNavigationResultDesc: 'Show returning result when page closes',
  MainKeys.demoRouteInterceptor: 'Route Interceptor',
  MainKeys.demoRouteInterceptorDesc:
      'Tap to user info page and trigger login guard',
  MainKeys.navigationLoggedIn: 'Login status: signed in',
  MainKeys.navigationResult: 'Result: id=@id, message=@message',

  // 扩展 Tab 卡片
  MainKeys.demoScreenAdapt: 'Screen Adapt Demo',
  MainKeys.demoScreenAdaptDesc: 'Show responsive breakpoints and sizes',

  // 关于 Tab
  MainKeys.aboutAppName: 'FlutterKit',
  MainKeys.aboutVersion: 'Version 1.0.0',
  MainKeys.aboutDescription:
      'A Flutter project template based on GetX + TDesign, integrating common features and best practices.',
  MainKeys.aboutLinkDocs: 'Project Docs',
  MainKeys.aboutLinkGitHub: 'GitHub',
  MainKeys.aboutLinkGitee: 'Gitee',
  MainKeys.aboutLinkDemo: 'Demo',
  MainKeys.aboutLinkDesignSystem: 'TDesign Flutter Components',
};
