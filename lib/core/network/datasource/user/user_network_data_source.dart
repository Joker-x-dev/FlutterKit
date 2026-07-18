import '../../../../core/model/entity/user/user.dart';
import '../../../../core/model/response/base/base_response.dart';

/// 用户网络数据源接口
///
/// 定义用户个人信息等网络请求契约。
abstract class UserNetworkDataSource {
  /// 获取用户个人信息
  ///
  /// 返回用户详情响应
  Future<BaseResponse<User>> getPersonInfo();
}
