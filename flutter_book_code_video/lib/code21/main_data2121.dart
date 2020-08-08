//lib/code20/main_data2120.dart
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/image_loader_utils.dart';


///   绘制图片
class BiggerImageView extends StatefulWidget {
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
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Canvas 绘制图片"),
        ),
        body: Container(
            ///当图片没加载完时显示一个圆形进度
            child: BiggerView(
          config: BiggerConfig(
              image: AssetImage("assets/images/2.0x/head1.png"), rate: 1, isClip: true),
        )));
  }
}



/// 图片放大镜的配置类,将图片提供器中的[image],
/// 在半径为[radius]的[outlineColor]色圆中局部放大比例[rate]倍,
class BiggerConfig {
  double rate;
  ImageProvider image;
  double radius;
  Color outlineColor;
  bool isClip;

  BiggerConfig(
      {this.rate = 6,
        @required this.image,
        this.isClip = true,
        this.radius = 30,
        this.outlineColor = Colors.white});
}

class BiggerView extends StatefulWidget {
  BiggerView({
    Key key,
    @required this.config,
  }) : super(key: key);

  final BiggerConfig config;

  @override
  _BiggerViewState createState() => _BiggerViewState();
}

class _BiggerViewState extends State<BiggerView> {
  var posX = 0.0;
  var posY = 0.0;
  bool canDraw = false;
  var width =0.0;
  var height =0.0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: ImageLoaderUtils.imageLoader.loadImageByProvider(widget.config.image),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
          width = snapshot.data.width.toDouble() / widget.config.rate;
          height = snapshot.data.height.toDouble() / widget.config.rate;
        }

        return GestureDetector(
          onPanDown: (detail) {
            posX = detail.localPosition.dx;
            posY = detail.localPosition.dy;
            canDraw = true;
            setState(() {});
          },
          onPanUpdate: (detail) {
            posX = detail.localPosition.dx;
            posY = detail.localPosition.dy;
            if (judgeRectArea(posX, posY, width + 2, height + 2)) {
              setState(() {});
            }
          },
          onPanEnd: (detail) {
            canDraw = false;
            setState(() {});
          },
          child: Container(
            width: width,
            height: height,
            child: CustomPaint(
              painter: BiggerPainter(snapshot.data, posX, posY, canDraw,
                  widget.config.radius, widget.config.rate, widget.config.isClip),
            ),
          ),
        );
      },
    );
  }

  //判断落点是否在矩形区域
  bool judgeRectArea(double dstX, double dstY, double w, double h) {
    return (dstX - w / 2).abs() < w / 2 && (dstY - h / 2).abs() < h / 2;
  }
}

class BiggerPainter extends CustomPainter {
  final ui.Image _img; //图片
  Paint mainPaint; //主画笔
  Path circlePath; //圆路径
  double _x; //触点x
  double _y; //触点y
  double _radius; //圆形放大区域
  double _rate; //放大倍率
  bool _canDraw; //是否绘制放大图
  bool _isClip; //是否是裁切模式
  BiggerPainter(this._img, this._x, this._y, this._canDraw, this._radius, this._rate, this._isClip) {
    mainPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    circlePath = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    canvas.clipRect(rect); //裁剪区域
    if (_img != null) {
      Rect src =
      Rect.fromLTRB(0, 0, _img.width.toDouble(), _img.height.toDouble());
      canvas.drawImageRect(_img, src, rect, mainPaint);
      if (_canDraw) {
        var tempY = _y;
        _y = _y > 2 * _radius ? _y - 2 * _radius : _y + _radius;
        circlePath
            .addOval(Rect.fromCircle(center: Offset(_x, _y), radius: _radius));
        if (_isClip) {

          canvas.clipPath(circlePath);
          canvas.drawImage(
              _img, Offset(-_x * (_rate - 1), -tempY * (_rate - 1)), mainPaint);
          canvas.drawPath(circlePath, mainPaint);

        } else {
          canvas.drawImage(
              _img, Offset(-_x * (_rate - 1), -tempY * (_rate - 1)), mainPaint);
        }
      }
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

