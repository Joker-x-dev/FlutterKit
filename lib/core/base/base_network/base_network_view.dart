import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../../generated/assets.gen.dart';
import '../../localization/common/common_keys.dart';
import '../base/base_view.dart';
import 'base_network_logic.dart';
import 'base_network_state.dart';

/// 网络状态内容构建器
///
/// [baseState] 当前网络请求 Logic。
typedef BodyBuilder = Widget Function(BaseNetworkLogic<dynamic> baseState);

/// 基础网络状态页面
///
/// 根据网络请求状态统一展示加载、空数据、错误和成功内容。
abstract class BaseNetworkView<T extends BaseNetworkLogic<dynamic>>
    extends BaseView<T> {
  /// 创建基础网络状态页面
  ///
  /// [logic] 外部注入的网络 Logic；为空时通过 GetX 获取已注册实例。
  BaseNetworkView({super.key, super.logic});

  /// 显示时是否需要动画
  final bool showAnimation = true;

  /// 抽象方法，子类负责实现，用于返回成功状态下的布局
  ///
  /// [controller] 当前网络 Logic。
  Widget bodyContent(T controller);

  /// 主视图 子类可重写
  @override
  Widget body() {
    return commonView(controller, (baseState) {
      // 调用子类实现的方法
      return bodyContent(controller);
    });
  }

  /// 创建页面主视图
  ///
  /// [controller] 当前网络 Logic。
  /// [builder] 成功状态内容构建器。
  Widget commonView(T controller, BodyBuilder builder) {
    return Obx(() {
      // 根据当前状态返回相应的 Widget
      Widget child = _getWidgetForCurrentState(controller, builder);

      // 如果不需要动画，直接返回
      if (!showAnimation) return child;

      // 使用 PageTransitionSwitcher 包裹状态切换
      return PageTransitionSwitcher(
        transitionBuilder:
            (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                fillColor: Colors.transparent,
                child: child,
              );
            },
        child: child,
      );
    });
  }

  /// 根据当前状态返回相应的 Widget
  ///
  /// [controller] 当前网络 Logic。
  /// [builder] 成功状态内容构建器。
  Widget _getWidgetForCurrentState(T controller, BodyBuilder builder) {
    switch (controller.networkState.uiState.value) {
      case NetState.loading:
        return loadWidget();
      case NetState.emptyData:
        return emptyWidget();
      case NetState.error:
        return failWidget(controller);
      case NetState.dataSuccess:
        return builder(controller);
    }
  }

  /// 空视图 子类可重写
  Widget emptyWidget() {
    return empty(CommonKeys.baseNetworkEmpty.tr, Assets.icon.emptyVoid.path);
  }

  /// 错误视图 子类可重写
  ///
  /// [controller] 当前网络 Logic。
  Widget failWidget(T controller) {
    return empty(CommonKeys.baseNetworkError.tr, Assets.icon.emptyError.path);
  }

  /// 缺省页视图内容
  ///
  /// [emptyText] 缺省状态提示文本。
  /// [imgPath] 缺省状态图片资源路径。
  Widget empty(String emptyText, String imgPath) {
    return TDEmpty(
      onTapEvent: () {
        controller.loadData();
        controller.setStatusLoad();
      },
      operationText: CommonKeys.baseNetworkReload.tr,
      type: TDEmptyType.operation,
      emptyText: emptyText,
      image: SvgPicture.asset(imgPath).tight(height: 220, width: 200),
    );
  }

  /// 加载视图 子类可重写
  Widget loadWidget() {
    return TDLoading(
      text: CommonKeys.baseNetworkLoading.tr,
      size: TDLoadingSize.large,
      icon: TDLoadingIcon.circle,
    ).center();
  }
}
