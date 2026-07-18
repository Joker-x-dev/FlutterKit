/// 屏幕断点配置
///
/// 定义 XS / SM / MD / LG 四种断点类型及按宽度解析规则，
/// 断点阈值为 320 / 600 / 840 dp。
library;

/// 断点类型
enum BreakpointType {
  /// 超小断点
  xs,

  /// 小断点
  sm,

  /// 中断点
  md,

  /// 大断点
  lg;

  /// 断点顺序，用于按相邻断点回退取值
  static const List<BreakpointType> order = [xs, sm, md, lg];

  /// 根据屏幕宽度解析当前断点
  ///
  /// [width] 屏幕逻辑宽度，单位为 dp
  ///
  /// 返回对应的 [BreakpointType]
  static BreakpointType fromWidth(double width) {
    if (width < 320) {
      return xs;
    }
    if (width < 600) {
      return sm;
    }
    if (width < 840) {
      return md;
    }
    return lg;
  }
}

/// 断点值配置
///
/// 为不同断点分别设置同一语义下的取值，配合 [AdaptiveExtension.bp] 使用。
class BreakpointValueOptions<T> {
  /// 超小断点值
  final T? xs;

  /// 小断点值
  final T? sm;

  /// 中断点值
  final T? md;

  /// 大断点值
  final T? lg;

  /// 创建断点值配置
  ///
  /// [xs] 可选超小断点值。
  /// [sm] 可选小断点值。
  /// [md] 可选中断点值。
  /// [lg] 可选大断点值。
  const BreakpointValueOptions({this.xs, this.sm, this.md, this.lg});
}
