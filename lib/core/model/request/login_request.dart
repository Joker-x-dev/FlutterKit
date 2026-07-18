import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

/// 登录请求模型
@JsonSerializable()
class LoginRequest {
  /// 手机号
  final String phone;

  /// 密码
  final String password;

  /// 创建登录请求
  ///
  /// [phone] 用户手机号。
  /// [password] 用户密码。
  const LoginRequest({this.phone = '', this.password = ''});

  /// 从 JSON 创建登录请求
  ///
  /// [json] 登录请求 JSON 数据。
  ///
  /// 返回解析后的 [LoginRequest]。
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  /// 将登录请求转换为 JSON
  ///
  /// 返回当前登录请求的 JSON 数据。
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
