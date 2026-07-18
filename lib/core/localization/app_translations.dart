import 'package:get/get.dart';

import 'common/common_en.dart';
import 'common/common_zh.dart';
import 'network/network_en.dart';
import 'network/network_zh.dart';
import '../../feature/auth/localization/auth_en.dart';
import '../../feature/auth/localization/auth_zh.dart';
import '../../feature/demo/localization/demo_en.dart';
import '../../feature/demo/localization/demo_zh.dart';
import '../../feature/main/localization/main_en.dart';
import '../../feature/main/localization/main_zh.dart';
import '../../feature/user/localization/user_en.dart';
import '../../feature/user/localization/user_zh.dart';

/// 应用国际化翻译聚合
///
/// 按业务模块拆分各模块文案，在此处按语言聚合后注入 GetX。
class AppTranslations extends Translations {
  /// 按语言标识聚合应用全部模块文案
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      ...commonZh,
      ...networkZh,
      ...mainZh,
      ...demoZh,
      ...authZh,
      ...userZh,
    },
    'en_US': {
      ...commonEn,
      ...networkEn,
      ...mainEn,
      ...demoEn,
      ...authEn,
      ...userEn,
    },
  };
}
