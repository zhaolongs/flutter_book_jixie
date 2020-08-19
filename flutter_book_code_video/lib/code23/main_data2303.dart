import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/14.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code23/main_data2302.dart
class FadeTransitionPage extends StatefulWidget {
  @override
  _FadeTransitionPageState createState() => _FadeTransitionPageState();
}

///lib/code23/main_data2302.dart
class _FadeTransitionPageState extends State<FadeTransitionPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("透明度动画"),
      ),
      body: Column(
        ///子Widget的左上角对齐
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///构建执行渐变效果的Widget
          buildSlideTransition(),
          buildControlButton(),
        ],
      ),
    );
  }

  ///lib/code23/main_data2302.dart
  //动画控制器
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    ///在这里 controller 的值在2秒内从0过渡到1
    controller = AnimationController(

        ///duration 为正向执行动画的时间
        duration: Duration(seconds: 2),
        ///反向执行动画的时间
        reverseDuration: Duration(milliseconds: 3000),
        ///controller的变化的最小值
        lowerBound: 0.0,
        ///controller变化的最大值
        upperBound: 1.0,
        ///绑定页面的Ticker
        vsync: this);

    controller.addListener(() {
      ///获取AnimationController执行的值
      double offset = controller.value;
      ///获取当前动画的状态
      AnimationStatus status = controller.status;
    });
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is completed");
        //反向执行
        //controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
        //controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });
  }

  ///lib/code23/main_data2302.dart
  ///构建渐变动画[FadeTransition]
  Widget buildSlideTransition() {
    ///实现透明渐变动画
    return FadeTransition(
      ///过渡
      opacity: controller,
      //将要执行动画的子view
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }

  ///lib/code23/main_data2302.dart
  Widget buildControlButton() {
    return Wrap(spacing: 10, runSpacing: 12, children: [
      RaisedButton(
        child: Text('正向开启动画'),
        onPressed: () {
          ///重置动画
          controller.reset();
          ///向前执行
          controller.forward();
        },
      ),
      RaisedButton(
        child: Text('反向开启动画'),
        onPressed: () {
          ///反向前执行
          controller.reverse();
        },
      ),RaisedButton(
        child: Text('重置动画'),
        onPressed: () {
          ///反向前执行
          controller.reset();
        },
      ),RaisedButton(
        child: Text('重复执行'),
        onPressed: () {
          ///重复执行
          controller.repeat();
        },
      ),
    ]);
  }

  @override
  void dispose() {
    ///释放资源
    controller.dispose();
    super.dispose();
  }
}
