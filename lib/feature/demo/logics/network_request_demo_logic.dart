import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_logic.dart';
import 'package:flutter_kit/core/data/repository/goods_repository.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';
import 'package:flutter_kit/core/result/request_helper.dart';

/// 网络请求（独立）示例页 Logic
///
/// 通过 [RequestHelper] 手动发起请求并处理结果。
class NetworkRequestDemoLogic extends BaseLogic {
  /// 商品仓库
  final GoodsRepository _goodsRepository;

  /// 创建网络请求示例页逻辑
  ///
  /// [goodsRepository] 商品仓库，未传入时使用默认实现。
  NetworkRequestDemoLogic({GoodsRepository? goodsRepository})
    : _goodsRepository = goodsRepository ?? GoodsRepository();

  /// 请求结果商品
  final Rxn<Goods> goods = Rxn<Goods>();

  /// 是否正在加载
  final RxBool isLoading = false.obs;

  /// 请求错误信息
  final RxnString errorMessage = RxnString();

  /// 发起商品详情请求
  Future<void> request() async {
    isLoading.value = true;
    goods.value = null;
    errorMessage.value = null;

    return RequestHelper.repository<Goods>(
          _goodsRepository.getGoodsInfo(1),
        )
        .error((message, error) {
          // RequestHelper 已完成异常文案格式化。
          errorMessage.value = message;
        })
        .execute()
        .then<void>((data) {
          // execute 成功时只返回 BaseResponse.data。
          goods.value = data;
        })
        .catchError((Object error) {
          // error 回调已处理展示文案；此处终止 RequestHelper 的 rethrow。
        })
        .whenComplete(() {
          // 成功和失败均恢复按钮可点击状态。
          isLoading.value = false;
        });
  }
}
