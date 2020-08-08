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

///lib/code23/main_data2309.dart
/// 通过AnimatedSize 而达到缩放度渐变的动画效果
class AnimatedSizePage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

///lib/code23/main_data2309.dart
class _AnimatedOpacityPageState extends State<AnimatedSizePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放动画"),
      ),

      ///线性布局将缩放组件与滑块上下排列
      body: Column(
        ///子组件顶部对齐
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///构建缩放组件
          buildScalContainer(),

          ///构建滑块
          buildContainer(),

          ///
          buildButton(),
        ],
      ),
    );
  }

  ///lib/code23/main_data2309.dart
  ///构建滑块
  Container buildContainer() {
    return Container(
      ///线性布局将滑块与显示文字左右排列
      child: Row(
        children: [
          ///显示缩放度的文本
          Padding(

              ///设置一个右边距
              padding: EdgeInsets.only(right: 16),

              ///opacityLevel.toStringAsFixed(2)方法用来保留两位小数
              child: Text("当前的width${_width.toStringAsFixed(2)}")),
        ],
      ),
    );
  }

  ///lib/code23/main_data2309.dart
  ///当前组件宽高
  double _width = 160;
  double _height = 160;

  ///构建容器
  Widget buildScalContainer() {
    return AnimatedSize(
      ///绑定Ticker
      vsync: this,
      ///动画时间
      duration: const Duration(milliseconds: 1500),
      reverseDuration: Duration(milliseconds: 1500),
      ///动画插值器
      curve: Curves.fastOutSlowIn,
      ///子Widget
      child: Container(
        width: _width,
        height: _height,
        color: Colors.blue,
      ),
    );
  }

  ///lib/code23/main_data2309.dart
  ///是否放大
  bool isOpen = false;
  ///构建按钮
  Widget buildButton() {
    return RaisedButton(
      child: Text("缩放"),
      onPressed: () {
        setState(() {
          isOpen = !isOpen;
          if (isOpen) {
            _width = 200;
            _height = 200;
          } else {
            _width = 100;
            _height = 100;
          }
        });
      },
    );
  }
}
