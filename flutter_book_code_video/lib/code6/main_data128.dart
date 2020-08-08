import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code18/main_data128.dart
///ConstrainedBox 的基本使用
class ConstrainedShapePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConstrainedBoxState();
  }
}

///lib/code18/main_data128.dart
///ConstrainedBox 的基本使用
class _ConstrainedBoxState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("shape 样式"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          _buildOutlineInputBorder(),
          _buildUnderlineInputBorder(),
          _buildContinuousRectangleBorder(),
          _buildRoundedRectangleBorder(),
          _buildBorder(),
          _buildBorderDirectional(),
          _buildNoShape()
        ],),
      ),
    );
  }
  Material _buildOutlineInputBorder() {
    return Material(
      color: Colors.orangeAccent,
      elevation: 2,
      shape: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.purple),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 80,
        child: Text(
          "OutlineInputBorder",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Material _buildUnderlineInputBorder() {
    return Material(
      color: Colors.orangeAccent,
      elevation: 2,
      shape: UnderlineInputBorder(
        borderSide: BorderSide(width: 5.0, color: Colors.blue),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 80,
        child: Text(
          "UnderlineInputBorder",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Material _buildContinuousRectangleBorder() {
    return Material(
      color: Colors.orangeAccent,
      elevation: 2,
      shape: ContinuousRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 80,
        child: Text(
          "ContinuousRectangleBorder",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildRoundedRectangleBorder() {
    return Material(
      color: Colors.orangeAccent,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 2,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 80,
        child: Text(
          "RoundedRectangleBorder",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildBorder() {
    return Material(
      color: Colors.orangeAccent,
      shape: Border(
        top: BorderSide(width: 5.0, color: Color(0xFFFFDFDFDF)),
        left: BorderSide(width: 5.0, color: Color(0xFFFFDFDFDF)),
        right: BorderSide(width: 5.0, color: Color(0xFFFF7F7F7F)),
        bottom: BorderSide(width: 5.0, color: Color(0xFFFF7F7F7F)),
      ),
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 80,
        child: Text(
          "Border",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }


  Widget _buildBorderDirectional() {
    return Material(
      color: Colors.orangeAccent,
      shape: BorderDirectional(
          top: BorderSide(
            color: Colors.white,
          ),
          start: BorderSide(
              color: Colors.black,
              width: 15
          ),
          bottom: BorderSide(
            color: Colors.white,
          )
      ),
      elevation: 2,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 80,
        child: Text(
          "BorderDirectional",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildNoShape() {
    return Material(
      color: Colors.orangeAccent,
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        height: 80,
        child: Text(
          "No Shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

}
