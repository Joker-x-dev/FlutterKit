import 'package:get/get.dart';

/// Demo 计数器服务
///
/// 通过响应式变量在任意页面共享一个全局计数器。
class DemoCounterService extends GetxService {
  /// 当前计数值
  final RxInt count = 0.obs;

  /// 计数值加 1
  void increase() {
    count.value += 1;
  }

  /// 计数值减 1，最低为 0
  void decrease() {
    count.value = (count.value - 1).clamp(0, double.maxFinite).toInt();
  }

  /// 重置计数器
  void reset() {
    count.value = 0;
  }
}
