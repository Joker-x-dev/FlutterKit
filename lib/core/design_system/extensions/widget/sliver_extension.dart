import 'package:flutter/material.dart';

/// Sliver 子组件包装扩展。
///
/// 仅提供将当前 Widget 直接作为 child 或 sliver 的标准包装。
extension SliverExtension on Widget {
  /// 将普通 Box Widget 转换为 Sliver。
  ///
  /// [key] Sliver 标识。
  Widget sliverToBoxAdapter({Key? key}) {
    return SliverToBoxAdapter(key: key, child: this);
  }

  /// 为当前 Sliver 添加内边距。
  ///
  /// [padding] Sliver 四周的内边距。
  /// [key] Sliver 标识。
  Widget sliverPadding(EdgeInsetsGeometry padding, {Key? key}) {
    return SliverPadding(key: key, padding: padding, sliver: this);
  }

  /// 吸收当前 Sliver 产生的重叠区域。
  ///
  /// [handle] 记录重叠范围的共享句柄。
  /// [key] Sliver 标识。
  Widget sliverOverlapAbsorber({
    Key? key,
    required SliverOverlapAbsorberHandle handle,
  }) {
    return SliverOverlapAbsorber(key: key, handle: handle, sliver: this);
  }
}
