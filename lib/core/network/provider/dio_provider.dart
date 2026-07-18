import 'package:dio/dio.dart';

import '../../env/env.dart';
import '../debug/network_debug_tools.dart';
import '../interceptor/interceptor.dart';

/// Dio 提供者
///
/// 以单例形式管理 [Dio] 实例，业务层直接 `DioProvider().dio` 使用，
/// 不需要通过 GetX 注册或查找。
class DioProvider {
  /// Dio 提供者单例
  static final DioProvider _instance = DioProvider._internal();

  /// 获取 [DioProvider] 单例
  factory DioProvider() => _instance;

  /// 创建 Dio 提供者单例并初始化客户端
  DioProvider._internal() : dio = _createDio();

  /// [Dio] 实例
  final Dio dio;

  /// 创建 Dio 实例
  ///
  /// 子类可重写此方法以自定义拦截器、超时等配置
  static Dio _createDio() {
    return Dio()
      ..interceptors.add(HttpInterceptor())
      ..interceptors.addAll(NetworkDebugTools.interceptors)
      ..options = BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
  }
}
