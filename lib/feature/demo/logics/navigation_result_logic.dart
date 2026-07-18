import 'package:flutter_kit/core/base/base/base_logic.dart';
import 'package:flutter_kit/core/util/route/route_util.dart';
import 'package:flutter_kit/routes/demo/demo_result.dart';

/// 结果回传示例页 Logic
///
/// 点击后返回 [DemoResult] 给上一页。
class NavigationResultLogic extends BaseLogic {
  /// 返回示例结果
  void returnResult() {
    back<DemoResult>(const DemoResult(id: 9527, message: '回传结果'));
  }
}
