import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 存储工具类
class StorageUtil {
  /// SharedPreferences 存储实例
  static late SharedPreferences sharedPreferences;

  /// 初始化存储
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// 写入字符串
  ///
  /// [key] 存储键。
  /// [value] 字符串值。
  ///
  /// 返回写入是否成功。
  static Future<bool> setString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }

  /// 获取字符串
  ///
  /// [key] 存储键。
  /// [defaultValue] 数据不存在时的默认值。
  ///
  /// 返回已保存字符串或默认值。
  static String getString(String key, {String defaultValue = ''}) {
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  /// 写入布尔值
  ///
  /// [key] 存储键。
  /// [value] 布尔值。
  ///
  /// 返回写入是否成功。
  static Future<bool> setBool(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  /// 获取布尔值
  ///
  /// [key] 存储键。
  /// [defaultValue] 数据不存在时的默认值。
  ///
  /// 返回已保存布尔值或默认值。
  static bool getBool(String key, {bool defaultValue = false}) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  /// 写入浮点数
  ///
  /// [key] 存储键。
  /// [value] 浮点数值。
  ///
  /// 返回写入是否成功。
  static Future<bool> setDouble(String key, double value) {
    return sharedPreferences.setDouble(key, value);
  }

  /// 获取浮点数
  ///
  /// [key] 存储键。
  /// [defaultValue] 数据不存在时的默认值。
  ///
  /// 返回已保存浮点数或默认值。
  static double getDouble(String key, {double defaultValue = 0.0}) {
    return sharedPreferences.getDouble(key) ?? defaultValue;
  }

  /// 写入整数
  ///
  /// [key] 存储键。
  /// [value] 整数值。
  ///
  /// 返回写入是否成功。
  static Future<bool> setInt(String key, int value) {
    return sharedPreferences.setInt(key, value);
  }

  /// 获取整数
  ///
  /// [key] 存储键。
  /// [defaultValue] 数据不存在时的默认值。
  ///
  /// 返回已保存整数或默认值。
  static int getInt(String key, {int defaultValue = 0}) {
    return sharedPreferences.getInt(key) ?? defaultValue;
  }

  /// 获取 JSON 对象
  ///
  /// [key] 存储键。
  ///
  /// 返回已保存对象；数据不存在时返回空映射。
  static Map<String, dynamic> getObject(String key) {
    String? jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      return json.decode(jsonString) as Map<String, dynamic>;
    }
    return {};
  }

  /// 存储 JSON 对象
  ///
  /// [key] 存储键。
  /// [data] 可 JSON 编码的对象。
  ///
  /// 返回写入是否成功。
  static Future<bool> setObject(String key, dynamic data) {
    String jsonString = json.encode(data);
    return sharedPreferences.setString(key, jsonString);
  }

  /// 获取列表对象
  ///
  /// [key] 存储键。
  ///
  /// 返回已保存列表；数据不存在时返回空列表。
  static List<dynamic> getListObject(String key) {
    String? jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      return json.decode(jsonString) as List<dynamic>;
    }
    return [];
  }

  /// 存储列表对象
  ///
  /// [key] 存储键。
  /// [data] 可 JSON 编码的列表。
  ///
  /// 返回写入是否成功。
  static Future<bool> setListObject(String key, List<dynamic> data) {
    String jsonString = json.encode(data);
    return sharedPreferences.setString(key, jsonString);
  }

  /// 删除存储的数据
  ///
  /// [key] 存储键。
  ///
  /// 返回删除是否成功。
  static Future<bool> delete(String key) {
    return sharedPreferences.remove(key);
  }
}
