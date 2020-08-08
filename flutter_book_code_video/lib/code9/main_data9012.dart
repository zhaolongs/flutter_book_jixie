import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/image_loader_utils.dart';
/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class RawImagePage extends StatefulWidget {
  @override
  _RawImageState createState() => _RawImageState();
}

//lib/code/main_data9012.dart
//通过RawImage来加载图片
class _RawImageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载ui.Image 图形"),
      ),
      backgroundColor: Colors.grey,
      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              RaisedButton(child: Text("加载图片"),onPressed: (){
                loadingImage();
              },),
              Padding(padding: EdgeInsets.all(10),child:  buildRawImage(),),
            ],
          )),
    );
  }

  //lib/code/main_data9012.dart
  ui.Image  _image;
  ///通过RawImage构建图片
  Widget buildRawImage() {
    if(_image==null){
      return Container(child: Text("加载中"),);
    }
    return RawImage(
      image: _image,
    );
  }
  //lib/code/main_data9012.dart
  ///资源目录下的图片路径
  String assetImagePath ="assets/images/banner_mang.png";
  //通过FutureBuilder来构建RawImage中的ui.Image
  Widget buildRawImageByFuture() {
    ///通过异步加载组件来动态构建RawImage
    return FutureBuilder<ui.Image>(
      ///异步数据加载
      future: ImageLoaderUtils.imageLoader
          .loadUIImageByAsset(assetImagePath),
      ///构建用于显示异步加载数据的子Widget
      builder: (context, snapshot) => RawImage(image: snapshot.data),
    );
  }

  ///异常加载本地资源asset路径下的图片
  void loadingImage() async {
    ///资源目录下的图片路径
    String aPath ="assets/images/banner_mang.png";
    ///加载本地资源图片
    ui.Image image =
    await   ImageLoaderUtils.imageLoader.loadUIImageByAsset(aPath);
    ///加载完成后再渲染
    ///加载完成后再渲染页面
    setState(() {
      _image = image;
    });
  }

  ///网络图片地址
  String netImageUrl = "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";
}