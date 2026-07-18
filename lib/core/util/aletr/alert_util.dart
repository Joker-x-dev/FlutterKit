import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../localization/common/common_keys.dart';

/// TDesign 对话框工具
///
/// 统一展示反馈、确认、输入和图片类型对话框。
class AlertUtil {
  /// 反馈类对话框
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  static void showFeedbackDialog(String content, {String? title}) {
    showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return TDConfirmDialog(
              title: title ?? CommonKeys.tip.tr,
              content: content,
              showCloseButton: true,
            );
          },
    );
  }

  /// 确认类对话框
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  /// [rightBtnAction] 可选确认按钮回调。
  static void showConfirmDialog(
    String content, {
    String? title,
    VoidCallback? rightBtnAction,
  }) {
    showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return TDAlertDialog(
              title: title ?? CommonKeys.tip.tr,
              content: content,
              showCloseButton: true,
              rightBtnAction: rightBtnAction,
            );
          },
    );
  }

  /// 输入类对话框
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
    final TextEditingController textController = TextEditingController();
    await showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return StatefulBuilder(
              builder:
                  (
                    BuildContext context,
                    void Function(void Function()) setState,
                  ) {
                    return TDInputDialog(
                      textEditingController: textController,
                      title: title ?? CommonKeys.tip.tr,
                      content: content,
                      hintText: hintText ?? CommonKeys.inputTitle.tr,
                      showCloseButton: true,
                      rightBtn: TDDialogButtonOptions(
                        title: CommonKeys.confirm.tr,
                        fontWeight: FontWeight.w600,
                        height: 56,
                        action: () {
                          final inputValue = textController.text;
                          onConfirm(inputValue);
                        },
                      ),
                    );
                  },
            );
          },
    );
  }

  /// 带图片的对话框
  ///
  /// [content] 对话框内容。
  /// [image] 对话框图片。
  /// [title] 可选对话框标题。
  /// [imagePosition] 图片展示位置。
  static void showImageDialog(
    String content, {
    required Image image,
    String? title,
    TDDialogImagePosition imagePosition = TDDialogImagePosition.top,
  }) {
    showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return TDImageDialog(
              image: image,
              title: title ?? CommonKeys.tip.tr,
              content: content,
              imagePosition: imagePosition,
              showCloseButton: true,
            );
          },
    );
  }
}
