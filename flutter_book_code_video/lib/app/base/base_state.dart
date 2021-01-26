import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
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

///lib/app/base/base_state.dart
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    //埋点信息 页面的进入
  }

  @override
  void dispose() {
    super.dispose();
    //埋点信息 页面的退出
  }

  //打开新的页面
  void push({@required Widget page}) {
    NavigatorUtils.pushPage(context, page);
  }

  //关闭当前页面
  void pop() {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }
}
