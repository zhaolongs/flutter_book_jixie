import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data111.dart
///  Container BoxDecoration gradient 渐变颜色过渡
class ContainerGradientPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///6 /lib/code6/main_data111.dart
  ///  Container BoxDecoration  gradient 渐变颜色过渡
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
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder5(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///6 /lib/code6/main_data111.dart
  ///  Container BoxDecoration  gradient 线性渐变颜色过渡
  Container buildBorder5() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
          color: Colors.blue,
          // 线性渐变
          gradient: LinearGradient(
            ///渐变过渡的颜色体系
            colors: [Colors.blue, Colors.yellow, Colors.red],
            ///过渡的开始位置
            begin: FractionalOffset(0.5, 0),
            ///过渡的结束位置
            end: FractionalOffset(1, 1),
          )),
      child: Text("配置渐变颜色"),
    );
  }
  ///6 /lib/code6/main_data111.dart
  ///  Container BoxDecoration  gradient 线性渐变颜色过渡
  Container buildBorder6() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
          color: Colors.blue,
          // 线性渐变
          gradient: LinearGradient(
            ///渐变过渡的颜色体系
            colors: [Colors.blue, Colors.yellow, Colors.red],
            ///过渡的开始位置
            begin: Alignment.topCenter,
            ///过渡的结束位置
            end: Alignment.bottomRight,
          )),
      child: Text("配置渐变颜色"),
    );
  }
}
