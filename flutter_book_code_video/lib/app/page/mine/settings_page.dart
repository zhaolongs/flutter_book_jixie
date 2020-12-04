import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/common/user_helper.dart';
import 'package:flutterbookcode/app/page/login/bubble_login_page.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/3.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///设置中心
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
      backgroundColor: Colors.white,

      ///填充布局
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("用户协议"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.web_sharp),
            title: Text("检查更新"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Hero(
              tag: "loginTag",
              child: Material(
                child: Icon(Icons.exit_to_app),
                color: Colors.transparent,
              ),
            ),
            title: Text("退出登录"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              UserHelper.getInstance.exitLogin();
              NavigatorUtils.openPageByFade(
                context,
                BobbleLoginPage(),
                mills: 1000,
                endMills: 800,
                isReplace: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
