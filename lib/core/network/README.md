# Network

网络层包是应用程序的网络请求处理层，负责所有与后端服务的通信。该包采用模块化结构，确保网络请求的可维护性和可扩展性。

## 目录结构

### 1. datasource/
- 按业务模块组织的网络数据源接口与实现
- 每个模块的 `*_network_data_source.dart` 定义对外契约
- 每个模块的 `*_network_data_source_impl.dart` 直接使用 Retrofit 注解声明接口，并由代码生成器生成具体实现

#### 模块化组织
- `goods/`: 商品相关数据源
- `user/`: 用户相关数据源
- `auth/`: 认证相关数据源
- 等等...

### 2. interceptor/
- 网络请求拦截器
- 请求/响应的预处理逻辑
- 统一的错误处理机制

### 3. provider/
- Dio 实例提供者
- 管理 [Dio] 单例的创建与配置
- 业务层通过 `DioProvider().dio` 直接使用，也便于测试 mock

### 4. exception/
- 自定义异常类定义
- 错误处理工具类
- 统一的异常处理策略

## API请求处理

### RequestHelper 使用

`RequestHelper` 提供了统一的网络请求处理方式：

```dart
await RequestHelper.repository<Goods>(
  GoodsRepository().getGoodsInfo(1),
)
  .loading(true)
  .toast(true)
  .execute();
```

详细使用说明请参考 [API请求处理器文档](../result/README.md)

## 代码生成

### 何时需要生成代码

在以下情况下需要运行代码生成命令：

1. 修改数据源接口实现（`*_network_data_source_impl.dart`）
   - 添加新的接口方法
   - 修改现有接口的参数或返回类型
   - 添加新的业务模块

2. 添加新的业务模块
   - 创建新的模块目录
   - 实现新的 `*_network_data_source.dart` 接口
   - 实现新的 `*_network_data_source_impl.dart` Retrofit 接口

### 生成命令

在项目根目录下执行以下命令：

```shell
# 生成代码（一次性）
dart run build_runner build
```

```shell
# 清理旧的生成文件
dart run build_runner clean
```

```shell
# 持续监听文件变化并自动生成
dart run build_runner watch
```

## 使用指南

1. 添加新的业务模块：
   ```dart
   // 1. 在 datasource/ 下创建新模块目录
   // 2. 创建 *_network_data_source.dart 接口
   // 3. 创建 *_network_data_source_impl.dart，使用 @RestApi 声明 Retrofit 接口
   @RestApi(baseUrl: "data")
   abstract class NewModuleNetworkDataSourceImpl
       implements NewModuleNetworkDataSource {
     factory NewModuleNetworkDataSourceImpl(Dio dio, {String baseUrl}) =
         _NewModuleNetworkDataSourceImpl;

     @GET("/list")
     Future<BaseResponse<MyData>> getData();
   }
   ```

2. API 接口规范：
   - 使用 `@RestApi` 注解定义服务接口
   - 使用 HTTP 方法注解（@GET, @POST 等）
   - 请求参数使用 `@Query`、`@Body` 等注解
   - 响应数据使用 `BaseResponse<T>` 封装

3. 错误处理：
   - 使用 RequestHelper 统一处理请求状态
   - 使用拦截器处理通用错误
   - 在业务层处理特定错误

## 注意事项

1. 代码生成
   - 修改 API 接口后必须运行代码生成命令
   - 如遇生成冲突，先执行 clean 后再 build
   - 开发时建议使用 watch 命令自动生成

2. 模块化原则
   - 每个业务模块独立维护自己的数据源
   - 相关的 API 放在同一模块目录下
   - 保持模块之间的独立性
   - 在 `datasource/` 下按业务模块组织接口与实现

3. 性能优化
   - 合理使用请求缓存
   - 实现请求取消机制
   - 处理并发请求
   - 监控网络性能

4. 安全考虑
   - 实现统一的认证机制
   - 保护敏感数据
   - 使用 HTTPS
   - 处理证书验证

5. 测试
   - 为每个 API 编写单元测试
   - 模拟不同网络状况
   - 测试错误处理逻辑

## 开发流程

1. 创建新模块
   - 在 datasource/ 下创建新模块目录
   - 实现数据源接口与 Retrofit 实现
   - 运行代码生成命令

2. 更新现有模块
   - 修改对应模块的数据源实现
   - 运行代码生成命令

3. 测试验证
   - 运行单元测试
   - 进行集成测试
   - 验证错误处理
