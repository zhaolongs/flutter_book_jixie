import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ho/src/bean/bean_app_version.dart';
import 'package:flutter_app_ho/src/common/user_helper.dart';
import 'package:flutter_app_ho/src/net/dio_utils.dart';
import 'package:flutter_app_ho/src/page/common/app_upgrade.dart';
import 'package:flutter_app_ho/src/page/common/user_protocol_page.dart';
import 'package:flutter_app_ho/src/page/login/bubble_login_page.dart';
import 'package:flutter_app_ho/src/utils/log_util.dart';
import 'package:flutter_app_ho/src/utils/navigator_utils.dart';
import 'package:flutter_app_ho/src/utils/toast_utils.dart';
import 'package:package_info/package_info.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/3.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///设置中心
///lib/src/page/mine/settings_page.dart
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置中心"),
      ),
      body: ListView(
        children: [
          //第一部分显示用户协议相关
          ListTile(
            leading: Icon(Icons.person),
            title: Text("用户协议"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              //用户协议 弹框显示
              showUserProtocolPage(
                context: context,
              );
            },
          ),
          //第二部分检查更新功能
          ListTile(
            leading: Icon(Icons.web_sharp),
            title: Text("检查更新"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              checkAppVersion();
            },
          ),
          //第三部分检查登录
          buildLoginRow(context),
        ],
      ),
    );
  }

  ListTile buildLoginRow(BuildContext context) {
    String text = "退出登录";
    if (!UserHelper.getInstance.userIsLogin) {
      text = "去登录";
    }
    return ListTile(
      leading: Hero(
        tag: "loginTag",
        child: Material(
          child: Icon(Icons.exit_to_app),
          color: Colors.transparent,
        ),
      ),
      title: Text("$text"),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        //清除缓存用户信息
        UserHelper.getInstance.exitLogin();
        //跳转登录页面
        NavigatorUtils.openPageByFade(
          context,
          BobbleLoginPage(),
          mills: 1000,
          endMills: 800,
          isReplace: true,
        );
      },
    );
  }

  void checkAppVersion() async {

    //获取当前App的版本信息
    PackageInfo   packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    LogUtil.e("appName $appName");
    LogUtil.e("packageName $packageName");
    LogUtil.e("version $version");
    LogUtil.e("buildNumber $buildNumber");

    //请求接口获取App版本信息
    ResponseInfo responseInfo = await DioUtils.instance.getRequest(url: HttpHelper.APP_VERSION_URL);

    if(responseInfo.success){
      if(responseInfo.data!=null){
        //解析数据
        AppVersionBean versionBean = AppVersionBean.fromMap(responseInfo.data);
        //升级提示框
        showAppUpgradeDialog(
          //升级显示文案
          upgradText: versionBean.message,
          //是否是强制升级
          isForce: versionBean.isForce,
          //下载apk的地址
          apkUrl :versionBean.apkUrl,
          context: context,
        );
      }else{
        ToastUtils.showToast("已是最新版本");
      }

    }else{
      ToastUtils.showToast("查询失败 请稍后再试");
    }
  }
}
