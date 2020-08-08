import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data109.dart
///  Container BoxDecoration配置边框样式
class ContainerDecorationPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration配置边框样式
  Widget buildMainBody(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "示例",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),buildBorder6(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),buildBorder5(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),buildBorder4(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder3(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder2(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorderAndColor3(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorderAndColor2(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorderAndColor()
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration配置边框与填充色样式
  Container buildBorderAndColor() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
        //边框圆角
        borderRadius: new BorderRadius.all(Radius.circular(20)),

        ///填充色
        color: Color(0xFF9E9E9E),
      ),
      child: Text("配置边框与填充色"),
    );
  }

  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration 通过circular函数配置边框无填充色样式
  Container buildBorder2() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
        //边框圆角
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text("配置边框"),
    );
  }
  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration only 分别配置四个角的圆角样式
  Container buildBorder3() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
        //分别配置边框圆角
        //也可以单独配置其中的一个圆角
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4)),
      ),
      child: Text("配置边框"),
    );
  }
  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration vertical 分别配置上下两组的圆角样式
  Container buildBorder4() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
        borderRadius: BorderRadius.vertical(
            ///同时配置topLeft与topRight两个角的圆角样式
            top: Radius.circular(20),
            ///同时配置bottomLeft与bottomRight两圆角的样式
            bottom: Radius.circular(10),)
      ),
      child: Text("配置边框"),
    );
  }
  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration horizontal 分别配置左右两组的圆角样式
  Container buildBorder5() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
          border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
          borderRadius: BorderRadius.horizontal(
            ///同时配置topLeft与bottomLeft两个角的圆角样式
            left: Radius.circular(20),
            ///同时配置topRight与bottomRight两圆角的样式
            right: Radius.circular(10),)
      ),
      child: Text("配置边框"),
    );
  }
  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration horizontal 分别配置左右两组的圆角样式
  Container buildBorder6() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
          border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
          borderRadius: BorderRadius.horizontal(
            ///同时配置topLeft与bottomLeft两个角的圆角样式
            left: Radius.circular(20),
            ///同时配置topRight与bottomRight两圆角的样式
            right: Radius.elliptical(20,30),)
      ),
      child: Text("配置边框"),
    );
  }
  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration 分别配置水平与竖直方向的边框样式
  Container buildBorderAndColor3() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        //通过构造函数来分别创建四个边的边线
        border: Border.symmetric(
          //配置竖直方向的样式，也就是top与bottom边框样式
          vertical: BorderSide(color: Colors.blue, width: 12.0),
          //配置水平方向的样式，也就是left与right边框的样式
          horizontal: BorderSide(color: Colors.deepPurple, width: 22.0),
        ),
      ),
      child: Text("配置边框与填充色"),
    );
  }

  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration配置不同的边框样式
  Container buildBorderAndColor2() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        //通过构造函数来分别创建四个边的边线
        border: new Border(
          ///左边边线
          left: BorderSide(color: Colors.blue, width: 14.0),

          ///右边边线
          right: BorderSide(color: Colors.red, width: 10.0),

          ///顶部边线
          top: BorderSide(color: Colors.deepPurple, width: 10.0),
        ),

        ///填充色
        color: Color(0xFF9E9E9E),
      ),
      child: Text("配置边框与填充色"),
    );
  }

  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration配置边框无填充色样式
  Container buildBorder() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
        //边框圆角
        borderRadius: new BorderRadius.all(Radius.circular(20)),
      ),
      child: Text("配置边框"),
    );
  }
}
