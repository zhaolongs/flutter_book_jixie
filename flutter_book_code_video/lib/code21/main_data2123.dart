//lib/code20/main_data9023.dart
import 'dart:math';

import 'package:flutter/material.dart';


///   绘制粒子动画
class DrawBillAnimationPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code20/main_data9023.dart
class _PageState extends State with SingleTickerProviderStateMixin {
  AnimationController controller;
  Ball _ball;
  var _limit = Rect.fromLTRB(-140, -100, 140, 100);//矩形边界

  @override
  void initState() {
    super.initState();
    //初始化小球
//    _ball = Ball(x: 0, y: 0, color: Colors.blue, r: 10, aX: 0, aY: 0, vX: 0, vY: 2);
    _ball =Ball(x: 0, y: 0, color: Colors.blue, r: 10, aX: 0, aY: 0.1, vX: 2, vY: -2);
    // 创建 AnimationController 对象
    //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    controller = AnimationController(
        duration: const Duration(milliseconds: 200000), vsync: this);
    ///添加动画监听
    controller.addListener(() {
      //更新小球
      updateBallLocation();
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }

  //lib/code20/main_data9023.dart
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }
//更新小球位置
  void updateBallLocation() {
    //运动学公式
    _ball.x += _ball.vX;
    _ball.y += _ball.vY;
    _ball.vX += _ball.aX;
    _ball.vY += _ball.aY;
    //限定下边界
    if (_ball.y > _limit.bottom - _ball.r) {
      _ball.y = _limit.bottom - _ball.r;
      _ball.vY = -_ball.vY;
      _ball.color=getRandomColor();//碰撞后随机色
    }
    //限定上边界
    if (_ball.y < _limit.top + _ball.r) {
      _ball.y = _limit.top + _ball.r;
      _ball.vY = -_ball.vY;
      _ball.color=getRandomColor();//碰撞后随机色
    }

    //限定左边界
    if (_ball.x < _limit.left + _ball.r) {
      _ball.x = _limit.left + _ball.r;
      _ball.vX = -_ball.vX;
      _ball.color=getRandomColor();//碰撞后随机色
    }

    //限定右边界
    if (_ball.x > _limit.right - _ball.r) {
      _ball.x = _limit.right - _ball.r;
      _ball.vX= -_ball.vX;
      _ball.color=getRandomColor();//碰撞后随机色
    }
  }
  getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }
  ///页面的主体
  buildBody1() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Canvas 绘制图片"),
        ),
        body: CustomPaint(
          painter: RunBallView(context, _ball,_limit),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.forward(); //执行动画
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),);
  }

}

//lib/code20/main_data9023.dart
///  绘制图片的CustomPainter
class RunBallView extends CustomPainter {
  Paint mPaint;
  BuildContext context;
  Ball _ball;
  Rect _limit;

  RunBallView(this.context, Ball ball, Rect limit) {
    mPaint = new Paint();
    _ball = ball;
    _limit = limit;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    canvas.translate(160, 320);
    mPaint.color = Color.fromARGB(148, 198, 246, 248);
    canvas.drawRect(_limit, mPaint);

    canvas.save();
    drawBall(canvas, _ball);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  //绘制小球
  void drawBall(Canvas canvas, Ball ball) {
    mPaint.color = ball.color;
    canvas.drawCircle(Offset(ball.x, ball.y), ball.r, mPaint);
  }
}



class Ball {
  double aX; //加速度
  double aY; //加速度Y
  double vX; //速度X
  double vY; //速度Y
  double x; //点位X
  double y; //点位Y
  Color color; //颜色
  double r;//小球半径

  Ball({this.x, this.y, this.color, this.r, this.aX, this.aY, this.vX, this.vY});
}
