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
class ImageOvalPage extends StatefulWidget {
  @override
  _ImageAssetsBaseUsePageState createState() => _ImageAssetsBaseUsePageState();
}

//lib/code/main_data9011.dart
class _ImageAssetsBaseUsePageState extends State {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("加载圆角图形"),
      ),
      backgroundColor: Colors.grey,
      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
             Padding(padding: EdgeInsets.all(10),child:  buildRRectImage(),),
//              buildOvalImage(),
//              buildCircleAvatarImage(),
//              buildClipRRectImage(),
//              Image(image:AssetImage("assets/images/banner_mang.png",),),
            ],
          )),
    );
  }
  //lib/code/main_data9011.dart
  ///网络图片地址
  String netImageUrl = "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";
  ///圆形图片
  Widget buildOvalImage(){
    ///用于圆形裁剪
    return new ClipOval(
      child: Image.network(
        netImageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.fitHeight,
      ),
    );
  }
  ///圆形图片
  Widget buildCircleAvatarImage() {
    return new CircleAvatar(
      backgroundImage: NetworkImage(netImageUrl),
      radius: 50.0,
    );
  }

  //lib/code/main_data9011.dart
  ///通过ClipRRect构建圆形图片
  Widget buildClipRRectImage() {
    return new ClipRRect(
      child: Image.network(
        netImageUrl,
        fit: BoxFit.cover,
        width: 100, height: 100,
      ),
      //配制的圆角正好为图片大小的一半
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );
  }

  //lib/code/main_data9011.dart
  ///网络图片地址
//  String netImageUrl = "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";
  ///通过ClipRRect构建圆角矩形图片
  Widget buildRRectImage() {
    return new ClipRRect(
      child: Image.network(
        netImageUrl,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    );
  }
}