/// Demo 模块导航结果
///
/// 承载 Demo 页面关闭时返回给调用方的数据。
class DemoResult {
  /// 结果 ID
  final int id;

  /// 结果消息
  final String message;

  /// 创建 Demo 模块导航结果
  ///
  /// [id] 结果 ID。
  /// [message] 结果消息。
  const DemoResult({required this.id, required this.message});
}
