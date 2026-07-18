/// 测试环境配置
abstract final class EnvTest {
  /// 禁止实例化测试环境配置类
  EnvTest._();

  /// 环境标识
  static const String flavor = 'test';

  /// 基础接口域名
  static const String baseUrl = 'https://mall.dusksnow.top/app/';
}
