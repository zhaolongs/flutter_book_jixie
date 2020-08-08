import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/5.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

/// 水平分割线的基本使用
class DividerPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          ///水平分割线
          child: Divider(
            height: 10.0, //水平线的区域占位范围
            indent: 10.0, //距左边距的距离
            endIndent: 12.0,//距右边距的距离
            thickness: 2.0,//线的绘制高度
            color: Colors.blueGrey, //线的颜色),
          ),
        ),
      ),
    );
  }
}
