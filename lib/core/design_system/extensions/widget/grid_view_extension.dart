import 'package:flutter/material.dart';

/// List 的 GridView 扩展
///
/// 提供基于数据源和固定列数的响应式网格构建能力。
extension DataGridViewExtension<T> on List<T> {
  /// 将数据列表转换为固定列数的 GridView
  ///
  /// [crossAxisCount] 交叉轴列数。
  /// [itemBuilder] 网格子项构建器。
  /// [mainAxisSpacing] 主轴间距。
  /// [crossAxisSpacing] 交叉轴间距。
  /// [childAspectRatio] 子项宽高比。
  /// [mainAxisExtent] 子项主轴尺寸；设置后忽略 [childAspectRatio]。
  /// [padding] 网格内边距。
  /// [physics] 滚动物理效果；为空时遵循当前平台默认行为。
  /// [shrinkWrap] 是否按内容收缩。
  /// [primary] 是否作为主滚动视图。
  /// [scrollDirection] 滚动方向。
  /// [controller] 滚动控制器。
  /// [reverse] 是否反向滚动。
  /// [keyboardDismissBehavior] 键盘收起行为。
  /// [clipBehavior] 裁剪行为。
  ///
  /// 返回按数据源懒加载的 GridView。
  Widget toGridView({
    required int crossAxisCount,
    required Widget Function(BuildContext context, int index, T item)
    itemBuilder,
    double mainAxisSpacing = 0,
    double crossAxisSpacing = 0,
    double childAspectRatio = 1,
    double? mainAxisExtent,
    EdgeInsetsGeometry? padding,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    bool? primary,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    bool reverse = false,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return GridView.builder(
      itemCount: length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: (context, index) => itemBuilder(context, index, this[index]),
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkWrap,
      primary: primary,
      scrollDirection: scrollDirection,
      controller: controller,
      reverse: reverse,
      keyboardDismissBehavior: keyboardDismissBehavior,
      clipBehavior: clipBehavior,
    );
  }
}
