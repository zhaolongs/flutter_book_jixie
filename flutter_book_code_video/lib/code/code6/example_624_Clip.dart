import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// gongzhonghao biglead
// https://study.163.com/instructor/1021406208.htm
// https://blog.csdn.net/zl1
// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example624(),
  ));
}

class Example624 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  //创建动画控制器
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    //创建动画控制器 0.0 ~ 1.0 执行时间 1400 毫秒
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    );

    //实时刷新
    animationController.addListener(() {
      setState(() {});
    });

    //动画状态监听
    animationController.addStatusListener((status) {
      //反复执行
      if (status == AnimationStatus.completed) {
        animationController.reset();
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Clip 动画 "),
      ),
      //线性排列
      body: Column(
        children: [
          //第一部分 效果区域
          buildClipContainer(context),
          //第二部分 按钮区域 与代码清单 代码清单 6-29 中的一致
          buildContainer()
        ],
      ),
    );
  }

  /// 代码清单 6-32 Clip 裁剪动画
  ///lib/code/code6/example_624_Clip.dart
  Container buildClipContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.grey[300],
      child: Stack(
        children: [
          //一个图片
          Positioned.fill(
            child: Container(
              child: Image.asset(
                "assets/images/3.0x/welcome.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          //核心功能
          ClipRect(
            child: Align(
              //左对齐
              alignment: Alignment.centerLeft,
              //在这理解为裁剪的比例 0.0 - 1.0
              widthFactor: animationController.value,
              //高斯模糊
              child: BackdropFilter(
                //模糊设置
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                //模糊内容填充
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 代码清单 6-29
  ///lib/code/code6/example_622_Hero.dart
  Container buildContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        //子Widget居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("开始"),
            onPressed: () {
              //正向执行动画
              animationController.forward();
            },
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            child: Text("停止"),
            onPressed: () {
              //正向执行动画
              animationController.reset();
            },
          ),
        ],
      ),
    );
  }
}
