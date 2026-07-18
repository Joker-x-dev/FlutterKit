import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../design_system/theme/app_theme.dart';

/// 自定义遮罩加载动画
class LoadingDialog {
  /// 显示自定义遮罩加载动画
  static void show() {
    BotToast.showCustomLoading(
      backgroundColor: Colors.transparent,
      toastBuilder: (_) {
        return Builder(
          builder: (BuildContext context) {
            final AppTheme appTheme = AppTheme.of(context);
            return const TDLoading(
                  size: TDLoadingSize.large,
                  icon: TDLoadingIcon.circle,
                )
                .center()
                .backgroundColor(appTheme.textPrimary.withValues(alpha: 0.3))
                .backgroundBlur(sigmaX: 5, sigmaY: 5);
          },
        );
      },
    );
  }

  /// 关闭全部加载动画
  static void hide() {
    BotToast.closeAllLoading();
  }
}
