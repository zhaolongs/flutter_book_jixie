import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/29.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///lib/app/bean/bean_event.dart
class EventMessageBean{
  //code用来标识不用的通信
  num code=200;
  ///说明
  String message="消息";
  ///data用来携带不同的数据
  dynamic data;
}