import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///6 /lib/code6/main_data98.dart
///  Container 的大小限定
class ContainerSizePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///6 /lib/code6/main_data98.dart
///  Container 的大小限定
///  Container 填充父布局
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "示例",
        ),
      ),
      body: Container(
        color: Colors.grey,
      ),
    );
  }
}
