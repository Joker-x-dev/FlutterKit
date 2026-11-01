import 'package:get/get.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../design_system/theme/app_theme.dart';

/// 基础页面
///
/// 统一提供 Logic 注入、主题访问、导航栏和 Scaffold 页面结构。
abstract class BaseView<T> extends GetView<T> {
  /// 创建基础页面
  ///
  /// [logic] 外部注入的 Logic；为空时通过 GetX 获取已注册实例。
  const BaseView({super.key, T? logic}) : _injectedLogic = logic;

  /// 外部注入的 Logic
  final T? _injectedLogic;

  /// 当前页面 GetX Controller
  @override
  T get controller => _injectedLogic ?? super.controller;

  /// 当前页面 Logic
  T get logic => controller;

  /// 设置标题文字
  final String? navTitle = null;

  /// 是否显示导航栏返回按钮
  final bool navBackBtn = true;

  /// 导航栏高度
  final double navHeight = 44;

  /// 导航栏底部的widget
  final Widget? navBottomWidget = null;

  /// 设置右边按钮数组
  final List<TNavBarItem>? rightBarItems = null;

  /// 是否隐藏导航栏
  final bool isHiddenNav = false;

  /// 使用默认返回按钮
  final bool useDefaultBack = true;

  /// appbar塌陷
  final bool extendBodyBehindAppBar = false;

  /// 输入框推动页面
  final bool resizeToAvoidBottomInset = true;

  /// 背景颜色
  final Color? backgroundColor = null;

  /// 是否保存当前页面状态
  bool get keepAlive => false;

  /// 导航栏 子类可根据需求重写
  ///
  /// 底部区域构建在 [TNavBar] 之外：1.1.0 移除了 per-instance 的 padding 参数，
  /// belowTitleWidget 会落在 [TNavBarThemeData.padding] 内，下拉筛选栏与 TabBar
  /// 因此比遮罩窄一条边距。
  PreferredSizeWidget? head() {
    if (isHiddenNav) return null;
    return PreferredSize(
      preferredSize: Size.fromHeight(navHeight),
      child: Builder(
        builder: (BuildContext context) {
          final double safeTop = MediaQuery.paddingOf(context).top;
          return <Widget>[
                TNavBar(
                  title: TText(navTitle ?? ''),
                  height: navHeight,
                  useDefaultBack: navBackBtn && useDefaultBack,
                  useSafeArea: true,
                  actions: rightBarItems,
                ).expanded(),
                ?navBottomWidget,
              ]
              .toColumn(crossAxisAlignment: .stretch)
              .tight(height: safeTop + navHeight);
        },
      ),
    );
  }

  /// 设置主视图内容 (子类必须实现)
  Widget body();

  /// 底部导航栏内容 子类可根据需求重写
  Widget? bottom() => null;

  /// 右下角的悬浮操作按钮
  Widget? floatingAction() => null;

  /// 底部导航区域背景颜色
  ///
  /// 默认使用容器背景色，确保底部安全区与导航组件颜色一致。
  Color get bottomBackgroundColor => appTheme.backgroundContainer;

  /// 构建基础页面结构
  ///
  /// [context] 当前构建上下文。
  ///
  /// 返回包含导航栏、页面内容、底部区域和悬浮按钮的 Scaffold。
  @override
  Widget build(BuildContext context) {
    // 注册 Theme 依赖，深浅模式变化时重新构建页面并刷新语义颜色
    AppTheme.of(context);
    final bottomWidget = bottom();
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      appBar: head(),
      body: keepAlive ? body().keepAlive() : body(),
      bottomNavigationBar: bottomWidget?.backgroundColor(bottomBackgroundColor),
      floatingActionButton: floatingAction(),
    );
  }
}
