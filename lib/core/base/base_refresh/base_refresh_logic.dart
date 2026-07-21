import '../base_network/base_network_logic.dart';
import 'base_refresh_state.dart';

/// 刷新基础控制器
abstract class BaseRefreshLogic<T> extends BaseNetworkLogic<T> {
  /// 默认刷新页面 State，仅在业务 Logic 未重写 [refreshState] 时创建
  late final BaseRefreshState _refreshState = BaseRefreshState();

  /// 状态管理
  BaseRefreshState get refreshState => _refreshState;

  /// 网络父类复用刷新页面 State，保证请求状态与刷新状态属于同一对象
  @override
  BaseRefreshState get networkState => refreshState;

  /// 刷新数据
  @override
  Future<void> refresh() => super.loadData();
}
