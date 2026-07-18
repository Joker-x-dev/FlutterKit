import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/data/preview/user_preview_data.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/widgets/space.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/local_storage_demo_logic.dart';

/// 本地存储示例页
///
/// 演示用户信息的本地保存、读取与清除。
class LocalStorageDemoView extends BaseView<LocalStorageDemoLogic> {
  /// 创建本地存储示例页面
  ///
  /// [logic] 外部注入的本地存储示例 Logic 一般用于测试和预览。
  LocalStorageDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleLocalStorageDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建本地存储操作与用户信息
  @override
  Widget body() {
    return Obx(
      () =>
          [
                _buildActionButtons(),
                const SpaceVerticalLarge(),
                if (logic.user.value == null)
                  TDEmpty(emptyText: DemoKeys.storageNoData.tr)
                else
                  TDCellGroup(
                    theme: TDCellGroupTheme.cardTheme,
                    cells: [
                      _infoCell(
                        DemoKeys.storageUserId.tr,
                        '${logic.user.value!.id}',
                      ),
                      _infoCell(
                        DemoKeys.storageNickName.tr,
                        logic.user.value!.nickName ?? '',
                      ),
                      _infoCell(
                        DemoKeys.storagePhone.tr,
                        logic.user.value!.phone ?? '',
                      ),
                    ],
                  ),
              ]
              .toColumnStart(spacing: spaceVerticalMedium)
              .scrollable(padding: pageVerticalPadding),
    );
  }

  /// 构建本地存储操作按钮
  ///
  /// 宽屏使用单行等宽布局，窄屏自动换行为两列，避免长文案横向溢出。
  Widget _buildActionButtons() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttons = <Widget>[
          TDButton(
            text: DemoKeys.storageSave.tr,
            theme: TDButtonTheme.primary,
            onTap: logic.saveUser,
          ),
          TDButton(
            text: DemoKeys.storageRead.tr,
            theme: TDButtonTheme.defaultTheme,
            onTap: logic.readUser,
          ),
          TDButton(
            text: DemoKeys.storageClear.tr,
            theme: TDButtonTheme.danger,
            onTap: logic.clearUser,
          ),
        ];

        if (constraints.maxWidth < 400) {
          final itemWidth = (constraints.maxWidth - spaceHorizontalSmall) / 2;
          return buttons
              .map((button) => button.width(itemWidth))
              .toList()
              .toCenteredWrap(
                spacing: spaceHorizontalSmall,
                runSpacing: spaceVerticalSmall,
              );
        }

        return buttons
            .map((button) => button.expanded())
            .toList()
            .toRowCenter(spacing: spaceHorizontalSmall);
      },
    ).padHorizontal(spaceHorizontalLarge);
  }

  /// 构建本地存储信息单元格
  ///
  /// [label] 字段名称。
  /// [value] 字段值。
  ///
  /// 返回 TDesign 单元格。
  TDCell _infoCell(String label, String value) {
    return TDCell(title: label, note: value);
  }
}

/// 本地存储示例页面预览
@ResponsivePreview()
Widget previewLocalStorageDemoView() {
  final LocalStorageDemoLogic logic = LocalStorageDemoLogic();
  logic.user.value = previewUser;
  return LocalStorageDemoView(logic: logic);
}
