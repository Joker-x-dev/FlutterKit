import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design_system/extensions/extensions.dart';
import '../../design_system/theme/size.dart';
import '../../localization/common/common_keys.dart';
import '../base_network/base_network_view.dart';
import 'base_refresh_logic.dart';

/// 基础刷新页面
///
/// 使用 EasyRefresh 统一封装下拉刷新和页面内容列表。
abstract class BaseRefreshView<T extends BaseRefreshLogic<dynamic>>
    extends BaseNetworkView<T> {
  /// 创建基础刷新页面
  ///
  /// [logic] 外部注入的刷新 Logic；为空时通过 GetX 获取已注册实例。
  BaseRefreshView({super.key, super.logic});

  /// 子类重写此方法传递视图内容
  ///
  /// [controller] 当前刷新 Logic。
  List<Widget> pageContent(T controller);

  /// 构建刷新页面成功状态内容
  ///
  /// [controller] 当前刷新 Logic。
  @override
  Widget bodyContent(T controller) {
    return EasyRefresh(
      controller: controller.refreshState.easyRefreshController,
      onRefresh: () => controller.refresh(),
      header: ClassicHeader(
        armedText: CommonKeys.refreshHeaderArmed.tr,
        readyText: CommonKeys.refreshHeaderReady.tr,
        processedText: CommonKeys.refreshHeaderProcessed.tr,
        processingText: CommonKeys.refreshHeaderProcessing.tr,
        messageText: CommonKeys.refreshHeaderMessage.tr,
        failedText: CommonKeys.refreshHeaderFailed.tr,
        noMoreText: CommonKeys.refreshHeaderNoMore.tr,
        dragText: CommonKeys.refreshHeaderDrag.tr,
      ),
      child: pageContent(controller).toListView(
        padding: listItemPadding,
        itemBuilder: (context, index, item) => item,
      ),
    );
  }
}
