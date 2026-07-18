import 'package:get/get.dart';

/// 网络请求状态管理类
class BaseNetworkState {
  /// 构造函数
  ///
  /// [requestErrorToast] 请求失败以后是否显示 toast
  /// [firstLoad] 是否进入页面就进行加载
  /// [requestSetStatus] 每次加载前是否设置为加载状态，一般配合列表使用
  BaseNetworkState({
    this.requestErrorToast = true,
    this.firstLoad = true,
    this.requestSetStatus = true,
  });

  /// 定义网络状态，方便子控制器使用
  final Rx<NetState> uiState = NetState.loading.obs;

  /// 请求失败以后是否显示 toast
  final bool requestErrorToast;

  /// 是否进入页面就进行加载
  final bool firstLoad;

  /// 每次加载前是否设置为加载状态，一般配合 base_list 使用
  final bool requestSetStatus;
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
