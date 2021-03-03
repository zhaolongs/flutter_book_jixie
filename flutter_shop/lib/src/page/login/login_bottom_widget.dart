import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/1.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

///代码清单 13- 登录页面中使用到的底部弹框
///lib/src/page/login/login_bottom_widget.dart
class LoginBottomWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginBottomWidgetState();
  }
}

class _LoginBottomWidgetState extends State<LoginBottomWidget> {
  String resultMessage = "--";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Column(
        children: [
          buildItem("微信登录", "assets/images/2.0x/wx.png", onTap: () {
            setState(() {
              resultMessage = "微信登录";
            });
          }),
          //分割线
          Divider(),

          buildItem("QQ登录", "assets/images/2.0x/qq.png", onTap: () {
            setState(() {
              resultMessage = "qq 登录点击";
            });
          }),
          //分割线
          Divider(),
          buildItem("密码登录", "assets/images/2.0x/password.png", onTap: () {
            setState(() {
              resultMessage = "密码登录 点击";
            });
          }),

          Container(
            color: Colors.grey[300],
            height: 8,
          ),

          //取消按钮
          //添加个点击事件
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              child: Text("取消"),
              height: 44,
              alignment: Alignment.center,
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(String title, String imagePath, {Function onTap}) {
    //添加点击事件

    return InkWell(
      //点击回调
      onTap: () {
        //关闭弹框
        Navigator.of(context).pop();
        //外部回调
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 40,
        //左右排开的线性布局
        child: Row(
          //所有的子Widget 水平方向居中
          mainAxisAlignment: MainAxisAlignment.center,
          //所有的子Widget 竖直方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
