import 'package:flutter/material.dart';

/// Widget 状态保存扩展
/// 提供链式调用的状态保存功能
extension KeepAliveExtension on Widget {
  /// 状态保存包装
  ///
  /// [keepAlive] 是否保持状态存活，默认为 true
  ///
  /// 当设置为 true 时，Widget 在滚动出视野后仍会保持状态，
  /// 避免重新构建时丢失数据或重置状态。
  ///
  /// 示例:
  /// ```dart
  /// // 基本用法 - 保持状态
  /// Container(
  ///   child: Text('保持状态的内容'),
  /// ).keepAlive()
  ///
  /// // 条件保持状态
  /// ListView.builder(
  ///   itemBuilder: (context, index) {
  ///     return ExpensiveWidget().keepAlive(index < 10);
  ///   },
  /// )
  /// ```
  ///
  /// 注意:
  /// - 只在需要保持状态的场景下使用，避免内存浪费
  /// - 常用于 TabBarView、PageView、ListView 等可滚动组件中
  /// - 适用于表单输入、视频播放、复杂状态管理等场景
  Widget keepAlive([bool keepAlive = true]) {
    return KeepAliveWrapper(keepAlive: keepAlive, child: this);
  }
}

/// 状态保存
class KeepAliveWrapper extends StatefulWidget {
  /// 参数[child]不能为null
  /// 如果需要[keepAlive]，设为true
  const KeepAliveWrapper({
    super.key,
    required this.child,
    this.keepAlive = true,
  });

  /// 需要保持状态的子组件
  final Widget child;

  /// 是否保持子组件状态存活
  final bool keepAlive;

  /// 创建状态保存包装器状态
  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

/// 状态保存包装器状态
class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  /// 构建保持状态的子组件
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  /// 当前组件是否需要保持状态存活
  @override
  bool get wantKeepAlive => widget.keepAlive;
}
