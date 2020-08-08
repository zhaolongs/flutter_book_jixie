import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/shake/shake_animation_type.dart';
import 'package:flutterbookcode/demo/shake/shake_animation_widget.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/14.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code23/20main_data2330.dart
class TweenSequencePage3 extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/20main_data2330.dart
/// AnimatedWidget 的基本使用
class _TransformPageState extends State<TweenSequencePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween"),
      ),

      ///执行旋转，快速的微旋转而形成抖动的动画效果
      body: Column(
        children: [
          ///抖动效果
          ShakeAnimationWidget(
            shakeAnimationType: ShakeAnimationType.RandomShake,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.deepOrange,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ShakeAnimationWidget(
            shakeAnimationType: ShakeAnimationType.RandomShake,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ShakeAnimationWidget(
            shakeAnimationType: ShakeAnimationType.RandomShake,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.lightBlueAccent,
            ),
          )
        ],
      ),
    );
  }
}
