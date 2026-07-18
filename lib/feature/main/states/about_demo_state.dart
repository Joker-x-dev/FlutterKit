import '../localization/main_keys.dart';
import '../models/about_link_item.dart';

/// 关于示例页 State
///
/// 保存关于页面使用的链接列表。
class AboutDemoState {
  /// 默认链接列表
  static const List<AboutLinkItem> defaultLinks = <AboutLinkItem>[
    AboutLinkItem(
      title: MainKeys.aboutLinkDocs,
      url: 'https://flutter.dusksnow.top/',
    ),
    AboutLinkItem(
      title: MainKeys.aboutLinkDesignSystem,
      url: 'https://tdesign.tencent.com/flutter/getting-started',
    ),
    AboutLinkItem(
      title: MainKeys.aboutLinkGitHub,
      url: 'https://github.com/Joker-x-dev/FlutterKit',
    ),
    AboutLinkItem(
      title: MainKeys.aboutLinkGitee,
      url: 'https://gitee.com/Joker-x-dev/FlutterKit',
    ),
    AboutLinkItem(
      title: MainKeys.aboutLinkDemo,
      url: 'https://www.pgyer.com/FlutterKit',
    )
  ];

  /// 创建关于示例页状态
  ///
  /// [links] 关于页面链接列表。
  const AboutDemoState({this.links = defaultLinks});

  /// 关于页面链接列表
  final List<AboutLinkItem> links;
}
