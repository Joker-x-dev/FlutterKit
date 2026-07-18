/// Demo 菜单行为
///
/// 标识首页 Demo 菜单对应的业务操作，由各页面 Logic 负责执行。
enum DemoAction {
  /// BaseView 示例
  base,

  /// BaseRefresh 示例
  baseRefresh,

  /// BaseTab 示例
  baseTab,

  /// 自动网络状态示例
  network,

  /// 独立网络请求示例
  networkRequest,

  /// 网络列表示例
  networkList,

  /// 状态管理示例
  stateManagement,

  /// 数据库示例
  database,

  /// 本地存储示例
  localStorage,

  /// 带参数导航示例
  navigationWithParams,

  /// 导航结果回传示例
  navigationResult,

  /// 路由拦截示例
  routeInterceptor,

  /// 屏幕适配示例
  screenAdapt,

  /// 语言与主题示例
  theme,
}
