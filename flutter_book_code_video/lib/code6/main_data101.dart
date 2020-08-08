import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///7 /lib/code6/main_data101.dart
///  Container 的大小限定
class ContainerBodySelfPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///7/lib/code6/main_data101.dart
/// Container 的大小限定
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
        width: 100,
        height: 100,
        color: Colors.grey,
      ),
    );
  }
}
