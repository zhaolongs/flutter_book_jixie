import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7002.dart
///
class MaterialButtonRow extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State  {

  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [

          buildMaterialButton(),

      ],),),
    );
  }

  //lib/code7/main_data7002.dart
  ///MaterialButton的子Widgwet配置
  buildMaterialButton() {
    return MaterialButton(
      ///按钮上显示的内容
      child: Container(
        ///左右排列显示
        child: Row(
          ///子Widget居中显示
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mail,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "点击这里发送邮件",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      color: Colors.grey,
      ///按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
    );
  }
}
