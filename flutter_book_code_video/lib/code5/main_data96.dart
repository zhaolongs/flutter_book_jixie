import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data96.dart
/// 文字对齐方式
class TextFieldFillColorPage extends StatefulWidget {
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
            margin: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //输入文本框
                Text("请输入文本内容"),
                buildTextFieldFunction1(),
              ],
            ),
          )),
    );
  }

  ///6 /lib/code3/main_data96.dart
  /// 文字对齐方式
  buildTextFieldFunction1() {
    return SizedBox(height: 80,child:
    new TextField(
      textAlignVertical: TextAlignVertical(y: 0.5),
      decoration: InputDecoration(
       fillColor: Colors.grey,
//          filled: true,
          focusColor: Colors.deepPurple,
      ),
    ),);
  }

}
