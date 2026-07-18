import 'package:json_annotation/json_annotation.dart';

import '../../../config/app_config.dart';

part 'base_response.g.dart';

/// 解析网络响应
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  /// 真实数据
  /// 类型是泛型
  final T? data;

  /// 状态码
  /// 等于 [AppConfig.successCode] 表示成功
  final int code;

  /// 出错的提示信息
  /// 发生了错误不一定有
  final String? message;

  /// 创建通用网络响应
  ///
  /// [data] 可选业务数据。
  /// [code] 业务状态码。
  /// [message] 可选提示信息。
  BaseResponse({this.data, this.code = AppConfig.successCode, this.message});

  /// 是否成功
  bool get isSucceeded => code == AppConfig.successCode;

  /// 从 JSON 创建通用网络响应
  ///
  /// [json] 网络响应 JSON 数据。
  /// [fromJsonT] 泛型业务数据 JSON 转换函数。
  ///
  /// 返回解析后的 [BaseResponse]。
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);

  /// 将通用网络响应转换为 JSON
  ///
  /// [toJsonT] 泛型业务数据 JSON 转换函数。
  ///
  /// 返回当前网络响应的 JSON 数据。
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
