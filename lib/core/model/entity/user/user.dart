import 'package:json_annotation/json_annotation.dart';

import '../../common/base_entity.dart';

part 'user.g.dart';

/// 用户信息模型
@JsonSerializable()
class User extends BaseEntity {
  /// 登录唯一ID
  final String unionid;

  /// 头像
  final String? avatarUrl;

  /// 昵称
  final String? nickName;

  /// 手机号
  final String? phone;

  /// 性别 0-未知 1-男 2-女
  final int gender;

  /// 状态 0-禁用 1-正常 2-已注销
  final int status;

  /// 登录方式 0-小程序 1-公众号 2-H5
  final String loginType;

  /// 密码
  final String? password;

  /// 创建用户信息模型
  ///
  /// [id] 用户 ID。
  /// [unionid] 登录唯一标识。
  /// [avatarUrl] 可选头像地址。
  /// [nickName] 可选用户昵称。
  /// [phone] 可选手机号。
  /// [gender] 用户性别编码。
  /// [status] 用户状态编码。
  /// [loginType] 登录方式编码。
  /// [password] 可选用户密码。
  /// [createTime] 可选创建时间。
  /// [updateTime] 可选更新时间。
  const User({
    super.id = 0,
    this.unionid = '',
    this.avatarUrl,
    this.nickName,
    this.phone,
    this.gender = 0,
    this.status = 1,
    this.loginType = '0',
    this.password,
    super.createTime,
    super.updateTime,
  });

  /// 从 JSON 创建用户信息模型
  ///
  /// [json] 用户信息 JSON 数据。
  ///
  /// 返回解析后的 [User]。
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// 将用户信息模型转换为 JSON
  ///
  /// 返回当前用户信息的 JSON 数据。
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
