import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class GesturOnVerticalPanPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1306.dart
//手势识别 拖动与滑动 水平方向 单一方向的事件处理
class _TestPageState extends State<GesturOnVerticalPanPage>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  ///减速动画
  ///动画控制器
  AnimationController _animationController;

  ///颜色变化取值
  Animation<Offset> _animateOffset;

  @override
  void initState() {
    super.initState();

    ///初始化动画控制器
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    ///添加动画监听
    _animationController.addListener(() {
      print("top: $_top andr left : $_left");
      setState(() {});
    });

    ///Tween结合_animationController，使300毫秒内执行一个从0.0到0.1的变换过程
    _animateOffset = Tween<Offset>(begin: Offset(0, 0), end: Offset.zero)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动与滑动手势"),
      ),
      backgroundColor: Colors.white,

      ///通过修改Container的外边距来实现拖动子Widget移动功能
      body: Container(
        margin: EdgeInsets.only(
            top: _top + _animateOffset.value.dy,
            left: _left + _animateOffset.value.dx),
        child: Row(
          children: [
            //事件兼听
            GestureDetector(
              ///手指按下时的回调 竖直方向
              onVerticalDragDown: (DragDownDetails details) {},

              ///手指开始滑动时的回调 竖直方向
              onVerticalDragStart: (DragStartDetails details) {},

              ///手指移动时的回调 竖直方向
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  ///获取在x轴与y轴上的滑动偏移量
                  Offset dOffset = details.delta;

                  ///dy为手指移动在y轴方向上的偏移量
                  double dy = dOffset.dy;
                  _top = _top + dy;
                  if (_top <= 0) {
                    _top = 0;
                  }
                  print("竖直方向 滑动 $dy");
                });
              },

              ///滑动结束时回调 竖直方向
              onVerticalDragEnd: (DragEndDetails details) {
                //滑动结束时在x、y轴上的速度
                Offset velocityOffset = details.velocity.pixelsPerSecond;
                //滑动结束时在y轴上的速度
                double velocityDy = velocityOffset.dy;
                print("滑动结束时在x、y轴上的速度：$velocityOffset  ${details.velocity}");

                double vy = velocityDy / 110.0;

                ///减速动画
                _animateOffset =
                    Tween<Offset>(begin: Offset.zero, end: Offset(0, vy))
                        .animate(_animationController);
                _animationController.reset();
                _animationController.forward();
              },

              ///滑动取消时回调 竖直方向
              onVerticalDragCancel: () {},

              child: Container(
                width: 160,
                height: 160,
                child: Image.asset(
                  "assets/images/2.0x/banner1.webp",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
