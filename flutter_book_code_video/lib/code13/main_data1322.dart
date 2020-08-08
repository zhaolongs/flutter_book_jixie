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
class InkWellUsePage6 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1322.dart
//Inkew
class _TestPageState extends State<InkWellUsePage6> {
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
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer1()
          ],
        ),
      ),
    );
  }

  //lib/code/main_data1322.dart
  ///使用InkResponse为图片添加点击事件
  Widget buildInkWellContainer3() {
    return new Material(
      child: new Ink(
        child: new InkResponse(
          child: new Container(
            //设置child 居中
            alignment: Alignment(0, 0),
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
            ),
          ),
        ),
      ),
    );
  }

  //lib/code/main_data1322.dart
  ///使用InkResponse为图片添加点击事件
  Widget buildInkWellContainer1() {
    return new Material(
      child: new Ink(
        child: new InkWell(
          onTap: (){
            print("图片点击事件");
          },
          child: new Container(
            height: 200,
            //设置child 居中
            alignment: Alignment(0, 0),
            child: Ink.image(
              image: AssetImage("assets/images/2.0x/banner1.webp",),
            ),
          ),
        ),
      ),
    );
  }


}
