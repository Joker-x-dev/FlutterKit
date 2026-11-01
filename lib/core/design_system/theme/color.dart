import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 当前 GetX 构建上下文
BuildContext get _context => Get.context!;

//====================主色====================
/// 品牌主色，用于主要按钮、主要图标、重点文字等
Color get primary => _context.tTheme.brandColor7;

/// 品牌浅色，用于主色浅色背景、hover状态等
Color get primaryLight => _context.tTheme.brandColor1;

/// 品牌深色，用于主色深色背景、点击状态等
Color get primaryDark => _context.tTheme.brandColor8;

/// 品牌禁用色，用于禁用状态的主色按钮等元素
Color get primaryDisabled => _context.tTheme.brandColor3;

/// 品牌聚焦色，用于聚焦状态交互
Color get primaryFocus => _context.tTheme.brandColor2;

/// 品牌激活色，用于点击状态
Color get primaryActive => _context.tTheme.brandColor8;

//====================成功色====================
/// 成功色，用于成功状态、完成状态的按钮、图标和文字
Color get success => _context.tTheme.successColor5;

/// 成功浅色，用于成功状态的背景色
Color get successLight => _context.tTheme.successColor1;

/// 成功禁用色，用于禁用状态的成功色按钮等元素
Color get successDisabled => _context.tTheme.successColor3;

/// 成功聚焦色，用于成功元素的聚焦状态
Color get successFocus => _context.tTheme.successColor2;

/// 成功激活色，用于成功元素的点击状态
Color get successActive => _context.tTheme.successColor6;

//====================警告色====================
/// 警告色，用于警告状态、需要注意的按钮、图标和文字
Color get warning => _context.tTheme.warningColor5;

/// 警告浅色，用于警告状态的背景色
Color get warningLight => _context.tTheme.warningColor1;

/// 警告禁用色，用于禁用状态的警告色按钮等元素
Color get warningDisabled => _context.tTheme.warningColor3;

/// 警告聚焦色，用于警告元素的聚焦状态
Color get warningFocus => _context.tTheme.warningColor2;

/// 警告激活色，用于警告元素的点击状态
Color get warningActive => _context.tTheme.warningColor6;

//====================错误色====================
/// 错误色，用于错误状态、失败状态的按钮、图标和文字
Color get error => _context.tTheme.errorColor6;

/// 错误浅色，用于错误状态的背景色
Color get errorLight => _context.tTheme.errorColor1;

/// 错误禁用色，用于禁用状态的错误色按钮等元素
Color get errorDisabled => _context.tTheme.errorColor3;

/// 错误聚焦色，用于错误元素的聚焦状态
Color get errorFocus => _context.tTheme.errorColor2;

/// 错误激活色，用于错误元素的点击状态
Color get errorActive => _context.tTheme.errorColor7;

//====================背景色====================
/// 页面整体背景色(白色)
Color get backgroundPage => _context.tTheme.grayColor2;

/// 一级容器背景色，用于卡片、弹窗等容器背景
Color get backgroundContainer => _context.tTheme.whiteColor1;

/// 一级容器激活态背景色
Color get backgroundContainerActive => _context.tTheme.grayColor3;

/// 二级容器背景色，用于次级区域背景 (灰色) 配合卡片使用
Color get backgroundSecondaryContainer => _context.tTheme.grayColor1;

/// 二级容器激活态背景色
Color get backgroundSecondaryContainerActive => _context.tTheme.grayColor4;

/// 组件背景色，用于默认状态的组件背景
Color get backgroundComponent => _context.tTheme.grayColor3;

/// 组件激活态背景色，用于按钮等组件激活状态
Color get backgroundComponentActive => _context.tTheme.grayColor6;

/// 组件禁用态背景色，用于禁用状态的组件背景
Color get backgroundComponentDisabled => _context.tTheme.grayColor2;

//====================文本色====================
/// 主要文本颜色，用于重要级文字信息、标题
Color get textPrimary => _context.tTheme.fontGray1;

/// 次要文本颜色，用于次级文字信息
Color get textSecondary => _context.tTheme.fontGray2;

/// 占位文本颜色，用于占位符、输入框提示等
Color get textPlaceholder => _context.tTheme.fontGray3;

/// 禁用文本颜色，用于禁用状态的文字
Color get textDisabled => _context.tTheme.fontGray4;

/// 反色文本，用于深色背景上的文字
Color get textAnti => _context.tTheme.whiteColor1;

/// 品牌色文本，用于链接、强调文字
Color get textBrand => _context.tTheme.brandColor7;

/// 链接文本颜色，用于链接文字
Color get textLink => _context.tTheme.brandColor8;

//====================边框色====================
/// 一级边框颜色，用于分割线、边框等
Color get borderLevel1 => _context.tTheme.grayColor3;

/// 二级边框颜色，用于较深的分割线、边框等
Color get borderLevel2 => _context.tTheme.grayColor4;
