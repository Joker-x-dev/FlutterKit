import 'package:flutter/material.dart';

import 'adaptive_config.dart';

/// BuildContext 断点适配扩展
///
/// 提供基于屏幕宽度的断点适配 API：
/// - [currentBreakpoint] 获取当前断点
/// - [isXS] / [isSM] / [isMD] / [isLG] 断点判断
/// - [bp] / [bpByOptions] 按断点取值并支持相邻断点回退兜底
extension AdaptiveExtension on BuildContext {
  /// 当前断点
  BreakpointType get currentBreakpoint {
    return BreakpointType.fromWidth(MediaQuery.sizeOf(this).width);
  }

  /// 是否为超小断点
  bool get isXS => currentBreakpoint == BreakpointType.xs;

  /// 是否为小断点
  bool get isSM => currentBreakpoint == BreakpointType.sm;

  /// 是否为中断点
  bool get isMD => currentBreakpoint == BreakpointType.md;

  /// 是否为大断点
  bool get isLG => currentBreakpoint == BreakpointType.lg;

  /// 根据断点返回适配值
  ///
  /// [xs] / [sm] / [md] / [lg] 分别对应四个断点的取值。
  /// [defaultValue] 为兜底默认值；若未提供且全部断点值为空，则抛出异常。
  ///
  /// 取值优先级：
  /// 1. 当前断点值
  /// 2. 向更小的断点回退
  /// 3. 向更大的断点回退
  /// 4. [defaultValue]
  /// 5. 首个非空断点值
  T bp<T>({T? xs, T? sm, T? md, T? lg, T? defaultValue}) {
    return currentBreakpoint.bp(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      defaultValue: defaultValue,
    );
  }

  /// 根据 [BreakpointValueOptions] 返回适配值
  ///
  /// [options] 断点值配置
  /// [defaultValue] 兜底默认值
  T bpByOptions<T>(BreakpointValueOptions<T> options, {T? defaultValue}) {
    return _resolveBreakpointValue(
      options,
      currentBreakpoint,
      defaultValue: defaultValue,
    );
  }
}

/// 断点值解析扩展
///
/// 支持根据指定断点解析响应式值，适用于 [LayoutBuilder] 的局部约束场景。
extension BreakpointValueExtension on BreakpointType {
  /// 根据当前断点返回适配值
  ///
  /// [xs] / [sm] / [md] / [lg] 分别对应四个断点的取值。
  /// [defaultValue] 为兜底默认值；若全部取值为空则抛出异常。
  T bp<T>({T? xs, T? sm, T? md, T? lg, T? defaultValue}) {
    return _resolveBreakpointValue(
      BreakpointValueOptions(xs: xs, sm: sm, md: md, lg: lg),
      this,
      defaultValue: defaultValue,
    );
  }
}

/// 解析断点值
///
/// 按相邻断点回退取值：当前断点 → 更小断点 → 更大断点 → 默认值 → 首个非空值。
T _resolveBreakpointValue<T>(
  BreakpointValueOptions<T> options,
  BreakpointType current, {
  T? defaultValue,
}) {
  final values = [options.xs, options.sm, options.md, options.lg];
  final index = BreakpointType.order.indexOf(current);

  // 当前断点值
  if (index >= 0 && values[index] != null) {
    return values[index] as T;
  }

  // 向更小的断点回退
  for (var i = index - 1; i >= 0; i--) {
    if (values[i] != null) {
      return values[i] as T;
    }
  }

  // 向更大的断点回退
  for (var i = index + 1; i < values.length; i++) {
    if (values[i] != null) {
      return values[i] as T;
    }
  }

  // 兜底默认值
  if (defaultValue != null) {
    return defaultValue;
  }

  // 首个非空断点值
  final firstValue = values.firstWhere(
    (value) => value != null,
    orElse: () => null,
  );
  if (firstValue != null) {
    return firstValue as T;
  }

  throw ArgumentError('BreakpointValueOptions 不能为空，请至少提供一个断点值。');
}
