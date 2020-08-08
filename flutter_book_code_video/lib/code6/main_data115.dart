import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data114.dart
///  Container BoxDecoration image属性配置说明
class ContainerImagePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///7 /lib/code6/main_data114.dart
  ///  Container BoxDecoration image属性配置说明
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
                buildBorder3(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder1(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder2(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  ///7 /lib/code6/main_data114.dart
  ///  CContainer BoxDecoration image图像属性配置说明
  Container buildBorder3() {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: new BoxDecoration(
        ///配置填充图像
        color: Colors.red,
        ///配置背景图像
        image: DecorationImage(
          ///加载图片
            image: AssetImage("assets/images/2.0x/logo.jpg"),
            ///填充
            fit: BoxFit.fill),
      ),
    );
  }

  ///7 /lib/code6/main_data114.dart
  ///  CContainer BoxDecoration image图像属性配置说明
  Container buildBorder2() {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: new BoxDecoration(
        ///配置填充图像
        color: Colors.red,
        ///配置背景图像
        image: DecorationImage(
          ///加载图片
            image: AssetImage("assets/images/2.0x/logo.jpg"),
            ///填充
            fit: BoxFit.fill),
      ),
    );
  }

  ///7 /lib/code6/main_data114.dart
  ///  CContainer BoxDecoration image图像属性配置说明
  Container buildBorder1() {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: new BoxDecoration(
        ///配置填充图像
        color: Colors.red,
        ///配置背景图像
        image: DecorationImage(
          ///加载图片
            image: AssetImage("assets/images/2.0x/logo.jpg"),
            ///填充
            fit: BoxFit.fill),
      ),
    );
  }
}
