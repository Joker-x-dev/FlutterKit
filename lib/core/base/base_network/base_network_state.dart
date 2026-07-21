import 'package:get/get.dart';

/// 网络请求状态管理类
class BaseNetworkState {
  /// 定义网络状态，方便子控制器使用
  final Rx<NetState> uiState = NetState.loading.obs;

  /// 请求失败以后是否显示 toast，子类 State 可重写
  bool get requestErrorToast => true;

  /// 是否进入页面就进行加载，子类 State 可重写
  bool get firstLoad => true;

  /// 每次加载前是否设置为加载状态，子类 State 可重写
  bool get requestSetStatus => true;
}

/// 网络页面展示状态
enum NetState {
  /// 加载状态
  loading,

  /// 错误状态，显示失败界面，并附带刷新按钮
  error,

  /// 空数据状态
  emptyData,

  /// 数据获取成功状态
  dataSuccess,
}
