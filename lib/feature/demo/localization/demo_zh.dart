import 'demo_keys.dart';

/// Demo 模块文案 - 简体中文
final Map<String, String> demoZh = {
  // 页面标题
  DemoKeys.titleNetworkDemo: '自动网络状态示例',
  DemoKeys.titleNetworkListDemo: '网络分页列表示例',
  DemoKeys.titleDatabaseDemo: '数据库示例',
  DemoKeys.titleLocalStorageDemo: '本地存储示例',
  DemoKeys.titleStateManagementDemo: '状态管理示例',
  DemoKeys.titleNetworkRequestDemo: '手动网络请求示例',
  DemoKeys.titleScreenAdaptDemo: '屏幕适配示例',
  DemoKeys.titleNavigationWithArgs: '带参跳转示例',
  DemoKeys.titleNavigationResult: '结果回传示例',

  // 网络请求示例
  DemoKeys.goodsTitle: '商品标题',
  DemoKeys.goodsSubtitle: '商品副标题',
  DemoKeys.goodsPrice: '价格',
  DemoKeys.goodsSold: '已售',

  // 数据库示例
  DemoKeys.dbAdd: '新增记录',
  DemoKeys.dbClear: '清空全部',
  DemoKeys.dbEmpty: '暂无记录',
  DemoKeys.dbItemTitle: '示例记录',
  DemoKeys.dbItemDesc: '数据库示例数据',

  // 本地存储示例
  DemoKeys.storageSave: '保存用户信息',
  DemoKeys.storageRead: '读取用户信息',
  DemoKeys.storageClear: '清除用户信息',
  DemoKeys.storageNickName: '昵称',
  DemoKeys.storagePhone: '手机号',
  DemoKeys.storageUserId: '用户ID',
  DemoKeys.storageNoData: '未读取到用户信息',

  // 状态管理示例
  DemoKeys.counterTitle: '全局计数器',
  DemoKeys.counterIncrement: '加 1',
  DemoKeys.counterDecrement: '减 1',
  DemoKeys.counterReset: '重置',

  // 网络请求（独立）示例
  DemoKeys.requestStart: '发起请求',
  DemoKeys.requestResult: '请求结果',

  // 屏幕适配示例
  DemoKeys.adaptBreakpoint: '当前断点',
  DemoKeys.adaptGridColumns: '网格列数',
  DemoKeys.adaptListColumns: '列表列数',
  DemoKeys.adaptTextSize: '文本尺寸',
  DemoKeys.adaptBoxSize: '方块尺寸',
  DemoKeys.adaptGridSection: '网格布局示例',
  DemoKeys.adaptListSection: '列表布局示例',
  DemoKeys.adaptTextSection: '文本适配示例',
  DemoKeys.adaptSizeSection: '大小适配示例',
  DemoKeys.adaptGridItem: '网格项 @index',
  DemoKeys.adaptGridItemDesc: '根据屏幕大小调整列数',
  DemoKeys.adaptListItem: '列表项 @index',
  DemoKeys.adaptListItemDesc: '小屏一列，大屏两列',
  DemoKeys.adaptTextLabel: '适配文本',
  DemoKeys.adaptTextSample: '示例文字会随屏幕变化',
  DemoKeys.adaptSizeTitle: '尺寸随屏幕变化',
  DemoKeys.adaptSizeDesc: '通过 bp 设置不同断点尺寸',
  DemoKeys.adaptSampleSize: '示例尺寸：@size dp',

  // 带参跳转示例
  DemoKeys.receivedGoodsId: '接收到的商品ID',

  // 结果回传示例
  DemoKeys.returnResult: '返回结果',

  // 语言与主题
  DemoKeys.titleThemeDemo: '语言与主题',
  DemoKeys.languageThemeDesc: '设置应用语言、深浅模式与多主题颜色',
  DemoKeys.languageSettingTitle: '语言设置',
  DemoKeys.currentLanguage: '当前语言（点击切换）',
  DemoKeys.languageChinese: '中文',
  DemoKeys.languageEnglish: '英文',
  DemoKeys.darkModeSettingTitle: '深浅模式',
  DemoKeys.themeColorSettingTitle: '主题颜色',
  DemoKeys.themeGreen: '绿色主题',
  DemoKeys.themeGreenDesc: '切换应用为绿色主题风格',
  DemoKeys.themeRed: '红色主题',
  DemoKeys.themeRedDesc: '切换应用为红色主题风格',
  DemoKeys.themeBlue: '蓝色主题',
  DemoKeys.themeBlueDesc: '切换应用为蓝色主题风格',
  DemoKeys.themeDefault: '默认主题',
  DemoKeys.themeDefaultDesc: '恢复应用默认主题风格',

  // Base 示例
  DemoKeys.titleBaseDemo: '基础页面示例',
  DemoKeys.titleBaseDemoDesc: '展示 BaseView 导航栏、下拉菜单、悬浮按钮与底部导航',
  DemoKeys.titleBaseRefreshDemo: '下拉刷新示例',
  DemoKeys.titleBaseRefreshDemoDesc: '展示 BaseRefreshView 网络请求与下拉刷新能力',
  DemoKeys.titleBaseTabDemo: '标签页示例',
  DemoKeys.titleBaseTabDemoDesc: '展示 BaseTabView 顶部标签与页面联动切换',
  DemoKeys.baseAllProducts: '全部产品',
  DemoKeys.baseLatestProducts: '最新产品',
  DemoKeys.basePopularProducts: '最火产品',
  DemoKeys.baseDefaultSort: '默认排序',
  DemoKeys.basePriceHighToLow: '价格从高到低',
  DemoKeys.baseContentTitle: '页面主视图内容',
  DemoKeys.baseContentDescription: '对 Scaffold 做了封装，减少样板代码',
  DemoKeys.baseFloatingAction: '悬浮按钮',
  DemoKeys.baseTabMessages: '消息',
  DemoKeys.baseTabTasks: '待办',
  DemoKeys.baseTabWorkspace: '工作台',
  DemoKeys.baseTabContacts: '通讯录',
  DemoKeys.baseTabProfile: '我的',
  DemoKeys.baseTabLabelOne: '标签页 1',
  DemoKeys.baseTabLabelTwo: '标签页 2',
  DemoKeys.baseTabLabelThree: '标签页 3',
  DemoKeys.baseTabPageOne: '页面 1',
  DemoKeys.baseTabPageTwo: '页面 2',
  DemoKeys.baseTabPageThree: '页面 3',

  // 主题模式切换
  DemoKeys.themeModeSystem: '跟随系统',
  DemoKeys.themeModeSystemDesc: '开启后，将跟随系统打开或关闭深色模式。',
  DemoKeys.themeModeLight: '浅色模式',
  DemoKeys.themeModeLightDesc: '强制使用浅色主题',
  DemoKeys.themeModeDark: '深色模式',
  DemoKeys.themeModeDarkDesc: '强制使用深色主题',
};
