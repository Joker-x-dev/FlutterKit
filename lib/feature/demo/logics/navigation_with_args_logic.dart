import 'package:flutter_kit/core/base/base/base_logic.dart';
import 'package:flutter_kit/core/util/route/route_util.dart';
import 'package:flutter_kit/routes/demo/demo_params.dart';

/// 带参跳转示例页 Logic
///
/// 从路由参数中读取 [DemoParams]。
class NavigationWithArgsLogic extends BaseLogic {
  /// 创建带参跳转示例页 Logic
  ///
  /// [initialParams] 外部注入的页面参数，一般用于测试和预览。
  NavigationWithArgsLogic({DemoParams? initialParams})
    : _injectedParams = initialParams;

  /// 外部注入的页面参数
  final DemoParams? _injectedParams;

  /// 跳转传入的参数
  late final DemoParams params;

  /// 初始化页面参数
  @override
  void onInit() {
    super.onInit();
    params =
        _injectedParams ??
        getTypedArguments<DemoParams>() ??
        const DemoParams(goodsId: 0);
  }
}
