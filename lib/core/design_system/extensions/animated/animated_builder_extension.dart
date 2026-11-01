import 'package:flutter/material.dart';

/// [Listenable] 动画构建扩展。
///
/// 保留 [AnimatedBuilder] 的监听、子组件缓存和重建语义，同时提供统一的
/// 链式调用入口。
extension ListenableAnimatedBuilderExtension on Listenable {
  /// 监听当前对象并构建动画内容。
  ///
  /// [key] 动画构建器标识。
  /// [child] 不随监听值变化的缓存子组件。
  /// [builder] 根据监听值构建界面的回调。
  Widget animatedBuilder({
    Key? key,
    Widget? child,
    required TransitionBuilder builder,
  }) {
    return AnimatedBuilder(
      key: key,
      animation: this,
      builder: builder,
      child: child,
    );
  }
}
