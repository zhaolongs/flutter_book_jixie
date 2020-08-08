import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

/**
 *
 */
class LoginPage1 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data80.dart
/// 文本输入框 弹出键盘加车键
class _PageState extends State<LoginPage1> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "登录"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(),));
  }
  ///6 /lib/code3/main_data80.dart
  /// 文本输入框  弹出键盘回车键样式设置
  /// 监听回车键按钮事件
  ///文本输入框的内容
  String inputStr="";
  ///用户名焦点
  FocusNode userNameFocusNode = FocusNode();
  ///密码焦点
  FocusNode passwordFocusNode = FocusNode();
  buildBodyFunction() {
    return Column(children: [
      ///第一行姓名输入框
      Row(children: [
        Text('姓名'),
        SizedBox(width: 12,),
        Expanded(child:  new TextField(
          decoration: InputDecoration(
            hintText: "请输入姓名",
            hintStyle: TextStyle(color: Colors.grey,fontSize: 12.0)
          ),
          ///关联焦点控制
          focusNode: userNameFocusNode,
          ///设置键盘的类型
          keyboardType: TextInputType.text,
          ///键盘回车键的样式
          textInputAction: TextInputAction.next,

          ///点击键盘上的回车按钮回调事件函数
          ///参数[value]获取的是当前TextField中输入的内容
          onSubmitted: (value){
            print("onSubmitted $value");
            ///更新内容
            setState(() {
              inputStr = value;
              // 用户名输入失去焦点
              userNameFocusNode.unfocus();
              //密码输入  获取焦点
              FocusScope.of(context).requestFocus(passwordFocusNode);
            });
          },

        ),)
      ],),
      SizedBox(height: 30,),
      //第二行密码输入框
      Row(children: [
        Text('密码'),
        SizedBox(width: 12,),
        Expanded(child:  new TextField(
          decoration: InputDecoration(
              hintText: "请输入密码"
          ),
          ///关联焦点控制
          focusNode: passwordFocusNode,
          ///设置键盘的类型
          keyboardType: TextInputType.visiblePassword,
          ///键盘回车键的样式
          textInputAction: TextInputAction.done,
          ///点击键盘上的回车按钮回调事件函数
          ///参数[value]获取的是当前TextField中输入的内容
          onSubmitted: (value){
            print("onSubmitted $value");
            ///更新内容
            setState(() {
              inputStr = value;
            });
          },
        ),)
      ],),
    ],);
  }
}