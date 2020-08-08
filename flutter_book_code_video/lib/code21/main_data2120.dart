//lib/code20/main_data2120.dart
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/image_loader_utils.dart';


///   绘制图片
class DrawImagePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code20/main_data2120.dart
class _PageState extends State {
  ///需要绘制的图片
  ui.Image image ;
  ///在页面初始化创建时就开始加载
  @override
  void initState() {
    super.initState();
    ///加载图片
    loadingAssetImage();
  }
  ///异步加载图片
  void loadingAssetImage() async {
    image = await ImageLoaderUtils.imageLoader.loadImageByAsset("assets/images/2.0x/head1.png");
    if(!mounted){
      return;
    }
    setState(() {

    });
  }

  //lib/code20/main_data2120.dart
  @override
  Widget build(BuildContext context) {
    return buildBody2();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Canvas 绘制图片"),
        ),
        body: Container(
          ///当图片没加载完时显示一个圆形进度
          child: image == null
              ? CircularProgressIndicator()
              : CustomPaint(
                  painter: ImagePainter(image),
                ),
        ));
  }

  ///页面的主体
  buildBody2() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Canvas 绘制图片"),
        ),
        body: Container(
          child: FutureBuilder<ui.Image>(
            future: ImageLoaderUtils.imageLoader.loadImageByAsset("assets/images/2.0x/head1.png"),
            builder: (context, snapshot) => CustomPaint(
              painter: ImagePainter(snapshot.data),
            ),
          ),
        ));
  }
}

//lib/code20/main_data2120.dart
///  绘制图片的CustomPainter
class ImagePainter extends CustomPainter {
  ///画笔
  Paint _paint;
  ui.Image image;

  ImagePainter(this.image){
    _paint = Paint()..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    ///绘制图片
    canvas.drawImage(
        image,
        //从左上角开始绘制图片
        Offset(0, 0),
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
