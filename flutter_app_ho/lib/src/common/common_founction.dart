import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 页面中间弹框
void showCenterToast(String message,
    {ToastGravity toastGravity = ToastGravity.CENTER}) {
  /// 根据消息长度决定自动消失时间
  double multiplier = .5;
  int timeInSecForIos = (multiplier * (message.length * 0.06 + 0.5)).round();

  Fluttertoast.showToast(
    msg: message,
    ///提示文字的颜色
    textColor: Colors.white,
    ///消息提示小弹框的背景
    backgroundColor: Colors.black87,
    ///在页面中间显示消息提示
    gravity: toastGravity,
    ///显示时间配置 默认1秒
    timeInSecForIosWeb: timeInSecForIos,
  );
}
