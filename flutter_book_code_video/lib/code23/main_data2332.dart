import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/shake/shake_animation_controller.dart';
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

///lib/code23/20main_data2332.dart
class ButtonShakeAnimationPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/20main_data2332.dart
/// ShakeAnimationWidget 的基本使用
class _TransformPageState extends State<ButtonShakeAnimationPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮的抖动"),
      ),

      ///执行旋转，快速的微旋转而形成抖动的动画效果
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),

          ///抖动效果
          buildShakeAnimationWidget(),
        ],
      ),
    );
  }
  ///lib/code23/20main_data2332.dart
  ///抖动动画控制器
 ShakeAnimationController _shakeAnimationController =
        new ShakeAnimationController();
  ///构建抖动效果
  ShakeAnimationWidget buildShakeAnimationWidget() {
    return ShakeAnimationWidget(
      ///抖动控制器
      shakeAnimationController: _shakeAnimationController,
      ///微旋转的抖动
      shakeAnimationType: ShakeAnimationType.SkewShake,
      ///设置不开启抖动
      isForward: false,
      ///默认为 0 无限执行
      shakeCount: 0,
      ///抖动的幅度 取值范围为[0,1]
      shakeRange: 0.2,
      ///执行抖动动画的子Widget
      child: RaisedButton(
        child: Text(
          '测试',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          ///判断抖动动画是否正在执行
          if (_shakeAnimationController.animationRunging) {
            ///停止抖动动画
            _shakeAnimationController.stop();
          } else {
            ///开启抖动动画
            ///参数shakeCount 用来配置抖动次数
            ///通过 controller start 方法默认为 1
            _shakeAnimationController.start(shakeCount: 1);
          }
        },
      ),
    );
  }
}
