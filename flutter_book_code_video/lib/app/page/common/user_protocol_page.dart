import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/app/base/pop_base_state.dart';
import 'package:flutterbookcode/app/page/common/webview_page.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

import '../../base/pop_base_state.dart';
import 'common_dialog.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///便捷打开用户协议弹框
///lib/app/page/common/user_protocol_page.dart
showUserProtocolPage(
    {@required BuildContext context,
    //点击关闭是否退出应用
    bool isColseApp = true,
    //弹框消失的回调
    Function(dynamic value) dismissCallback}) {
  //打开用户隐私协议页面
  NavigatorUtils.openPageByFade(
    context,
    UserProtocolRequestPage(
      isColseApp: isColseApp,
    ),
    opaque: false,
    dismissCallBack: dismissCallback,
  );
}

///lib/app/page/common/user_protocol_page.dart
///用户隐私协议页面
class UserProtocolRequestPage extends StatefulWidget {
  final bool isColseApp;

  UserProtocolRequestPage({this.isColseApp = true});

  @override
  _UserProtocolState createState() => _UserProtocolState();
}

class _UserProtocolState extends PopBaseState<UserProtocolRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景透明
      backgroundColor: Colors.transparent,

      ///白色圆角边框的背景
      body: CommonDialogPage(
        //中间显示的隐私协议富文本
        contentWidget: buildSingleChildScrollView(),
        //右侧的 "同意协议" 按钮文案
        selectText: "同意协议",
        //点击右侧按钮的回调
        selectCallBack: () {
          //如果是同意协议返回true
          Navigator.of(context).pop(true);
        },
        //左侧的 "退出" 按钮文案
        cancleText: "退出",
        isSelectColose: false,
        isCancleColose: false,
        //点击左侧按钮的回调
        cancleCallBack: () {
          //不同意协议一般是关闭App
          closeApp();
        },
      ),
    );
  }

  ///关闭应用的功能
  Future<void> closeApp() async {
    if (widget.isColseApp) {
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
  //协议说明文案
  String userPrivateProtocol =
      "我们一向尊重并会严格保护用户在使用本产品时的合法权益（包括用户隐私、用户数据等）不受到任何侵犯。本协议（包括本文最后部分的隐私政策）是用户（包括通过各种合法途径获取到本产品的自然人、法人或其他组织机构，以下简称“用户”或“您”）与我们之间针对本产品相关事项最终的、完整的且排他的协议，并取代、合并之前的当事人之间关于上述事项的讨论和协议。本协议将对用户使用本产品的行为产生法律约束力，您已承诺和保证有权利和能力订立本协议。用户开始使用本产品将视为已经接受本协议，请认真阅读并理解本协议中各种条款，包括免除和限制我们的免责条款和对用户的权利限制（未成年人审阅时应由法定监护人陪同），如果您不能接受本协议中的全部条款，请勿开始使用本产品";

  TapGestureRecognizer _registProtocolRecognizer;
  TapGestureRecognizer _privacyProtocolRecognizer;

  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();
  }

  ///生命周期函数 页面销毁时执行一次
  @override
  void dispose() {
    super.dispose();
    ///销毁
    _registProtocolRecognizer.dispose();
    _privacyProtocolRecognizer.dispose();
  }

  ///lib/app/page/common/user_protocol_page.dart
  ///构建隐私协议的富文本
  Widget buildSingleChildScrollView() {
    return Expanded(
      //可滑动的适配
      child: SingleChildScrollView(
        child: Padding(
          //左右边距
          padding: EdgeInsets.only(left: 18, right: 18),
          //富文本
          child: buildRichText(),
        ),
      ),
    );
  }


  ///lib/app/page/common/user_protocol_page.dart
  ///构建富文本
  RichText buildRichText() {
    return RichText(
      //文字居中
      textAlign: TextAlign.center,
      //文字区域
      text: TextSpan(
        text: "请您本产品之前，请务必仔细阅读并理解",
        style: TextStyle(color: Colors.grey),
        children: [
          TextSpan(
            text: "《用户协议》",
            style: TextStyle(color: Colors.blue),
            //点击事件
            recognizer: _registProtocolRecognizer
              ..onTap = () {
                //打开用户协议
                openUserProtocol();
              },
          ),
          TextSpan(
            text: "与",
            style: TextStyle(color: Colors.grey),
          ),
          TextSpan(
            text: "《隐私协议》",
            style: TextStyle(color: Colors.blue),
            //点击事件
            recognizer: _privacyProtocolRecognizer
              ..onTap = () {
                //打开隐私协议
                openPrivateProtocol();
              },
          ),
          //后续显示的文本内容
          TextSpan(text: userPrivateProtocol)
        ],
      ),
    );
  }

  ///lib/app/page/common/user_protocol_page.dart
  ///打开用户协议
  void openPrivateProtocol() {
    showWebViewPage(
        context: context,
        pageTitle: "用户协议",
        pageUrl: "https://space.bilibili.com/513480210");
  }

  ///打开隐私协议
  void openUserProtocol() {
    showWebViewPage(
        context: context,
        pageTitle: "隐私协议",
        pageUrl: "https://blog.csdn.net/zl18603543572");
  }
}
