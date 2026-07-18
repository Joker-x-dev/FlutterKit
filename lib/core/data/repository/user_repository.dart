import '../../model/entity/user/user.dart';
import '../../model/response/base/base_response.dart';
import '../../network/datasource/user/user_network_data_source.dart';
import '../../network/datasource/user/user_network_data_source_impl.dart';
import '../../network/provider/dio_provider.dart';

/// 用户数据仓库
///
/// 作为用户模块对外唯一数据入口，封装 [UserNetworkDataSource] 的网络请求。
class UserRepository {
  /// 用户网络数据源
  final UserNetworkDataSource _dataSource;

  /// 构造函数
  ///
  /// [dataSource] 可选，未传入时自动创建默认实现
  UserRepository({UserNetworkDataSource? dataSource})
    : _dataSource = dataSource ?? UserNetworkDataSourceImpl(DioProvider().dio);

  /// 获取用户个人信息
  ///
  /// 返回用户详情响应
  Future<BaseResponse<User>> getPersonInfo() => _dataSource.getPersonInfo();
}
