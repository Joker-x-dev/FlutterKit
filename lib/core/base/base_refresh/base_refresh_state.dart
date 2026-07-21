import 'package:easy_refresh/easy_refresh.dart';

import '../base_network/base_network_state.dart';

/// 刷新状态管理类
class BaseRefreshState extends BaseNetworkState {
  /// 刷新页面加载时不应把整页设置为 loading，由 EasyRefresh 自身控制
  @override
  bool get requestSetStatus => false;

  /// 刷新控制器
  EasyRefreshController easyRefreshController = EasyRefreshController(
    controlFinishLoad: true,
  );
}
