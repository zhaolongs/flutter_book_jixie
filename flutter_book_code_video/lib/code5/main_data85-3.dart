import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show SystemChannels;

///6 /lib/code3/main_data85-3.dart
/// 输入框焦点事件的捕捉与监听
class TextFieldFocusNodePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  ///焦点控制
  FocusNode focusNode = new FocusNode();

  ///6 /lib/code3/main_data85-3.dart
  /// 输入框焦点事件的捕捉与监听
  @override
  void initState() {
    super.initState();
    //添加listener监听
    //对应的TextField失去或者获取焦点都会回调此监听
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        print('得到焦点');
      } else {
        print('失去焦点');
      }
    });
  }

  //获取焦点
  void getFocusFunction(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  //失去焦点
  void unFocusFunction() {
    focusNode.unfocus();
  }

  //隐藏键盘而不丢失文本字段焦点：
  void hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }
  ///6 /lib/code3/main_data85-3.dart
  /// 全局点击空白处理隐藏键盘
  Widget buildMainBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //隐藏键盘
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "示例",
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(30.0),
            child: Column(children: [
              new TextField(
                //引用FocusNode
                focusNode: focusNode,
              ),
              SizedBox(
                height: 60,
              ),
              RaisedButton(
                child: Text("隐藏键盘 不丢失文本字段焦点"),
                onPressed: () {
                  hideKeyBoard();
                },
              ),
              RaisedButton(
                child: Text("隐藏键盘 并丢失文本字段焦点"),
                onPressed: () {
                  unFocusFunction();
                },
              )
            ]),
          )),
    );
  }

  //页面销毁
  @override
  void dispose() {
    super.dispose();
    //释放
    focusNode.dispose();
  }
}
