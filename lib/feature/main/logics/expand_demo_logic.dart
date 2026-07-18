import 'package:flutter_kit/core/base/base/base_logic.dart';

import '../../../routes/demo/demo_navigator.dart';
import '../models/demo_action.dart';
import '../models/demo_item.dart';
import '../states/expand_demo_state.dart';

/// 扩展示例页 Logic
///
/// 管理“扩展”Tab 中的演示卡片列表。
class ExpandDemoLogic extends BaseLogic {
  /// 扩展示例页面状态
  final ExpandDemoState expandDemoState = const ExpandDemoState();

  /// 处理扩展示例菜单点击
  ///
  /// [item] 被点击的菜单项。
  void onItemTap(DemoItem item) {
    switch (item.action) {
      case DemoAction.screenAdapt:
        _onScreenAdaptTap();
        return;
      case DemoAction.theme:
        _onThemeTap();
        return;
      default:
        throw UnsupportedError('ExpandDemoLogic 不支持 ${item.action.name} 操作');
    }
  }

  /// 屏幕适配示例点击
  void _onScreenAdaptTap() {
    DemoNavigator.toScreenAdaptDemo<void>();
  }

  /// 语言与主题示例点击
  void _onThemeTap() {
    DemoNavigator.toThemeDemo<void>();
  }
}
