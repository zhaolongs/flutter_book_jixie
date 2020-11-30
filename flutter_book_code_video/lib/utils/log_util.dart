

import 'package:flutter/material.dart';

///lib/utils/log_util.dart 
///日志输出工具类
class LogUtil {
  ///打印log的标签
  static const String _defaultLogTag = "flutter_log";
  //是否是debug模式,true: log  不输出.
  static bool _debugMode=false;
  ///log日志的长度
  static int _maxLogLength=130;
  ///当前的logTag的值
  static String _tagValue=_defaultLogTag;

  static void init({
    String tag = _defaultLogTag,
    bool isDebug = false,
    int maxLen = 130,
  }) {
    _tagValue = tag;
    _debugMode = isDebug;
    _maxLogLength = maxLen;
  }

  static void e(Object object, {String tag}) {
    if(_debugMode){
      _printLog(tag, ' e ', object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    String da = object.toString();
    tag = tag ?? _tagValue;
    if (da.length <= _maxLogLength) {
      debugPrint("$tag$stag $da");
      return;
    }
    debugPrint(
        '$tag$stag — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —');
    while (da.isNotEmpty) {
      if (da.length > _maxLogLength) {
        debugPrint("$tag$stag| ${da.substring(0, _maxLogLength)}");
        da = da.substring(_maxLogLength, da.length);
      } else {
        debugPrint("$tag$stag| $da");
        da = "";
      }
    }
    debugPrint(
        '$tag$stag — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —');
  }
}
