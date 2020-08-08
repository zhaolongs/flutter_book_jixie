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
class CenterSliceUsePage extends StatefulWidget {
  @override
  _ImageAssetsBaseUsePageState createState() => _ImageAssetsBaseUsePageState();
}

//lib/code/main_data9001.dart
class _ImageAssetsBaseUsePageState extends State {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("centerSlice使用"),
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.asset("assets/images/2.0xx/message_bg.png",
                alignment: Alignment.topLeft,
                fit: BoxFit.fitWidth,
                width: 300,
                height: 100,
                centerSlice:Rect.fromPoints(Offset(0,0), Offset(20,20))
                ),

//              Image(image:AssetImage("assets/images/banner_mang.png",),),
            ],
          )),
    );
  }
}