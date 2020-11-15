import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fai_umeng/flutter_fai_umeng.dart';
import 'package:flutterbookcode/app/base/pop_base_state.dart';
import 'package:flutterbookcode/app/common/user_helper.dart';
import 'package:flutterbookcode/app/page/common/permission_request_page.dart';
import 'package:flutterbookcode/app/page/common/user_protocol_page.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
import 'package:flutterbookcode/app/splash.dart';
import 'package:flutterbookcode/app/welcome_page.dart';
import 'package:flutterbookcode/demo/shake/shake_animation_text.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';
import 'package:flutterbookcode/utils/code1/sp_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'common/sp_key.dart';
import 'config/local_notifier.dart';
import 'config/theme_notifier.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/20.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends PopBaseState<IndexPage> {
  ///用户是否第一次使用
  bool _userFirst = false;
  @override
  void initState() {
    super.initState();
    ///Widget渲染完成的回调
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///检查权限
      checkPermissonFunction();
    });
  }
  ///lib/app/index.dart
  ///常用的第三方的初始功能 如友盟统计
  ///获取保存的用户偏好设置
  void initData() async {
    ///获取当前的运行环境
    ///当App运行在Release环境时，inProduction为true；
    ///当App运行在Debug和Profile环境时，inProduction为false。
    const bool inProduction = const bool.fromEnvironment("dart.vm.product");
    ///为ture时输出日志
    const bool isLog = !inProduction;
    ///初始化友盟统计
    // await initUmeng(isLog: isLog);
    ///初始化本地存储工具
    await SPUtil.init();
    ///初始化日志工具
    LogUtil.init(tag: "flutter_log", isDebug: isLog);

    ///获取用户保存偏好设置
    ///国际化
    String _languageCode = await SPUtil.getString(spUserLocalLanguageKey);
    ///如果用户有选择过语言环境设置在这里根据用户的选择再重置一下App的语言环境
    if (_languageCode != null && _languageCode.length > 0) {
      LocaleNotifier localeState=LocaleNotifier.zh();
      if(_languageCode==LocaleNotifier.en().toString()){
        localeState=LocaleNotifier.en();
      }
      ///更新语言环境
      Provider.of<LocaleNotifier>(context, listen: false)
          .changeLocaleState(localeState);
    }

    ///获取缓存的应用主题
    int themIndex = await SPUtil.getInt(spUserThemeKey);
    Provider.of<ThemeNotifier>(context, listen: false).setThem(themIndex);
    ///获取用户是否第一次登录
    _userFirst = await SPUtil.getBool(spUserIsFirstKey);
    ///获取用户隐私协议的状态
    bool _userProtocol = await SPUtil.getBool(spUserProtocolKey);
    ///记录
    UserHelper.getInstance.userProtocol=_userProtocol;
    ///初始化用户的登录信息
    UserHelper.getInstance.init();
    ///下一步
    openUserProtocol();
  }
  ///lib/app/index.dart
  ///构建[IndexPage]中的友盟统计
  Future<bool> initUmeng({bool isLog = false}) async {
    /// 监听原生消息
    FlutterFaiUmeng.receiveMessage((message) {
      LogUtil.e(message.toString());
    });
    ///友盟的初始化
    ///参数一 appkey
    ///参数二 推送使用的pushSecret
    ///参数三 是否打开调试日志
    await FlutterFaiUmeng.uMengInit("5dcfb8f84ca357f70e000b0a",
        pushSecret: "5cb4fc014c143a77fb85cb17edd807a2", logEnabled: isLog);
    return Future.value(true);
  }

  ///lib/app/index.dart
  ///构建[IndexPage]中的显示内容
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///层叠布局
      body: Stack(
        children: [
          ///构建背景
          Positioned(
            left: 0, right: 0, top: 0, bottom: 0,
            child: Image.asset(
              "assets/images/3.0x/welcome.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            color: Color.fromARGB(155, 100, 100, 100,
            ),
          ),
          Center(
            ///抖动动画
            child: ShakeTextAnimationWidget(
              animationString: "HELLO WORLD",
              textStyle: TextStyle(
                  color: Colors.white,
                  ///文字的大小
                  fontSize: 25,
                  ///引用圆滑的自定义字体
                  fontFamily: "UniTortred"),
            ),
          )
        ],
      ),
    );
  }
  ///lib/app/index.dart
  ///构建[IndexPage]中的异步的
  ///权限请求判断
  void checkPermissonFunction() {
    ///根据语言环境加载的文案
    List<String> messageList = [
      StringLanguages.of(context).get(StringKey.storePermisson1),
      StringLanguages.of(context).get(StringKey.storePermisson2),
      StringLanguages.of(context).get(StringKey.storePermisson3),
    ];

    ///权限请求封装功能
    ///如果当前配制的权限通过就直接回调dismissCallback方法
    showPermissionRequestPage(
        context: context,
        ///在这里请求的是文件读写权限
        permission: Permission.storage,
        ///对应的弹框提示语
        permissionMessageList: messageList,
        ///权限请求完成后的回调
        dismissCallback: (value) {
          ///权限请求结束获取权限后进行初始化操作
          ///如果未获取权限是对权限进行关闭的
          initData();
        });
  }
  ///lib/app/index.dart
  ///判断用户隐私协议
  void openUserProtocol() {
    ///已同意用户隐私协议 下一步
    if (UserHelper.getInstance.isUserProtocol) {
      openNext();
    } else {
      ///未同意用户协议 弹框显示
      showUserProtocolPage(context: context, dismissCallback: (value) {
        openNext();
      });
    }
  }
  ///进入首页面或者是引导页面
  void openNext() {
    if (_userFirst == null || _userFirst == false) {
      ///第一次 隐藏logo 显示左右滑动的引导
      NavigatorUtils.openPageByFade(context, SplashPage(), isReplace: true);
    } else {
      ///非第一次 隐藏logo 显示欢迎
      NavigatorUtils.openPageByFade(context, WelcomePage(), isReplace: true);
    }
  }
}
