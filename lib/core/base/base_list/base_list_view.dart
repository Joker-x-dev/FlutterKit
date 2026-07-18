import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../design_system/extensions/extensions.dart';
import '../../design_system/theme/size.dart';
import '../../design_system/widgets/space.dart';
import '../../localization/common/common_keys.dart';
import '../base_network/base_network_view.dart';
import 'base_list_logic.dart';

/// 基础分页列表页面
///
/// 使用 EasyRefresh 统一封装下拉刷新、上拉加载和列表项构建逻辑。
abstract class BaseListView<T extends BaseListLogic<E>, E>
    extends BaseNetworkView<T> {
  /// 创建基础分页列表页面
  ///
  /// [logic] 外部注入的列表 Logic；为空时通过 GetX 获取已注册实例。
  BaseListView({super.key, super.logic});

  /// 子类重写此方法传递列表项widget
  ///
  /// [item] 当前列表数据项。
  /// [index] 当前列表下标。
  Widget itemWidget(E item, int index);

  /// 构建分页列表成功状态内容
  ///
  /// [controller] 当前列表 Logic。
  @override
  Widget bodyContent(T controller) {
    return EasyRefresh(
      controller: controller.listState.easyRefreshController,
      onRefresh: () => controller.refresh(),
      onLoad: () => controller.loadMore(),
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
      footer: ClassicFooter(
        dragText: CommonKeys.loadFooterDrag.tr,
        armedText: CommonKeys.loadFooterArmed.tr,
        readyText: CommonKeys.loadFooterReady.tr,
        processingText: CommonKeys.loadFooterProcessing.tr,
        processedText: CommonKeys.loadFooterProcessed.tr,
        noMoreText: CommonKeys.loadFooterNoMore.tr,
        failedText: CommonKeys.loadFooterFailed.tr,
        messageText: CommonKeys.loadFooterMessage.tr,
      ),
      child: builderItemWidget(),
    );
  }

  /// 使用 ListView 构建列表内容，子类可覆盖为其他列表布局
  Widget builderItemWidget() {
    return controller.listState.dataList.toListViewSeparated(
      padding: listItemPadding,
      separatorBuilder: (context, index) => const SpaceVerticalLarge(),
      itemBuilder: (context, index, item) => itemWidget(item, index),
    );
  }
}
