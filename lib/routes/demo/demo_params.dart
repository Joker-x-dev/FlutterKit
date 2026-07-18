/// Demo 模块导航参数
///
/// 承载 Demo 页面跳转所需的类型安全参数。
class DemoParams {
  /// 商品 ID
  final int goodsId;

  /// 创建 Demo 模块导航参数
  ///
  /// [goodsId] 商品 ID。
  const DemoParams({required this.goodsId});
}
