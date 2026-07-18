import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base_tab/base_tab_logic.dart';

import '../localization/demo_keys.dart';

/// BaseTab 示例页 Logic
///
/// 定义三个标签页的本地化标题。
class BaseTabDemoLogic extends BaseTabLogic {
  /// 标签页标题列表
  @override
  List<String> get tabList => [
    DemoKeys.baseTabLabelOne.tr,
    DemoKeys.baseTabLabelTwo.tr,
    DemoKeys.baseTabLabelThree.tr,
  ];
}
