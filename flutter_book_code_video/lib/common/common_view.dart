import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/8.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data1301.dart
///一个常用的图片
Widget buildCommonImageWidget({double width=200,double height=100}) {
  return Row(
    children: [
      Container(
        width: width,
        height: height,
        child: Image.asset(
          "assets/images/2.0x/banner1.webp",
        ),
      )
    ],
  );
}
