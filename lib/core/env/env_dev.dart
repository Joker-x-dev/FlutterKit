/// 开发环境配置
abstract final class EnvDev {
  /// 禁止实例化开发环境配置类
  EnvDev._();

  /// 环境标识
  static const String flavor = 'dev';

  /// 基础接口域名
  static const String baseUrl = 'https://mall.dusksnow.top/app/';
}
