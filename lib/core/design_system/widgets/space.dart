import 'package:flutter/material.dart';

import '../theme/size.dart';

/// 间距组件库
/// 提供预设的水平和垂直间距组件，简化布局代码
/// 使用示例：
/// ```dart
/// [
///   TDText('第一行', font: fontBodyLarge),
///   const SpaceVerticalMedium(),
///   TDText('第二行', font: fontBodyLarge),
/// ].toColumnStart()
/// ```

//region 水平间距组件

/// 创建一个超小水平间距(4dp)的间隔组件
class SpaceHorizontalXSmall extends StatelessWidget {
  /// 创建超小水平间距组件
  ///
  /// [key] 组件标识。
  const SpaceHorizontalXSmall({super.key});

  /// 构建超小水平间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spaceHorizontalXSmall);
  }
}

/// 创建一个小水平间距(8dp)的间隔组件
class SpaceHorizontalSmall extends StatelessWidget {
  /// 创建小水平间距组件
  ///
  /// [key] 组件标识。
  const SpaceHorizontalSmall({super.key});

  /// 构建小水平间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spaceHorizontalSmall);
  }
}

/// 创建一个中等水平间距(12dp)的间隔组件
class SpaceHorizontalMedium extends StatelessWidget {
  /// 创建中等水平间距组件
  ///
  /// [key] 组件标识。
  const SpaceHorizontalMedium({super.key});

  /// 构建中等水平间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spaceHorizontalMedium);
  }
}

/// 创建一个大水平间距(16dp)的间隔组件
class SpaceHorizontalLarge extends StatelessWidget {
  /// 创建大水平间距组件
  ///
  /// [key] 组件标识。
  const SpaceHorizontalLarge({super.key});

  /// 构建大水平间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spaceHorizontalLarge);
  }
}

/// 创建一个特大水平间距(24dp)的间隔组件
class SpaceHorizontalXLarge extends StatelessWidget {
  /// 创建特大水平间距组件
  ///
  /// [key] 组件标识。
  const SpaceHorizontalXLarge({super.key});

  /// 构建特大水平间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spaceHorizontalXLarge);
  }
}

/// 创建一个超大水平间距(32dp)的间隔组件
class SpaceHorizontalXXLarge extends StatelessWidget {
  /// 创建超大水平间距组件
  ///
  /// [key] 组件标识。
  const SpaceHorizontalXXLarge({super.key});

  /// 构建超大水平间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spaceHorizontalXXLarge);
  }
}

//endregion

//region 垂直间距组件

/// 创建一个超小垂直间距(4dp)的间隔组件
class SpaceVerticalXSmall extends StatelessWidget {
  /// 创建超小垂直间距组件
  ///
  /// [key] 组件标识。
  const SpaceVerticalXSmall({super.key});

  /// 构建超小垂直间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceVerticalXSmall);
  }
}

/// 创建一个小垂直间距(8dp)的间隔组件
class SpaceVerticalSmall extends StatelessWidget {
  /// 创建小垂直间距组件
  ///
  /// [key] 组件标识。
  const SpaceVerticalSmall({super.key});

  /// 构建小垂直间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceVerticalSmall);
  }
}

/// 创建一个中等垂直间距(12dp)的间隔组件
class SpaceVerticalMedium extends StatelessWidget {
  /// 创建中等垂直间距组件
  ///
  /// [key] 组件标识。
  const SpaceVerticalMedium({super.key});

  /// 构建中等垂直间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceVerticalMedium);
  }
}

/// 创建一个大垂直间距(16dp)的间隔组件
class SpaceVerticalLarge extends StatelessWidget {
  /// 创建大垂直间距组件
  ///
  /// [key] 组件标识。
  const SpaceVerticalLarge({super.key});

  /// 构建大垂直间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceVerticalLarge);
  }
}

/// 创建一个特大垂直间距(24dp)的间隔组件
class SpaceVerticalXLarge extends StatelessWidget {
  /// 创建特大垂直间距组件
  ///
  /// [key] 组件标识。
  const SpaceVerticalXLarge({super.key});

  /// 构建特大垂直间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceVerticalXLarge);
  }
}

/// 创建一个超大垂直间距(32dp)的间隔组件
class SpaceVerticalXXLarge extends StatelessWidget {
  /// 创建超大垂直间距组件
  ///
  /// [key] 组件标识。
  const SpaceVerticalXXLarge({super.key});

  /// 构建超大垂直间距
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceVerticalXXLarge);
  }
}

//endregion
