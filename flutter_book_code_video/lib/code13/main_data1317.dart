import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/common/common_view.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class InkWellUsePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1317.dart
//Inkew
class _TestPageState extends State<InkWellUsePage> {
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
            buildCenterText(),
            SizedBox(
              height: 40,
            ),
            buildInkWellText(),
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
            buildInkWellContainer4(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer5(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer6(),
            SizedBox(
              height: 40,
            ),
            buildInkWellContainer7(),
          ],
        ),
      ),
    );
  }

  //lib/code/main_data1317.dart
  ///Text设置点击事件
  Widget buildCenterText() {
    return GestureDetector(
      onTap: () {},
      child: Text("测试文字"),
    );
  }

  ///通过 InkWell Text设置点击事件
  Widget buildInkWellText() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("测试文字"),
      ),
    );
  }

  //lib/code/main_data1317.dart
  ///通过 InkWell Container设置点击事件
  ///InkWell的子Widget中设置了背景颜色
  Widget buildInkWellContainer() {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(10),
        child: Text("测试文字"),
      ),
    );
  }

  //lib/code/main_data1317.dart
  ///InkWell的子Widget中设置了背景颜色
  Widget buildInkWellContainer2() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
//          color: Colors.blue,
            ),
        padding: EdgeInsets.all(10),
        child: Text("测试文字"),
      ),
    );
  }

  //lib/code/main_data1317.dart
  ///InkWell的父Widget中设置了背景颜色
  Widget buildInkWellContainer3() {
    return Container(
      color: Colors.red,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text("测试文字"),
        ),
      ),
    );
  }

  ///通过 InkWell Container设置点击事件
  Widget buildInkWellContainer4() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          "测试文字",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  //lib/code/main_data1317.dart
  ///通过 InkWell Container设置点击事件
  ///通过Material来添加背景样式
  Widget buildInkWellContainer5() {
    return new Material(
      // 设置背景颜色 默认矩形
      color: Colors.purple,
      type: MaterialType.card,
      ///阴影的颜色
      shadowColor:Colors.blue,
      ///阴影的高度
      elevation: 12,
      ///边框圆角
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: new InkWell(
        //点击事件回调
        onTap: () {},
        //不要在这里设置背景色，否则会遮挡水波纹效果,
        // 如果设置的话尽量设置Material下面的color来实现背景色
        child: new Container(
          width: 300.0,
          height: 50.0,
          //设置child 居中
          alignment: Alignment(0, 0),
          child: Text(
            "登录",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }

  //lib/code/main_data1317.dart
  ///通过 InkWell Container设置点击事件
  ///通过Material来添加背景样式
  Widget buildInkWellContainer6() {
    return new Material(
      color: Colors.blue,
//     shape: buildMaterialBorder(),
//      shape: buildMaterialBorder2(),
//      shape: buildMaterialBorder3(),
//      shape: buildMaterialBorder4(),
//      shape: buildMaterialBorder5(),
      shape: buildMaterialBorder6(),
      child: new InkWell(
        //点击事件回调
        onTap: () {},
        //不要在这里设置背景色，否则会遮挡水波纹效果,
        // 如果设置的话尽量设置Material下面的color来实现背景色
        child: new Container(
          width: 300.0,
          height: 50.0,
          //设置child 居中
          alignment: Alignment(0, 0),
          child: Text(
            "登录",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
  ///通过BorderDirectional来构建边框样式
  ShapeBorder buildMaterialBorder(){
    ///具有方向性的边框
    return new BorderDirectional(
        //开始位置的边框
        //在国内就是左边框
        start: new BorderSide(
          color: Colors.red, width: 4.0,
        ),
        ///上边框
        top:new BorderSide(
          color: Colors.blue,width: 12.0,
        ),
        ///结束位置的边框
        ///在国内就是右边框
        end: new BorderSide(
          color: Colors.deepOrange, width: 8.0,
        ),
        ///底部边框
        bottom: new BorderSide(
          color: Colors.green, width: 8.0,
        )
    );
  }
  //lib/code/main_data1317.dart
  ///通过Border来构建边框样式
  ShapeBorder buildMaterialBorder2(){
    ///比较直观
    return new Border(
      //开始位置的边框
      //在国内就是左边框
        left: new BorderSide(
          color: Colors.red, width: 4.0,
        ),
        ///上边框
        top:new BorderSide(
          color: Colors.blue,width: 12.0,
        ),
        ///结束位置的边框
        ///在国内就是右边框
        right: new BorderSide(
          color: Colors.deepOrange, width: 8.0,
        ),
        ///底部边框
        bottom: new BorderSide(
          color: Colors.green, width: 8.0,
        )
    );
  }

  //lib/code/main_data1317.dart
  ///通过CircleBorder来构建边框样式
  ShapeBorder buildMaterialBorder3() {
    return new CircleBorder(
        side: BorderSide(
            ///边框颜色
            color: Colors.deepOrange,
            ///边框的宽度
            width: 4.0,
            ///BorderStyle.solid 有边框
            ///BorderStyle.none 无边框
            style: BorderStyle.solid),
    );
  }
  //lib/code/main_data1317.dart
  ///通过RoundedRectangleBorder来构建边框样式
  ShapeBorder buildMaterialBorder4() {
    ///圆角矩形边框
    return  new RoundedRectangleBorder(
      //边框的样式
      side:  BorderSide(
          width: 2.0,
          color: Colors.red
      ),
      ///四周的圆角
      borderRadius:new BorderRadius.circular(20.0),
    );
  }
  //lib/code/main_data1317.dart
  ///通过StadiumBorder来构建边框样式
  ShapeBorder buildMaterialBorder5() {
    ///体育场形状的边框
    return new StadiumBorder(
      side:  BorderSide(
          width: 2.0,
          color: Colors.red
      ),
    );
  }
  //lib/code/main_data1317.dart
  ///通过BeveledRectangleBorder来构建边框样式
  ShapeBorder buildMaterialBorder6() {
    ///斜角矩形边框
    return  new BeveledRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        style: BorderStyle.none,
      ),
      //每个角落的半径
      borderRadius:new BorderRadius.circular(14.0),
    );
  }

  Widget buildInkWellContainer7() {
    return new Material(
      //INK可以实现装饰容器，实现矩形  设置背景色
      child: new Ink(
        //设置背景  默认矩形
        color: Colors.purple,
        child: new InkWell(
          //点击事件回调
          onTap: () {},
          child: new Container(
            width: 300.0,
            height: 50.0,
            //设置child 居中
            alignment: Alignment(0, 0),
            child: Text(
              "登录",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInkWellContainer8() {
    return new Material(
      //INK可以实现装饰容器，实现矩形  设置背景色
      child: new Ink(
        //设置背景  默认矩形
        color: Colors.purple,
        child: new InkWell(
          //点击事件回调
          onTap: () {
            print("父InkWell中的点击效果");
          },
          child: new Container(
            width: 300.0,
            height: 50.0,
            //设置child 居中
            alignment: Alignment(0, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: Material(
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          print("子InkWell中的注册点击效果");
                        },
                        child: Text(
                          "注册",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child: Material(
                      color: Colors.deepOrange,
                      child: InkWell(
                        onTap: () {
                          print("子InkWell中的登录点击效果");
                        },
                        child: Text(
                          "登录",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
