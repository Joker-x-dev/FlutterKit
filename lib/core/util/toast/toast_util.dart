import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../design_system/theme/shape.dart';
import '../../design_system/theme/size.dart';

/// TDesign 通知工具
///
/// 使用 BotToast 统一展示普通、成功、警告和错误通知。
class ToastUtil {
  /// 当前通知关闭回调
  static CancelFunc? _cancelFunc;

  /// 展示基础通知
  ///
  /// [message] 通知文本。
  /// [variant] 通知语义类型。
  static void _showBase(
    String message, {
    TNoticeBarStatus variant = TNoticeBarStatus.info,
  }) {
    _cancelFunc = BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return Builder(
          builder: (BuildContext context) {
            return TNoticeBar(
                    content: message,
                    status: variant,
                    suffixIcon: TIcons.close,
                    onTargetTap: (_) => hide(),
                  )
                .clipRadius(radiusDefault)
                .marginSymmetric(horizontal: spaceHorizontalLarge);
          },
        );
      },
    );
  }

  /// 普通通知
  ///
  /// [message] 通知文本。
  static void show(String message) {
    _showBase(message);
  }

  /// 成功通知
  ///
  /// [message] 通知文本。
  static void success(String message) {
    _showBase(message, variant: TNoticeBarStatus.success);
  }

  /// 警告通知
  ///
  /// [message] 通知文本。
  static void warning(String message) {
    _showBase(message, variant: TNoticeBarStatus.warning);
  }

  /// 错误通知
  ///
  /// [message] 通知文本。
  static void error(String message) {
    _showBase(message, variant: TNoticeBarStatus.error);
  }

  /// 关闭当前通知
  static void hide() {
    if (_cancelFunc != null) {
      _cancelFunc!();
      _cancelFunc = null;
    }
  }
}
