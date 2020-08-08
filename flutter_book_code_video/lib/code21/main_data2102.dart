import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///lib/code21/main_data2102.dart
///  20.1 绘图的基本使用
class CanvasBaseUsePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///lib/code21/main_data2102.dart
///  20.1 绘图的基本使用
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘图基本使用"),
      ),
      backgroundColor: Colors.grey,
      body: buildBaseUseFunction(),
    );
  }
  ///lib/code21/main_data2102.dart
  ///  20.1 绘图的基本使用
  buildBaseUseFunction() {
    ///FittedBox能将SizeBox在其内部调整和缩放
    ///同时允许其他组件限制其大小
    return FittedBox(
      ///通过SizedBox来限制画板大小
      child: SizedBox(
        width: 400, height: 400,
        ///配置画板
        child: CustomPaint(
          ///定义画板的大小
          size: Size(300, 300),
          //配置画家
          painter: LinePainter(),
        ),
      ),
    );
  }

  buildBaseUseFunction1() {
    return Container(
      width: 400,
      color: Colors.white,
      height: 400,

      ///创建画板
      child: CustomPaint(
        ///定义画板的大小
        size: Size(300, 300),
        //配置画家
        painter: LinePainter(),
      ),
    );
  }

  ///lib/code21/main_data2102.dart
  ///  20.1 绘图的基本使用
  buildRepaintBoundaryFunction() {
    return CustomPaint(
      //指定画布大小
      size: Size(400, 400),
      painter: LinePainter(),

      ///child不为空时使用RepaintBoundary通过独立图层的方式
      ///分离与父Widget绘制图层，避免不必要的重复绘制
      child: RepaintBoundary(child: Text("")),
    );
  }
}

///自定义绘图者
class LinePainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    //绘制一条直线
    canvas.drawLine(Offset(20, 20), Offset(100, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/*


    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度
painter，foregroundPainter 和 child  ，
painter 是绘制的 backgroud 层，
而child 是在backgroud之上绘制，
oregroundPainter 是在 child 之上绘制，
所以这里就有了个层级关系，这跟android里面的backgroud与foreground是一个意思，

在实际中如果只是单纯的想绘制一个图形，只用painter就可以了，
如果你给绘制区域添加一个背景（颜色，图片，等等），这时候如果使用 painter是会有问题的，painter的绘制会被child 层覆盖掉，此时你只需要将painter替换成foregroundPainter,然会颜色或者图片传递给child即可。

 如果是Android绘制几何图形，应该是重写View的onLayout() 和 onDraw方法，但是Flutter实现绘制，必须继承CustomPainter并重写 paint（Canvascanvas, Size size）和 shouldRepaint (CustomPainteroldDelegate) 方法 ，第一个参数canvas就是我们绘制的画布了（跟Android一模一样），paint第二个参数Size就是上面CustomPaint构造方法传入的size, 决定绘制区域的宽高信息

       既然Size已经确定了，现在就定义下绘制区域的边界,一般我做类似的UI，都会定义一个最基本的padding, 一般取值为16 ， 因为绘制的内容与坐标轴之间需要找到一个基准线，这样更容易绘制，而且调试边距也很灵活
 */
