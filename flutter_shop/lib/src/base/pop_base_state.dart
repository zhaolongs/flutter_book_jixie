import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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


///弹框使用基类
///lib/app/base/pop_base_state.dart
abstract class PopBaseState <T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    ///状态栏的全透明沉浸
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    //隐藏顶部的状态栏
    //这个方法也可把状态栏和虚拟按键隐藏掉
    //   SystemUiOverlay.top 状态栏
    //  SystemUiOverlay.bottom 底部的虚拟键盘
    // SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    super.dispose();
    //显示
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }
}
