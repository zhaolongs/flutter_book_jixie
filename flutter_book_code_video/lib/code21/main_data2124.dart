//lib/code20/main_data9023.dart
import 'dart:math';

import 'package:flutter/material.dart';

///   绘制粒子动画s
class DrawBillsAnimationPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code20/main_data9023.dart
class _PageState extends State with SingleTickerProviderStateMixin {
  AnimationController controller;
  Ball _ball;
  var _limit = Rect.fromLTRB(-140, -100, 140, 100); //矩形边界

  @override
  void initState() {
    super.initState();
    //初始化小球
    var ball = Ball(
        x: 0,
        y: 0,
        color: Colors.blue,
        r: 40,
        aX: 0.05,
        aY: 0.1,
        vX: 3,
        vY: -3);
    _balls.add(ball); //添加一个
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

  var _balls = List<Ball>(); //将_ball换成集合
//更新小球位置
  void updateBallLocation() {
//更新方法
    for (int i = 0; i < _balls.length; i++) {
      var ball = _balls[i];
      if (ball.r < 0.3) {
        //半径小于0.3就移除
        _balls.removeAt(i);
      }
      //运动学公式
      ball.x += ball.vX;
      ball.y += ball.vY;
      ball.vX += ball.aX;
      ball.vY += ball.aY;
      //限定下边界
      if (ball.y > _limit.bottom) {
        var newBall = Ball.fromBall(ball);
        newBall.r = newBall.r / 2;
        newBall.vX = -newBall.vX;
        newBall.vY = -newBall.vY;
        _balls.add(newBall);
        ball.r = ball.r / 2;

        ball.y = _limit.bottom;
        ball.vY = -ball.vY;
        ball.color = getRandomColor(); //碰撞后随机色
      }
      //限定上边界
      if (ball.y < _limit.top) {
        ball.y = _limit.top;
        ball.vY = -ball.vY;
        ball.color = getRandomColor(); //碰撞后随机色
      }

      //限定左边界
      if (ball.x < _limit.left) {
        ball.x = _limit.left;
        ball.vX = -ball.vX;
        ball.color = getRandomColor(); //碰撞后随机色
      }

      //限定右边界
      if (ball.x > _limit.right) {
        var newBall = Ball.fromBall(ball);
        newBall.r = newBall.r / 2;
        newBall.vX = -newBall.vX;
        newBall.vY = -newBall.vY;
        _balls.add(newBall);
        ball.r = ball.r / 2;

        ball.x = _limit.right;
        ball.vX = -ball.vX;
        ball.color = getRandomColor(); //碰撞后随机色
      }
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
        painter: RunBallView(context, _balls, _limit),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); //执行动画
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

//lib/code20/main_data9023.dart
///  绘制图片的CustomPainter
class RunBallView extends CustomPainter {
  Paint mPaint;
  BuildContext context;
  List<Ball> _balls;
  Rect _limit;

  RunBallView(this.context, List<Ball> ball, Rect limit) {
    mPaint = new Paint();
    _balls = ball;
    _limit = limit;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    canvas.translate(160, 320);
    mPaint.color = Color.fromARGB(148, 198, 246, 248);
    canvas.drawRect(_limit, mPaint);

    canvas.save();
    //------paint方法中-----------
    _balls.forEach((ball) {
      drawBall(canvas, ball);
    });
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
  double r; //小球半径

  //复制一个小球
  Ball.fromBall(Ball ball) {
    this.x = ball.x;
    this.y = ball.y;
    this.color = ball.color;
    this.r = ball.r;
    this.aX = ball.aX;
    this.aY = ball.aY;
    this.vX = ball.vX;
    this.vY = ball.vY;
  }

  Ball(
      {this.x, this.y, this.color, this.r, this.aX, this.aY, this.vX, this.vY});
}
