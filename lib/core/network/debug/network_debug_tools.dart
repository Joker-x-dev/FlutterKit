import 'package:alice/alice.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// 网络调试工具集中管理
///
/// 将 [Alice]、[PrettyDioLogger] 等调试依赖收敛到本文件，
/// 业务代码通过 [NetworkDebugTools.interceptors] 与 [NetworkDebugTools.initialize]
/// 使用，避免直接依赖调试包的具体类型。
///
/// 所有功能仅在 [kDebugMode] 下生效，生产环境返回空拦截器列表。
class NetworkDebugTools {
  /// 禁止实例化网络调试工具类
  NetworkDebugTools._();

  /// Alice 调试工具实例
  static Alice? _alice;

  /// Alice Dio 适配器
  static final AliceDioAdapter _aliceDioAdapter = AliceDioAdapter();

  /// Alice 调试工具是否完成初始化
  static bool _initialized = false;

  /// 初始化 Alice 调试工具
  ///
  /// 需要在 [GetMaterialApp] 构建前调用，以便 Dio 拦截器能正确挂载 Adapter。
  static void initialize() {
    if (!kDebugMode || _initialized) {
      return;
    }

    _alice = Alice()..setNavigatorKey(Get.key);
    _initialized = true;
  }

  /// 获取调试模式下需要注入 Dio 的拦截器列表
  ///
  /// 生产环境返回空列表，避免调试代码参与网络请求。
  static List<dio.Interceptor> get interceptors {
    if (!kDebugMode) {
      return <dio.Interceptor>[];
    }

    return <dio.Interceptor>[
      _AliceInterceptor(),
      PrettyDioLogger(requestHeader: false, requestBody: true),
    ];
  }
}

/// Alice Dio 拦截器
///
/// 拦截器在构造时向 Alice 注册 Dio Adapter，实现网络请求在通知栏展示。
class _AliceInterceptor extends dio.Interceptor {
  /// 创建 Alice Dio 拦截器并注册适配器
  _AliceInterceptor() {
    NetworkDebugTools._alice?.addAdapter(NetworkDebugTools._aliceDioAdapter);
  }

  /// 将请求事件转发给 Alice 调试适配器
  ///
  /// [options] Dio 请求配置。
  /// [handler] 请求拦截处理器。
  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      NetworkDebugTools._aliceDioAdapter.onRequest(options, handler);
      return;
    }
    handler.next(options);
  }

  /// 将响应事件转发给 Alice 调试适配器
  ///
  /// [response] Dio 响应数据。
  /// [handler] 响应拦截处理器。
  @override
  void onResponse(
    dio.Response<dynamic> response,
    dio.ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      NetworkDebugTools._aliceDioAdapter.onResponse(response, handler);
      return;
    }
    handler.next(response);
  }

  /// 将错误事件转发给 Alice 调试适配器
  ///
  /// [err] Dio 请求异常。
  /// [handler] 错误拦截处理器。
  @override
  void onError(dio.DioException err, dio.ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      NetworkDebugTools._aliceDioAdapter.onError(err, handler);
      return;
    }
    handler.next(err);
  }
}
