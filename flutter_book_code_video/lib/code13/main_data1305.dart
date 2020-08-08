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
class GesturOnPanPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1305.dart
//手势识别 拖动与滑动
class _TestPageState extends State<GesturOnPanPage> with SingleTickerProviderStateMixin{
  double _top = 0.0;
  double _left = 0.0;
  double _dy = 0.0;
  double _dx = 0.0;

  ///减速动画
  ///动画控制器
  AnimationController _animationController;
  ///颜色变化取值
  Animation<Offset> _animateOffset;


  @override
  void initState() {
    super.initState();
    ///初始化动画控制器
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    ///添加动画监听
    _animationController.addListener(() {
      _dy=_animateOffset.value.dy;
      _dx=_animateOffset.value.dx;
      setState(() {});
    });
    ///Tween结合_animationController，使300毫秒内执行一个从0.0到0.1的变换过程
    _animateOffset = Tween<Offset>(begin:Offset(10,10), end: Offset.zero).animate(_animationController);


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
            top: _top+_animateOffset.value.dy,
            left: _left+_animateOffset.value.dx),
        child: Row(
          children: [
            //事件兼听
            GestureDetector(
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails details) {
                //手指按下的位置(相对于屏幕)
                Offset globalOffset = details.globalPosition;
                //手指按下的位置(相对于父组件)
                Offset localOffset = details.localPosition;
                print("用户手指按下：$globalOffset  $localOffset");
              },
              ///手指开始滑动时的回调
              onPanStart:(DragStartDetails details){
                ///手指按下到开始滑动的时间间隔
                Duration duration = details.sourceTimeStamp;
                //手指开始滑动的位置(相对于屏幕)
                Offset globalOffset = details.globalPosition;
                //手手指开始滑动位置(相对于父组件)
                Offset localOffset = details.localPosition;
                print("用户手指开始滑动：$globalOffset  $localOffset  $duration");
              },
              ///手指移动时的回调
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  ///获取在x轴与y轴上的滑动偏移量
                  Offset dOffset = details.delta;
                  ///dx为手指移动在x轴方向上的偏移量
                  double dx = dOffset.dx;
                  ///dy为手指移动在y轴方向上的偏移量
                  double dy = dOffset.dy;
                  //手指按下的位置(相对于屏幕)
                  Offset globalOffset = details.globalPosition;
                  //手指按下的位置(相对于父组件)
                  Offset localOffset = details.localPosition;

                  _left = _left + dx;
                  _top = _top + dy;
                  if (_left <= 0) {
                    _left = 0;
                  }
                  if (_top <= 0) {
                    _top = 0;
                  }

                });
              },
              ///滑动结束时回调
              onPanEnd: (DragEndDetails details){
                //滑动结束时在x、y轴上的速度
                Offset velocityOffset = details.velocity.pixelsPerSecond;
                //滑动结束时在x轴上的速度
                double velocityDx =velocityOffset.dx;
                //滑动结束时在y轴上的速度
                double velocityDy =velocityOffset.dy;
                print("滑动结束时在x、y轴上的速度：$velocityOffset  velocityDx $velocityDx");

                double vx = velocityDx/110.0;
                double vy =velocityDy/110.0;


                _animateOffset = Tween<Offset>(begin:Offset.zero, end: Offset(vx,vy)).animate(_animationController);
                _animationController.reset();
                _animationController.forward();
              },
              ///取消滑动时回调
              onPanCancel:(){
                print("用户取消了滑动");
              },
              child: Container(
                width: 60,
                height: 60,
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
