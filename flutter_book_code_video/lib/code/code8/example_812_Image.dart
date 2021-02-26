import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/image_loader_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example812(),
  ));
}


/// 代码清单 8-16 绘制图片Image
/// lib/code/code8/example_812_Image.dart
class Example812 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example812State();
  }
}

class _Example812State extends State {
  //需要绘制的图片
  ui.Image _image;
  //在页面初始化创建时就开始加载
  @override
  void initState() {
    super.initState();
    //加载图片
    loadingAssetImage();
  }
  //异步加载图片
  void loadingAssetImage() async {
    //通过工具类方法
    _image = await ImageLoaderUtils.imageLoader
        .loadImageByAsset("assets/images/banner_mang.png");
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: [
            //当图片没加载完时显示一个圆形进度
            _image == null
                ? CircularProgressIndicator()
                : CustomPaint(
                    painter: ImagePainter(_image),
                  ),
          ],
        ),
      ),
    );
  }
}

/// 代码清单 8-17 绘制图片Image 自定义CustomPainter
/// lib/code/code8/example_812_Image.dart
class ImagePainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    //启动抗锯齿
    ..isAntiAlias = true;

  //将要绘制的图片
  ui.Image _uiImage;
  ImagePainter(this._uiImage);

  @override
  void paint(Canvas canvas, Size size) {
    //绘制图片
    canvas.drawImage(
        _uiImage,
        //从左上角开始绘制图片
        Offset(0, 0),
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  //通过ImageProvider读取Image
  Future<ui.Image> loadAssetImageImage() async {
    ImageProvider provider = AssetImage("assets/images/2.0/head1.png");
    //完成的回调
    Completer<ui.Image> completer = Completer<ui.Image>();
    ImageStreamListener listener;
    //获取图片流
    ImageStream stream = provider.resolve(ImageConfiguration.empty);
    //创建一个图片流监听
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //图片加载完获取这一帧图片
      final ui.Image image = frame.image;
      //触发回调方法
      completer.complete(image);
      //移除监听
      stream.removeListener(listener);
    });
    //为图片流添加监听
    stream.addListener(listener); //添加监听
    return completer.future; //返回
  }
}
