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
class ImageAssetsBaseUsePage extends StatefulWidget {
  @override
  _ImageAssetsBaseUsePageState createState() => _ImageAssetsBaseUsePageState();
}

//lib/code/main_data9001.dart
class _ImageAssetsBaseUsePageState extends State {
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData= MediaQuery.of(context);
    ///获取屏幕缩放比
    double  devicePixelRatio2 = MediaQuery.of(context).devicePixelRatio;
    ///或者通过 window对象来获取
    double devicePixelRatio = window.devicePixelRatio;

    ///获取屏幕的逻辑像素
    double screenWidthPt= MediaQuery.of(context).size.width ;
    double screenHeightPt= MediaQuery.of(context).size.height ;

    //获取屏幕的实际物理像素
    ///可通过逻辑像素与缩放比的乘积来获取
    double screenWidthPx= screenWidthPt*devicePixelRatio;
    double screenHeightPx= screenHeightPt*devicePixelRatio;

    ///也可通过window对象直接获取
    Size physicalSize = window.physicalSize;
    double screenWindowWidthPx= window.physicalSize.width;
    double screenWindowPx= window.physicalSize.height;

    print("屏幕逻辑像素 width $screenWidthPt height $screenHeightPt");
    print("屏幕缩放比 $devicePixelRatio  $devicePixelRatio2");
    print("屏幕物理像素 width $screenWindowWidthPx height $screenWindowPx");

    return Scaffold(
      appBar: AppBar(
        title: Text("Image.asset的基本使用"),
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [

              Image.asset("assets/images/banner_mang.png",),

//              Image(image:AssetImage("assets/images/banner_mang.png",),),
            ],
          )),
    );
  }
}