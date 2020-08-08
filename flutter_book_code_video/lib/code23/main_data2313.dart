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

///lib/code23/main_data2313.dart
class AnimatedContainerPage extends StatefulWidget {
  @override
  _FadeTransitionPageState createState() => _FadeTransitionPageState();
}

///lib/code23/main_data2313.dart
class _FadeTransitionPageState extends State<AnimatedContainerPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放动画"),
      ),
      body: Column(
        ///子Widget的左上角对齐
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///构建执行缩放效果的Widget
          buildAnimatedContainer(),
          buildControlButton(),
        ],
      ),
    );
  }

  ///lib/code23/main_data2313.dart
  Alignment _alignment = Alignment.center;

  ///AnimatedContainer 使用到的宽高
  double _width = 100;
  double _height = 100;

  ///AnimatedContainer的边框圆角
  double _borderRadius = 0;

  ///AnimatedContainer的背景颜色
  Color _color = Colors.red;
  Color _borderColor = Colors.red;

  ///AnimatedContainer的内边距
  EdgeInsetsGeometry _padding = EdgeInsets.only(left: 10, right: 10);
  EdgeInsetsGeometry _margin = EdgeInsets.only(left: 10, right: 10);

  ///构建 [AnimatedContainer]
  Widget buildAnimatedContainer() {
    return AnimatedContainer(
      //子组件的对齐方式
      alignment: _alignment,

      ///宽度
      width: _width,
      height: _height,

      ///内边距
      padding: _padding,
      margin: _margin,

      ///装饰样式
      decoration: BoxDecoration(
          color: _color,
          border: Border.all(color: _borderColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius))),

      ///动画执行时间
      duration: Duration(milliseconds: 1500),
      //子view
      child: Container(
        color: Colors.blue,
        height: 100,
        width: 50,
      ),
    );
  }

  ///lib/code23/main_data2313.dart
  Widget buildControlButton() {
    return Wrap(spacing: 10, runSpacing: 12, children: [
      RaisedButton(
        child: Text('缩放'),
        onPressed: () {
          setState(() {
            if (_width == 100) {
              _width = 200;
              _height = 200;
            } else {
              _width = 100;
              _height = 100;
            }
          });
        },
      ),
      RaisedButton(
        child: Text('平移'),
        onPressed: () {
          setState(() {
            if (_alignment == Alignment.topLeft) {
              _alignment = Alignment.bottomRight;
            } else {
              _alignment = Alignment.topLeft;
            }
          });
        },
      ),
      RaisedButton(
        child: Text('边框圆角'),
        onPressed: () {
          setState(() {
            if (_borderRadius == 0) {
              _borderRadius = 100;
            } else {
              _borderRadius = 0;
            }
          });
        },
      ),
      RaisedButton(
        child: Text('颜色'),
        onPressed: () {
          setState(() {
            if (_color == Colors.red) {
              _color = Colors.deepPurple;
            } else {
              _color = Colors.red;
            }
          });
        },
      ),
    ]);
  }
}
