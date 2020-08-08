import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7001.dart
///
class MaterialButtonBaseUse extends StatefulWidget {
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

          buildMaterialButton13(),

      ],),),
    );
  }
  //lib/code7/main_data7001.dart宽高限定
  buildMaterialButton13() {
    return  MaterialButton(
          ///设置子Button的内边距
          padding: EdgeInsets.only(left: 40),
        ///按钮上显示的文字
          child: Text('登录'),
          ///配置背景颜色
          color: Colors.blue,
          onPressed: () {
            print("点击事件");
          });
  }
  //lib/code7/main_data7001.dart
  /// MaterialButton的宽高限定
  buildMaterialButton12() {
    return Container(
      width: 300,
      height: 60,
      child: MaterialButton(
          ///按钮上显示的文字
          child: Text('登录'),
          ///配置背景颜色
          color: Colors.blue,
          onPressed: () {
            print("点击事件");
          }),
    );
  }

  //lib/code7/main_data7001.dart
  /// MaterialButton的宽高限定
  buildMaterialButton11() {
    return MaterialButton(
        ///设置按钮的最小宽度
        minWidth: 200,
        ///设置按钮的高度
        height: 60,
        ///按钮上显示的文字
        child: Text('登录'),
        ///配置背景颜色
        color: Colors.blue,
        onPressed: () {
          print("点击事件");
        });
  }

  //lib/code7/main_data7001.dart
  /// shape使用分析  BeveledRectangleBorder设置 多边形
  buildMaterialButton10() {
    return MaterialButton(
      ///按钮上显示的文字
      child: Text('登录'),
      /// 设置 多边形边框
      shape:BeveledRectangleBorder(
        ///边框样式
          side: BorderSide(width: 2,color: Colors.red),
          ///边框角度
          borderRadius: BorderRadius.all(Radius.circular(10)))

    );
  }
  //lib/code7/main_data7001.dart
  /// shape使用分析 CircleBorder 用来设置圆形边框
  buildMaterialButton9() {
    return MaterialButton(
      ///按钮上显示的文字
      child: Text('登录'),
      ///按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
      /// 椭圆形边框
      shape:StadiumBorder(side: BorderSide(width: 2,color: Colors.red)),
    );
  }
  //lib/code7/main_data7001.dart
  /// shape使用分析 CircleBorder 用来设置圆形边框
  buildMaterialButton8() {
    return MaterialButton(
      ///按钮上显示的文字
        child: Text('登录'),
        ///按钮的点击事件
        onPressed: () {
          print("点击了按钮");
        },
        /// 用来设置圆形边框
        shape:CircleBorder(side: BorderSide(width: 2,color:Colors.red )),
    );
  }
  //lib/code7/main_data7001.dart
  /// shape使用分析 RoundedRectangleBorder 创建圆角矩形边框
  buildMaterialButton7() {
    return MaterialButton(
      ///按钮上显示的文字
        child: Text('登录'),
        ///按钮的点击事件
        onPressed: () {
          print("点击了按钮");
        },
      /// 用来设置圆角矩形边框
      shape:RoundedRectangleBorder(
          //边框样式
          side: BorderSide(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid),
          ///边框的圆角
          borderRadius: BorderRadius.all(Radius.elliptical(10,20)))
    );
  }
//lib/code7/main_data7001.dart
  /// shape使用分析
  buildMaterialButton6() {
    return MaterialButton(
      ///按钮上显示的文字
      child: Text('登录'),
      ///按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
      ///可以分别设置边框
      shape: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid),
          borderRadius: BorderRadius.circular(10))
    );
  }
  //lib/code7/main_data7001.dart
  /// shape使用分析 Border构造函数创建Button
  buildMaterialButton5() {
    return MaterialButton(
      ///按钮上显示的文字
      child: Text('登录'),
      ///按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
      ///可以分别设置边框
      shape: Border(
        ///底部边框
          bottom: BorderSide(color: Colors.blue,width:3,style:  BorderStyle.solid),
          //顶部边框
          top: BorderSide(color: Colors.yellow,width: 2.5,style:  BorderStyle.solid),
          ///左边边框
          left: BorderSide(color: Colors.deepPurple,width: 12,style:  BorderStyle.solid),
          ///右边边框
          right: BorderSide(color: Colors.deepOrange,width: 2.5,style:  BorderStyle.solid),
      ),
    );
  }

  //lib/code7/main_data7001.dart
  /// shape使用分析
  buildMaterialButton4() {
    return MaterialButton(
      ///按钮上显示的文字
      child: Text('登录'),
      ///按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
      ///同时配置四个边框
      shape: Border.all(
        ///边框的颜色
          color: Colors.deepOrange,
          ///边框的宽度
          width: 2.5,
          /// 取值为 BorderStyle.solid 表示使用这个边框样式配置
          /// 取值为 BorderStyle.none 表示不使用这个边框样式配置
          style:  BorderStyle.solid),
    );
  }
  //lib/code7/main_data7001.dart
  ///按钮的事件回调
  buildMaterialButton3() {
    return MaterialButton(
        ///按钮上显示的文字
        child: Text('登录'),
        ///按钮的点击事件
        onPressed: () {
          print("点击了按钮");
        },
        ///按钮按下时回调 value = true
        ///按钮抬起时回调 value = false
        ///要先于 onPressed
        onHighlightChanged: (value) {
          print("按钮点击 Hight $value");
        },
        ///按钮的长按事件
        onLongPress: () {
          print("长按按钮");
        });
  }

  //lib/code7/main_data7001.dart
  ///Material Design风格按钮的基本使用
  buildMaterialButton() {
    return MaterialButton(
      ///按钮上显示的文字
      child: Text('登录'),
      ///按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
    );
  }

  //lib/code7/main_data7001.dart
  ///Material Design风格按钮的基本使用
  buildMaterialButton2() {
    return MaterialButton(
      minWidth: 200,
      ///按钮的背景
      color: Colors.blue,
      ///按钮点击下的颜色
//      highlightColor:Colors.blue[700],
      ///按钮上显示的文字
      child: Text('登录'),
      ///配制按钮上文本的颜色
      textColor: Colors.deepOrange,
      ///未设置点击时的背景颜色 也就是当onPressed: null,时显示这个颜色配置
      disabledColor:Colors.yellow ,

      ///水波方的颜色
      splashColor: Colors.green,
      ///按钮的阴影
      elevation: 10,
      ///按钮按下时的阴影高度
      highlightElevation: 20,
      ///未设置点击时的阴影高度
      disabledElevation: 5.0,
      ///按钮的点击事件
      onPressed: () {
        print("点击了按钮");
      },
    );
  }
}
