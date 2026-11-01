import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/app_theme.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';

/// 仿原生双圆弧下拉刷新球。
///
/// 下拉阶段由进度控制弧长与旋转角度，刷新阶段保持同一图形连续旋转并
/// 往返收缩弧长，避免刷新状态切换时改变视觉语言。
class NestedScrollRefreshBall extends StatefulWidget {
  /// 创建双圆弧下拉刷新球。
  ///
  /// [progress] 下拉进度，取值范围为 0 到 1。
  /// [isProcessing] 是否正在执行刷新。
  /// [color] 圆弧颜色。
  /// [strokeWidth] 圆弧线宽。
  const NestedScrollRefreshBall({
    super.key,
    required this.progress,
    required this.isProcessing,
    required this.color,
    required this.strokeWidth,
  });

  /// 下拉进度。
  final double progress;

  /// 是否正在执行刷新。
  final bool isProcessing;

  /// 圆弧颜色。
  final Color color;

  /// 圆弧线宽。
  final double strokeWidth;

  /// 创建刷新球动画状态。
  @override
  State<NestedScrollRefreshBall> createState() =>
      _NestedScrollRefreshBallState();
}

/// 双圆弧刷新球动画状态。
class _NestedScrollRefreshBallState extends State<NestedScrollRefreshBall>
    with SingleTickerProviderStateMixin {
  /// 完整往返收缩周期。
  static const Duration _animationDuration = Duration(seconds: 1);

  /// 刷新阶段无限动画控制器。
  late final AnimationController _controller;

  /// 初始化刷新阶段动画。
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    if (widget.isProcessing) {
      _startProcessingAnimation();
    }
  }

  /// 根据刷新状态变化启停无限动画。
  ///
  /// [oldWidget] 上一次刷新球配置。
  @override
  void didUpdateWidget(covariant NestedScrollRefreshBall oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isProcessing == oldWidget.isProcessing) {
      return;
    }
    if (widget.isProcessing) {
      _startProcessingAnimation();
    } else {
      _controller.stop();
    }
  }

  /// 释放刷新阶段动画控制器。
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 构建下拉进度或刷新循环对应的双圆弧。
  @override
  Widget build(BuildContext context) {
    return _controller.animatedBuilder(
      builder: (BuildContext context, Widget? child) {
        final double animationValue = _controller.value;
        final double progress = widget.isProcessing
            ? (animationValue * 2 - 1).abs()
            : widget.progress.clamp(0, 1);
        final double rotation = widget.isProcessing
            ? animationValue * math.pi * 4
            : progress * math.pi * 2;
        return CustomPaint(
          painter: _NestedScrollRefreshBallPainter(
            progress: progress,
            rotation: rotation,
            color: widget.color,
            strokeWidth: widget.strokeWidth,
          ),
        );
      },
    );
  }

  /// 从完整圆弧开始刷新阶段的循环动画。
  void _startProcessingAnimation() {
    _controller
      ..value = 0
      ..repeat();
  }
}

/// 双圆弧刷新球绘制器。
class _NestedScrollRefreshBallPainter extends CustomPainter {
  /// 创建双圆弧刷新球绘制器。
  ///
  /// [progress] 当前弧长进度。
  /// [rotation] 当前旋转弧度。
  /// [color] 圆弧颜色。
  /// [strokeWidth] 圆弧线宽。
  const _NestedScrollRefreshBallPainter({
    required this.progress,
    required this.rotation,
    required this.color,
    required this.strokeWidth,
  });

  /// 当前弧长进度。
  final double progress;

  /// 当前旋转弧度。
  final double rotation;

  /// 圆弧颜色。
  final Color color;

  /// 圆弧线宽。
  final double strokeWidth;

  /// 绘制两个相隔四十度的圆头圆弧。
  ///
  /// [canvas] 目标画布。
  /// [size] 可用绘制尺寸。
  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double radius = math.max(
      0,
      math.min(size.width, size.height) / 2 - strokeWidth,
    );
    final Rect bounds = Rect.fromCircle(center: center, radius: radius);
    final Paint arcPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final double sweepAngle = _degreesToRadians(140) * progress;

    canvas
      ..save()
      ..translate(center.dx, center.dy)
      ..rotate(rotation)
      ..translate(-center.dx, -center.dy)
      ..drawArc(bounds, _degreesToRadians(-160), sweepAngle, false, arcPaint)
      ..drawArc(bounds, _degreesToRadians(20), sweepAngle, false, arcPaint)
      ..restore();
  }

  /// 判断刷新球参数变化时是否需要重新绘制。
  ///
  /// [oldDelegate] 上一次绘制参数。
  @override
  bool shouldRepaint(covariant _NestedScrollRefreshBallPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.rotation != rotation ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }

  /// 将角度转换为弧度。
  ///
  /// [degrees] 角度值。
  double _degreesToRadians(double degrees) => degrees * math.pi / 180;
}

/// 双圆弧下拉刷新球组件预览。
@WidgetPreview()
Widget previewNestedScrollRefreshBall() {
  return Builder(
    builder: (BuildContext context) {
      return NestedScrollRefreshBall(
        progress: 0.72,
        isProcessing: false,
        color: appTheme.textSecondary,
        strokeWidth: spaceIndicator + spaceDivider * 2,
      ).square(spacer24 + spacer4);
    },
  );
}
