import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kit/core/data/repository/goods_repository.dart';
import 'package:flutter_kit/core/model/entity/goods/goods.dart';
import 'package:flutter_kit/core/model/request/goods_search_request.dart';
import 'package:flutter_kit/core/model/response/base/base_list_response.dart';
import 'package:flutter_kit/core/model/response/base/base_response.dart';
import 'package:flutter_kit/core/network/datasource/goods/goods_network_data_source.dart';

class _FakeGoodsNetworkDataSource implements GoodsNetworkDataSource {
  GoodsSearchRequest? capturedRequest;
  int? capturedId;

  @override
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) async {
    capturedRequest = request;
    return BaseResponse(
      data: BaseListResponse(list: [Goods(id: 2, title: '仓库商品')]),
    );
  }

  @override
  Future<BaseResponse<Goods>> getGoodsInfo(int id) async {
    capturedId = id;
    return BaseResponse(data: Goods(id: id, title: '仓库商品$id'));
  }
}

void main() {
  group('GoodsRepository', () {
    late _FakeGoodsNetworkDataSource fakeDataSource;
    late GoodsRepository repository;

    setUp(() {
      fakeDataSource = _FakeGoodsNetworkDataSource();
      repository = GoodsRepository(dataSource: fakeDataSource);
    });

    test('getGoodsPage 转发到数据源', () async {
      const request = GoodsSearchRequest(page: 1, size: 10);

      final response = await repository.getGoodsPage(request);

      expect(fakeDataSource.capturedRequest, same(request));
      expect(response.data?.list?.first.id, 2);
    });

    test('getGoodsInfo 转发到数据源', () async {
      const id = 99;

      final response = await repository.getGoodsInfo(id);

      expect(fakeDataSource.capturedId, id);
      expect(response.data?.title, '仓库商品$id');
    });
  });
}
