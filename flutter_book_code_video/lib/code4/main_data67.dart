import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///5.2 /lib/code3/main_data67.dart
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
    return buildBodyFunction5();
  }

  ///5.2 01 /lib/code3/main_data67.dart
  /// 文本显示组件Text
  Widget buildBodyFunction() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "这是一个标题"
          , style: TextStyle(
          ///用来配制文字的颜色
          color: Colors.red,
        ),
        ),
      ),
      body: Center(child: Text("内容主体"),),);
  }

  ///5.2 /lib/code3/main_data67.dart
  /// 文本显示组件Text
  Widget buildBodyFunction2() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "这是一个标题"
          , style: TextStyle(

          ///用来配制文字的颜色
          color: Colors.red,

          ///文字的大小
          fontSize: 16,

          ///文字的背景颜色配置
          backgroundColor: Colors.yellow,

          ///文字加粗
          fontWeight: FontWeight.bold,

          ///正规体
          fontStyle: FontStyle.normal,

          ///字与字的间隔
          letterSpacing: 2,
          //单词之间的间距
          wordSpacing: 4,

          ///文字的对齐基线
          textBaseline: TextBaseline.alphabetic,
          height: 1,

        ),
        ),
      ),
      body: Center(child: Text("内容主体"),),);
  }

  ///5.2 /lib/code3/main_data67.dart
  /// 文本显示组件Text
  Widget buildBodyFunction3() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "这是一个标题"
        ),
      ),
      body: Container(child: Center(
        child: Column(children: [
          Text("inherit: true", style: TextStyle(
            ///文字的大小
            fontSize: 16,
            inherit: true,),),
          Text("inherit: false ", style: TextStyle(
            ///文字的大小
            fontSize: 16,
            inherit: false,),),

        ],),),color: Colors.grey,));
  }


  ///5.2 /lib/code3/main_data67.dart
  /// 文本显示组件Text
  Widget buildBodyFunction4() {
   Paint paint =  Paint();
   paint.color=Colors.blue;
   paint.strokeCap=StrokeCap.square;
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "这是一个标题"
          ),
        ),
        body: Container(child: Center(
          child: Column(children: [
            Text("inherit: true", style: TextStyle(
              ///文字的大小
              fontSize: 16,
              color: Colors.yellow,
              background:paint ,
//              backgroundColor: Colors.deepOrange,
              inherit: true,),),

            SizedBox(height: 100,),
            Text("inherit: false ", style: TextStyle(
              ///文字的大小
              fontSize: 16,
              inherit: false,),),

          ],),),color: Colors.grey,));
  }


  ///5.2 /lib/code3/main_data67.dart
  /// 文本显示组件Text
  Widget buildBodyFunction5() {
    ///获取devicePixelRatio
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    //屏幕宽度
    double width = MediaQuery.of(context).size.width;
    //屏幕高度
    double height = MediaQuery.of(context).size.height;
    ///日志输出
    print("当前设备的 width为 $width height为 $height devicePixelRatio为$devicePixelRatio");

    ///定义
    double fontSize =16.0;
    ///设置中的文字的实际大小计算
    double practicalFontSize = fontSize * devicePixelRatio;
    print("设备中的实际文字大小为 $practicalFontSize");

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "这是一个标题"
          ),),
        body: Container(child: Center(
          child: Column(children: [
            Text("inherit: true", style: TextStyle(
              ///文字的大小
              fontSize: 16,
              color: Colors.yellow,
              backgroundColor: Colors.deepOrange,
              inherit: true,),),
    ]

    ),),),);
  }

}