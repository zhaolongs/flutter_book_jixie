import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ho/src/bean/bean_user.dart';
import 'package:flutter_app_ho/src/common/user_helper.dart';
import 'package:flutter_app_ho/src/net/DioUtils.dart';
import 'package:flutter_app_ho/src/utils/toast_utils.dart';

import '../mine/oval_transit_rect_widget.dart';
import 'bg/bubble_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/22.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
/// 知乎 https://www.zhihu.com/people/zhao-long-90-89
///
///
/// 气泡背景的登录页面

void main() => runApp(
      MaterialApp(
        home: BobbleLoginPage(),
      ),
    );

class BobbleLoginPage extends StatefulWidget {
  @override
  _BobbleLoginPageState createState() => _BobbleLoginPageState();
}

class _BobbleLoginPageState extends State<BobbleLoginPage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController _fadeAnimationController;

  @override
  void initState() {
    super.initState();

    //添加监听
    WidgetsBinding.instance.addObserver(this);
    _fadeAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    _fadeAnimationController.addStatusListener((status) {});
    //重复执行动画
    _fadeAnimationController.forward();
  }

  @override
  void dispose() {
    //解绑
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool _showInputBg = false;

  //应用尺寸改变时回调
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    /*
     *Frame是一次绘制过程，称其为一帧，
     * Flutter engine受显示器垂直同步信号"VSync"的驱使不断的触发绘制，
     *Flutter可以实现60fps（Frame Per-Second），
     * 就是指一秒钟可以触发60次重绘，FPS值越大，界面就越流畅。
     */
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //注意，不要在此类回调中再触发新的Frame，这可以会导致循环刷新。
      setState(() {
        ///获取底部遮挡区域的高度
        double keyboderFlexHeight = MediaQuery.of(context).viewInsets.bottom;
        print("键盘的高度 keyboderFlexHeight $keyboderFlexHeight");
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          //关闭键盘 启动logo动画反向执行 0.0 -1.0
          // logo 布局区域显示出来
          setState(() {
            _showInputBg = false;
          });
        } else {
          //显示键盘 启动logo动画正向执行 1.0-0.0
          // logo布局区域缩放隐藏
          setState(() {
            _showInputBg = true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Stack(
        children: [
          //第一部分 第一层 渐变背景
          buildBackground(),
          //第二部分 第二层 气泡
          BubbleWidget(),
          //第三部分 高斯模糊
          buildBlureWidget(),
          //第四部分 顶部的文字
          buildTopText(),
          //第五部分 logo 的Hero动画
          buildHeroLogo(context),
          //第六部分 输入框与按钮
          FadeTransition(
            opacity: _fadeAnimationController,
            child: buildColumn(context),
          ),
          //第七部分 左上角的关闭按钮
          Positioned(
            top: 44,
            left: 10,
            child: CloseButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  Positioned buildHeroLogo(BuildContext context) {
    return Positioned(
      top: 120,
      left: 45,
      child: Stack(
        children: [
          Hero(
            tag: "loginTag",
            child: Material(
              color: Colors.transparent,
              child: ClipOval(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    "assets/images/2.0x/app_icon.png",
                    fit: BoxFit.fill,
                    width: 44,
                    height: 44,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//第四部分 顶部的文字
  Positioned buildTopText() {
    //顶部对齐
    return Positioned(
      top: 120,
      left: 0,
      right: 0,
      child: Text(
        'Holl World',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 40.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  //第一部分 第一层 渐变背景
  Container buildBackground() {
    return Container(
      decoration: BoxDecoration(
        //线性渐变
        gradient: LinearGradient(
          //渐变角度
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //渐变颜色组
          colors: [
            Colors.lightBlue.withOpacity(0.3),
            Colors.lightBlueAccent.withOpacity(0.3),
            Colors.blue.withOpacity(0.3),
          ],
        ),
      ),
    );
  }

  //第一部分 图片背景
  buildImage() {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/welcome_bg.jpeg",
        fit: BoxFit.fill,
      ),
    );
  }

  //第三部分 高斯模糊
  buildBlureWidget() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
      child: Container(
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _passwordFocusNode = new FocusNode();

  //第五部分 输入框与按钮
  Widget buildColumn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hidenKeyBoard();
      },
      child: Container(
        color:
            _showInputBg ? Colors.white.withOpacity(0.9) : Colors.transparent,
        padding: EdgeInsets.all(44),
        child: buildInputColumn(context),
      ),
    );
  }

  Column buildInputColumn(BuildContext context) {
    return Column(
      //子Widget 底部对齐
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextFieldWidget(
          hintText: '邮箱',
          focusNode: _userNameFocusNode,
          controller: _userNameController,
          obscureText: false,
          prefixIconData: Icons.mail_outline,
          submit: (String value) {
            checkUserName(value);
            //焦点切换
            _userNameFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFieldWidget(
              hintText: '密码',
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              obscureText: true,
              prefixIconData: Icons.lock_outline,
              suffixIconData: Icons.visibility,
              submit: (String value) {
                checkPassword(value);
                submitLoginFunction();
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '忘记密码?',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        ButtonWidget(
          buttonLabel: '登录',
          onTap: () {
            submitLoginFunction();
          },
          hasBorder: false,
        ),
      ],
    );
  }

  void submitLoginFunction() async {
    //隐藏
    hidenKeyBoard();

    String userName = _userNameController.text.trim();
    String password = _passwordController.text.trim();

    checkUserName(userName);
    checkPassword(password);

    Map<String, String> map = new Map();
    map["mobile"] = userName;
    map["password"] = password;
    ResponseInfo responseInfo = await DioUtils.instance.postRequest(
      url: HttpHelper.UWER_LOGIN_URL,
      formDataMap: map,
    );
    if (responseInfo.success) {
      UserBean userBean = UserBean.fromJson(responseInfo.data);
      UserHelper.getInstance.userBean = userBean;
      Navigator.of(context).pop(userBean);
    } else {
      ToastUtils.showToast(responseInfo.message);
    }
  }

  void checkPassword(String value) {
    if (value.trim().length == 0) {
      ToastUtils.showToast("请输入密码");
      return;
    }
  }

  void checkUserName(String value) {
    if (value.trim().length == 0) {
      ToastUtils.showToast("请输入用户账号");
      return;
    }
  }

  void hidenKeyBoard() {
    //隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _passwordFocusNode.unfocus();
    _userNameFocusNode.unfocus();
  }
}

///自定义文本输入框
class TextFieldWidget extends StatelessWidget {
  //占位提示文本
  final String hintText;

  //输入框前置图标
  final IconData prefixIconData;

  //输入框后置图标
  final IconData suffixIconData;

  //是否隐藏文本
  final bool obscureText;

  //输入实时回调
  final Function onChanged;

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String value) submit;

  TextFieldWidget({
    Key key,
    this.hintText,
    this.submit,
    this.focusNode,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //构建输入框
    return TextField(
      focusNode: focusNode,
      controller: controller,
      //实时输入回调
      onChanged: onChanged,
      onSubmitted: submit,
      //是否隐藏文本
      obscureText: obscureText,
      //隐藏文本小圆点的颜色
      cursorColor: Theme.of(context).accentColor,
      //文本样式
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 14.0,
      ),
      //输入框的边框
      decoration: InputDecoration(
        //提示文本
        labelText: hintText,
        //提示文本的样式
        labelStyle: TextStyle(color: Theme.of(context).accentColor),
        //可编辑时的提示文本的颜色
        focusColor: Theme.of(context).accentColor,
        //填充
        filled: true,
        //可编辑时 无边框样式
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),

        //获取输入焦点时的边框样式
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),

        //文本前置的图标
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Theme.of(context).accentColor,
        ),
        //文本后置的图标
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            suffixIconData,
            size: 18,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

///自定义按钮
class ButtonWidget extends StatelessWidget {
  //按钮上的文字
  final String buttonLabel;

  //是否填充背景
  final bool hasBorder;

  //点击事件回调
  final GestureTapCallback onTap;

  ButtonWidget({
    Key key,
    @required this.buttonLabel,
    this.hasBorder = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        //边框
        decoration: BoxDecoration(
          //定义填充颜色
          color: hasBorder ? Colors.white : Theme.of(context).accentColor,
          //点击事件高亮的边框圆角
          borderRadius: BorderRadius.circular(10),
          //边框设置
          border: hasBorder
              ? Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        //事件监听回调
        child: buildInkWell(context),
      ),
    );
  }

  InkWell buildInkWell(BuildContext context) {
    return InkWell(
      //事件回调
      onTap: onTap,
      //点击的水波纹与高亮颜色 与Ink设置的背景圆角一致
      borderRadius: BorderRadius.circular(10),
      //按钮样式
      child: Container(
        height: 60.0,
        child: Center(
          child: Text(
            //文本内容
            buttonLabel,
            //文本样式
            style: TextStyle(
              //文本颜色
              color: hasBorder ? Theme.of(context).accentColor : Colors.white,
              //加粗
              fontWeight: FontWeight.w600,
              //文字大小
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
