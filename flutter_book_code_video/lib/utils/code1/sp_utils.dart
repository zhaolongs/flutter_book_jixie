import 'dart:convert';

/// /lib/utils/code1/sp_utils.dart
//保存用户对应用程序语言环境的偏好设置shared_preferences插件的操作工具类
import 'package:shared_preferences/shared_preferences.dart';

class SPUtil {
  ///静态实例
  static SharedPreferences _sharedPreferences;

  ///初始化
  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return Future.value(true);
  }

  // 异步保存
  static Future save(String key, dynamic value) async {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    }
  }

  // 异步读取
  static Future<String> getString(String key) async {
    return _sharedPreferences.getString(key);
  }
  static Future<int> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }
  static Future<bool> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }
  static Future<double> getDouble(String key) async {
    return _sharedPreferences.getDouble(key);
  }

  ///保存自定义对象
  static Future saveObject(String key, dynamic value) async {
    ///通过 json 将Object对象编译成String类型保存
      _sharedPreferences.setString(key, json.encode(value));
  }
  ///获取自定义对象
  ///返回的是 Map<String,dynamic> 类型数据
  static dynamic getObject(String key){
    String _data =_sharedPreferences.getString(key) ;
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  ///保存列表数据
  static Future<bool> putObjectList(String key, List<Object> list) {
    ///将Object的数据类型转换为String类型
    List<String> _dataList = list?.map((value) {
      return json.encode(value);
    })?.toList();
    return _sharedPreferences.setStringList(key, _dataList);
  }

  ///获取对象集合数据
  ///返回的是List<Map<String,dynamic>>类型
  static List<Map> getObjectList(String key) {
    if (_sharedPreferences == null) return null;
    List<String> dataLis = _sharedPreferences.getStringList(key);
    return dataLis?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    })?.toList();
  }


}
