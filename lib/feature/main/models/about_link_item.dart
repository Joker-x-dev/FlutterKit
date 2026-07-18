import 'package:get/get.dart';

/// 关于页面链接数据
///
/// 保存链接标题国际化键和目标地址。
class AboutLinkItem {
  /// 标题国际化键
  final String title;

  /// 链接地址
  final String url;

  /// 创建关于页面链接数据
  ///
  /// [title] 标题国际化键。
  /// [url] 链接地址。
  const AboutLinkItem({required this.title, required this.url});

  /// 当前语言对应的标题
  String get localizedTitle => title.tr;
}
