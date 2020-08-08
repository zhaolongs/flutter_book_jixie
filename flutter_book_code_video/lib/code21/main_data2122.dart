//lib/code20/main_data2122.dart
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/image_loader_utils.dart';


///   绘制图片
class DrawImageAndBleomPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code20/main_data2122.dart
class _PageState extends State {
  ///需要绘制的图片
  ui.Image image ;
  ui.Image image2 ;
  ///在页面初始化创建时就开始加载
  @override
  void initState() {
    super.initState();
    ///加载图片
    loadingAssetImage();
  }
  ///异步加载图片
  void loadingAssetImage() async {
    image = await ImageLoaderUtils.imageLoader.loadImageByAsset("assets/images/2.0x/sp1.png",config: ImageConfiguration(size: Size(100,100)));
    image2 = await ImageLoaderUtils.imageLoader.loadImageByAsset("assets/images/2.0x/sp2.png");
    if(!mounted){
      return;
    }
    setState(() {

    });
  }

  //lib/code20/main_data2122.dart
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Canvas 绘制图片"),
        ),
        body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Container(
              ///当图片没加载完时显示一个圆形进度
              child: image == null
                  ? CircularProgressIndicator()
                  : CustomPaint(
                      painter: ImagePainter(image, image2),
                    ),
            )));
  }
}

//lib/code20/main_data2122.dart
///  绘制图片的CustomPainter
class ImagePainter extends CustomPainter {
  ///画笔
  Paint _paint;
  ui.Image image;
  ui.Image image2;

  ImagePainter(this.image,this.image2){
    _paint = Paint()..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {

    canvas.saveLayer(Rect.fromLTRB(0,0,100,100), _paint);
    ///绘制图片
//    canvas.drawImageRect(
//        image,
//        Rect.fromLTRB(0,0,100,100),
//        Rect.fromLTRB(0, 0, 400,700),
//        _paint);
    canvas.drawImage(image, Offset(20,-100), _paint);
    canvas.restore();
//    _paint.blendMode=BlendMode.colorBurn;
//    canvas.saveLayer(Rect.fromPoints(Offset(0,0),Offset(100,100)), _paint);
//    ///绘制图片
//    canvas.drawImageRect(
//        image2,
//        Rect.fromLTWH(0, 0, 60, 60),
//        Rect.fromLTWH(60, 60,size.width, size.height),
//        _paint);
//    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
