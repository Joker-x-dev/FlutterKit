import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// 应用日志工具
///
/// 在非 Release 环境按日志级别输出调试信息。
class LogUtil {
  /// 日志输出器
  static final Logger _logger = Logger(
    level: kReleaseMode ? Level.off : Level.trace,
  );

  /// debug日志 打印出来是白色
  ///
  /// [message] 日志消息。
  /// [error] 可选异常对象。
  /// [stackTrace] 可选异常堆栈。
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// error日志 打印出来是红色
  ///
  /// [message] 日志消息。
  /// [error] 可选异常对象。
  /// [stackTrace] 可选异常堆栈。
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// info日志 打印出来是蓝色
  ///
  /// [message] 日志消息。
  /// [error] 可选异常对象。
  /// [stackTrace] 可选异常堆栈。
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// warning日志 打印出来是黄色
  ///
  /// [message] 日志消息。
  /// [error] 可选异常对象。
  /// [stackTrace] 可选异常堆栈。
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// trace日志 打印出来是灰色
  ///
  /// [message] 日志消息。
  /// [error] 可选异常对象。
  /// [stackTrace] 可选异常堆栈。
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.t(message, error: error, stackTrace: stackTrace);
  }
}
