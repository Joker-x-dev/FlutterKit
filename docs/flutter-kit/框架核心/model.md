# 数据模型

`lib/core/model/` 定义项目多个模块共用的数据契约：服务端响应、分页包装、实体、请求参数与通用基础类型。模型负责字段、序列化和通用成功判断；Repository、DataSource 和 Feature Logic 围绕同一模型协作，页面不直接解析 `Map<String, dynamic>`。

## 模型边界

FlutterKit 当前没有单独的 `biz_model` 模块，`core/model/` 同时包含跨 Feature 复用的业务实体和协议模型。是否下沉 core 取决于复用范围，而非模型名称。

| 位置 | 内容 | 示例 |
| --- | --- | --- |
| `core/model/common/` | 多模块共用基础类型 | `BaseEntity` |
| `core/model/response/` | 通用响应和分页包装 | `BaseResponse<T>`、`BaseListResponse<T>`、`PageMeta` |
| `core/model/request/` | 可复用接口请求参数 | `PageRequest`、`GoodsSearchRequest` |
| `core/model/entity/` | 多模块使用的业务实体 | `Goods`、`User`、`Auth` |
| `feature/<module>/models/` | 仅本模块使用的展示或业务模型 | Main 模块专用模型 |
| `routes/<module>/` | 导航参数和结果协议 | `DemoParams`、`DemoResult` |

单页专用的展示结构不必进入 core；网络 DTO、数据库实体或多个模块共享的领域实体才适合放入 `core/model/`。

## 网络响应模型

### `BaseResponse<T>`

文件：`lib/core/model/response/base/base_response.dart`

所有 Retrofit DataSource 返回 `BaseResponse<T>`。成功判断由 `AppConfig.successCode` 统一控制，当前值为 `1000`；接口响应字段或成功码与后端不一致时，应在这个通用模型及配置层统一调整，而不是每个 Repository 各自判断。

```dart
/// 项目通用网络响应包装。
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  /// 可空业务数据；成功接口也可能没有 data。
  final T? data;

  /// 服务端业务状态码。
  final int code;

  /// 服务端返回的提示文本。
  final String? message;

  /// 只有状态码等于全局成功码时才视为业务成功。
  bool get isSucceeded => code == AppConfig.successCode;

  /// 泛型模型 JSON 反序列化入口。
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}
```

`RequestHelper`、`HttpInterceptor` 与网络父类均基于此成功判断工作。修改 `successCode` 或 `BaseResponse` 字段名会影响所有网络请求，应同时验证网络、登录和分页 Demo。

### `BaseListResponse<T>` 与 PageMeta

文件：`lib/core/model/response/base/base_list_response.dart`

```dart
/// 通用分页响应数据。
@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T> {
  /// 当前页记录。
  final List<T>? list;

  /// 总数、页码和页大小信息。
  final PageMeta? pagination;
}

/// 分页元信息。
@JsonSerializable()
class PageMeta {
  /// 总记录数。
  final int? total;

  /// 当前页大小。
  final int? size;

  /// 当前页码。
  final int? page;
}
```

`BaseListLogic` 使用 `pagination.total`、`pagination.size` 判断是否还有下一页。分页接口若缺少这些字段，会被父类按无更多数据处理；接口模型应尽量返回完整元信息。

## 实体模型

实体描述业务对象，不包含 View 状态。例如 `Goods` 继承 `BaseEntity` 并使用 `@JsonSerializable()`，供商品详情、商品列表、Preview Data、Repository 与 DataSource 共用。

```dart
/// 商品业务实体。
@JsonSerializable()
class Goods extends BaseEntity {
  /// 商品分类标识。
  final int typeId;

  /// 商品标题。
  final String title;

  /// 可选副标题。
  final String? subTitle;

  /// 从接口 JSON 创建实体。
  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);

  /// 将实体转换为 JSON。
  Map<String, dynamic> toJson() => _$GoodsToJson(this);
}
```

实体不放 `Rx`、`BuildContext`、Widget 或页面 loading 字段。页面可观察数据应放 Feature State，例如 `NetworkDemoState.goods`。

## 请求模型

文件：`lib/core/model/request/goods_search_request.dart`

请求对象用于表达接口参数，避免 Logic 手写 Map。`GoodsSearchRequest` 继承 `PageRequest`，并使用 `includeIfNull: false`，因此未设置的搜索条件不会序列化到请求体。

```dart
/// 商品分页搜索请求。
@JsonSerializable(includeIfNull: false)
class GoodsSearchRequest extends PageRequest {
  /// 商品分类筛选条件。
  final List<int>? typeId;

  /// 搜索关键词。
  final String? keyWord;

  /// 排序字段与方向。
  final String? order;
  final String? sort;

  /// 生成 Retrofit @Body 使用的 JSON。
  Map<String, dynamic> toJson() => _$GoodsSearchRequestToJson(this);
}
```

## 自定义服务端响应

后端响应格式不同，不要在 DataSource 或 Feature 中绕过 `BaseResponse`。应统一处理：

1. 在 `BaseResponse` 调整 `data`、`code`、`message` 的 JSON 字段映射。
2. 在 `AppConfig.successCode` 调整成功码，或在通用模型中调整成功判断。
3. 若分页字段不同，同步调整 `BaseListResponse` 与 `PageMeta`。
4. 重新生成代码，并验证 RequestHelper、网络父类和分页 Demo。

## JSON 代码生成

`@JsonSerializable` 模型的 `fromJson`、`toJson` 实现在 `*.g.dart`。生成文件不能手改；修改注解、字段、Retrofit 接口或泛型响应后执行：

```bash
# 生成 JSON、Retrofit 与其他 build_runner 产物。
dart run build_runner build --delete-conflicting-outputs
```

## 注意事项

- 字段可空性应与真实后端契约一致；不能因为页面当前只展示一个字段就删除响应字段。
- 页面不使用 dynamic JSON；转换在 json_serializable、Entity、DataSource 或 Repository 完成。
- 路由 Params / Result 不是网络模型，按模块放在 `routes/`。
- 对 API 响应结构的变更是全局变更，必须运行网络、列表、登录相关测试。

## 关联阅读

- [网络请求](./network.md)
- [结果处理](./result.md)
- [分页父类](./base-list.md)
