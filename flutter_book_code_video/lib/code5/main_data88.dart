import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data88.dart
/// countText的样式配置
class TextFieldCountTextPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
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
              Text("请输入11位用户名"),
              buildTextFieldFunction1(),
              SizedBox(
                height: 50,
              ),
              buildTextFieldFunction1(),
            ],
          ),
        ));
  }

  buildTextFieldFunction1() {
    return new TextField(
      //最多可输入11位
      maxLength: 11,

      ///当字数超出maxLength设置的大小进仍然可输入
      maxLengthEnforced: false,
      //边框样式设置
      decoration: InputDecoration(
          //输入的字数小于等于maxLength限制的大小时使用的文本样式
          counterStyle: TextStyle(color: Colors.blue, fontSize: 18.0),
          //输入的字数大于maxLength限制的大小时使用的文本样式
          errorStyle: TextStyle(color: Colors.deepOrange, fontSize: 22.0)),
    );
  }

  buildTextFieldFunction2() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        //输入的字数小于等于maxLength限制的大小时使用的文本样式
        counterStyle: TextStyle(color: Colors.blue, fontSize: 18.0),
      ),
    );
  }
}
