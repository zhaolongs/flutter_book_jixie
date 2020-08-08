import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data97.dart
///  Container 样式
class ContainerDecorationAndColorPage extends StatefulWidget {
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
          width: 200,
          height: 100,
          color: Colors.white,
          decoration: BoxDecoration(),
          child: Text("过于沉静的外表,恰恰诠释着他内心的沉重"),
        ),
      ),
    );
  }
}
