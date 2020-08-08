import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data94.dart
/// 光标样式配置
class TextFieldCursorPage extends StatefulWidget {
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

  ///6 /lib/code3/main_data94.dart
  /// 光标的属性配置
  buildTextFieldFunction1() {
    return new TextField(
      ///光标的颜色
        cursorColor: Colors.red,
        ///设置光标的 四个角的弧度
        cursorRadius: Radius.circular(10),
        ///设置光标的宽度
        cursorWidth: 6,
        ///值为true时显示光标,为false时，隐藏光标
        showCursor: true,
    );
  }

}
