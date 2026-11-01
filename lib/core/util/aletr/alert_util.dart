import 'dart:async';

import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../design_system/extensions/extensions.dart';
import '../../design_system/theme/size.dart';
import '../../localization/common/common_keys.dart';

/// 图片对话框中的图片位置。
enum AlertImagePosition {
  /// 图片显示在正文上方。
  top,

  /// 图片显示在正文下方。
  bottom,
}

/// TDesign 对话框工具。
///
/// 统一展示反馈、确认、输入和图片类型对话框。
class AlertUtil {
  /// 反馈类对话框。
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  static void showFeedbackDialog(String content, {String? title}) {
    final BuildContext context = Get.context!;
    unawaited(
      TDialog.show<void>(
        context,
        dialog: TConfirmDialog(
          title: title ?? CommonKeys.tip.tr,
          content: content,
          showCloseButton: true,
        ),
      ),
    );
  }

  /// 确认类对话框。
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  /// [rightBtnAction] 可选确认按钮回调。
  static void showConfirmDialog(
    String content, {
    String? title,
    VoidCallback? rightBtnAction,
  }) {
    final BuildContext context = Get.context!;
    unawaited(
      TDialog.show<void>(
        context,
        dialog: TDialog(
          title: Text(title ?? CommonKeys.tip.tr),
          content: Text(content),
          showCloseButton: true,
          actions: [
            TDialogAction(child: Text(CommonKeys.cancel.tr)),
            TDialogAction(
              role: TDialogActionRole.primary,
              onPressed: rightBtnAction,
              child: Text(CommonKeys.confirm.tr),
            ),
          ],
        ),
      ),
    );
  }

  /// 输入类对话框。
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  /// [hintText] 可选输入提示文本。
  /// [onConfirm] 输入确认回调。
  static Future<void> showInputDialog(
    String content, {
    String? title,
    String? hintText,
    required void Function(String value) onConfirm,
  }) async {
    String inputValue = '';
    final BuildContext context = Get.context!;
    await TDialog.show<void>(
      context,
      dialog: TDialog(
        title: Text(title ?? CommonKeys.tip.tr),
        content: Builder(
          builder: (BuildContext dialogContext) {
            return <Widget>[
              Text(content),
              SizedBox(height: spacer16),
              TInput(
                hintText: hintText ?? CommonKeys.inputTitle.tr,
                onChanged: (String value) => inputValue = value,
              ),
            ].toColumn(mainAxisSize: .min);
          },
        ),
        showCloseButton: true,
        actions: [
          TDialogAction(child: Text(CommonKeys.cancel.tr)),
          TDialogAction(
            role: TDialogActionRole.primary,
            onPressed: () => onConfirm(inputValue),
            child: Text(CommonKeys.confirm.tr),
          ),
        ],
      ),
    );
  }

  /// 带图片的对话框。
  ///
  /// [content] 对话框内容。
  /// [image] 对话框图片。
  /// [title] 可选对话框标题。
  /// [imagePosition] 图片展示位置。
  static void showImageDialog(
    String content, {
    required Image image,
    String? title,
    AlertImagePosition imagePosition = AlertImagePosition.top,
  }) {
    final BuildContext context = Get.context!;
    unawaited(
      TDialog.show<void>(
        context,
        dialog: TConfirmDialog(
          title: title ?? CommonKeys.tip.tr,
          contentWidget: Builder(
            builder: (BuildContext dialogContext) {
              final Widget spacing = SizedBox(height: spacer16);
              final List<Widget> children =
                  imagePosition == AlertImagePosition.top
                  ? <Widget>[image, spacing, Text(content)]
                  : <Widget>[Text(content), spacing, image];
              return children.toColumn(mainAxisSize: .min);
            },
          ),
          showCloseButton: true,
        ),
      ),
    );
  }
}
