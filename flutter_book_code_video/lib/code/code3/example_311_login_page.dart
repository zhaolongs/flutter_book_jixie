import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/base/keyboard_placeholder_wdget.dart';
import 'package:flutterbookcode/base/shake_textfiled.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example311(),
  ));
}

///代码清单 3-21 登录页面 Stack 层叠
///lib/code/code3/example_311_login_page.dart
class Example311 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example311> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //键盘弹出布局不移动
      resizeToAvoidBottomPadding: false,
      //当前显示页面的背景
      backgroundColor: Colors.white,
      body: Container(
        //填充父布局空间
        width: double.infinity,
        height: double.infinity,
        //一个层叠布局
        child: Stack(
          //内容居中
          alignment: Alignment.center,
          children: [
            //第一部分 图片背景
            buildImage(),
            //第二部分 高斯模糊
            buildBlureWidget(),
            //第三部分 登录
            LoginInputLayout(),
          ],
        ),
      ),
    );
  }

  //第一部分 图片背景
  Widget buildImage() {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/2.0x/welcome_bg.jpeg",
        fit: BoxFit.fill,
      ),
    );
  }

  //第二部分 高斯模糊
  Widget buildBlureWidget() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        color: Colors.white.withOpacity(0.06),
      ),
    );
  }
}

///代码清单 3-22 登录页面 输入层
///lib/code/code3/example_311_login_page.dart
class LoginInputLayout extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<LoginInputLayout> {
  //用户名输入框的焦点控制
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  //文本输入框控制器
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  //抖动动画控制器
  ShakeAnimationController _userNameAnimation = new ShakeAnimationController();
  ShakeAnimationController _userPasswordAnimation =
      new ShakeAnimationController();

  //Stream 更新错误方案操作控制器
  StreamController<String> _userNameStream = new StreamController();
  StreamController<String> _userPasswordStream = new StreamController();

  ///代码清单 3-23 输入层build方法
  ///lib/code/code3/example_311_login_page.dart
  @override
  Widget build(BuildContext context) {
    //手势识别点击空白隐藏键盘
    return GestureDetector(
      onTap: () {
        hindKeyBoarder();
      },
      child: Scaffold(
        //键盘弹出不移动布局
        resizeToAvoidBottomPadding: false,
        //背景透明
        backgroundColor: Colors.transparent,
        //登录页面的主体
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: buildLoginWidget(),
        ),
      ),
    );
  }

  ///代码清单 3-24
  ///lib/code/code3/example_311_login_page.dart
  Widget buildLoginWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        //键盘占位区
        KeyboardPlaceholderWidget(
          //键盘弹起时的占位高度
          minHeight: 170,
          //键盘隐藏时的占位高度
          maxHeight: 200,
        ),
        //白色边框背景
        Container(
          margin: EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          //内边距
          padding: EdgeInsets.all(16),
          //圆角边框
          decoration: BoxDecoration(
            //透明的白色
              color: Colors.white.withOpacity(0.8),
              //四个圆角
              borderRadius: BorderRadius.all(Radius.circular(12))),
          //线性布局
          child: buildColumn(),
        ),
      ],
    );
  }

  ///代码清单 3-25
  ///lib/code/code3/example_311_login_page.dart
  Column buildColumn() {
    return Column(
      //包裹
      mainAxisSize: MainAxisSize.min,
      children: [
        //用户名输入框
        buildUserNameWidget(),
        SizedBox(
          height: 20,
        ),
        //用户密码输入框
        buildUserPasswordWidget(),
        SizedBox(
          height: 40,
        ),
        //登录按钮
        Container(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
            child: Text("登录"),
            onPressed: () {
              checkLoginFunction();
            },
          ),
        )
      ],
    );
  }



  ///代码清单 3-26 抖动用户名输入框构建
  ///lib/code/code3/example_311_login_page.dart
  Widget buildUserNameWidget() {
    return ShakeTextFiled(
      labelText: "用户名",
      stream: _userNameStream.stream,
      shakeAnimationController: _userNameAnimation,
      textFieldController: _userNameController,
      focusNode: _userNameFocusNode,
      onSubmitted: (String value) {
        //点击校验，如果有内容输入 输入焦点跳入下一个输入框
        if (checkUserName()) {
          _userNameFocusNode.unfocus();
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        } else {
          FocusScope.of(context).requestFocus(_userNameFocusNode);
        }
      },
    );
  }

  ///代码清单 3-27 抖动密码输入框构建
  ///lib/code/code3/example_311_login_page.dart
  Widget buildUserPasswordWidget() {
    return ShakeTextFiled(
      labelText: "密码",
      stream: _userPasswordStream.stream,
      shakeAnimationController: _userPasswordAnimation,
      textFieldController: _passwordController,
      focusNode: _passwordFocusNode,
      onSubmitted: (String value) {
        if (checkUserPassword()) {
          loginFunction();
        } else {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        }
      },
    );
  }



  ///代码清单 3-28 隐藏键盘操作
  ///lib/code/code3/example_311_login_page.dart
  void hindKeyBoarder() {
    //输入框失去焦点
    _userNameFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    //隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }


  ///代码清单 3-29 校验输入用户名操作
  ///lib/code/code3/example_311_login_page.dart

  bool checkUserName() {
    //获取输入框中的输入文本
    String userName = _userNameController.text;
    if (userName.length == 0) {
      //Stream 事件流更新提示文案
      _userNameStream.add("请输入用户名");
      //抖动动画开启
      _userNameAnimation.start();
      return false;
    } else {
      //清除错误提示
      _userNameStream.add(null);
      return true;
    }
  }

  ///代码清单 3-30 校验输入密码操作
  ///lib/code/code3/example_311_login_page.dart
  bool checkUserPassword() {
    String userPassrowe = _passwordController.text;
    if (userPassrowe.length < 6) {
      _userPasswordStream.add("请输入标准密码");
      _userPasswordAnimation.start();
      return false;
    } else {
      _userPasswordStream.add(null);
      return true;
    }
  }
  ///代码清单 3-31 登录校验
  ///lib/code/code3/example_311_login_page.dart
  void checkLoginFunction() {
    //隐藏键盘
    hindKeyBoarder();
    //校验用户输入的用户名
    checkUserName();
    //校验用户输入的用户密码
    checkUserPassword();
    //登录功能
    loginFunction();
  }

  void loginFunction() {}
}
