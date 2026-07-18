/// 预生产环境配置
abstract final class EnvPre {
  /// 禁止实例化预生产环境配置类
  EnvPre._();

  /// 环境标识
  static const String flavor = 'pre';

  /// 基础接口域名
  static const String baseUrl = 'https://mall.dusksnow.top/app/';
}
