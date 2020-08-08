import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/demo/text_tag_widget.dart';
//import 'package:flutter_tag_layout/flutter_tag_layout.dart';

/// lib/code4/main_data401.dart
class TextTagPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<TextTagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("文本标签"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            buildTextTagWidget(),
            SizedBox(
              height: 40,
            ),
            buildTextTagWidget2(),
            SizedBox(
              height: 40,
            ),
            buildTextTagWidget3(),
            SizedBox(
              height: 40,
            ),
            buildTextTagWidget4(),
          ]),
        ));
  }

  /// lib/code4/main_data401.dart
  ///默认样式的文本标签
  buildTextTagWidget() {
    return TextTagWidget("文本标签");
  }

  /// lib/code4/main_data401.dart
  ///指定背景颜色的文本标签
  buildTextTagWidget2() {
    return TextTagWidget(
      "文本标签",
      backgroundColor: Colors.brown,
    );
  }

  /// lib/code4/main_data401.dart
  ///指定边框颜色的文本标签
  buildTextTagWidget3() {
    return TextTagWidget(
      "文本标签",
      borderColor: Colors.blue,
    );
  }

  /// lib/code4/main_data401.dart
  ///指定边框颜色的文本标签
  buildTextTagWidget4() {
    return TextTagWidget(
      "文本标签",
      borderColor: Colors.red,
      backgroundColor: Colors.brown,
    );
  }
}
