import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/27.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
/// 日期时间处理工具类  TimeDateUtils类名调用
/// 基本格式 [DEFAULT_FORMAT] YYYY-MM-DD hh:mm:ss
/// lib/utils/time_date_utils.dart
class TimeDateUtils {

  static const String DEFAULT_FORMAT = "YYYY-MM-DD hh:mm:ss";

  ///将字符串类型的数据转为 Dart 对象类型 [DateTime]
  static DateTime getDateTimeByStr({@required String dateStr, bool isUtc}) {
    if (dateStr == null) {
      return null;
    }
    DateTime dateTime = DateTime.tryParse(dateStr);
    if (isUtc != null) {
      if (isUtc) {
        dateTime = dateTime.toUtc();
      } else {
        dateTime = dateTime.toLocal();
      }
    }
    return dateTime;
  }

  ///将字符串类型的数据转为 Dart 对象类型 [DateTime]
  static DateTime getDateTimeByMs(
      {@required int milliseconds, bool isUtc = false}) {
    if (milliseconds == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
  }



  ///获取当前日期的时间毫秒
  ///如 1606438828697
  static int getNowDateMs() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  ///获取当前日期 指定格式
  /// 默认格式 2020-11-27 09:00:28
  static String getNowDateStr({String format = DEFAULT_FORMAT}) {
    return formatDateByDateTime(dateTime: DateTime.now());
  }

  ///字符串日期格式之间的转换
  ///如 2020-11-11 06:08:66 轻转  11月11日
  static String formatDateByStr(
      {String dateStr, String format = DEFAULT_FORMAT}) {
    return formatDateByDateTime(
        dateTime: getDateTimeByStr(dateStr: dateStr), format: format);
  }

  ///当毫秒转为指定格式
  ///如 1606438828697 转 2020-11-27 09:00:28
  static String formatDateByMill(
      {@required int milliseconds, String format = DEFAULT_FORMAT}) {
    return formatDateByDateTime(
        dateTime: getDateTimeByMs(milliseconds: milliseconds), format: format);
  }

  ///格式化操作 查找替换思路
  static String formatDateByDateTime(
      {DateTime dateTime, String format = DEFAULT_FORMAT}) {
    if (dateTime == null) return "";
    //年是四位数 单独截取处理
    if (format.contains("YY")) {
      String year = dateTime.year.toString();
      if (format.contains("YYYY")) {
        format = format.replaceAll("YYYY", year);
      } else {
        format = format.replaceAll(
            "YY", year.substring(year.length - 2, year.length));
      }
    }
    //月 日 时 分 秒 是二位数
    format = _itemFormat(dateTime.month, format, 'M', 'MM');
    format = _itemFormat(dateTime.day, format, 'D', 'DD');
    format = _itemFormat(dateTime.hour, format, 'h', 'hh');
    format = _itemFormat(dateTime.minute, format, 'm', 'mm');
    format = _itemFormat(dateTime.second, format, 's', 'ss');
    format = _itemFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  ///[tagValue] 将要使用的数据
  ///[tagFormat] 将要转换成的格式
  ///[single] [full] 用来做双位还是单位
  static String _itemFormat(
      int tagValue, String tagFormat, String single, String full) {
    if (tagFormat.contains(single)) {
      if (tagFormat.contains(full)) {
        tagFormat = tagFormat.replaceAll(
            full, tagValue < 10 ? '0$tagValue' : tagValue.toString());
      } else {
        tagFormat = tagFormat.replaceAll(single, tagValue.toString());
      }
    }
    return tagFormat;
  }
}
