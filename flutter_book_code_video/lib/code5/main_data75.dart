import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/main_login1.dart';
import 'package:flutterbookcode/code5/test_search_bar.dart';
import 'package:flutterbookcode/code5/test_search_bar2.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data76.dart';
import 'main_data77.dart';
import 'main_data78.dart';
import 'main_data79.dart';
import 'main_data80.dart';
import 'main_data81.dart';
import 'main_data82.dart';
import 'main_data83.dart';
import 'main_data84.dart';
import 'main_data85-1.dart';
import 'main_data85-2.dart';
import 'main_data85-3.dart';
import 'main_data85.dart';
import 'main_data86.dart';
import 'main_data87.dart';
import 'main_data88.dart';
import 'main_data89.dart';
import 'main_data90.dart';
import 'main_data91.dart';
import 'main_data93.dart';
import 'main_data94.dart';
import 'main_data95.dart';
import 'main_data96.dart';





class TextFieldMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


///6 /lib/code3/main_data75.dart
/// 文本输入框的基本使用
class _FirstPageState extends State<TextFieldMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "文本输入框"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context) {
    return Row(
      children: [
        Container(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bluldLeftWidget(context),
          ),
        )),
        Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bluldLeftWidget2(context),
            ),
          ),
        ),
      ],
    );
  }

  bluldLeftWidget(BuildContext context){
    return [
      RaisedButton(child: Text("TextField基本使用"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldUsePage()); },),
      RaisedButton(child: Text("密码输入"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldPassword()); },),
      RaisedButton(child: Text("输入字母大写"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldCapitalization()); },),
      RaisedButton(child: Text("键盘回车样式"),onPressed: () { NavigatorUtils.pushPage(context, TextKeyBoardReturn()); },),
      RaisedButton(child: Text("输入焦点控制"),onPressed: () { NavigatorUtils.pushPage(context, TextFouceNote()); },),
      RaisedButton(child: Text("字数限制"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldMaxLengthPage()); },),
      RaisedButton(child: Text("行数限制"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldMaxLinePage()); },),
      RaisedButton(child: Text("限制输入内容"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldContentPage()); },),
      RaisedButton(child: Text("输入边框样式"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldDecPage()); },),
      RaisedButton(child: Text("登录页面示例"),onPressed: () { NavigatorUtils.pushPage(context, LoginPage1()); },),
      RaisedButton(child: Text("文本对齐"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldTextAlignPage()); },),
      RaisedButton(child: Text("fillColor"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldFillColorPage()); },),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [

      RaisedButton(child: Text("labelText"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldLabelTextPage()); },),
      RaisedButton(child: Text("labelText 样式"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldLabelTextStylePage()); },),
      RaisedButton(child: Text("labelText 动态修改"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldLabelTextStyle2Page()); },),
      RaisedButton(child: Text("FocusNode"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldFocusNodePage()); },),


      RaisedButton(child: Text("preIcon"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldPreIconPage()); },),
      RaisedButton(child: Text("preText"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldPreTextPage()); },),
      RaisedButton(child: Text("countText"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldCountTextPage()); },),
      RaisedButton(child: Text("自定义countText"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldCustomCountTextPage()); },),
      RaisedButton(child: Text("suffix显示计数"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldCountAndSufixTextPage()); },),
      RaisedButton(child: Text("helperText"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldHelperTextPage()); },),
      RaisedButton(child: Text("文本控制器"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldControllerPage()); },),
      RaisedButton(child: Text("光标样式"),onPressed: () { NavigatorUtils.pushPage(context, TextFieldCursorPage()); },),

      RaisedButton(child: Text("搜索框"),onPressed: () { NavigatorUtils.pushPage(context, TestSearchBarPage()); },),

      RaisedButton(child: Text("搜索框 pub库"),onPressed: () { NavigatorUtils.pushPage(context, TestSearchBarPage2()); },),



    ];
  }

}