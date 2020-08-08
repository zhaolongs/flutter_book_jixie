import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data116.dart
///  Container ShapeDecoration
class ContainerShapeDecorationPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration
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
                  padding: EdgeInsets.only(top: 60),
                ),
                buildBorder7(),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                buildBorder5(),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                buildBorder2(),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                buildBorder1(),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                buildBorder3(),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                buildBorder4(),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                buildBorder6(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过Border来创建边框样式
  Container buildBorder1() {
    return Container(
      width: 100,
      height: 100,
      decoration: new ShapeDecoration(
        ///填充的颜色
        color: Colors.grey,

        ///通过Border来构建边框装饰样式
        shape: Border.all(

            ///边框的颜色
            color: Colors.red,
            ///取值BorderStyle.solid表示显示边框装饰样式
            ///取值BorderStyle.none表示不显示边框装饰样式
            style: BorderStyle.solid,
            ///边框的宽度
            width: 4),
      ),
    );
  }

  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过 UnderlineInputBorder 来创建边框样式
  Container buildBorder2() {
    return Container(
      width: 100,
      height: 100,
      decoration: new ShapeDecoration(
        ///填充的颜色
        color: Colors.grey,
        ///只有下边框
        shape: UnderlineInputBorder(
          //边框样式
          borderSide: BorderSide(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 4),
        ),
      ),
    );
  }
  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过 RoundedRectangleBorder 来创建边框样式
  Container buildBorder3() {
    return Container(
      width: 100,
      height: 100,
      decoration: new ShapeDecoration(
        ///填充的颜色
          color: Colors.grey,
          ///圆角矩形边框
          shape: RoundedRectangleBorder(
              ///四个角的配置
              borderRadius: BorderRadius.all(Radius.circular(10)),
              //边框样式
              side: BorderSide(
                  color: Colors.red, style: BorderStyle.solid, width: 2))),
    );
  }

  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过 CircleBorder 来创建边框样式
  Container buildBorder4() {
    return Container(
      width: 100,
      height: 100,
      decoration: new ShapeDecoration(
        ///填充的颜色
          color: Colors.grey,
          ///圆形装饰
          shape: CircleBorder(
            ///边框样式
              side: BorderSide(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 2),
          ),
      ),
    );
  }
  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过 StadiumBorder 来创建边框样式
  Container buildBorder5() {
    return Container(
      width: 200,
      height: 100,
      decoration: new ShapeDecoration(
        ///填充的颜色
        color: Colors.grey,
        //体育场椭圆形装饰
        shape: StadiumBorder(
            side: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: Colors.red),
        ),
      ),
    );
  }

  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过 CircleBorder 来创建边框样式
  Container buildBorder6() {
    return Container(
      width: 100,
      height: 200,
      decoration: new ShapeDecoration(
        ///填充的颜色
        color: Colors.grey,
        //椭圆形装饰
        shape: StadiumBorder(
            side: BorderSide(
                width: 2,
                style: BorderStyle.solid,
                color: Colors.red),
        ),
      ),
    );
  }
  ///7 /lib/code6/main_data116.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过 BeveledRectangleBorder 来创建边框样式
  Container buildBorder7() {

    return Container(

      width: 100,
      height: 100,
      decoration: new ShapeDecoration(
        ///填充的颜色
          color: Colors.grey,
          ///多棱角装饰
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              side: BorderSide(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 2))),
    );
  }
}
