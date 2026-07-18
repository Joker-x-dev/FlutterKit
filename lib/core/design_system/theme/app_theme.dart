import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 应用主题扩展
///
/// 将 TDesign 主题数据封装为 Flutter [ThemeExtension]，
/// 通过 [Theme.of(context).extension<AppTheme>()] 或 [AppTheme.of(context)] 获取，
/// 符合 Flutter 设计规范，同时便于 Widget 测试注入 mock 主题。
@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  /// 创建应用主题扩展
  ///
  /// [tdTheme] 底层 TDesign 主题数据。
  /// [primary]、[primaryLight]、[primaryDark]、[primaryDisabled]、
  /// [primaryFocus]、[primaryActive] 配置品牌主色状态。
  /// [success]、[successLight]、[successDisabled]、[successFocus]、
  /// [successActive] 配置成功色状态。
  /// [warning]、[warningLight]、[warningDisabled]、[warningFocus]、
  /// [warningActive] 配置警告色状态。
  /// [error]、[errorLight]、[errorDisabled]、[errorFocus]、[errorActive]
  /// 配置错误色状态。
  /// [backgroundPage]、[backgroundContainer]、[backgroundContainerActive]、
  /// [backgroundSecondaryContainer]、[backgroundSecondaryContainerActive]、
  /// [backgroundComponent]、[backgroundComponentActive]、
  /// [backgroundComponentDisabled] 配置页面和组件背景色。
  /// [textPrimary]、[textSecondary]、[textPlaceholder]、[textDisabled]、
  /// [textAnti]、[textBrand]、[textLink] 配置文本语义色。
  /// [borderLevel1]、[borderLevel2] 配置边框语义色。
  /// `font` 前缀参数配置各层级字体样式和字重。
  const AppTheme({
    required this.tdTheme,
    // 主色
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.primaryDisabled,
    required this.primaryFocus,
    required this.primaryActive,
    // 成功色
    required this.success,
    required this.successLight,
    required this.successDisabled,
    required this.successFocus,
    required this.successActive,
    // 警告色
    required this.warning,
    required this.warningLight,
    required this.warningDisabled,
    required this.warningFocus,
    required this.warningActive,
    // 错误色
    required this.error,
    required this.errorLight,
    required this.errorDisabled,
    required this.errorFocus,
    required this.errorActive,
    // 背景色
    required this.backgroundPage,
    required this.backgroundContainer,
    required this.backgroundContainerActive,
    required this.backgroundSecondaryContainer,
    required this.backgroundSecondaryContainerActive,
    required this.backgroundComponent,
    required this.backgroundComponentActive,
    required this.backgroundComponentDisabled,
    // 文本色
    required this.textPrimary,
    required this.textSecondary,
    required this.textPlaceholder,
    required this.textDisabled,
    required this.textAnti,
    required this.textBrand,
    required this.textLink,
    // 边框色
    required this.borderLevel1,
    required this.borderLevel2,
    // 字体
    required this.fontDisplayLarge,
    required this.fontDisplayMedium,
    required this.fontHeadlineLarge,
    required this.fontHeadlineMedium,
    required this.fontHeadlineSmall,
    required this.fontTitleExtraLarge,
    required this.fontTitleLarge,
    required this.fontTitleMedium,
    required this.fontTitleSmall,
    required this.fontBodyExtraLarge,
    required this.fontBodyLarge,
    required this.fontBodyMedium,
    required this.fontBodySmall,
    required this.fontBodyExtraSmall,
    required this.fontMarkLarge,
    required this.fontMarkMedium,
    required this.fontMarkSmall,
    required this.fontMarkExtraSmall,
    required this.fontLinkLarge,
    required this.fontLinkMedium,
    required this.fontLinkSmall,
    // 字重
    required this.fontWeightRegular,
    required this.fontWeightMedium,
    required this.fontWeightBold,
  });

  /// 底层 TDesign 主题数据
  final TDThemeData tdTheme;

  //==================== 主色 ====================
  /// 品牌主色，用于主要按钮、主要图标、重点文字等
  final Color primary;

  /// 品牌浅色，用于主色浅色背景、hover 状态等
  final Color primaryLight;

  /// 品牌深色，用于主色深色背景、点击状态等
  final Color primaryDark;

  /// 品牌禁用色，用于禁用状态的主色按钮等元素
  final Color primaryDisabled;

  /// 品牌聚焦色，用于聚焦状态交互
  final Color primaryFocus;

  /// 品牌激活色，用于点击状态
  final Color primaryActive;

  //==================== 成功色 ====================
  /// 成功色，用于成功状态、完成状态的按钮、图标和文字
  final Color success;

  /// 成功浅色，用于成功状态的背景色
  final Color successLight;

  /// 成功禁用色，用于禁用状态的成功色按钮等元素
  final Color successDisabled;

  /// 成功聚焦色，用于成功元素的聚焦状态
  final Color successFocus;

  /// 成功激活色，用于成功元素的点击状态
  final Color successActive;

  //==================== 警告色 ====================
  /// 警告色，用于警告状态、需要注意的按钮、图标和文字
  final Color warning;

  /// 警告浅色，用于警告状态的背景色
  final Color warningLight;

  /// 警告禁用色，用于禁用状态的警告色按钮等元素
  final Color warningDisabled;

  /// 警告聚焦色，用于警告元素的聚焦状态
  final Color warningFocus;

  /// 警告激活色，用于警告元素的点击状态
  final Color warningActive;

  //==================== 错误色 ====================
  /// 错误色，用于错误状态、失败状态的按钮、图标和文字
  final Color error;

  /// 错误浅色，用于错误状态的背景色
  final Color errorLight;

  /// 错误禁用色，用于禁用状态的错误色按钮等元素
  final Color errorDisabled;

  /// 错误聚焦色，用于错误元素的聚焦状态
  final Color errorFocus;

  /// 错误激活色，用于错误元素的点击状态
  final Color errorActive;

  //==================== 背景色 ====================
  /// 页面整体背景色
  final Color backgroundPage;

  /// 一级容器背景色，用于卡片、弹窗等容器背景
  final Color backgroundContainer;

  /// 一级容器激活态背景色
  final Color backgroundContainerActive;

  /// 二级容器背景色，用于次级区域背景
  final Color backgroundSecondaryContainer;

  /// 二级容器激活态背景色
  final Color backgroundSecondaryContainerActive;

  /// 组件背景色，用于默认状态的组件背景
  final Color backgroundComponent;

  /// 组件激活态背景色，用于按钮等组件激活状态
  final Color backgroundComponentActive;

  /// 组件禁用态背景色，用于禁用状态的组件背景
  final Color backgroundComponentDisabled;

  //==================== 文本色 ====================
  /// 主要文本颜色，用于重要级文字信息、标题
  final Color textPrimary;

  /// 次要文本颜色，用于次级文字信息
  final Color textSecondary;

  /// 占位文本颜色，用于占位符、输入框提示等
  final Color textPlaceholder;

  /// 禁用文本颜色，用于禁用状态的文字
  final Color textDisabled;

  /// 反色文本，用于深色背景上的文字
  final Color textAnti;

  /// 品牌色文本，用于链接、强调文字
  final Color textBrand;

  /// 链接文本颜色，用于链接文字
  final Color textLink;

  //==================== 边框色 ====================
  /// 一级边框颜色，用于分割线、边框等
  final Color borderLevel1;

  /// 二级边框颜色，用于较深的分割线、边框等
  final Color borderLevel2;

  //==================== 字体 ====================
  /// 超大号显示文字 (64/72)
  final Font? fontDisplayLarge;

  /// 大号显示文字 (48/56)
  final Font? fontDisplayMedium;

  /// 大型标题 (36/44)
  final Font? fontHeadlineLarge;

  /// 中型标题 (28/36)
  final Font? fontHeadlineMedium;

  /// 小型标题 (24/32)
  final Font? fontHeadlineSmall;

  /// 特大号标题 (20/28)
  final Font? fontTitleExtraLarge;

  /// 大号标题 (18/26)
  final Font? fontTitleLarge;

  /// 中号标题 (16/24)
  final Font? fontTitleMedium;

  /// 小号标题 (14/22)
  final Font? fontTitleSmall;

  /// 超大号正文 (18/26)
  final Font? fontBodyExtraLarge;

  /// 大号正文 (16/24)
  final Font? fontBodyLarge;

  /// 中号正文 (14/22)
  final Font? fontBodyMedium;

  /// 小号正文 (12/20)
  final Font? fontBodySmall;

  /// 超小号正文 (10/16)
  final Font? fontBodyExtraSmall;

  /// 大号标记文字 (16/24)
  final Font? fontMarkLarge;

  /// 中号标记文字 (14/22)
  final Font? fontMarkMedium;

  /// 小号标记文字 (12/20)
  final Font? fontMarkSmall;

  /// 超小号标记文字 (10/16)
  final Font? fontMarkExtraSmall;

  /// 大号链接文字 (16/24)
  final Font? fontLinkLarge;

  /// 中号链接文字 (14/22)
  final Font? fontLinkMedium;

  /// 小号链接文字 (12/20)
  final Font? fontLinkSmall;

  //==================== 字重 ====================
  /// 常规字重
  final FontWeight fontWeightRegular;

  /// 中等字重
  final FontWeight fontWeightMedium;

  /// 加粗字重
  final FontWeight fontWeightBold;

  /// 从 [BuildContext] 获取 [AppTheme]
  static AppTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTheme>()!;
  }

  /// 构建 Material 主题
  ///
  /// [tdTheme] 当前深浅模式对应的 TDesign 主题数据。
  /// [brightness] Material 主题亮度。
  ///
  /// 返回保持品牌色、普通图标色和导航前景色职责分离的主题配置。
  static ThemeData buildMaterialTheme(
    TDThemeData tdTheme,
    Brightness brightness,
  ) {
    final isDark = brightness == Brightness.dark;
    final colorScheme = isDark
        ? ColorScheme.dark(
            primary: tdTheme.brandNormalColor,
            secondary: tdTheme.brandNormalColor,
          )
        : ColorScheme.light(primary: tdTheme.brandNormalColor);
    final foregroundColor = tdTheme.textColorPrimary;
    final iconTheme = IconThemeData(color: foregroundColor);

    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: tdTheme.bgColorPage,
      iconTheme: iconTheme,
      primaryIconTheme: iconTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: tdTheme.bgColorContainer,
        foregroundColor: foregroundColor,
        iconTheme: iconTheme,
        actionsIconTheme: iconTheme,
        surfaceTintColor: Colors.transparent,
      ),
      extensions: [tdTheme, AppTheme.fromTdTheme(tdTheme)],
    );
  }

  /// 构建系统状态栏与导航栏样式
  ///
  /// [tdTheme] 当前深浅模式对应的 TDesign 主题数据。
  /// [brightness] 当前界面亮度。
  ///
  /// 返回与页面容器背景一致的系统栏样式。
  static SystemUiOverlayStyle buildSystemUiOverlayStyle(
    TDThemeData tdTheme,
    Brightness brightness,
  ) {
    final isDark = brightness == Brightness.dark;
    final iconBrightness = isDark ? Brightness.light : Brightness.dark;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: iconBrightness,
      statusBarBrightness: brightness,
      systemNavigationBarColor: tdTheme.bgColorContainer,
      systemNavigationBarDividerColor: tdTheme.bgColorContainer,
      systemNavigationBarIconBrightness: iconBrightness,
      systemNavigationBarContrastEnforced: false,
    );
  }

  /// 从 [TDThemeData] 构建 [AppTheme]
  factory AppTheme.fromTdTheme(TDThemeData tdTheme) {
    return AppTheme(
      tdTheme: tdTheme,
      // 主色
      primary: tdTheme.brandColor7,
      primaryLight: tdTheme.brandColor1,
      primaryDark: tdTheme.brandColor8,
      primaryDisabled: tdTheme.brandColor3,
      primaryFocus: tdTheme.brandColor2,
      primaryActive: tdTheme.brandColor8,
      // 成功色
      success: tdTheme.successColor5,
      successLight: tdTheme.successColor1,
      successDisabled: tdTheme.successColor3,
      successFocus: tdTheme.successColor2,
      successActive: tdTheme.successColor6,
      // 警告色
      warning: tdTheme.warningColor5,
      warningLight: tdTheme.warningColor1,
      warningDisabled: tdTheme.warningColor3,
      warningFocus: tdTheme.warningColor2,
      warningActive: tdTheme.warningColor6,
      // 错误色
      error: tdTheme.errorColor6,
      errorLight: tdTheme.errorColor1,
      errorDisabled: tdTheme.errorColor3,
      errorFocus: tdTheme.errorColor2,
      errorActive: tdTheme.errorColor7,
      // 背景色
      backgroundPage: tdTheme.bgColorPage,
      backgroundContainer: tdTheme.bgColorContainer,
      backgroundContainerActive: tdTheme.bgColorContainerActive,
      backgroundSecondaryContainer: tdTheme.bgColorSecondaryContainer,
      backgroundSecondaryContainerActive:
          tdTheme.bgColorSecondaryContainerActive,
      backgroundComponent: tdTheme.bgColorComponent,
      backgroundComponentActive: tdTheme.bgColorComponentActive,
      backgroundComponentDisabled: tdTheme.bgColorComponentDisabled,
      // 文本色
      textPrimary: tdTheme.textColorPrimary,
      textSecondary: tdTheme.textColorSecondary,
      textPlaceholder: tdTheme.textColorPlaceholder,
      textDisabled: tdTheme.textDisabledColor,
      textAnti: tdTheme.textColorAnti,
      textBrand: tdTheme.textColorBrand,
      textLink: tdTheme.textColorLink,
      // 边框色
      borderLevel1: tdTheme.componentStrokeColor,
      borderLevel2: tdTheme.componentBorderColor,
      // 字体
      fontDisplayLarge: tdTheme.fontDisplayLarge,
      fontDisplayMedium: tdTheme.fontDisplayMedium,
      fontHeadlineLarge: tdTheme.fontHeadlineLarge,
      fontHeadlineMedium: tdTheme.fontHeadlineMedium,
      fontHeadlineSmall: tdTheme.fontHeadlineSmall,
      fontTitleExtraLarge: tdTheme.fontTitleExtraLarge,
      fontTitleLarge: tdTheme.fontTitleLarge,
      fontTitleMedium: tdTheme.fontTitleMedium,
      fontTitleSmall: tdTheme.fontTitleSmall,
      fontBodyExtraLarge: tdTheme.fontBodyExtraLarge,
      fontBodyLarge: tdTheme.fontBodyLarge,
      fontBodyMedium: tdTheme.fontBodyMedium,
      fontBodySmall: tdTheme.fontBodySmall,
      fontBodyExtraSmall: tdTheme.fontBodyExtraSmall,
      fontMarkLarge: tdTheme.fontMarkLarge,
      fontMarkMedium: tdTheme.fontMarkMedium,
      fontMarkSmall: tdTheme.fontMarkSmall,
      fontMarkExtraSmall: tdTheme.fontMarkExtraSmall,
      fontLinkLarge: tdTheme.fontLinkLarge,
      fontLinkMedium: tdTheme.fontLinkMedium,
      fontLinkSmall: tdTheme.fontLinkSmall,
      // 字重
      fontWeightRegular: FontWeight.normal,
      fontWeightMedium: FontWeight.w500,
      fontWeightBold: FontWeight.w600,
    );
  }

  /// 基于当前主题复制新的主题扩展
  ///
  /// 所有可选参数均覆盖同名主题属性，未提供的属性沿用当前实例值。
  ///
  /// 返回合并后的 [AppTheme]。
  @override
  ThemeExtension<AppTheme> copyWith({
    TDThemeData? tdTheme,
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? primaryDisabled,
    Color? primaryFocus,
    Color? primaryActive,
    Color? success,
    Color? successLight,
    Color? successDisabled,
    Color? successFocus,
    Color? successActive,
    Color? warning,
    Color? warningLight,
    Color? warningDisabled,
    Color? warningFocus,
    Color? warningActive,
    Color? error,
    Color? errorLight,
    Color? errorDisabled,
    Color? errorFocus,
    Color? errorActive,
    Color? backgroundPage,
    Color? backgroundContainer,
    Color? backgroundContainerActive,
    Color? backgroundSecondaryContainer,
    Color? backgroundSecondaryContainerActive,
    Color? backgroundComponent,
    Color? backgroundComponentActive,
    Color? backgroundComponentDisabled,
    Color? textPrimary,
    Color? textSecondary,
    Color? textPlaceholder,
    Color? textDisabled,
    Color? textAnti,
    Color? textBrand,
    Color? textLink,
    Color? borderLevel1,
    Color? borderLevel2,
    Font? fontDisplayLarge,
    Font? fontDisplayMedium,
    Font? fontHeadlineLarge,
    Font? fontHeadlineMedium,
    Font? fontHeadlineSmall,
    Font? fontTitleExtraLarge,
    Font? fontTitleLarge,
    Font? fontTitleMedium,
    Font? fontTitleSmall,
    Font? fontBodyExtraLarge,
    Font? fontBodyLarge,
    Font? fontBodyMedium,
    Font? fontBodySmall,
    Font? fontBodyExtraSmall,
    Font? fontMarkLarge,
    Font? fontMarkMedium,
    Font? fontMarkSmall,
    Font? fontMarkExtraSmall,
    Font? fontLinkLarge,
    Font? fontLinkMedium,
    Font? fontLinkSmall,
    FontWeight? fontWeightRegular,
    FontWeight? fontWeightMedium,
    FontWeight? fontWeightBold,
  }) {
    return AppTheme(
      tdTheme: tdTheme ?? this.tdTheme,
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryDisabled: primaryDisabled ?? this.primaryDisabled,
      primaryFocus: primaryFocus ?? this.primaryFocus,
      primaryActive: primaryActive ?? this.primaryActive,
      success: success ?? this.success,
      successLight: successLight ?? this.successLight,
      successDisabled: successDisabled ?? this.successDisabled,
      successFocus: successFocus ?? this.successFocus,
      successActive: successActive ?? this.successActive,
      warning: warning ?? this.warning,
      warningLight: warningLight ?? this.warningLight,
      warningDisabled: warningDisabled ?? this.warningDisabled,
      warningFocus: warningFocus ?? this.warningFocus,
      warningActive: warningActive ?? this.warningActive,
      error: error ?? this.error,
      errorLight: errorLight ?? this.errorLight,
      errorDisabled: errorDisabled ?? this.errorDisabled,
      errorFocus: errorFocus ?? this.errorFocus,
      errorActive: errorActive ?? this.errorActive,
      backgroundPage: backgroundPage ?? this.backgroundPage,
      backgroundContainer: backgroundContainer ?? this.backgroundContainer,
      backgroundContainerActive:
          backgroundContainerActive ?? this.backgroundContainerActive,
      backgroundSecondaryContainer:
          backgroundSecondaryContainer ?? this.backgroundSecondaryContainer,
      backgroundSecondaryContainerActive:
          backgroundSecondaryContainerActive ??
          this.backgroundSecondaryContainerActive,
      backgroundComponent: backgroundComponent ?? this.backgroundComponent,
      backgroundComponentActive:
          backgroundComponentActive ?? this.backgroundComponentActive,
      backgroundComponentDisabled:
          backgroundComponentDisabled ?? this.backgroundComponentDisabled,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textPlaceholder: textPlaceholder ?? this.textPlaceholder,
      textDisabled: textDisabled ?? this.textDisabled,
      textAnti: textAnti ?? this.textAnti,
      textBrand: textBrand ?? this.textBrand,
      textLink: textLink ?? this.textLink,
      borderLevel1: borderLevel1 ?? this.borderLevel1,
      borderLevel2: borderLevel2 ?? this.borderLevel2,
      fontDisplayLarge: fontDisplayLarge ?? this.fontDisplayLarge,
      fontDisplayMedium: fontDisplayMedium ?? this.fontDisplayMedium,
      fontHeadlineLarge: fontHeadlineLarge ?? this.fontHeadlineLarge,
      fontHeadlineMedium: fontHeadlineMedium ?? this.fontHeadlineMedium,
      fontHeadlineSmall: fontHeadlineSmall ?? this.fontHeadlineSmall,
      fontTitleExtraLarge: fontTitleExtraLarge ?? this.fontTitleExtraLarge,
      fontTitleLarge: fontTitleLarge ?? this.fontTitleLarge,
      fontTitleMedium: fontTitleMedium ?? this.fontTitleMedium,
      fontTitleSmall: fontTitleSmall ?? this.fontTitleSmall,
      fontBodyExtraLarge: fontBodyExtraLarge ?? this.fontBodyExtraLarge,
      fontBodyLarge: fontBodyLarge ?? this.fontBodyLarge,
      fontBodyMedium: fontBodyMedium ?? this.fontBodyMedium,
      fontBodySmall: fontBodySmall ?? this.fontBodySmall,
      fontBodyExtraSmall: fontBodyExtraSmall ?? this.fontBodyExtraSmall,
      fontMarkLarge: fontMarkLarge ?? this.fontMarkLarge,
      fontMarkMedium: fontMarkMedium ?? this.fontMarkMedium,
      fontMarkSmall: fontMarkSmall ?? this.fontMarkSmall,
      fontMarkExtraSmall: fontMarkExtraSmall ?? this.fontMarkExtraSmall,
      fontLinkLarge: fontLinkLarge ?? this.fontLinkLarge,
      fontLinkMedium: fontLinkMedium ?? this.fontLinkMedium,
      fontLinkSmall: fontLinkSmall ?? this.fontLinkSmall,
      fontWeightRegular: fontWeightRegular ?? this.fontWeightRegular,
      fontWeightMedium: fontWeightMedium ?? this.fontWeightMedium,
      fontWeightBold: fontWeightBold ?? this.fontWeightBold,
    );
  }

  /// 在两个主题扩展之间插值
  ///
  /// [other] 插值目标主题扩展。
  /// [t] 插值进度，范围通常为 `0.0` 到 `1.0`。
  ///
  /// 返回当前插值进度对应的 [AppTheme]。
  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) return this;
    return AppTheme(
      tdTheme: t < 0.5 ? tdTheme : other.tdTheme,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryDisabled: Color.lerp(primaryDisabled, other.primaryDisabled, t)!,
      primaryFocus: Color.lerp(primaryFocus, other.primaryFocus, t)!,
      primaryActive: Color.lerp(primaryActive, other.primaryActive, t)!,
      success: Color.lerp(success, other.success, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      successDisabled: Color.lerp(successDisabled, other.successDisabled, t)!,
      successFocus: Color.lerp(successFocus, other.successFocus, t)!,
      successActive: Color.lerp(successActive, other.successActive, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningLight: Color.lerp(warningLight, other.warningLight, t)!,
      warningDisabled: Color.lerp(warningDisabled, other.warningDisabled, t)!,
      warningFocus: Color.lerp(warningFocus, other.warningFocus, t)!,
      warningActive: Color.lerp(warningActive, other.warningActive, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorLight: Color.lerp(errorLight, other.errorLight, t)!,
      errorDisabled: Color.lerp(errorDisabled, other.errorDisabled, t)!,
      errorFocus: Color.lerp(errorFocus, other.errorFocus, t)!,
      errorActive: Color.lerp(errorActive, other.errorActive, t)!,
      backgroundPage: Color.lerp(backgroundPage, other.backgroundPage, t)!,
      backgroundContainer: Color.lerp(
        backgroundContainer,
        other.backgroundContainer,
        t,
      )!,
      backgroundContainerActive: Color.lerp(
        backgroundContainerActive,
        other.backgroundContainerActive,
        t,
      )!,
      backgroundSecondaryContainer: Color.lerp(
        backgroundSecondaryContainer,
        other.backgroundSecondaryContainer,
        t,
      )!,
      backgroundSecondaryContainerActive: Color.lerp(
        backgroundSecondaryContainerActive,
        other.backgroundSecondaryContainerActive,
        t,
      )!,
      backgroundComponent: Color.lerp(
        backgroundComponent,
        other.backgroundComponent,
        t,
      )!,
      backgroundComponentActive: Color.lerp(
        backgroundComponentActive,
        other.backgroundComponentActive,
        t,
      )!,
      backgroundComponentDisabled: Color.lerp(
        backgroundComponentDisabled,
        other.backgroundComponentDisabled,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textPlaceholder: Color.lerp(textPlaceholder, other.textPlaceholder, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textAnti: Color.lerp(textAnti, other.textAnti, t)!,
      textBrand: Color.lerp(textBrand, other.textBrand, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,
      borderLevel1: Color.lerp(borderLevel1, other.borderLevel1, t)!,
      borderLevel2: Color.lerp(borderLevel2, other.borderLevel2, t)!,
      fontDisplayLarge: t < 0.5 ? fontDisplayLarge : other.fontDisplayLarge,
      fontDisplayMedium: t < 0.5 ? fontDisplayMedium : other.fontDisplayMedium,
      fontHeadlineLarge: t < 0.5 ? fontHeadlineLarge : other.fontHeadlineLarge,
      fontHeadlineMedium: t < 0.5
          ? fontHeadlineMedium
          : other.fontHeadlineMedium,
      fontHeadlineSmall: t < 0.5 ? fontHeadlineSmall : other.fontHeadlineSmall,
      fontTitleExtraLarge: t < 0.5
          ? fontTitleExtraLarge
          : other.fontTitleExtraLarge,
      fontTitleLarge: t < 0.5 ? fontTitleLarge : other.fontTitleLarge,
      fontTitleMedium: t < 0.5 ? fontTitleMedium : other.fontTitleMedium,
      fontTitleSmall: t < 0.5 ? fontTitleSmall : other.fontTitleSmall,
      fontBodyExtraLarge: t < 0.5
          ? fontBodyExtraLarge
          : other.fontBodyExtraLarge,
      fontBodyLarge: t < 0.5 ? fontBodyLarge : other.fontBodyLarge,
      fontBodyMedium: t < 0.5 ? fontBodyMedium : other.fontBodyMedium,
      fontBodySmall: t < 0.5 ? fontBodySmall : other.fontBodySmall,
      fontBodyExtraSmall: t < 0.5
          ? fontBodyExtraSmall
          : other.fontBodyExtraSmall,
      fontMarkLarge: t < 0.5 ? fontMarkLarge : other.fontMarkLarge,
      fontMarkMedium: t < 0.5 ? fontMarkMedium : other.fontMarkMedium,
      fontMarkSmall: t < 0.5 ? fontMarkSmall : other.fontMarkSmall,
      fontMarkExtraSmall: t < 0.5
          ? fontMarkExtraSmall
          : other.fontMarkExtraSmall,
      fontLinkLarge: t < 0.5 ? fontLinkLarge : other.fontLinkLarge,
      fontLinkMedium: t < 0.5 ? fontLinkMedium : other.fontLinkMedium,
      fontLinkSmall: t < 0.5 ? fontLinkSmall : other.fontLinkSmall,
      fontWeightRegular: t < 0.5 ? fontWeightRegular : other.fontWeightRegular,
      fontWeightMedium: t < 0.5 ? fontWeightMedium : other.fontWeightMedium,
      fontWeightBold: t < 0.5 ? fontWeightBold : other.fontWeightBold,
    );
  }
}
