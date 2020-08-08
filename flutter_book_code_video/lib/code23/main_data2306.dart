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

///lib/code23/main_data2306.dart
///通过AnimatedPadding实现的缩放动画效果
class AnimatedAnimatedPaddingPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

//lib/code/main_data.dart
class _AnimatedOpacityPageState extends State<AnimatedAnimatedPaddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放动画"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: buildAnimatedPadding(),
          ),

        ],
      ),
    );
  }

  ///lib/code23/main_data2306.dart
  ///默认为内边距 子Widget是放大效果
  bool _isOpen = true;
  ///构建按钮
  Widget buildButton(){
    return RaisedButton(
      child: Text('修改Padding'),
      onPressed: () {
        setState(() {
          _isOpen = !_isOpen;
          if (_isOpen) {
            _padding = EdgeInsets.all(0);
          } else {
            _padding = EdgeInsets.all(200);
          }
        });
      },
    );
  }

  ///lib/code23/main_data2306.dart
  ///当前页面显示组件的内边距
  EdgeInsetsGeometry _padding = EdgeInsets.zero;
  ///构建透明动画组件[AnimatedOpacity]
  Widget buildAnimatedPadding() {
    ///固定大小
    return Container(
      width: 200,
      height: 200,
      ///在父布局固定大小的基础上修改
      ///内边距从而达到缩小与放大的效果
      child: AnimatedPadding(
        ///内边距 EdgeInsetsGeometry 类型
        padding: _padding,
        ///动画插值器
        curve: Curves.ease,
        ///过渡时间
        duration: Duration(seconds: 1),
        ///子Widget
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
