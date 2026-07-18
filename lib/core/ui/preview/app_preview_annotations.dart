import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'app_preview.dart';

/// 应用 Widget Preview 注解。

/// 应用预览设备
enum AppPreviewDevice {
  /// 手机尺寸，对应 SM 断点
  phone(label: 'Phone', size: Size(375, 812)),

  /// 折叠屏展开尺寸，对应 MD 断点
  foldable(label: 'Foldable', size: Size(840, 840)),

  /// 平板尺寸，对应 LG 断点
  tablet(label: 'Tablet', size: Size(1280, 800));

  /// 创建应用预览设备
  ///
  /// [label] 设备显示名称。
  /// [size] 设备逻辑尺寸。
  const AppPreviewDevice({required this.label, required this.size});

  /// 设备显示名称
  final String label;

  /// 设备逻辑尺寸
  final Size size;
}

/// 组件预览注解
///
/// 生成一个组件预览，深浅色由 Widget Preview 工具栏切换。
final class WidgetPreview extends MultiPreview {
  /// 创建组件预览注解
  const WidgetPreview();

  /// 构建组件预览配置
  @override
  List<Preview> get previews {
    return const <Preview>[
      Preview(
        group: '组件',
        size: Size.fromWidth(375),
        theme: buildAppPreviewTheme,
        wrapper: wrapAppComponentPreview,
      ),
    ];
  }
}

/// 手机页面预览注解
///
/// 生成一个手机尺寸页面预览，深浅色由 Widget Preview 工具栏切换。
final class MobilePreview extends MultiPreview {
  /// 创建手机页面预览注解
  const MobilePreview();

  /// 构建手机页面预览配置
  @override
  List<Preview> get previews {
    return _buildScreenPreviews(
      devices: const <AppPreviewDevice>[AppPreviewDevice.phone],
    );
  }
}

/// 平板页面预览注解
///
/// 生成一个平板尺寸页面预览，深浅色由 Widget Preview 工具栏切换。
final class TabletPreview extends MultiPreview {
  /// 创建平板页面预览注解
  const TabletPreview();

  /// 构建平板页面预览配置
  @override
  List<Preview> get previews {
    return _buildScreenPreviews(
      devices: const <AppPreviewDevice>[AppPreviewDevice.tablet],
    );
  }
}

/// 折叠屏页面预览注解
///
/// 生成一个折叠屏尺寸页面预览，深浅色由 Widget Preview 工具栏切换。
final class FoldablePreview extends MultiPreview {
  /// 创建折叠屏页面预览注解
  const FoldablePreview();

  /// 构建折叠屏页面预览配置
  @override
  List<Preview> get previews {
    return _buildScreenPreviews(
      devices: const <AppPreviewDevice>[AppPreviewDevice.foldable],
    );
  }
}

/// 响应式页面预览注解
///
/// 生成手机、折叠屏和平板三个页面预览。
final class ResponsivePreview extends MultiPreview {
  /// 创建响应式页面预览注解
  const ResponsivePreview();

  /// 构建多设备页面预览配置
  @override
  List<Preview> get previews {
    return _buildScreenPreviews(devices: AppPreviewDevice.values);
  }
}

/// 构建页面预览配置
///
/// [devices] 需要生成预览的设备集合。
///
/// 返回指定设备集合对应的页面预览配置。
List<Preview> _buildScreenPreviews({required List<AppPreviewDevice> devices}) {
  return <Preview>[
    for (final AppPreviewDevice device in devices)
      Preview(
        group: '页面',
        name: device.label,
        size: device.size,
        theme: buildAppPreviewTheme,
        wrapper: wrapAppScreenPreview,
      ),
  ];
}
