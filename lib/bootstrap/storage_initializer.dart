import '../core/util/storage/storage_util.dart';
import 'app_initializer.dart';

/// 全局存储初始化器
///
/// 初始化 [SharedPreferences] 实例，供 [StorageUtil] 使用
class StorageInitializer implements AppInitializer {
  @override
  Future<void> init() async {
    await StorageUtil.init();
  }
}
