import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../demo/localization/demo_keys.dart';
import '../localization/main_keys.dart';
import '../models/demo_action.dart';
import '../models/demo_item.dart';

/// 扩展示例页 State
///
/// 保存扩展 Tab 的演示卡片列表。
class ExpandDemoState {
  /// 默认扩展示例菜单
  static const List<DemoItem> defaultDemoItems = <DemoItem>[
    DemoItem(
      title: MainKeys.demoScreenAdapt,
      description: MainKeys.demoScreenAdaptDesc,
      icon: TDIcons.desktop,
      action: DemoAction.screenAdapt,
    ),
    DemoItem(
      title: DemoKeys.titleThemeDemo,
      description: DemoKeys.languageThemeDesc,
      icon: TDIcons.setting,
      action: DemoAction.theme,
    ),
  ];

  /// 创建扩展示例页状态
  ///
  /// [demoItems] 扩展示例卡片列表。
  const ExpandDemoState({this.demoItems = defaultDemoItems});

  /// 演示卡片列表
  final List<DemoItem> demoItems;
}
