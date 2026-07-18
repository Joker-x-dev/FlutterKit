import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/data/preview/demo_entity_preview_data.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/widgets/space.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../../../../core/localization/common/common_keys.dart';
import '../logics/database_demo_logic.dart';

/// 数据库示例页
///
/// 演示本地数据库的增删查能力。
class DatabaseDemoView extends BaseView<DatabaseDemoLogic> {
  /// 创建数据库示例页面
  ///
  /// [logic] 外部注入的数据库示例 Logic 一般用于测试和预览。
  DatabaseDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleDatabaseDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建数据库记录与操作按钮
  @override
  Widget body() {
    return Obx(
      () =>
          [
                [
                      TDButton(
                        text: DemoKeys.dbAdd.tr,
                        theme: TDButtonTheme.primary,
                        onTap: logic.addItem,
                      ),
                      TDButton(
                        text: DemoKeys.dbClear.tr,
                        theme: TDButtonTheme.danger,
                        onTap: logic.clearAll,
                      ),
                    ]
                    .toRowCenter(spacing: spaceHorizontalMedium)
                    .padHorizontal(spaceHorizontalLarge),
                const SpaceVerticalLarge(),
                if (logic.items.isEmpty)
                  TDEmpty(emptyText: DemoKeys.dbEmpty.tr)
                else
                  TDCellGroup(
                    theme: TDCellGroupTheme.cardTheme,
                    cells: logic.items
                        .map(
                          (item) => TDCell(
                            title: item.title,
                            description: item.description,
                            bordered: true,
                            rightIconWidget: TDButton(
                              text: CommonKeys.delete.tr,
                              theme: TDButtonTheme.danger,
                              size: TDButtonSize.small,
                              type: TDButtonType.text,
                              onTap: () => logic.deleteItem(item.id!),
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ]
              .toColumnStart(spacing: spaceVerticalMedium)
              .scrollable(padding: pageVerticalPadding),
    );
  }
}

/// 数据库示例页面预览
@ResponsivePreview()
Widget previewDatabaseDemoView() {
  final DatabaseDemoLogic logic = DatabaseDemoLogic();
  logic.items.assignAll(previewDemoEntities);
  return DatabaseDemoView(logic: logic);
}
