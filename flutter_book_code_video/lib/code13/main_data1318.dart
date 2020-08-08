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
class InkWellUsePage2 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1318.dart
//Inkew
class _TestPageState extends State<InkWellUsePage2> {
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
            buildInkWellContainer(),
            SizedBox(
              height: 40,
            ),

            buildInkWellContainer2(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer3(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  //lib/code/main_data1318.dart
  ///通过 [InkWell] 为 [Container]设置点击事件
  ///通过 [Ink] 来添加背景样式
  Widget buildInkWellContainer() {
    return new Material(
      child: new Ink(
        color: Colors.blue,
        child: new InkWell(
          //点击事件回调
          onTap: () {},
          //不要在这里设置背景色，否则会遮挡水波纹效果,
          child: buildContainer(),
        ),
      ),
    );
  }

  //lib/code/main_data1318.dart
  ///通过 [InkWell] 为 [Container]设置点击事件
  ///通过 [Ink] 来添加背景样式
  Widget buildInkWellContainer2() {
    return new Material(
      child: new Ink(
        ///内边距
        padding: EdgeInsets.all(2),
        ///限定子Widget的宽高
        width: 300,height: 50,
        ///背景颜色
        ///color: Colors.blue,
        ///与color属性不能同时设置
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius:new BorderRadius.circular(18.0),
        ),
        child: new InkWell(
          //点击事件回调
          onTap: () {},
          //不要在这里设置背景色，否则会遮挡水波纹效果,
          child: buildContainer(),
        ),
      ),
    );
  }
  //lib/code/main_data1318.dart
  ///通过 [InkWell] 为 [Container]设置点击事件
  ///通过 [Ink] 来添加背景样式
  Widget buildInkWellContainer3() {
    return new Material(
      child: new Ink(
        ///内边距
        padding: EdgeInsets.all(2),
        ///限定子Widget的宽高
        width: 300,height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          ///配置Ink的边框圆角
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: new InkWell(
          ///设置与Ink相同的边框圆角
          borderRadius: BorderRadius.all(Radius.circular(25)),
          //点击事件回调
          onTap: () {},
          //不要在这里设置背景色，否则会遮挡水波纹效果,
          child: buildContainer(),
        ),
      ),
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
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        );
  }


}
