import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/theme/theme_color_preset.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/theme_demo_logic.dart';

/// 语言与主题设置页
///
/// 基于 TDesign 官方设置示例展示语言、深浅模式与多主题颜色。
class ThemeDemoView extends BaseView<ThemeDemoLogic> {
  /// 创建语言与主题设置页
  /// [logic] 外部注入的语言与主题设置 Logic 一般用于测试和预览。
  ThemeDemoView({super.key, super.logic});

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleThemeDemo.tr;

  /// 页面背景颜色
  @override
  Color? get backgroundColor => appTheme.backgroundSecondaryContainer;

  /// 构建语言、深浅模式与主题颜色设置
  @override
  Widget body() {
    final systemBrightness = MediaQuery.platformBrightnessOf(Get.context!);
    return Obx(() {
      final locale = Application.locale.value;
      final themeMode = Application.themeMode.value;
      final themeColorName = Application.themeColorName.value;
      return <Widget>[
        _buildLanguageGroup(locale),
        _buildThemeModeGroup(themeMode, systemBrightness),
        _buildThemeColorGroup(themeColorName),
      ].toColumnStretch().scrollable(padding: pageVerticalPadding);
    });
  }

  /// 构建语言设置卡片组
  ///
  /// [locale] 当前应用语言。
  Widget _buildLanguageGroup(Locale locale) {
    final languageName = locale.languageCode == 'zh'
        ? DemoKeys.languageChinese.tr
        : DemoKeys.languageEnglish.tr;
    return TDCellGroup(
      title: DemoKeys.languageSettingTitle.tr,
      theme: TDCellGroupTheme.cardTheme,
      cells: [
        TDCell(
          title: DemoKeys.currentLanguage.tr,
          note: languageName,
          arrow: true,
          onClick: (_) => unawaited(logic.toggleLocale()),
        ),
      ],
    );
  }

  /// 构建深浅模式设置卡片组
  ///
  /// [themeMode] 当前应用主题模式。
  /// [systemBrightness] 当前系统明暗模式。
  Widget _buildThemeModeGroup(
    ThemeMode themeMode,
    Brightness systemBrightness,
  ) {
    return TDCellGroup(
      title: DemoKeys.darkModeSettingTitle.tr,
      theme: TDCellGroupTheme.cardTheme,
      cells: [
        TDCell(
          title: DemoKeys.themeModeSystem.tr,
          description: DemoKeys.themeModeSystemDesc.tr,
          rightIconWidget: TDSwitch(
            isOn: themeMode == ThemeMode.system,
            onChanged: (isOn) {
              unawaited(logic.updateFollowSystem(isOn, systemBrightness));
              return true;
            },
          ),
        ),
        TDCell(
          title: DemoKeys.themeModeLight.tr,
          leftIcon: TDIcons.mode_light,
          rightIcon: _enabledModeCheckIcon(
            themeMode,
            ThemeMode.light,
            systemBrightness,
          ),
          onClick: (_) => unawaited(logic.updateThemeMode(ThemeMode.light)),
        ),
        TDCell(
          title: DemoKeys.themeModeDark.tr,
          leftIcon: TDIcons.mode_dark,
          rightIcon: _enabledModeCheckIcon(
            themeMode,
            ThemeMode.dark,
            systemBrightness,
          ),
          onClick: (_) => unawaited(logic.updateThemeMode(ThemeMode.dark)),
        ),
      ],
    );
  }

  /// 构建主题颜色卡片组
  ///
  /// [selectedColorName] 当前主题颜色名称。
  Widget _buildThemeColorGroup(String selectedColorName) {
    return TDCellGroup(
      title: DemoKeys.themeColorSettingTitle.tr,
      theme: TDCellGroupTheme.cardTheme,
      cells: logic.themeDemoState.themeColors.map((preset) {
        return TDCell(
          title: _themeColorTitle(preset).tr,
          description: _themeColorDescription(preset).tr,
          leftIconWidget: _buildThemeColorPreview(preset.previewColor),
          rightIcon: selectedColorName == preset.name ? TDIcons.check : null,
          onClick: (_) => unawaited(logic.updateThemeColor(preset)),
        );
      }).toList(),
    );
  }

  /// 获取主题颜色标题国际化键
  ///
  /// [preset] 主题颜色预设。
  String _themeColorTitle(ThemeColorPreset preset) {
    return switch (preset.name) {
      'green' => DemoKeys.themeGreen,
      'red' => DemoKeys.themeRed,
      'blue' => DemoKeys.themeBlue,
      _ => DemoKeys.themeDefault,
    };
  }

  /// 获取主题颜色说明国际化键
  ///
  /// [preset] 主题颜色预设。
  String _themeColorDescription(ThemeColorPreset preset) {
    return switch (preset.name) {
      'green' => DemoKeys.themeGreenDesc,
      'red' => DemoKeys.themeRedDesc,
      'blue' => DemoKeys.themeBlueDesc,
      _ => DemoKeys.themeDefaultDesc,
    };
  }

  /// 构建主题颜色预览圆点
  ///
  /// [color] 主题预览颜色。
  Widget _buildThemeColorPreview(Color color) {
    return Icon(Icons.circle, size: spacer24, color: color);
  }

  /// 获取当前生效模式的选中图标
  ///
  /// [themeMode] 当前应用主题模式。
  /// [targetMode] 目标主题模式。
  /// [systemBrightness] 当前系统明暗模式。
  IconData? _enabledModeCheckIcon(
    ThemeMode themeMode,
    ThemeMode targetMode,
    Brightness systemBrightness,
  ) {
    final effectiveMode = themeMode == ThemeMode.system
        ? systemBrightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light
        : themeMode;
    return effectiveMode == targetMode ? TDIcons.check : null;
  }
}

/// 语言与主题设置页面预览
@ResponsivePreview()
Widget previewThemeDemoView() => ThemeDemoView(logic: ThemeDemoLogic());
