
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///5.1 /lib/code3/main_data66.dart
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

class _FirstPageState extends State<FirstPage>{

  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
  }

  ///5.1 /lib/code3/main_data66.dart
  /// 文本显示组件Text
  Widget buildBodyFunction() {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是一个标题"),
      ),
      body: Center(child: Text("内容主体"),),);
  }


}