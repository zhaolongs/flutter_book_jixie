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
class ImageLoadingAssetPage extends StatefulWidget {
  @override
  _ImageAssetsBaseUsePageState createState() => _ImageAssetsBaseUsePageState();
}

//lib/code/main_data9008.dart
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
              buildDecorationImage()

//              Image(image:AssetImage("assets/images/banner_mang.png",),),
            ],
          )),
    );
  }

  //lib/code/main_data9008.dart
  ///通过AssetImage来加载资源图片
  buildAssetImage() {
    return Image(
      image: AssetImage("assets/images/banner_mang.png"),
    );
  }

  //lib/code/main_data9008.dart
  ///通过ExactAssetImage来加载资源图片
  buildExactAssetImage() {
    return Image(

      ///可配制缩放比例
      image: ExactAssetImage("assets/images/banner_mang.png", scale: 1.0),
    );
  }

  //lib/code/main_data9008.dart
  ///网络图片地址
  String netImageUrl = "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";

  ///通过NetworkImage来加载网络图片
  buildNetworkImageImage() {
    return Image(
      image: NetworkImage(

        ///地址
          netImageUrl,

          ///缩放
          scale: 1.0,

          ///请求头信息
          headers: Map()),
    );
  }
}
//lib/code/main_data9008.dart
///网络图片地址
String netImageUrl = "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";

///通过FadeInImage来加载网络图片
buildFadeInImageByAsset() {
  ///从asset中取获取占位图
  return FadeInImage.assetNetwork(
    ///本地资源路径下的一个占位图
    placeholder: "assets/images/normal_user_icon.png",
    //网络图片地址
    image: netImageUrl,
    fadeOutDuration: Duration(milliseconds: 200),
    fadeInCurve: Curves.easeIn,
  );
}




//lib/code/main_data9008.dart
///通过DecorationImage来加载资源图片
buildDecorationImage() {
  return Container(
    child: Center(
      child: Text(
        'Container',
        style: TextStyle(color: Colors.red),
      ),
    ),
    height: 200.0,
    width: 200.0,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      image: DecorationImage(
          image: AssetImage('assets/images/banner_mang.png'),
          fit: BoxFit.cover),
    ),
    margin: const EdgeInsets.only(top: 10.0),
  );
}
