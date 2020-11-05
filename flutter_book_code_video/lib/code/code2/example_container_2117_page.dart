import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_216_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example2117(),
  ));
}

///代码清单 2-117
///lib/code/code2/example_appbar_2117_page.dart
class Example2117 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example2117> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      //手势识别 用来监听点击背景
      body: Container(
        padding: EdgeInsets.all(20),
        //容器的高度
        height: double.infinity,
        child: Column(
          children: [
            buildBorder(),
            //buildRadial()
          ],
        ),
      ),
    );
  }

  ///代码清单 2-118
  ///lib/code/code2/example_appbar_2117_page.dart
  Widget buildBorder() {
    return Material(
      //背景颜色
      color: Colors.orangeAccent,
      //阴影高度
      elevation: 2,
      //使用自定义的边框
      shape: SimpleShapeBoder(),
      //子Widget内容
      child: Container(
        //居中
        alignment: Alignment.center,
        //内边距
        padding: EdgeInsets.all(10),
        //高度
        height: 80,
        //文本
        child: Text(
          "自定义shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

///代码清单 2-117
///lib/code/code2/example_appbar_2117_page.dart
class SimpleShapeBoder extends ShapeBorder {
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    //创建画笔
    var paint = Paint()
      //画笔的颜色
      ..color = Colors.white
      //画笔的宽度
      ..strokeWidth = 2.0
      //画笔的样式为边框样式
      ..style = PaintingStyle.stroke
      //拐角处理使用圆角
      ..strokeJoin = StrokeJoin.round;
    //获取当前画布的宽度
    var w = rect.width;
    //获取当前画布的高度
    var h = rect.height;
    //绘制小圆圈 效果是一个白色的圆环
    canvas.drawCircle(Offset(0.3 * h, 0.23 * h), 0.12 * h, paint);
    //绘制黑色的小圆
    canvas.drawCircle(
        Offset(0.3 * h, 0.23 * h),
        0.06 * h,
        //修改画笔的颜色为填充模式
        //绘制出来的就是实心圆
        paint
          ..style = PaintingStyle.fill
          ..color = Colors.black);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }
}
