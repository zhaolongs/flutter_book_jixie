import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class InkWellUsePage4 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1320.dart
//Inkew
class _TestPageState extends State<InkWellUsePage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点击事件"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer3(),
          ],
        ),
      ),
    );
  }

  //lib/code/main_data1320.dart
  ///相关颜色属性配制
  Widget buildInkWellContainer3() {
    return new InkWell(
      customBorder: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: new BorderSide(
            style: BorderStyle.none,
          )),
      //点击事件回调
      onTap: () {
        print("onTap 单击回调");
      },

      ///需要设置点击事件的子Widget
      //不要在这里设置背景色，否则会遮挡水波纹效果,
      child: buildContainer(),
    );
  }

  ///常见的子类
  Container buildContainer() {
    return new Container(
      width: 300.0,
      height: 50.0,
      //设置child 居中
      alignment: Alignment(0, 0),
      child: Text(
        "登录",
        style: TextStyle(color: Colors.red, fontSize: 16.0),
      ),
    );
  }
}
