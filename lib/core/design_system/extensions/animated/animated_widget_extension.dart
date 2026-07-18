import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui';

/// Widget 动画扩展
///
/// 提供便捷的 Widget 动画设置方法，支持装饰、约束、变换等属性的动画过渡
extension AnimatedWidgetExtension on Widget {
  /// 设置动画配置
  ///
  /// [duration] - 动画持续时间
  /// [curve] - 动画曲线
  ///
  /// 示例：
  /// ```dart
  /// Container(
  ///   width: 100,
  ///   height: 100,
  ///   color: Colors.blue,
  /// ).animate(
  ///   duration: Duration(milliseconds: 500),
  ///   curve: Curves.easeInOut,
  /// )
  /// ```
  Widget animate({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.linear,
  }) {
    return _StyledInheritedAnimation(
      animation: _StyledAnimatedModel(duration: duration, curve: curve),
      child: this,
    );
  }

  /// 设置动画装饰
  ///
  /// [decoration] - 装饰对象
  /// [position] - 装饰位置
  ///
  /// 示例：
  /// ```dart
  /// Text('Hello').animatedDecoration(
  ///   BoxDecoration(
  ///     color: Colors.red,
  ///     borderRadius: BorderRadius.circular(8),
  ///   ),
  /// ).animate(duration: Duration(milliseconds: 300))
  /// ```
  Widget animatedDecoration(
    Decoration decoration, {
    DecorationPosition position = DecorationPosition.background,
  }) {
    return _StyledAnimatedBuilder(
      builder: (animation) => _AnimatedDecorationBox(
        decoration: decoration,
        position: position,
        duration: animation.duration,
        curve: animation.curve,
        child: this,
      ),
    );
  }

  /// 设置动画约束
  ///
  /// [constraints] - 约束对象
  ///
  /// 示例：
  /// ```dart
  /// Text('Hello').animatedConstraints(
  ///   BoxConstraints(
  ///     minWidth: 100,
  ///     maxWidth: 200,
  ///     minHeight: 50,
  ///     maxHeight: 100,
  ///   ),
  /// ).animate(duration: Duration(milliseconds: 400))
  /// ```
  Widget animatedConstraints(BoxConstraints constraints) {
    return _StyledAnimatedBuilder(
      builder: (animation) => _AnimatedConstrainedBox(
        constraints: constraints,
        duration: animation.duration,
        curve: animation.curve,
        child: this,
      ),
    );
  }

  /// 设置动画变换
  ///
  /// [transform] - 变换矩阵
  /// [alignment] - 变换对齐方式
  /// [origin] - 变换原点
  ///
  /// 示例：
  /// ```dart
  /// Container(
  ///   width: 100,
  ///   height: 100,
  ///   color: Colors.green,
  /// ).animatedTransform(
  ///   Matrix4.rotationZ(0.5),
  ///   alignment: Alignment.center,
  /// ).animate(duration: Duration(milliseconds: 600))
  /// ```
  Widget animatedTransform(
    Matrix4 transform, {
    AlignmentGeometry? alignment,
    Offset? origin,
    bool transformHitTests = true,
  }) {
    return _StyledAnimatedBuilder(
      builder: (animation) => _AnimatedTransform(
        transform: transform,
        alignment: alignment,
        origin: origin,
        transformHitTests: transformHitTests,
        duration: animation.duration,
        curve: animation.curve,
        child: this,
      ),
    );
  }

  /// 设置动画内边距
  ///
  /// [padding] - 内边距
  ///
  /// 示例：
  /// ```dart
  /// Text('Hello').animatedPadding(
  ///   EdgeInsets.all(16.0),
  /// ).animate(duration: Duration(milliseconds: 300))
  /// ```
  Widget animatedPadding(EdgeInsetsGeometry padding) {
    return _StyledAnimatedBuilder(
      builder: (animation) => AnimatedPadding(
        padding: padding,
        duration: animation.duration,
        curve: animation.curve,
        child: this,
      ),
    );
  }

  /// 设置动画外边距
  ///
  /// [margin] - 外边距
  ///
  /// 示例：
  /// ```dart
  /// Container(
  ///   width: 50,
  ///   height: 50,
  ///   color: Colors.orange,
  /// ).animatedMargin(
  ///   EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  /// ).animate(duration: Duration(milliseconds: 350))
  /// ```
  Widget animatedMargin(EdgeInsetsGeometry margin) {
    return _StyledAnimatedBuilder(
      builder: (animation) => AnimatedContainer(
        margin: margin,
        duration: animation.duration,
        curve: animation.curve,
        child: this,
      ),
    );
  }
}

/// 动画模型类，用于存储动画配置
class _StyledAnimatedModel {
  /// 动画持续时间
  final Duration duration;

  /// 动画曲线
  final Curve curve;

  /// 创建动画配置模型
  ///
  /// [duration] 动画持续时间。
  /// [curve] 动画曲线。
  _StyledAnimatedModel({required this.duration, this.curve = Curves.linear});
}

/// 继承的动画配置 Widget
class _StyledInheritedAnimation extends InheritedWidget {
  /// 当前动画配置
  final _StyledAnimatedModel? animation;

  /// 创建动画配置继承组件
  ///
  /// [key] 组件标识。
  /// [animation] 当前动画配置。
  /// [child] 共享动画配置的子组件。
  _StyledInheritedAnimation({Key? key, this.animation, required Widget child})
    : super(key: key, child: child);

  /// 判断动画配置变化是否需要通知依赖组件
  ///
  /// [oldAnimation] 上一次构建使用的动画配置。
  @override
  bool updateShouldNotify(_StyledInheritedAnimation oldAnimation) =>
      !(oldAnimation.animation?.duration == animation?.duration &&
          oldAnimation.animation?.curve == animation?.curve);

  /// 从构建上下文读取最近的动画配置
  ///
  /// [context] 当前构建上下文。
  static _StyledInheritedAnimation? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_StyledInheritedAnimation>();
}

/// 动画构建器
class _StyledAnimatedBuilder extends StatelessWidget {
  /// 创建动画构建器
  ///
  /// [key] 组件标识。
  /// [builder] 使用动画配置构建组件的函数。
  _StyledAnimatedBuilder({Key? key, required this.builder}) : super(key: key);

  /// 使用动画配置构建组件的函数
  final Widget Function(_StyledAnimatedModel) builder;

  /// 构建使用继承动画配置的组件
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    _StyledAnimatedModel? animation = _StyledInheritedAnimation.of(
      context,
    )?.animation;
    assert(
      animation != null,
      '[styled_widget]: Tried to animate a widget without an animation specified. Define your animation using .animate() as an ancestor of the widget you are trying to animate',
    );
    return builder(animation!);
  }
}

/// 动画装饰盒子
class _AnimatedDecorationBox extends ImplicitlyAnimatedWidget {
  /// 创建动画装饰盒子
  ///
  /// [key] 组件标识。
  /// [decoration] 目标装饰。
  /// [position] 装饰绘制位置。
  /// [child] 子组件。
  /// [curve] 动画曲线。
  /// [duration] 动画持续时间。
  /// [onEnd] 动画结束回调。
  _AnimatedDecorationBox({
    Key? key,
    this.decoration,
    this.position = DecorationPosition.background,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : assert(decoration == null || decoration.debugAssertIsValid()),
       super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// 容器包含的子 Widget
  final Widget? child;

  /// 在子 Widget 后面绘制的装饰
  final Decoration? decoration;

  /// 装饰绘制位置
  final DecorationPosition? position;

  /// 创建动画装饰盒子状态
  @override
  _AnimatedDecorationBoxState createState() => _AnimatedDecorationBoxState();

  /// 填充动画装饰盒子调试属性
  ///
  /// [properties] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Decoration>('bg', decoration, defaultValue: null),
    );
  }
}

/// 动画装饰盒子状态
class _AnimatedDecorationBoxState
    extends AnimatedWidgetBaseState<_AnimatedDecorationBox> {
  /// 装饰补间动画
  DecorationTween? _decoration;

  /// 更新装饰补间对象
  ///
  /// [visitor] Flutter 隐式动画补间访问器。
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decoration =
        visitor(
              _decoration,
              widget.decoration,
              (dynamic value) => DecorationTween(begin: value as Decoration),
            )
            as DecorationTween?;
  }

  /// 构建当前动画值对应的装饰盒子
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: widget.child,
      decoration: _decoration?.evaluate(animation) ?? BoxDecoration(),
      position: widget.position ?? DecorationPosition.background,
    );
  }

  /// 填充装饰动画状态调试属性
  ///
  /// [description] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<DecorationTween>(
        'bg',
        _decoration,
        defaultValue: null,
      ),
    );
  }
}

/// 动画约束盒子
class _AnimatedConstrainedBox extends ImplicitlyAnimatedWidget {
  /// 创建动画约束盒子
  ///
  /// [key] 组件标识。
  /// [constraints] 目标尺寸约束。
  /// [child] 子组件。
  /// [curve] 动画曲线。
  /// [duration] 动画持续时间。
  /// [onEnd] 动画结束回调。
  _AnimatedConstrainedBox({
    Key? key,
    this.constraints,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : assert(constraints == null || constraints.debugAssertIsValid()),
       super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// 容器包含的子 Widget
  final Widget? child;

  /// 应用于子 Widget 的额外约束
  final BoxConstraints? constraints;

  /// 创建动画约束盒子状态
  @override
  _AnimatedConstrainedBoxState createState() => _AnimatedConstrainedBoxState();

  /// 填充动画约束盒子调试属性
  ///
  /// [properties] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'constraints',
        constraints,
        defaultValue: null,
        showName: false,
      ),
    );
  }
}

/// 动画约束盒子状态
class _AnimatedConstrainedBoxState
    extends AnimatedWidgetBaseState<_AnimatedConstrainedBox> {
  /// 尺寸约束补间动画
  BoxConstraintsTween? _constraints;

  /// 更新尺寸约束补间对象
  ///
  /// [visitor] Flutter 隐式动画补间访问器。
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _constraints =
        visitor(
              _constraints,
              widget.constraints,
              (dynamic value) =>
                  BoxConstraintsTween(begin: value as BoxConstraints),
            )
            as BoxConstraintsTween?;
  }

  /// 构建当前动画值对应的约束盒子
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: widget.child,
      constraints: _constraints?.evaluate(animation) ?? BoxConstraints(),
    );
  }

  /// 填充约束动画状态调试属性
  ///
  /// [description] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<BoxConstraintsTween>(
        'constraints',
        _constraints,
        showName: false,
        defaultValue: null,
      ),
    );
  }
}

/// 动画变换
class _AnimatedTransform extends ImplicitlyAnimatedWidget {
  /// 创建动画变换组件
  ///
  /// [key] 组件标识。
  /// [transform] 目标变换矩阵。
  /// [origin] 变换原点。
  /// [alignment] 变换对齐方式。
  /// [transformHitTests] 是否对命中测试应用变换。
  /// [child] 子组件。
  /// [curve] 动画曲线。
  /// [duration] 动画持续时间。
  _AnimatedTransform({
    Key? key,
    this.transform,
    this.origin,
    this.alignment,
    this.transformHitTests = true,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
  }) : super(key: key, curve: curve, duration: duration);

  /// 容器包含的子 Widget
  final Widget? child;

  /// 变换原点
  final Offset? origin;

  /// 变换对齐方式
  final AlignmentGeometry? alignment;

  /// 是否对命中测试应用变换
  final bool? transformHitTests;

  /// 在绘制容器之前应用的变换矩阵
  final Matrix4? transform;

  /// 创建动画变换状态
  @override
  _AnimatedTransformState createState() => _AnimatedTransformState();

  /// 填充动画变换调试属性
  ///
  /// [properties] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<AlignmentGeometry>(
        'alignment',
        alignment,
        showName: false,
        defaultValue: null,
      ),
    );
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
  }
}

/// 动画变换状态
class _AnimatedTransformState
    extends AnimatedWidgetBaseState<_AnimatedTransform> {
  /// 对齐方式补间动画
  AlignmentGeometryTween? _alignment;

  /// 变换矩阵补间动画
  Matrix4Tween? _transform;

  /// 更新变换相关补间对象
  ///
  /// [visitor] Flutter 隐式动画补间访问器。
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _alignment =
        visitor(
              _alignment,
              widget.alignment,
              (dynamic value) =>
                  AlignmentGeometryTween(begin: value as AlignmentGeometry?),
            )
            as AlignmentGeometryTween?;
    _transform =
        visitor(
              _transform,
              widget.transform,
              (dynamic value) => Matrix4Tween(begin: value as Matrix4?),
            )
            as Matrix4Tween?;
  }

  /// 构建当前动画值对应的变换组件
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return Transform(
      child: widget.child,
      transform: _transform?.evaluate(animation) ?? Matrix4.zero(),
      alignment: _alignment?.evaluate(animation),
      origin: widget.origin,
      transformHitTests: widget.transformHitTests ?? true,
    );
  }

  /// 填充变换动画状态调试属性
  ///
  /// [description] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<AlignmentGeometryTween>(
        'alignment',
        _alignment,
        showName: false,
        defaultValue: null,
      ),
    );
    description.add(
      ObjectFlagProperty<Matrix4Tween>.has('transform', _transform),
    );
  }
}

/// 动画圆角裁剪
class _AnimatedClipRRect extends ImplicitlyAnimatedWidget {
  /// 创建动画圆角裁剪组件
  ///
  /// [key] 组件标识。
  /// [topLeft] 左上角目标圆角半径。
  /// [topRight] 右上角目标圆角半径。
  /// [bottomLeft] 左下角目标圆角半径。
  /// [bottomRight] 右下角目标圆角半径。
  /// [clipper] 自定义圆角裁剪器。
  /// [clipBehavior] 裁剪行为。
  /// [child] 子组件。
  /// [curve] 动画曲线。
  /// [duration] 动画持续时间。
  /// [onEnd] 动画结束回调。
  _AnimatedClipRRect({
    Key? key,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.clipper,
    this.clipBehavior,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// 容器包含的子 Widget
  final Widget? child;

  /// 左上角圆角半径
  final double? topLeft;

  /// 右上角圆角半径
  final double? topRight;

  /// 左下角圆角半径
  final double? bottomLeft;

  /// 右下角圆角半径
  final double? bottomRight;

  /// 自定义圆角裁剪器
  final CustomClipper<RRect>? clipper;

  /// 裁剪行为
  final Clip? clipBehavior;

  /// 创建动画圆角裁剪状态
  @override
  _AnimatedClipRRectState createState() => _AnimatedClipRRectState();

  /// 填充动画圆角裁剪调试属性
  ///
  /// [properties] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('topLeft', topLeft));
    properties.add(DoubleProperty('topRight', topRight));
    properties.add(DoubleProperty('bottomLeft', bottomLeft));
    properties.add(DoubleProperty('bottomRight', bottomRight));
  }
}

/// 动画圆角裁剪状态
class _AnimatedClipRRectState
    extends AnimatedWidgetBaseState<_AnimatedClipRRect> {
  /// 左上角圆角补间动画
  Tween<double>? _topLeft;

  /// 右上角圆角补间动画
  Tween<double>? _topRight;

  /// 左下角圆角补间动画
  Tween<double>? _bottomLeft;

  /// 右下角圆角补间动画
  Tween<double>? _bottomRight;

  /// 更新圆角补间对象
  ///
  /// [visitor] Flutter 隐式动画补间访问器。
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _topLeft =
        visitor(
              _topLeft,
              widget.topLeft,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
    _topRight =
        visitor(
              _topRight,
              widget.topRight,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
    _bottomLeft =
        visitor(
              _bottomLeft,
              widget.bottomLeft,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
    _bottomRight =
        visitor(
              _bottomRight,
              widget.bottomRight,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
  }

  /// 构建当前动画值对应的圆角裁剪组件
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: widget.child,
      clipper: widget.clipper,
      clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
      borderRadius: BorderRadius.only(
        topLeft: _topLeft != null
            ? Radius.circular(_topLeft!.evaluate(animation))
            : Radius.zero,
        topRight: _topRight != null
            ? Radius.circular(_topRight!.evaluate(animation))
            : Radius.zero,
        bottomLeft: _bottomLeft != null
            ? Radius.circular(_bottomLeft!.evaluate(animation))
            : Radius.zero,
        bottomRight: _bottomRight != null
            ? Radius.circular(_bottomRight!.evaluate(animation))
            : Radius.zero,
      ),
    );
  }

  /// 填充圆角裁剪动画状态调试属性
  ///
  /// [description] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Tween<double>>('topLeft', _topLeft));
    description.add(DiagnosticsProperty<Tween<double>>('topRight', _topRight));
    description.add(
      DiagnosticsProperty<Tween<double>>('bottomLeft', _bottomLeft),
    );
    description.add(
      DiagnosticsProperty<Tween<double>>('bottomRight', _bottomRight),
    );
  }
}

/// 动画背景模糊
class _AnimatedBackgroundBlur extends ImplicitlyAnimatedWidget {
  /// 创建动画背景模糊组件
  ///
  /// [key] 组件标识。
  /// [child] 子组件。
  /// [sigma] 目标模糊强度，必须大于等于 0。
  /// [curve] 动画曲线。
  /// [duration] 动画持续时间。
  /// [onEnd] 动画结束回调。
  const _AnimatedBackgroundBlur({
    Key? key,
    this.child,
    required this.sigma,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : assert(sigma >= 0.0),
       super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// 树中此 Widget 下方的 Widget
  final Widget? child;

  /// 背景模糊强度
  final double sigma;

  /// 创建动画背景模糊状态
  @override
  _AnimatedBackgroundBlurState createState() => _AnimatedBackgroundBlurState();

  /// 填充动画背景模糊调试属性
  ///
  /// [properties] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('background blur', sigma));
  }
}

/// 动画背景模糊状态
class _AnimatedBackgroundBlurState
    extends ImplicitlyAnimatedWidgetState<_AnimatedBackgroundBlur> {
  /// 模糊强度补间动画
  Tween<double>? _sigma;

  /// 更新模糊强度补间对象
  ///
  /// [visitor] Flutter 隐式动画补间访问器。
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _sigma =
        visitor(
              _sigma,
              widget.sigma,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
  }

  /// 构建当前动画值对应的背景模糊组件
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: _sigma?.evaluate(animation) ?? 0,
        sigmaY: _sigma?.evaluate(animation) ?? 0,
      ),
      child: widget.child,
    );
  }
}

/// 动画溢出盒子
class _AnimatedOverflowBox extends ImplicitlyAnimatedWidget {
  /// 创建动画溢出盒子
  ///
  /// [key] 组件标识。
  /// [child] 子组件。
  /// [minWidth] 目标最小宽度。
  /// [maxWidth] 目标最大宽度。
  /// [minHeight] 目标最小高度。
  /// [maxHeight] 目标最大高度。
  /// [alignment] 溢出内容对齐方式。
  /// [curve] 动画曲线。
  /// [duration] 动画持续时间。
  /// [onEnd] 动画结束回调。
  const _AnimatedOverflowBox({
    Key? key,
    this.child,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.alignment,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// 树中此 Widget 下方的 Widget
  final Widget? child;

  /// 溢出内容对齐方式
  final AlignmentGeometry? alignment;

  /// 最小宽度
  final double? minWidth;

  /// 最大宽度
  final double? maxWidth;

  /// 最小高度
  final double? minHeight;

  /// 最大高度
  final double? maxHeight;

  /// 创建动画溢出盒子状态
  @override
  _AnimatedOverflowBoxState createState() => _AnimatedOverflowBoxState();

  /// 填充动画溢出盒子调试属性
  ///
  /// [properties] 调试属性构建器。
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('minWidth', minWidth));
    properties.add(DoubleProperty('maxWidth', maxWidth));
    properties.add(DoubleProperty('minHeight', minHeight));
    properties.add(DoubleProperty('maxHeight', maxHeight));
  }
}

/// 动画溢出盒子状态
class _AnimatedOverflowBoxState
    extends ImplicitlyAnimatedWidgetState<_AnimatedOverflowBox> {
  /// 最小宽度补间动画
  Tween<double>? _minWidth;

  /// 最大宽度补间动画
  Tween<double>? _maxWidth;

  /// 最小高度补间动画
  Tween<double>? _minHeight;

  /// 最大高度补间动画
  Tween<double>? _maxHeight;

  /// 对齐方式补间动画
  AlignmentGeometryTween? _alignment;

  /// 更新溢出尺寸和对齐方式补间对象
  ///
  /// [visitor] Flutter 隐式动画补间访问器。
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _minWidth =
        visitor(
              _minWidth,
              widget.minWidth,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
    _maxWidth =
        visitor(
              _maxWidth,
              widget.maxWidth,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
    _minHeight =
        visitor(
              _minHeight,
              widget.minHeight,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
    _maxHeight =
        visitor(
              _maxHeight,
              widget.maxHeight,
              (dynamic value) => Tween<double>(begin: value as double),
            )
            as Tween<double>?;
    _alignment =
        visitor(
              _alignment,
              widget.alignment,
              (dynamic value) =>
                  AlignmentGeometryTween(begin: value as AlignmentGeometry),
            )
            as AlignmentGeometryTween?;
  }

  /// 构建当前动画值对应的溢出盒子
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: _minWidth?.evaluate(animation),
      maxWidth: _maxWidth?.evaluate(animation),
      minHeight: _minHeight?.evaluate(animation),
      maxHeight: _maxHeight?.evaluate(animation),
      alignment: _alignment?.evaluate(animation) ?? Alignment.center,
      child: widget.child,
    );
  }
}
