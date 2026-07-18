import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kit/core/config/app_config.dart';
import 'package:flutter_kit/core/model/request/goods_search_request.dart';
import 'package:flutter_kit/core/network/datasource/goods/goods_network_data_source.dart';
import 'package:flutter_kit/core/network/datasource/goods/goods_network_data_source_impl.dart';

class _FakeAdapter implements HttpClientAdapter {
  RequestOptions? captured;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    captured = options;

    if (options.path.endsWith('/page')) {
      return ResponseBody.fromString(
        jsonEncode({
          'code': AppConfig.successCode,
          'message': 'ok',
          'data': {
            'list': [
              {'id': 1, 'title': '商品1'},
            ],
          },
        }),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }

    if (options.path.endsWith('/info')) {
      final id = options.queryParameters['id'];
      return ResponseBody.fromString(
        jsonEncode({
          'code': AppConfig.successCode,
          'message': 'ok',
          'data': {'id': id, 'title': '商品$id'},
        }),
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }

    throw UnsupportedError('未预期的请求路径: ${options.path}');
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('GoodsNetworkDataSourceImpl', () {
    late _FakeAdapter adapter;
    late Dio dio;
    late GoodsNetworkDataSource dataSource;

    setUp(() {
      adapter = _FakeAdapter();
      dio = Dio(
        BaseOptions(baseUrl: 'https://example.com/'),
      )..httpClientAdapter = adapter;
      dataSource = GoodsNetworkDataSourceImpl(dio);
    });

    test('getGoodsPage 发起 POST /page 并解析响应', () async {
      const request = GoodsSearchRequest(page: 2, size: 20);

      final response = await dataSource.getGoodsPage(request);

      expect(adapter.captured?.method, 'POST');
      expect(adapter.captured?.baseUrl, endsWith('goods/info'));
      expect(adapter.captured?.path, '/page');
      expect(response.data?.list, hasLength(1));
      expect(response.data?.list?.first.id, 1);
      expect(response.data?.list?.first.title, '商品1');
    });

    test('getGoodsInfo 发起 GET /info 并解析响应', () async {
      const id = 42;

      final response = await dataSource.getGoodsInfo(id);

      expect(adapter.captured?.method, 'GET');
      expect(adapter.captured?.baseUrl, endsWith('goods/info'));
      expect(adapter.captured?.path, '/info');
      expect(adapter.captured?.queryParameters['id'], 42);
      expect(response.data?.id, id);
      expect(response.data?.title, '商品$id');
    });
  });
}
