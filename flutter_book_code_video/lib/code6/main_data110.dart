import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data109.dart
///  Container BoxDecoration boxShadow 阴影
class ContainerBoxShadowPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration boxShadow 阴影
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
            height:  MediaQuery.of(context).size.height,
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

  ///6 /lib/code6/main_data109.dart
  ///  Container BoxDecoration boxShadow 阴影
  Container buildBorder5() {
    return Container(
        //子Widget居中对齐
        alignment: Alignment.center,
        width: 200,height: 100,
        decoration: new BoxDecoration(
          color: Colors.blue,
          ///可配置多组阴影效果
          boxShadow: [
            //配制阴影
            BoxShadow(
              ///阴影的颜色
              color: Colors.red,
              //阴影在x轴与y轴上的偏移量
              offset: Offset(10.0, 10.0),
              //模糊半径
              blurRadius: 20.0,
              //阴影的延伸量
              spreadRadius: 10,
            )
          ],
        ),
        child: Text("配置阴影"),
    );
  }
}
