import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data114.dart
///  Container BoxDecoration shape属性配置说明
class ContainerShapePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///7 /lib/code6/main_data114.dart
  ///  Container BoxDecoration shape属性配置说明
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
                buildBorder2(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder1(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///7 /lib/code6/main_data114.dart
  ///  Container BoxDecoration shape属性配置说明
  Container buildBorder1() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: new BoxDecoration(
          color: Colors.blue,
          // 环形渐变
          shape: BoxShape.rectangle),
      child: Text("shape配置"),
    );
  }

  ///7 /lib/code6/main_data114.dart
  ///  CContainer BoxDecoration shape属性配置说明
  Container buildBorder2() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: new BoxDecoration(
          color: Colors.blue,
          // Container形状配置
          shape: BoxShape.circle),
      child: Text("shape配置"),
    );
  }

}
