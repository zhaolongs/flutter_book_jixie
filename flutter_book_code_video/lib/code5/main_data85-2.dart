import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data85-2.dart
/// 结合FocusNode动态修改labelText的样式
class TextFieldLabelTextStyle2Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {

  ///焦点控制
  FocusNode textFieldNode = new FocusNode();
  ///获取焦点时labelText的文本样式
  TextStyle labelFocusTextStyle = TextStyle(
    color: Colors.red,
    fontSize: 12.0,
  );
  ///未获取输入焦点时labelText的文本样式
  TextStyle labelNormalTextStyle = TextStyle(
    color: Colors.green,
    fontSize: 16.0,
  );
  ///当前labelText使用的文本样式
  TextStyle labelTextStyle ;

  @override
  void initState() {
    super.initState();
    ///初始设置labelText使用的样式
    labelTextStyle = labelNormalTextStyle;
    ///添加焦点兼听，对应的TextField获取焦点或者失去焦点都会回调此方法
    textFieldNode.addListener(() {
      ///textFieldNode.hasFocus 为true 表示当前兼听的TextField是获取输入焦点的
      if(textFieldNode.hasFocus){
        setState(() {
          labelTextStyle = labelFocusTextStyle;
        });
      }else{
        setState(() {
          labelTextStyle = labelNormalTextStyle;
        });
      }
    });
  }
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
            children: [

              new TextField(
                //引用FocusNode
                focusNode: textFieldNode,
                //边框样式设置
                decoration: InputDecoration(
                  labelText: "用户名",
                  ///设置labelText的样式
                  labelStyle: labelTextStyle,
                ),
              ),
             ]
          ),
        ));
  }
}
