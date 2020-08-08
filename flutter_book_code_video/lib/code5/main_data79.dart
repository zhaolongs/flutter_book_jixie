import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


/**
 *  文本输入框的 弹出键盘加车键
 */
class TextKeyBoardReturn extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data79.dart
/// 文本输入框 弹出键盘加车键
class _PageState extends State<TextKeyBoardReturn> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "文本输入框基本使用"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(),));
  }
  ///6 /lib/code3/main_data79.dart
  /// 文本输入框  弹出键盘回车键样式设置
  /// 监听回车键按钮事件
  ///文本输入框的内容
  String inputStr="";
  buildBodyFunction() {
    return Column(children: [
      new TextField(
        ///设置键盘的类型
        keyboardType: TextInputType.text,
        ///键盘回车键的样式
        /**
         * none 为不弹出键盘
         * unspecified 换行
         * none 为不弹出键盘
         * done 完成或者done
         * go  前往或者go
         * search 搜索或者search
         * send  发送或者send
         * next 下一项或者next
         * previous
         * continueAction 继续或者 continue
         * join 加入或者join
         * route 路线或者route
         * emergencyCall 紧急电话
         * newline 换行或者newline
         */
        textInputAction: TextInputAction.send,

        keyboardAppearance:Brightness.dark,

        ///点击键盘上的回车按钮回调事件函数
        ///参数[value]获取的是当前TextField中输入的内容
        onSubmitted: (value){
          print("onSubmitted $value");
          ///更新内容
          setState(() {
            inputStr = value;
          });
        },
        ///点击键盘上的回车按钮回调事件函数
        onEditingComplete: (){
          print("editingComplete ");
        },
      ),

      SizedBox(height: 30,),

      Text("输入【 $inputStr 】")

    ],);
  }
}