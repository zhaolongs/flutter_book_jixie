import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

///6 /lib/code3/main_data93.dart
/// 文本控制器TextEditingController的配置使用
class TextFieldControllerPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {

  ///创建文本控制器实例
  ///创建方式一
  TextEditingController _editingController = new TextEditingController();
  ///创建方式二
  TextEditingController _editingController2 = new TextEditingController(text: "这是初始化的内容");

  FocusNode _focusNode =new FocusNode();
  ///记录文本输入内容
  String _currentInputText="";


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
                SizedBox(
                  height: 40,
                ),
                //提交按钮
                buildSubmitFunction(),
                //清除按钮，清除TextField中已输入的内容
                buildClearInputContextFunction(),
                SizedBox(
                  height: 40,
                ),
                //点击提交按钮后显示输入的内容
                buildShowInputContextFunction(),

              ],
            ),
          )),
    );
  }

  ///6 /lib/code3/main_data93.dart
  /// TextField绑定控制器
  buildTextFieldFunction1() {
    return new TextField(
      //绑定控制器
      controller: _editingController,
      //焦点控制
      focusNode: _focusNode,
      maxLines: 3,
      minLines: 1,
      //边框样式设置
      decoration: InputDecoration(
        //helperText 使用的文本样式
        helperStyle: TextStyle(color: Colors.blue, fontSize: 12.0),
        helperText:
            "执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天。",
        helperMaxLines: 1,
      ),
    );
  }

  ///6 /lib/code3/main_data93.dart
  /// 提交按钮，点击后获取TextField中输入的内容
  buildSubmitFunction() {
    return RaisedButton(child: Text("提交"),onPressed: (){
      //清除输入焦点并关闭键盘
      _focusNode.unfocus();
      //获取输入框中的输入的文本
      String inputText = _editingController.text;
      //更新页面上显示
      setState(() {
        _currentInputText = inputText;
      });
    },);
  }
  ///6 /lib/code3/main_data93.dart
  /// Text 显示TextField中输入的内容
  buildShowInputContextFunction() {
    return Text("TextField中输入的内容是： $_currentInputText");
  }

  buildClearInputContextFunction(){
    return RaisedButton(child: Text("清除"),onPressed: (){
      ///清除TextField中输入的内容
      clearEditeInputTextFunction();
      ///清除页面上显示的内容并刷新视图
      setState(() {
        _currentInputText="";
      });
    },);
  }

  ///6 /lib/code3/main_data93.dart
  /// 获取TextField中输入的内容
  String getEditeInputTextFunction(){
    return _editingController.text;
  }

  /// 设置TextField中显示的内容
  void setEditeInputTextFunction(String flagText){
     _editingController.text = flagText;
  }

  /// 清除TextField中显示的内容
  void clearEditeInputTextFunction(){
    _editingController.text = "";
    ///或者使用clear方法
    _editingController.clear();
  }

  ///6 /lib/code3/main_data93.dart
  /// 设置TextField中显示的内容并保持输入光标在文本最后面
  void setEditeInputTextAndSelectionFunction(String flagText){
    ///控制 初始化的时候鼠标保持在文字最后
    _editingController = TextEditingController.fromValue(
      ///用来设置初始化时显示
      TextEditingValue(
        ///用来设置文本 controller.text = "0000"
        text: flagText,
        ///设置光标的位置
        selection: TextSelection.fromPosition(
          ///用来设置文本的位置
          TextPosition(
              affinity: TextAffinity.downstream,
              /// 光标向后移动的长度
              offset: flagText.length),),),
    );
  }
  ///6 /lib/code3/main_data93.dart
  /// EditingController添加Listener监听
  @override
  void initState() {
    super.initState();
    addListener();
  }
  /// 最好是在initState方法中调用
  void addListener(){
    /// 添加兼听 当TextFeild 中内容发生变化时 回调 焦点变动 也会触发
    /// TextField的onChanged方法当TextFeild文本发生改变时才会回调
    _editingController.addListener((){
      ///获取输入的内容
      String currentStr = _editingController.text;
      ///是否获取焦点
      bool isFocuse = _focusNode.hasFocus;
    });
  }
}
