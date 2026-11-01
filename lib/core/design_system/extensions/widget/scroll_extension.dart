import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'
    show ScrollCacheExtent, SliverPaintOrder;

/// Widget 滚动扩展
///
/// 提供各种滚动相关的扩展方法，包括：
/// - 基础滚动配置
/// - 不同滚动物理效果
/// - 滚动控制器设置
/// - 自定义滚动配置
extension ScrollExtension on Widget {
  /// 基础滚动容器
  ///
  /// [scrollDirection] 滚动方向，默认为垂直滚动
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [physics] 滚动物理效果
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// Column(children: widgets).scrollable();
  /// ```
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  /// 垂直滚动
  ///
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [physics] 滚动物理效果
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// Column(children: widgets).verticalScroll();
  /// ```
  Widget verticalScroll({
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: .vertical,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  /// 水平滚动
  ///
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [physics] 滚动物理效果
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// Row(children: widgets).horizontalScroll();
  /// ```
  Widget horizontalScroll({
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  /// 设置滚动物理效果
  ///
  /// [physics] 滚动物理效果
  /// [scrollDirection] 滚动方向，默认为垂直滚动
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// Column(children: widgets).scrollPhysics(BouncingScrollPhysics());
  /// ```
  Widget scrollPhysics(
    ScrollPhysics physics, {
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  /// 设置滚动控制器
  ///
  /// [controller] 滚动控制器
  /// [scrollDirection] 滚动方向，默认为垂直滚动
  /// [reverse] 是否反向滚动，默认为 false
  /// [primary] 是否为主滚动视图
  /// [physics] 滚动物理效果
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// final controller = ScrollController();
  /// Column(children: widgets).scrollController(controller);
  /// ```
  Widget scrollController(
    ScrollController controller, {
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      child: this,
    );
  }

  /// 弹性滚动效果（iOS 风格）
  ///
  /// [scrollDirection] 滚动方向，默认为垂直滚动
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// Column(children: widgets).bouncingScroll();
  /// ```
  Widget bouncingScroll({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: const BouncingScrollPhysics(),
      padding: padding,
      child: this,
    );
  }

  /// 夹紧滚动效果（Android 风格）
  ///
  /// [scrollDirection] 滚动方向，默认为垂直滚动
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// Column(children: widgets).clampingScroll();
  /// ```
  Widget clampingScroll({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: const ClampingScrollPhysics(),
      padding: padding,
      child: this,
    );
  }

  /// 永不滚动效果
  ///
  /// [scrollDirection] 滚动方向，默认为垂直滚动
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [shrinkWrap] 是否根据内容调整大小，默认为 false
  /// [padding] 内边距
  ///
  /// 示例:
  /// ```dart
  /// Column(children: widgets).neverScroll();
  /// ```
  Widget neverScroll({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      child: this,
    );
  }

  /// 单子组件滚动视图
  ///
  /// 提供完整的单子组件滚动配置选项
  ///
  /// [scrollDirection] 滚动方向，默认为垂直滚动
  /// [reverse] 是否反向滚动，默认为 false
  /// [controller] 滚动控制器
  /// [primary] 是否为主滚动视图
  /// [physics] 滚动物理效果
  /// [padding] 内边距
  /// [dragStartBehavior] 拖拽开始行为
  /// [clipBehavior] 裁剪行为
  /// [restorationId] 恢复 ID
  /// [keyboardDismissBehavior] 键盘消失行为
  ///
  /// 示例:
  /// ```dart
  /// Column(children: widgets).singleScroll(
  ///   physics: BouncingScrollPhysics(),
  ///   padding: EdgeInsets.all(16),
  ///   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
  /// );
  /// ```
  Widget singleScroll({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      padding: padding,
      dragStartBehavior: dragStartBehavior,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      keyboardDismissBehavior: keyboardDismissBehavior,
      child: this,
    );
  }

  /// 嵌套滚动视图
  ///
  /// 当前 Widget 作为 [NestedScrollView] 的 [NestedScrollView.body]。
  ///
  /// [key] 嵌套滚动视图标识。
  /// [controller] 外层滚动控制器。
  /// [scrollDirection] 外层滚动方向。
  /// [reverse] 是否反向滚动。
  /// [physics] 外层滚动物理效果。
  /// [headerSliverBuilder] 外层头部 Sliver 构建器。
  /// [dragStartBehavior] 拖拽开始行为。
  /// [floatHeaderSlivers] 是否优先展开浮动头部。
  /// [clipBehavior] 视口裁剪行为。
  /// [hitTestBehavior] 视口命中测试行为。
  /// [restorationId] 滚动位置恢复标识。
  /// [scrollBehavior] 滚动交互行为。
  ///
  /// 示例:
  /// ```dart
  /// const TabBarView(children: pages).nestedScroll(
  ///   headerSliverBuilder: (context, innerBoxIsScrolled) => headers,
  /// );
  /// ```
  Widget nestedScroll({
    Key? key,
    ScrollController? controller,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollPhysics? physics,
    required NestedScrollViewHeaderSliversBuilder headerSliverBuilder,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool floatHeaderSlivers = false,
    Clip clipBehavior = Clip.hardEdge,
    HitTestBehavior hitTestBehavior = HitTestBehavior.opaque,
    String? restorationId,
    ScrollBehavior? scrollBehavior,
  }) {
    return NestedScrollView(
      key: key,
      controller: controller,
      scrollDirection: scrollDirection,
      reverse: reverse,
      physics: physics,
      headerSliverBuilder: headerSliverBuilder,
      body: this,
      dragStartBehavior: dragStartBehavior,
      floatHeaderSlivers: floatHeaderSlivers,
      clipBehavior: clipBehavior,
      hitTestBehavior: hitTestBehavior,
      restorationId: restorationId,
      scrollBehavior: scrollBehavior,
    );
  }
}

/// Sliver 列表自定义滚动扩展。
extension CustomScrollExtension on List<Widget> {
  /// 构建真正的自定义 Sliver 滚动视图。
  ///
  /// [key] 滚动视图标识。
  /// [scrollDirection] 滚动方向。
  /// [reverse] 是否反向滚动。
  /// [controller] 滚动控制器。
  /// [primary] 是否使用主滚动控制器。
  /// [physics] 滚动物理效果。
  /// [scrollBehavior] 滚动交互行为。
  /// [shrinkWrap] 是否根据 Sliver 内容收缩尺寸。
  /// [center] 作为零滚动偏移中心的 Sliver 标识。
  /// [anchor] 零滚动偏移在视口中的相对位置。
  /// [scrollCacheExtent] 视口前后缓存区域长度。
  /// [paintOrder] Sliver 绘制顺序。
  /// [semanticChildCount] 参与无障碍语义的子项数量。
  /// [dragStartBehavior] 拖拽开始行为。
  /// [keyboardDismissBehavior] 滚动时的键盘收起行为。
  /// [restorationId] 滚动位置恢复标识。
  /// [clipBehavior] 视口裁剪行为。
  /// [hitTestBehavior] 视口命中测试行为。
  ///
  /// 示例:
  /// ```dart
  /// <Widget>[
  ///   const SliverToBoxAdapter(child: Text('标题')),
  ///   SliverList(delegate: delegate),
  /// ].customScroll(
  ///   physics: const BouncingScrollPhysics(),
  /// );
  /// ```
  Widget customScroll({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    ScrollBehavior? scrollBehavior,
    bool shrinkWrap = false,
    Key? center,
    double anchor = 0,
    ScrollCacheExtent? scrollCacheExtent,
    SliverPaintOrder paintOrder = SliverPaintOrder.firstIsTop,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
    HitTestBehavior hitTestBehavior = HitTestBehavior.opaque,
  }) {
    return CustomScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      scrollBehavior: scrollBehavior,
      shrinkWrap: shrinkWrap,
      center: center,
      anchor: anchor,
      scrollCacheExtent: scrollCacheExtent,
      paintOrder: paintOrder,
      slivers: this,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
      hitTestBehavior: hitTestBehavior,
    );
  }
}
