import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //根视图
    return MaterialApp(
      //应用主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //应用默认显示的页面
      home: MyHomePage(),
    );
  }
}

//应用显示的第一个页面
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //页面脚手架
    return Scaffold(
      //标题
      appBar: AppBar(
        title: Text("第一个Flutter应用程序"),
      ),
      //中间显示的一个文本
      body: Center(
        child: Text(
          "Hello World",
          //文本样式
          style: TextStyle(
              //文本大小
              fontSize: 33,
              //文本加粗
              fontWeight: FontWeight.bold),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
