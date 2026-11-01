import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/design_system/theme/theme_color_preset.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:flutter_kit/core/ui/widgets/rounded_cell_group.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../core/design_system/theme/app_theme.dart';
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
      ].toColumnStretch().scrollable(padding: pageVerticalPaddingWithInset);
    });
  }

  /// 构建语言设置卡片组
  ///
  /// [locale] 当前应用语言。
  Widget _buildLanguageGroup(Locale locale) {
    final languageName = locale.languageCode == 'zh'
        ? DemoKeys.languageChinese.tr
        : DemoKeys.languageEnglish.tr;
    return RoundedCellGroup(
      title: Text(DemoKeys.languageSettingTitle.tr),
      cells: [
        TCell(
          title: Text(DemoKeys.currentLanguage.tr),
          note: Text(languageName),
          arrow: true,
          onTap: () => unawaited(logic.toggleLocale()),
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
    return RoundedCellGroup(
      title: Text(DemoKeys.darkModeSettingTitle.tr),
      cells: [
        TCell(
          title: Text(DemoKeys.themeModeSystem.tr),
          subtitle: Text(DemoKeys.themeModeSystemDesc.tr),
          trailing: TSwitch(
            value: themeMode == ThemeMode.system,
            onChanged: (isOn) {
              unawaited(logic.updateFollowSystem(isOn, systemBrightness));
            },
          ),
        ),
        TCell(
          title: Text(DemoKeys.themeModeLight.tr),
          prefix: const Icon(TIcons.mode_light),
          trailing: _buildModeCheckIcon(
            _enabledModeCheckIcon(themeMode, ThemeMode.light, systemBrightness),
          ),
          onTap: () => unawaited(logic.updateThemeMode(ThemeMode.light)),
        ),
        TCell(
          title: Text(DemoKeys.themeModeDark.tr),
          prefix: const Icon(TIcons.mode_dark),
          trailing: _buildModeCheckIcon(
            _enabledModeCheckIcon(themeMode, ThemeMode.dark, systemBrightness),
          ),
          onTap: () => unawaited(logic.updateThemeMode(ThemeMode.dark)),
        ),
      ],
    );
  }

  /// 构建主题颜色卡片组
  ///
  /// [selectedColorName] 当前主题颜色名称。
  Widget _buildThemeColorGroup(String selectedColorName) {
    return RoundedCellGroup(
      title: Text(DemoKeys.themeColorSettingTitle.tr),
      cells: logic.themeDemoState.themeColors.map((preset) {
        return TCell(
          title: Text(_themeColorTitle(preset).tr),
          subtitle: Text(_themeColorDescription(preset).tr),
          prefix: _buildThemeColorPreview(preset.previewColor),
          trailing: selectedColorName == preset.name
              ? const Icon(TIcons.check)
              : null,
          onTap: () => unawaited(logic.updateThemeColor(preset)),
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
    return effectiveMode == targetMode ? TIcons.check : null;
  }

  /// 构建主题模式选中图标。
  ///
  /// [icon] 当前模式对应的图标数据。
  Widget? _buildModeCheckIcon(IconData? icon) {
    return icon == null ? null : Icon(icon);
  }
}

/// 语言与主题设置页面预览
@ResponsivePreview()
Widget previewThemeDemoView() => ThemeDemoView(logic: ThemeDemoLogic());
