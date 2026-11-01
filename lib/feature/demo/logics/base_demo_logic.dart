import 'package:get/get.dart';

import 'package:flutter_kit/core/base/base/base_logic.dart';

/// Base 示例页 Logic
///
/// 为 [BaseView] 自定义导航栏与底部视图示例提供页面控制器。
class BaseDemoLogic extends BaseLogic {
  /// 当前商品筛选值。
  final RxString productFilter = 'all'.obs;

  /// 当前商品排序值。
  final RxString productSort = 'default'.obs;

  /// 更新商品筛选值。
  ///
  /// [value] 目标筛选值。
  void updateProductFilter(String value) {
    productFilter.value = value;
  }

  /// 更新商品排序值。
  ///
  /// [value] 目标排序值。
  void updateProductSort(String value) {
    productSort.value = value;
  }
}
