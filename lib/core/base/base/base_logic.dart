import 'package:get/get.dart';

/// 基础业务逻辑控制器
///
/// 统一承载 GetX 生命周期并提供页面数据初始化入口。
abstract class BaseLogic extends SuperController<dynamic> {
  /// 其他页面传递过来的参数
  final dynamic args = Get.arguments;

  /// 当控制器准备就绪时调用此方法
  /// 通常用于初始化数据
  @override
  void onReady() {
    super.onReady();
    initData();
  }

  /// 当控制器从视图树中分离时调用此方法
  /// 适用于释放与视图树关联的资源
  @override
  void onDetached() {}

  /// 当控制器初始化时调用此方法
  /// 通常用于相关数据的初始设置
  @override
  void onInit() {
    super.onInit();
  }

  /// 当控制器处于非活动状态时调用此方法
  /// 适合进行一些状态监听或暂停操作
  @override
  void onInactive() {}

  /// 当控制器彻底离开时调用此方法
  /// 适合进行一些退出前的清理工作
  @override
  void onPaused() {}

  /// 当控制器彻底恢复时调用此方法
  /// 适合进行恢复时的数据加载或状态更新
  @override
  void onResumed() {}

  /// 当控制器被隐藏时调用此方法
  @override
  void onHidden() {}

  /// 初始化数据的方法
  /// 子类可以选择实现此方法以进行数据加载或初始化操作
  /// 若不需要初始化操作，可以直接使用默认实现
  void initData() {}
}
