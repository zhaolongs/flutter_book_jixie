import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class BackdropImagePage extends StatefulWidget {
  @override
  _RawImageState createState() => _RawImageState();
}

//lib/code/main_data9013.dart
//BackdropFilter 实现高斯模糊
class _RawImageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("高斯模糊"),),
      ///填充布局
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child:Stack(
            children: [
              ///使用图片填充布局
              Positioned(left: 0, right: 0, top: 0, bottom: 0,
                child: Image.asset(
                  "assets/images/2.0x/sp2.png", fit: BoxFit.fill,
                ),
              ),
              ///设置高斯模糊
              BackdropFilter(
                ///高斯模糊图片过滤器
                filter: ImageFilter.blur(
                  sigmaX: 8,
                  sigmaY: 8,
                ),
                child: Container(
                  color: Colors.white10,
                ),
              ),

            ],
        ),
      ),
    );
  }
}
