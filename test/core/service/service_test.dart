import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/core/data/repository/auth_store_repository.dart';
import 'package:flutter_kit/core/data/repository/user_info_store_repository.dart';
import 'package:flutter_kit/core/data/repository/user_repository.dart';
import 'package:flutter_kit/core/model/entity/auth/auth.dart';
import 'package:flutter_kit/core/model/entity/user/user.dart';
import 'package:flutter_kit/core/model/response/base/base_response.dart';
import 'package:flutter_kit/core/network/datasource/user/user_network_data_source.dart';
import 'package:flutter_kit/core/service/demo_counter_service.dart';
import 'package:flutter_kit/core/service/user_service.dart';
import 'package:flutter_kit/core/util/storage/storage_util.dart';

/// Service 层单元测试
void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageUtil.init();
  });

  tearDown(() async {
    final prefs = StorageUtil.sharedPreferences;
    await prefs.clear();
  });

  group('DemoCounterService', () {
    test('初始计数值为 0', () {
      final service = DemoCounterService();
      expect(service.count.value, 0);
    });

    test('increase 使计数值加 1', () {
      final service = DemoCounterService();
      service.increase();
      expect(service.count.value, 1);
    });

    test('decrease 使计数值减 1 且最低为 0', () {
      final service = DemoCounterService();
      service.decrease();
      expect(service.count.value, 0);

      service.increase();
      service.increase();
      service.decrease();
      expect(service.count.value, 1);
    });

    test('reset 重置计数值为 0', () {
      final service = DemoCounterService();
      service.increase();
      service.reset();
      expect(service.count.value, 0);
    });
  });

  group('UserService', () {
    test('initialize 在本地无数据时保持未登录', () async {
      final service = UserService();
      await service.initialize();

      expect(service.isLoggedIn.value, false);
      expect(service.auth.value, null);
      expect(service.userInfo.value, null);
      expect(service.userId.value, 0);
    });

    test('initialize 从本地存储恢复登录状态与用户信息', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      const user = User(id: 42, unionid: 'u42', nickName: 'test');
      final auth = Auth(
        token: 'token',
        refreshToken: 'refresh',
        expire: 3600,
        refreshExpire: 7200,
        createdAt: now,
      );

      final preService = UserService();
      await preService.updateUserState(auth, user);

      final service = UserService();
      await service.initialize();

      expect(service.isLoggedIn.value, true);
      expect(service.auth.value?.token, 'token');
      expect(service.userInfo.value?.id, 42);
      expect(service.userId.value, 42);
    });

    test('updateUserState 更新状态并持久化', () async {
      final service = UserService();
      final auth = Auth(
        token: 'a1',
        refreshToken: 'r1',
        expire: 3600,
        refreshExpire: 7200,
      );
      const user = User(id: 7, unionid: 'u7');

      await service.updateUserState(auth, user);

      expect(service.isLoggedIn.value, true);
      expect(service.userInfo.value?.id, 7);
      expect(service.userId.value, 7);

      final storedAuth = await AuthStoreRepository().getAuth();
      expect(storedAuth?.token, 'a1');
      final storedUser = await UserInfoStoreRepository().getUserInfo();
      expect(storedUser?.id, 7);
    });

    test('updateUserInfo 更新用户信息并持久化', () async {
      final service = UserService();
      const user = User(id: 9, unionid: 'u9', nickName: 'nick');

      await service.updateUserInfo(user);

      expect(service.userInfo.value?.nickName, 'nick');
      expect(service.userId.value, 9);

      final storedUser = await UserInfoStoreRepository().getUserInfo();
      expect(storedUser?.nickName, 'nick');
    });

    test('updateAuth 更新认证信息并持久化', () async {
      final service = UserService();
      final auth = Auth(
        token: 'new',
        refreshToken: 'r2',
        expire: 3600,
        refreshExpire: 7200,
      );

      await service.updateAuth(auth);

      expect(service.isLoggedIn.value, true);
      expect(service.auth.value?.token, 'new');

      final storedAuth = await AuthStoreRepository().getAuth();
      expect(storedAuth?.token, 'new');
    });

    test('logout 清除状态与本地存储', () async {
      final service = UserService();
      final auth = Auth(
        token: 't',
        refreshToken: 'rt',
        expire: 3600,
        refreshExpire: 7200,
      );
      const user = User(id: 1, unionid: 'u1');
      await service.updateUserState(auth, user);

      await service.logout();

      expect(service.isLoggedIn.value, false);
      expect(service.auth.value, null);
      expect(service.userInfo.value, null);
      expect(service.userId.value, 0);
      expect(await AuthStoreRepository().getAuth(), null);
      expect(await UserInfoStoreRepository().getUserInfo(), null);
    });

    test('shouldRefreshToken 在未登录时返回 false', () async {
      final service = UserService();
      expect(await service.shouldRefreshToken(), false);
    });

    test('shouldRefreshToken 在令牌临近过期时返回 true', () async {
      final service = UserService();
      final now = DateTime.now().millisecondsSinceEpoch;
      final auth = Auth(
        token: 't',
        refreshToken: 'rt',
        expire: 120,
        refreshExpire: 3600,
        createdAt: now - 100000,
      );
      await service.updateAuth(auth);

      expect(await service.shouldRefreshToken(), true);
    });

    test('shouldRefreshToken 在令牌未到期且不在刷新窗口时返回 false', () async {
      final service = UserService();
      final auth = Auth(
        token: 't',
        refreshToken: 'rt',
        expire: 3600,
        refreshExpire: 7200,
      );
      await service.updateAuth(auth);

      expect(await service.shouldRefreshToken(), false);
    });

    test('refreshUserInfo 在未登录时不请求网络', () async {
      final service = UserService(
        userRepository: _FailingUserRepository(),
      );
      await service.refreshUserInfo();
      expect(service.userInfo.value, null);
    });

    test('refreshUserInfo 从网络更新用户信息', () async {
      const refreshedUser = User(id: 99, unionid: 'u99', nickName: 'new');
      final service = UserService(
        userRepository: _FakeUserRepository(refreshedUser),
      );
      final auth = Auth(
        token: 't',
        refreshToken: 'rt',
        expire: 3600,
        refreshExpire: 7200,
      );
      await service.updateAuth(auth);

      await service.refreshUserInfo();

      expect(service.userInfo.value?.id, 99);
      expect(service.userInfo.value?.nickName, 'new');
      expect(service.userId.value, 99);
    });
  });
}

/// 用于测试的伪造用户网络数据源
class _FakeUserDataSource implements UserNetworkDataSource {
  final User _user;

  _FakeUserDataSource(this._user);

  @override
  Future<BaseResponse<User>> getPersonInfo() async {
    return BaseResponse(
      code: 1000,
      message: 'success',
      data: _user,
    );
  }
}

/// 用于测试的成功用户仓库
class _FakeUserRepository extends UserRepository {
  _FakeUserRepository(User user) : super(dataSource: _FakeUserDataSource(user));
}

/// 用于测试的失败用户仓库
class _FailingUserRepository extends UserRepository {
  _FailingUserRepository() : super(dataSource: _FailingUserDataSource());
}

/// 用于测试的失败用户网络数据源
class _FailingUserDataSource implements UserNetworkDataSource {
  @override
  Future<BaseResponse<User>> getPersonInfo() async {
    throw Exception('should not be called');
  }
}
