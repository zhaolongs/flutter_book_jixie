import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data85-1.dart
/// 描述文本labelText的多样式交互使用
class TextFieldLabelTextStylePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      disabledColor: Colors.deepPurple,
      accentColor:  Colors.deepPurple,
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.yellow,decorationColor: Colors.deepPurple),
      ),
    ),home: buildMainBody(),);
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "登录",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: [
              ///6 /lib/code3/main_data85-1.dart
              /// 描述文本labelText的多样式交互使用
              new TextField(
                //边框样式设置
                decoration: InputDecoration(
                  ///设置获取输入焦点时隐藏labelText
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "用户名",
                  ///设置上下左右 都有边框 设置四个角的弧度
                  enabledBorder: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red)
                  ),
                  focusedBorder: OutlineInputBorder(
                    ///设置边框四个角的弧度
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.blue)
                  ),
                  labelStyle: TextStyle(color: Colors.green),
                ),
              ),
             ]
          ),
        ));
  }
}
