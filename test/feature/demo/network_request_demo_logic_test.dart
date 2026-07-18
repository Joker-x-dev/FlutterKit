import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_kit/core/data/repository/goods_repository.dart';
import 'package:flutter_kit/core/localization/app_translations.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';
import 'package:flutter_kit/core/model/request/goods_search_request.dart';
import 'package:flutter_kit/core/model/response/base/base_list_response.dart';
import 'package:flutter_kit/core/model/response/base/base_response.dart';
import 'package:flutter_kit/core/network/datasource/goods/goods_network_data_source.dart';
import 'package:flutter_kit/feature/demo/logics/network_request_demo_logic.dart';

/// 网络请求示例页逻辑测试
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    Get.testMode = true;
    Get.locale = const Locale('zh', 'CN');
    Get.addTranslations(AppTranslations().keys);
  });

  test('请求失败后恢复加载状态', () async {
    final repository = GoodsRepository(
      dataSource: _FailingGoodsNetworkDataSource(),
    );
    final logic = NetworkRequestDemoLogic(goodsRepository: repository);

    await logic.request();

    expect(logic.isLoading.value, isFalse);
    expect(logic.goods.value, isNull);
    expect(logic.errorMessage.value, contains('network broken'));
  });
}

/// 始终返回网络异常的商品数据源
class _FailingGoodsNetworkDataSource implements GoodsNetworkDataSource {
  /// 返回商品分页请求异常
  @override
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) {
    return Future.error(Exception('network broken'));
  }

  /// 返回商品详情请求异常
  @override
  Future<BaseResponse<Goods>> getGoodsInfo(int id) {
    return Future.error(Exception('network broken'));
  }
}
