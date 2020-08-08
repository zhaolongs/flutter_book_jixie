
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

///4.11 /lib/code3/main_data64.dart
/// AppBar的shape属性分析
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{



  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
  }

 ///4.11 /lib/code3/main_data64.dart
  /// AppBar的shape属性分析
  Widget buildBodyFunction() {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是一个标题"),
        leading: Icon(Icons.home),
        //矩形边框
        shape:BeveledRectangleBorder(
            //设置边框
            side: BorderSide(
              //边框的颜色
                color: Colors.red,
                //的宽度
                width: 4),) ,
      ),
      body: Center(child: Text("内容主体"),),);
  }

  Widget buildBodyFunction2() {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool b) {
          return [
            SliverAppBar(
              actions: [],
            elevation: 12,

              centerTitle: true,
              //固定在顶部
              pinned: true,

              title: Text("这是一个标题"), leading: Icon(Icons.home),)
          ];
        },
        body: Center(child: Text("内容主体"),),),);
  }

}