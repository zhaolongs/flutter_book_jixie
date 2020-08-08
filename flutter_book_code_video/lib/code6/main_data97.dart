import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///6 /lib/code6/main_data97.dart
///  Container基本使用
class ContainerUsePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "示例",
          ),
        ),
        body: Container(
          child: Text("请输入文本内容"),
        ),
      ),
    );
  }

}
