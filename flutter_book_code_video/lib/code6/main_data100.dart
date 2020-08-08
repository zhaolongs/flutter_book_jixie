import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///7 /lib/code6/main_data100.dart
///  Container 的大小限定
class ContainerSizeBoxSelfPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///7/lib/code6/main_data100.dart
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
      body: SizedBox(
        width: 200,
        height: 200,
        ///Container自身配置的100会被父组件配置的200覆盖
        child: Container(
          width: 100,
          height: 100,
          color: Colors.grey,
        ),
      ),
    );
  }
}
