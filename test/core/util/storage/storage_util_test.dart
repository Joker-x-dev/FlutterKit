import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_kit/core/util/storage/storage_util.dart';

void main() {
  group('StorageUtil', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      await StorageUtil.init();
    });

    test('字符串读写与默认值', () async {
      await StorageUtil.setString('name', 'Tom');
      expect(StorageUtil.getString('name'), 'Tom');
      expect(StorageUtil.getString('missing', defaultValue: 'default'), 'default');
    });

    test('布尔值读写与默认值', () async {
      await StorageUtil.setBool('isLogin', true);
      expect(StorageUtil.getBool('isLogin'), isTrue);
      expect(StorageUtil.getBool('missing', defaultValue: true), isTrue);
    });

    test('整型读写与默认值', () async {
      await StorageUtil.setInt('count', 42);
      expect(StorageUtil.getInt('count'), 42);
      expect(StorageUtil.getInt('missing', defaultValue: -1), -1);
    });

    test('浮点型读写与默认值', () async {
      await StorageUtil.setDouble('rate', 3.14);
      expect(StorageUtil.getDouble('rate'), 3.14);
      expect(StorageUtil.getDouble('missing', defaultValue: 0.5), 0.5);
    });

    test('对象读写', () async {
      const data = {'id': 1, 'name': 'Tom'};
      await StorageUtil.setObject('user', data);
      expect(StorageUtil.getObject('user'), data);
    });

    test('列表对象读写', () async {
      final data = [
        {'id': 1},
        {'id': 2},
      ];
      await StorageUtil.setListObject('list', data);
      expect(StorageUtil.getListObject('list'), data);
    });

    test('删除指定键', () async {
      await StorageUtil.setString('temp', 'value');
      await StorageUtil.delete('temp');
      expect(StorageUtil.getString('temp'), '');
    });
  });
}
