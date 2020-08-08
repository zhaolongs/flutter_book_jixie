import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data116.dart
///  Container Transform
class ContainerMatrix4Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///7 /lib/code6/main_data116.dart
  ///  Container Transform
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
                buildBorder1(),

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
    double x = 2;
    double y = 0;
    double z = 0;
    return Container(
      width: 300,
      height: 100,
      transform: Matrix4(
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        0,0,0,1,
      )..rotateX(x)..rotateY(y)..rotateZ(z),
      decoration: new BoxDecoration(
        ///配置填充图像
        color: Colors.red,
        ///配置背景图像
        image: DecorationImage(
          ///加载图片
            image: AssetImage("assets/images/2.0x/head1.png"),
            ///填充
            fit: BoxFit.fill),
      ),
    );
  }


}
