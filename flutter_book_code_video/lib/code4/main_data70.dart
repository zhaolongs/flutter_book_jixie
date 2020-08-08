import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///5.2 /lib/code3/main_data70.dart
/// 文本显示组件Text
///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
//    return buildBodyFunction();
//    return buildBodyFunction2();
//    return buildBodyFunction3();
//    return buildBodyFunction4();
//    return buildBodyFunction5();
    return buildBodyFunction6();
  }

  ///5.2 /lib/code3/main_data70.dart
  /// 文本显示组件Text样式TextStyle中decoration 的样式
  Widget buildBodyFunction() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Text("inherit: true",
              style: TextStyle(
                ///文字的大小
                  fontSize: 25,
                  ///设置中间删除装饰样式
                  decoration: TextDecoration.lineThrough,
                ///配置删除线为红色
                decorationColor: Colors.red,
                ///双线样式
                decorationStyle: TextDecorationStyle.wavy,
              ),),
          ]
          ),));
  }
  ///5.2 /lib/code3/main_data70.dart
  /// 文本显示组件Text样式TextStyle中decoration 组合多组装饰样式
  Widget buildBodyFunction2() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Text("inherit: true",
              style: TextStyle(
                ///文字的大小
                  fontSize: 22,
                  ///设置文本的装饰样式
                  ///TextDecoration.combine 接收的是一个List参数 用来组合多个样式
                  decoration: TextDecoration.combine([
                    TextDecoration.overline,
                    TextDecoration.underline,
                  ]),
              ),),
          ]
          ),));
  }

  ///5.9 /lib/code3/main_data70.dart
  /// 文本显示组件Text样式TextStyle中decoration 的粗线
  Widget buildBodyFunction3() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Text("inherit: true",
              style: TextStyle(
                ///文字的大小
                fontSize: 25,
                ///设置中间删除装饰样式
                decoration: TextDecoration.lineThrough,
                ///配置删除线为红色
                decorationColor: Colors.red,
                ///双线样式波浪
                decorationStyle: TextDecorationStyle.wavy,
                ///加粗
                decorationThickness: 3,
                  fontFamily: "HanaleiFill"
              ),),
          ]
          ),));
  }
  ///5.10 /lib/code3/main_data70.dart
  /// 文本显示组件Text样式TextStyle中
  /// 字体fontFamily配置
  Widget buildBodyFunction4() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Text("inherit: true",
              style: TextStyle(
                ///文字的大小
                  fontSize: 25,
                  fontFamily: "Schyler"
              ),),
            SizedBox(height: 40,),
            Text("UniTortred 字体",
              style: TextStyle(
                ///文字的大小
                  fontSize: 25,
                ///引用圆滑的自定义字体
                fontFamily: "UniTortred"

              ),),

            SizedBox(height: 40,),
            Text("Regular 字体",
              style: TextStyle(
                ///文字的大小
                  fontSize: 25,
                  ///引用圆滑的自定义字体
                  fontFamily: "Regular",
                  ///支持的字体列表
                  fontFamilyFallback: <String>['Ubuntu', 'Cantarell', 'DejaVu Sans', 'Liberation Sans', 'Arial'],
              ),),

          ]
          ),));
  }

  ///5.11 /lib/code3/main_data70.dart
  /// 文本显示组件Text样式TextStyle中
  /// 阴影样式 配置 配置
  Widget buildBodyFunction5() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [

            Text("Regular 字体",
              style: TextStyle(
                ///文字的大小
                fontSize: 25,
                ///引用圆滑的自定义字体
                fontFamily: "Regular",
               ///配置字体阴影
               shadows:[
                 BoxShadow(
                   ///阴影的颜色
                   color: Color(0xffff0000),
                   ///偏移题
                   offset: Offset(2,1),
                   ///模糊度
                   spreadRadius: 5.0,
                 )
               ],
              ),),

          ]
          ),));
  }

  ///5.11 /lib/code3/main_data70.dart
  /// 文本显示组件Text样式TextStyle中
  /// 多行文本显示
  Widget buildBodyFunction6() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [

            Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念",
              style: TextStyle(
                ///文字的大小
                fontSize: 25,
                height: 1.0
              ),),
          ]
          ),));
  }


  ///5.11 /lib/code3/main_data70.dart
  /// 文本显示组件Text样式TextStyle中
  /// 多行文本显示
  Widget buildBodyFunction7() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [

            Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念",
              style: TextStyle(
                locale: Locale("",""),
                ///文字的大小
                  fontSize: 25,
                  height: 1.0
              ),),
          ]
          ),));
  }

}