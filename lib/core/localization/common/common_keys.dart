/// 通用国际化键名
///
/// 跨模块共享的字符串键名，如应用名称、通用按钮、通用状态提示等。
class CommonKeys {
  const CommonKeys._();

  /// 应用名称
  static const String appName = 'appName';

  //==================== 通用按钮 ====================

  /// 取消
  static const String cancel = 'cancel';

  /// 确认
  static const String confirm = 'confirm';

  /// 提示
  static const String tip = 'tip';

  /// 请选择
  static const String pleaseSelect = 'pleaseSelect';

  /// 删除
  static const String delete = 'delete';

  /// 保存
  static const String save = 'save';

  //==================== 通用输入 ====================

  /// 请输入内容
  static const String inputTitle = 'inputTitle';

  //==================== 通用状态 ====================

  /// 复制成功
  static const String copySuccess = 'copySuccess';

  /// 复制失败
  static const String copyFailed = 'copyFailed';

  /// 加载失败
  static const String loadFailed = 'loadFailed';

  //==================== 商品卡片 ====================

  /// 商品详情
  static const String goodsDetail = 'goodsDetail';

  /// 已售 x 件（含 %s 占位符）
  static const String goodsSold = 'goodsSold';

  //==================== BaseNetwork 状态 ====================

  /// 数据为空
  static const String baseNetworkEmpty = 'baseNetworkEmpty';

  /// 内容加载失败，请检查网络
  static const String baseNetworkError = 'baseNetworkError';

  /// 重新加载
  static const String baseNetworkReload = 'baseNetworkReload';

  /// 加载中…
  static const String baseNetworkLoading = 'baseNetworkLoading';

  //==================== 刷新组件 ====================

  /// 释放刷新
  static const String refreshHeaderArmed = 'refreshHeaderArmed';

  /// 正在加载...
  static const String refreshHeaderReady = 'refreshHeaderReady';

  /// 加载完成
  static const String refreshHeaderProcessed = 'refreshHeaderProcessed';

  /// 正在刷新...
  static const String refreshHeaderProcessing = 'refreshHeaderProcessing';

  /// 更新于 %T
  static const String refreshHeaderMessage = 'refreshHeaderMessage';

  /// 刷新失败
  static const String refreshHeaderFailed = 'refreshHeaderFailed';

  /// 没有更多数据
  static const String refreshHeaderNoMore = 'refreshHeaderNoMore';

  /// 拉动刷新
  static const String refreshHeaderDrag = 'refreshHeaderDrag';

  /// 上拉以加载
  static const String loadFooterDrag = 'loadFooterDrag';

  /// 释放准备加载
  static const String loadFooterArmed = 'loadFooterArmed';

  /// 正在加载...（加载更多）
  static const String loadFooterReady = 'loadFooterReady';

  /// 正在加载...（加载更多）
  static const String loadFooterProcessing = 'loadFooterProcessing';

  /// 加载成功
  static const String loadFooterProcessed = 'loadFooterProcessed';

  /// 没有更多数据（加载更多）
  static const String loadFooterNoMore = 'loadFooterNoMore';

  /// 加载失败
  static const String loadFooterFailed = 'loadFooterFailed';

  /// 最后更新于 %T
  static const String loadFooterMessage = 'loadFooterMessage';
}
