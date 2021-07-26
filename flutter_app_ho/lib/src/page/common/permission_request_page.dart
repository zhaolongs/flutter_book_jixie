import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ho/src/utils/log_util.dart';
import 'package:flutter_app_ho/src/utils/navigator_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common_dialog.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423///

///lib/app/page/common/permission_request_page.dart
///快速显示动态权限申请功能
///[context] 上下文对象，用来push新的Widget页面使用
///[permission] 对应申请的权限[Permission]也就说这是一个
///   通用的权限申请功能Widget
///[permissionMessageList] 对应弹框显示的文案，最少有三个
///[isColseApp] 权限申请不通过时，为true时退出APP
///[dismissCallback]就是权限申请完毕后的回调
///     当[isColseApp] 为true时此方法无效
///     当[isColseApp] 为false时，申请权限通过回调参数为true
///     申请权限未通过时 回调参数为false
showPermissionRequestPage(
    {@required BuildContext context,
    @required Permission permission,
    @required List<String> permissionMessageList,
    bool isColseApp = true,
    Function(dynamic value) dismissCallback}) {
  ///透明的方式打开权限请求 Widget
  NavigatorUtils.openPageByFade(
      context,
      PermissionRequestPage(
        permissionMessageList: permissionMessageList,
        permission: permission,
        isColseApp: isColseApp,
      ),
      opaque: false, dismissCallBack: (value) {
    ///权限请求结束获取权限后进行初始化操作
    ///如果未获取权限是对权限进行关闭的
    if (dismissCallback != null) {
      dismissCallback(value);
    }
  });
}

///lib/app/page/common/permission_request_page.dart
///通用动态权限申请功能封装
class PermissionRequestPage extends StatefulWidget {
  ///当前要申请的权限
  final Permission permission;

  ///申请权限的提示语
  final List<String> permissionMessageList;

  ///不同意权限时 为true触发关闭APP
  final bool isColseApp;
  PermissionRequestPage(
      {@required this.permission,
      @required this.permissionMessageList,
      this.isColseApp = true});
  @override
  _PermissionRequestState createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequestPage>
    with WidgetsBindingObserver {
  ///lib/app/page/common/permission_request_page.dart
  @override
  void initState() {
    super.initState();
    LogUtil.e("权限请求页面");
    WidgetsBinding.instance.addObserver(this); //添加观察者
    ///检查权限
    checkPermissonFunction();
  }

  @override
  void dispose() {
    //销毁观察者
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ///是否打开发设置中心
  bool isOpenSetting = false;

  ///生命周期变化时回调
  //  resumed:应用可见并可响应用户操作
  //  inactive:用户可见，但不可响应用户操作
  //  paused:已经暂停了，用户不可见、不可操作
  //  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && isOpenSetting) {
      checkPermissonFunction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      ///填充布局
      body: new Material(
          type: MaterialType.transparency,
          child: WillPopScope(
            onWillPop: () async {
              ///退出APP
              closeApp();
              return Future.value(false);
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
            ),
          )),
    );
  }

  ///代码清单 11-6
  ///lib/app/page/common/permission_request_page.dart
  ///检查权限 [status] 当前权限的状态
  void checkPermissonFunction({PermissionStatus status}) async {
    if (Platform.isAndroid) {
      ///获取权限状态
      if (status == null) {
        status = await widget.permission.status;
      }
      LogUtil.e("文件存储权限的状态 $status");
      if (status.isUndetermined) {
        ///以前从未请求过
        showCommonAlertDialog(
            contentMessag: widget.permissionMessageList[0],
            cancleText: "退出",
            selectText: "同意",
            selectCallBack: () {
              ///请求权限
              requestStoragePermisson();
            },
            cancleCallBack: () {
              closeApp();
            },
            context: context);
      } else if (status.isDenied) {
        ///用户拒绝
        showCommonAlertDialog(
            contentMessag: widget.permissionMessageList[1],
            cancleText: "退出",
            selectText: "重试",
            selectCallBack: () {
              ///请求权限
              requestStoragePermisson();
            },
            cancleCallBack: () {
              closeApp();
            },
            context: context);
      } else if (status.isPermanentlyDenied) {
        ///用户拒绝后并选择不再提示
        ///用户拒绝
        showCommonAlertDialog(
            contentMessag: widget.permissionMessageList[2],
            cancleText: "退出",
            selectText: "去设置中心",
            selectCallBack: () async {
              ///请求权限
              isOpenSetting = await openAppSettings();
              LogUtil.e("打开设置中心 $isOpenSetting");
              if (!isOpenSetting) {
                ///设置中心打开失败
                openSettingFaile();
              }
            },
            cancleCallBack: () {
              closeApp();
            },
            context: context);
      } else if (status.isGranted) {
        ///权限通过
        Navigator.of(context).pop(true);
      } else {
        Navigator.of(context).pop(false);
      }
    } else {
      ///权限通过
      Navigator.of(context).pop(true);
    }
  }

  void openSettingFaile() {
    showCommonAlertDialog(
        contentMessag: "暂时无法打开设置中心，请您打开手机设置->应用管理-同意权限",
        cancleText: "退出",
        cancleCallBack: () {
          closeApp();
        },
        context: context);
  }

  ///lib/app/page/common/permission_request_page.dart
  ///请求权限
  void requestStoragePermisson() async {
    ///请求权限
    PermissionStatus status = await widget.permission.request();

    ///校验权限申请结果
    checkPermissonFunction(status: status);
  }

  ///关闭应用程序或者权限请求功能
  Future<void> closeApp() async {
    if (widget.isColseApp) {
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(false);
      }
    }
  }
}
