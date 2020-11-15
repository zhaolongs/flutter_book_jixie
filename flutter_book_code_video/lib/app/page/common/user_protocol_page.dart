import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/app/base/pop_base_state.dart';
import 'package:flutterbookcode/app/common/user_helper.dart';
import 'package:flutterbookcode/app/page/common/webview_page.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
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
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///

///lib/app/page/common/user_protocol_page.dart
showUserProtocolPage(
    {@required BuildContext context,
    bool isColseApp = true,///点击关闭是否退出应用
    Function(dynamic value) dismissCallback}) {
  ///打开用户隐私协议页面
  NavigatorUtils.openPageByFade(
      context,
      UserProtocolRequestPage(
        isColseApp: isColseApp,
      ),
      opaque: false,
      dismissCallBack: dismissCallback);
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
      backgroundColor: Colors.transparent,
      ///白色圆角边框的背景
      body: CommonDialogPage(
        ///中间显示的隐私协议富文本
        contentWidget: buildSingleChildScrollView(),
        ///右侧的 "同意协议" 按钮文案
        selectText:
            StringLanguages.of(context).get(StringKey.buttonConsentProtocol),
        ///点击右侧按钮的回调
        selectCallBack: (){
          UserHelper.getInstance.userProtocol=true;
          Navigator.of(context).pop();
        },
        ///左侧的 "退出" 按钮文案
        cancleText: StringLanguages.of(context).get(StringKey.buttonExit),
        isSelectColose: false,
        isCancleColose: false,
        ///点击左侧按钮的回调
        cancleCallBack: (){
          closeApp();
        },
      ),
    );
  }
  ///关闭应用的功能
  Future<void> closeApp() async {
    if(widget.isColseApp){
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

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
      ///可滑动的适配
      child: SingleChildScrollView(
        child: Padding(
          ///左右边距
          padding: EdgeInsets.only(left: 18, right: 18),
          child: buildRichText(),
        ),
      ),
    );
  }

  ///lib/app/page/common/user_protocol_page.dart
  ///构建富文本
  RichText buildRichText() {
    return RichText(
      ///文字居中
      textAlign: TextAlign.center,
      ///文字区域
      text: TextSpan(
          text: StringLanguages.of(context).get(StringKey.userReadProtocol),
          style: TextStyle(color: Colors.grey),
          children: [
            TextSpan(
                text: StringLanguages.of(context).get(StringKey.userProtocol),
                style: TextStyle(color: Colors.blue),
                //点击事件
                recognizer: _registProtocolRecognizer
                  ..onTap = () {
                    ///打开用户协议
                    openUserProtocol();
                  }),
            TextSpan(
              text: "与",
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
                text: StringLanguages.of(context)
                    .get(StringKey.userPrivateProtocol),
                style: TextStyle(color: Colors.blue),
                //点击事件
                recognizer: _privacyProtocolRecognizer
                  ..onTap = () {
                    ///打开隐私协议
                    openPrivateProtocol();
                  }),
            TextSpan(
                text: StringLanguages.of(context)
                    .get(StringKey.userConsentProtocol))
          ]),
    );
  }

  ///lib/app/page/common/user_protocol_page.dart
  ///打开用户协议
  void openPrivateProtocol() {
    showWebViewPage(
        context: context,
        pageTitle: "用户协议",
        pageUrl: "https://blog.csdn.net/zl18603543572");
  }

  ///打开隐私协议
  void openUserProtocol() {
    showWebViewPage(
        context: context,
        pageTitle: "隐私协议",
        pageUrl: "https://blog.csdn.net/zl18603543572");
  }
}
