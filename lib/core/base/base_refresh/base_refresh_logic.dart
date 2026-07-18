import '../base_network/base_network_logic.dart';
import 'base_refresh_state.dart';

/// 刷新基础控制器
abstract class BaseRefreshLogic<T> extends BaseNetworkLogic<T> {
  /// 状态管理
  BaseRefreshState get refreshState => networkState as BaseRefreshState;

  /// 构造函数，确保只创建一个实例
  BaseRefreshLogic() : super(state: BaseRefreshState());

  /// 刷新数据
  @override
  Future<void> refresh() => super.loadData();
}
