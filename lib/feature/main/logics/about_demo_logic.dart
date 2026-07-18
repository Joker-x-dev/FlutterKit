import 'package:flutter_kit/core/base/base/base_logic.dart';
import 'package:flutter_kit/core/util/log/log_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/about_link_item.dart';
import '../states/about_demo_state.dart';

/// 关于示例页 Logic
///
/// 管理关于页面链接数据与外部地址打开操作。
class AboutDemoLogic extends BaseLogic {
  /// 关于示例页面状态
  final AboutDemoState aboutDemoState = const AboutDemoState();

  /// 关于页面链接列表
  List<AboutLinkItem> get links => aboutDemoState.links;

  /// 打开外部链接
  ///
  /// [item] 待打开的链接数据。
  Future<void> openLink(AboutLinkItem item) async {
    final Uri? uri = Uri.tryParse(item.url);
    if (uri == null || !uri.hasScheme) {
      LogUtil.e('无效的关于页面链接: ${item.url}');
      return;
    }

    try {
      final bool launched = await launchUrl(uri);
      if (!launched) {
        LogUtil.w('无法打开关于页面链接: ${item.url}');
      }
    } on Object catch (error, stackTrace) {
      LogUtil.e('打开关于页面链接失败: ${item.url}', error, stackTrace);
    }
  }
}
