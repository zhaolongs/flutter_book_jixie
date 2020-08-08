import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as image;

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

class DismissController {
  void start() {
    for (var i = 0; i < listener.length; i++) {
      Function(DismissStatus statues) callback = listener[i];
      callback(DismissStatus.start);
    }
  }

  void reverStart() {
    for (var i = 0; i < listener.length; i++) {
      Function(DismissStatus statues) callback = listener[i];
      callback(DismissStatus.rever);
    }
  }
  List<Function(DismissStatus statues)> listener = [];

  void addListener(Function(DismissStatus statues) f) {
    listener.add(f);
  }
}

enum DismissStatus {
  none,
  start,
  rever,
}

class DismissWidget extends StatefulWidget {
  Widget child;
  GlobalKey<_RawImageState> _globalKey = GlobalKey();
  DismissController dismissController;

  DismissWidget({@required this.child, this.dismissController});

  @override
  _RawImageState createState() => _RawImageState();
}

//lib/code/main_data9014.dart
//BackdropFilter 实现高斯模糊
class _RawImageState extends State<DismissWidget>
    with TickerProviderStateMixin {
  // 吹散动画Controller
  AnimationController _mainController;


  // 重叠的分离图层
  List<Widget> layers = [];

  ///图层的个数
  int numberOfLayers = 10;
  ///当前执行的状态
  DismissStatus currentStatus = DismissStatus.none;

  @override
  void initState() {
    super.initState();
    if (widget.dismissController != null) {
      ///添加监听
      widget.dismissController.addListener((statues) {
        ///更新状态
        currentStatus = statues;
        if (statues == DismissStatus.start) {
          start();
        }else if (statues == DismissStatus.rever) {
          reverStart();
        }
      });
    }
    _mainController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _mainController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...layers,
        _mainController.isAnimating
            ? Container()
            : RepaintBoundary(
                key: widget._globalKey,
                child: widget.child,
              ),
      ],
    );
  }

  void start() {
    blow();
  }

  void reverStart() {
    blow();
  }

  Future<void> blow() async {
    // 获取到完整的图像
    image.Image fullImage = await _getImageFromWidget();

    // 获取原图的宽高
    int width = fullImage.width;
    int height = fullImage.height;

    // 初始化与原图相同大小的空白的图层
    List<image.Image> blankLayers =
        List.generate(numberOfLayers, (i) => image.Image(width, height));

    // 将原图的像素点，分布到layer中
    separatePixels(blankLayers, fullImage, width, height);

    // 将图层转换为Widget
    layers = blankLayers.map((layer) => imageToWidget(layer)).toList();

    // 刷新页面
    setState(() {});

    // 开始动画
    _mainController.reset();
    _mainController.forward();

  }

  Widget imageToWidget(image.Image png) {
    // 先将image 转换为 Uint8List 格式
    Uint8List data = Uint8List.fromList(image.encodePng(png));

    double start = 0;
    double end =1;
    if(currentStatus==DismissStatus.rever){
      start=1;
      end=0;
    }
    // 定义一个先快后慢的动画过程曲线
    CurvedAnimation animation = CurvedAnimation(
        parent: _mainController, curve: Interval(start, end, curve: Curves.easeOut));

    Offset startOffset = Offset.zero;
    Offset endOffset = Offset(50, -20) + Offset(30, 30);
    if(currentStatus==DismissStatus.rever){
//      endOffset= Offset.zero;
//      startOffset= Offset(50, 20) + Offset(30, 30);
    }
    // 定义位移变化的插值（始末偏移量）
    Animation<Offset> offsetAnimation = Tween<Offset>(
      begin: startOffset,
      // 基础偏移量+随机偏移量
      end:endOffset.scale((Random().nextDouble() - 0.5) * 2,
              (Random().nextDouble() - 0.5) * 2),
    ).animate(animation);

    return AnimatedBuilder(
      animation: _mainController,
      child: Image.memory(data),
      builder: (context, child) {
        // 位移动画
        return Transform.translate(
          offset: offsetAnimation.value,
          // 渐隐动画
          child: Opacity(
            opacity: cos(animation.value * pi / 2), // 1 => 0
            child: child,
          ),
        );
      },
    );
  }

  void separatePixels(List<image.Image> blankLayers, image.Image fullImage,
      int width, int height) {
    // 遍历所有的像素点
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        // 获取当前的像素点
        int pixel = fullImage.getPixel(x, y);
        // 如果当前像素点是透明的  则直接continue 减少不必要的浪费
        if (0 == pixel) continue;

        // 随机生成放入的图层index
        int index = Random().nextInt(numberOfLayers);
        // 将像素点放入图层
        blankLayers[index].setPixel(x, y, pixel);
      }
    }
  }

  // 将一个Widget转为image.Image对象
  Future<image.Image> _getImageFromWidget() async {
    // _globalKey为需要图像化的widget的key
    RenderRepaintBoundary boundary =
        widget._globalKey.currentContext.findRenderObject();

    // ui.Image => image.Image
    var img = await boundary.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();

    return image.decodeImage(pngBytes);
  }
}
