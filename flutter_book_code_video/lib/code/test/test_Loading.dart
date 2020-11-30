import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_life_state/flutter_life_state.dart';
import 'package:flutterbookcode/app/page/common/app_upgrade.dart';
import 'package:flutterbookcode/app/page/common/common_loading_dialog.dart';
import 'package:flutterbookcode/utils/time_date_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/27.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: TestLoadingPage(),
  ));
}

/// 代码清单
///测试加载圆圈
class TestLoadingPage extends StatefulWidget {
  @override
  _TestLoadingPageState createState() => _TestLoadingPageState();
}

class _TestLoadingPageState extends BaseLifeState<TestLoadingPage> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载进度"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Text("当前金额:"),
                  LoadingWidget(),
                ],
              ),
              SizedBox(
                height: 44,
              ),
              ElevatedButton(
                child: Text("显示加载进度"),
                onPressed: () {
                  showLoadingWidget(context: context);
                },
              ),
              ElevatedButton(
                child: Text("显示加载进度 无阴影"),
                onPressed: () {
                  showLoadingWidget(
                      context: context,
                      //显示背景阴影
                      isBackShadow: true);
                },
              ),
              ElevatedButton(
                child: Text("显示 升级弹框"),
                onPressed: () {
                  showAppUpgradeDialog(
                    upgradText: "1.优化首页面列表显示功能 \n2.优化用户体验功能",
                    context: context,
                  );
                },
              ),
            ],
          )),
    );
  }
}
