import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/base/pop_base_state.dart';
import 'package:flutter_video/src/utils/log_util.dart';
import 'package:flutter_video/src/utils/navigator_utils.dart';

import 'base/pop_base_state.dart';
import 'page/home/home_main_page.dart';

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
///lib/src/welcome_page.dart
///广告倒计时欢迎页面
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends PopBaseState<WelcomePage> {

 //时间计时器
  Timer _timer;
 //初始的时间
  double progress = 1000;
 //倒计时时间
  double totalProgress = 6000;
 //AnimatedContainer的装饰的阴影的宽度
  double borderWidth = 1.0;

 //生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
   //初始化时间计时器
   //每100毫秒执行一次
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
     //进度每次累加100，
      progress += 100;
     //每一秒进行一次
     //AnimatedContainer的装饰的阴影的高度的修改
      if (progress % 1000 == 0) {
        if (borderWidth == 1.0) {
          borderWidth = 8.0;
        } else {
          borderWidth = 1.0;
        }
      }
     //计时完成后进入首页面
      if (progress >= totalProgress) {
        //完成计时后 取消计时 进入首页面
        _timer.cancel();
        goHome();
      }
      LogUtil.e("定时器 $progress");
      setState(() {});
    });
  }

 //生命周期函数 页面销毁时执行一次
  @override
  void dispose() {
   //取消定时
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
       //层叠布局
        child: Stack(
          children: [
           //背景图片
            buildBackgroundImage(),
           //倒计时使用的进度圆圈
            buildTimerProgress(),
          ],
        ),
      ),
    );
  }

 //lib/src/welcome_page.dart
 //可点击的 倒计时进度圆圈
  Positioned buildTimerProgress() {
    return Positioned(
      //右上角对齐
      right: 20, top: 60,
      //点击事件回调
      child: InkWell(
        onTap: () {
          goHome();
        },
        child: buildAnimatedContainer(),
      ),
    );
  }
 //lib/src/welcome_page.dart
 //白色阴影变化的 进度圆圈
  AnimatedContainer buildAnimatedContainer() {
    return AnimatedContainer(
     //过渡时间
      duration: Duration(milliseconds: 1000),
      decoration: BoxDecoration(
          color: Colors.black,
         //背景装饰的圆角
          borderRadius: BorderRadius.all(Radius.circular(30)),
         //边框样式
          border: Border.all(color: Colors.grey, width: 2.0),
         //白色的高斯模糊背景阴影
          boxShadow: [
            BoxShadow(
              color: Colors.white,
             //阴影的宽度
              blurRadius: borderWidth,
            ),
          ]),
     //层叠布局组合圆圈与显示的文本
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress / totalProgress,
          ),
          Text(
            "${progress ~/ 1000}",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

 ///lib/src/welcome_page.dart
 //倒计时页面的背景图
  Positioned buildBackgroundImage() {
    //填充
    return Positioned.fill(
      child: Image.asset(
        "assets/images/3.0x/welcome.png",
        fit: BoxFit.fill,
      ),
    );
  }

 //跳转首页面
 //Navigator的pushReplacement方法替换当前显示的Widget
  void goHome() {
    NavigatorUtils.openPageByFade(context, HomeMainPage(), isReplace: true);
  }

  void test(){
   //5秒
    const timeout = const Duration(seconds: 5);
    print('currentTime='+DateTime.now().toString());
   //5秒后调用一次
    Timer timer = Timer(timeout, () {
      print('afterTimer='+DateTime.now().toString());
    });
  // timer.cancel();
   // 或者使用
   //5秒后调用一次
    Future.delayed(timeout,(){
      print('FutureafterTimer='+DateTime.now().toString());
    });
  }

  void test2(){
   //100毫秒
    const timeout = const Duration(milliseconds: 100);
   //100毫秒秒后调用一次
    Timer timer = Timer.periodic(timeout, (timer) {

    });
   // timer.cancel();
   // 或者使用
   //5秒后调用一次
    Future.delayed(timeout,(){
      print('FutureafterTimer='+DateTime.now().toString());
    });
  }
}
