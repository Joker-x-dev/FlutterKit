/// 应用初始化器抽象接口
///
/// 所有全局初始化逻辑都应实现此接口，并在 [Application.init] 中按顺序执行
abstract class AppInitializer {
  /// 执行初始化
  Future<void> init();
}
