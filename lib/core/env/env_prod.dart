/// 生产环境配置
abstract final class EnvProd {
  /// 禁止实例化生产环境配置类
  EnvProd._();

  /// 环境标识
  static const String flavor = 'prod';

  /// 基础接口域名
  static const String baseUrl = 'https://mall.dusksnow.top/app/';
}
