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
class InkWellUsePage5 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1321.dart
//Inkew
class _TestPageState extends State<InkWellUsePage5> {
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

  //lib/code/main_data1321.dart
  ///实现圆角矩形的效果
  Widget buildInkWellContainer3() {
    return new Material(
      child: new Ink(
        //设置背景
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
        ),
        child: new InkResponse(
          borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
          //点击或者toch控件高亮时显示的控件在控件上层,水波纹下层
//          highlightColor: Colors.purple[800],
          //点击或者toch控件高亮的shape形状
          //BoxShape.rectangle 矩形
          //BoxShape.circle 圆形
          highlightShape: BoxShape.rectangle,
          //.InkResponse内部的radius这个需要注意的是，
          //需要半径大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
          //水波纹的半径
          radius: 1000.0,
          //水波纹的颜色 设置了highlightColor属性后 splashColor将不起效果
          splashColor: Colors.grey,
          //true表示要剪裁水波纹响应的界面
          // false不剪裁  如果控件是圆角不剪裁的话水波纹是矩形
          containedInkWell: true,
          onTap: () {
            print('click');
          },
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
        style: TextStyle(color: Colors.red, fontSize: 16.0),
      ),
    );
  }
}
