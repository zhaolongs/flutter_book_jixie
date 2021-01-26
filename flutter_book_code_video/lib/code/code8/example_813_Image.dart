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
    home: Example813(),
  ));
}

/// 代码清单 8-20 绘制图片Image FutureBuilder
/// lib/code/code8/example_813_Image.dart
class Example813 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example813State();
  }
}

class _Example813State extends State {
  Future<ui.Image> _imageFuture;

  @override
  void initState() {
    super.initState();
    //图片工具类异步加载图片
    _imageFuture = ImageLoaderUtils.imageLoader
        .loadImageByAsset("assets/images/banner_mang.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas 绘制图片"),
      ),
      body: Container(
        child: FutureBuilder<ui.Image>(
          future: _imageFuture,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            } else {
              return CustomPaint(
                painter: ImagePainter(snapshot.data),
              );
            }
          },
        ),
      ),
    );
  }
}

class ImagePainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    //是否启动抗锯齿
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
}
