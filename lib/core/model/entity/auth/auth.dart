import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

/// 认证令牌模型
@JsonSerializable()
class Auth {
  /// token
  final String token;

  /// 刷新 token
  final String refreshToken;

  /// token 过期时间(秒)
  final int expire;

  /// 刷新令牌过期时间
  final int refreshExpire;

  /// 令牌创建时间(不来自服务端)，用于计算 token 是否过期
  final int createdAt;

  /// 创建认证令牌模型
  ///
  /// [token] 访问令牌。
  /// [refreshToken] 刷新令牌。
  /// [expire] 访问令牌有效时长，单位为秒。
  /// [refreshExpire] 刷新令牌有效时长，单位为秒。
  /// [createdAt] 令牌创建时间戳，单位为毫秒。
  const Auth({
    this.token = '',
    this.refreshToken = '',
    this.expire = 0,
    this.refreshExpire = 0,
    this.createdAt = 0,
  });

  /// 从 JSON 创建认证令牌模型
  ///
  /// [json] 认证令牌 JSON 数据。
  ///
  /// 返回解析后的 [Auth]。
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  /// 将认证令牌模型转换为 JSON
  ///
  /// 返回当前认证信息的 JSON 数据。
  Map<String, dynamic> toJson() => _$AuthToJson(this);

  /// 访问令牌是否已过期
  bool get isExpired {
    final expirationTime = createdAt + expire * 1000;
    return DateTime.now().millisecondsSinceEpoch >= expirationTime;
  }

  /// 刷新令牌是否已过期
  bool get isRefreshTokenExpired {
    final expirationTime = createdAt + refreshExpire * 1000;
    return DateTime.now().millisecondsSinceEpoch >= expirationTime;
  }

  /// 令牌是否需要刷新（过期前 15 分钟）
  bool get shouldRefresh {
    final now = DateTime.now().millisecondsSinceEpoch;
    final refreshTime = createdAt + expire * 1000 - 15 * 60 * 1000;
    return now >= refreshTime && !isRefreshTokenExpired;
  }
}
