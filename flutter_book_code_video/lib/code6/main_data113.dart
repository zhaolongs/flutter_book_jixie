import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data112.dart
///  Container BoxDecoration gradient Radial 环形渐变颜色过渡
class ContainerRadialGradientPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  gradient Radial 环形渐变颜色过渡
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

  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  Radial 环形渐变颜色过渡
  Container buildBorder1() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 200,
      decoration: new BoxDecoration(
        color: Colors.blue,
        // 环形渐变
        gradient: RadialGradient(
          ///渐变过渡的颜色体系
          colors: [Colors.red,Colors.yellow, Colors.black, ],
          //渐变颜色的过渡半径
          //由Container的短边决定
          radius: 0.5,
          //过渡半径之外的颜色填充模式
          // 默认是clamp，直接使用colors中配置的最后一个颜色填充
          //如这里配置的黑色
          tileMode: TileMode.clamp,
          //中心点 默认就是当前Container的中心
          //也可以通过Alignment.center来配置
          center: FractionalOffset(0.5, 0.5),
        ),
      ),
      child: Text("配置渐变颜色"),
    );
  }
  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  Radial 环形渐变颜色过渡
  Container buildBorder2() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 200,
      decoration: new BoxDecoration(
        color: Colors.blue,
        // 环形渐变
        gradient: RadialGradient(
          ///渐变过渡的颜色体系
          colors: [Colors.red,Colors.yellow, Colors.black, ],
          //渐变颜色的过渡半径
          //由Container的短边决定
          radius: 0.3,
          //过渡半径之外的颜色填充模式
          // 默认是clamp，直接使用colors中配置的最后一个颜色填充
          //如这里配置的黑色
          tileMode: TileMode.clamp,
          //中心点 默认就是当前Container的中心
          //也可以通过Alignment.center来配置
          center: FractionalOffset(0.5, 0.5),
        ),
      ),
      child: Text("配置渐变颜色"),
    );
  }

}
