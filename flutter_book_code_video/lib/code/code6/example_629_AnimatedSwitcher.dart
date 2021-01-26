import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example629(),
  ));
}

///代码清单 6-40 AnimatedSwitcher
///lib/code/code6/example_629_AnimatedSwitcher.dart
class Example629 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  //计时器
  Timer _timer;

  //计时更新的次数 文本显示内容
  int _count = 1000;

  //点击按钮时启动
  void startTimer() {
    if (_timer != null && _timer.isActive) {
      stopTimer();
    }
    _timer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
      _count++;
      setState(() {});
    });
  }

  //点击停止按钮时停止计时
  //Widget销毁时调用
  void stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }

  ///代码清单 6-41
  ///lib/code/code6/example_629_AnimatedSwitcher.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("AnimatedSwitcher 动画 "),
      ),
      //线性排列
      body: Column(
        children: [
          //第一部分 效果区域
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: buildAnimatedSwitcher(context),
          ),
          //第二部分 按钮区域 与代码清单 代码清单 6-29 中的一致
          buildContainer()
        ],
      ),
    );
  }

  ///代码清单 6-42 AnimatedSwitcher 的基本使用
  ///lib/code/code6/example_629_AnimatedSwitcher.dart
  AnimatedSwitcher buildAnimatedSwitcher(BuildContext context) {
    return AnimatedSwitcher(
      //动画执行切换时间
      duration: const Duration(milliseconds: 1000),
      //动画构建器 构建指定动画类型
      //每次修改都会回调两次 移进时回调一次 移出时回调一次
      transitionBuilder: (Widget child, Animation<double> animation) {
        //构建切换使用动画
        return buildMultAnimation(animation, child);
      },
      //执行动画的子 Widget
      //只有子 Widget 被切换时才会触发动画
      child: Text(
        '$_count',
        //显示指定key，不同的key会被认为是不同的Text
        key: ValueKey<int>(_count),
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w500,
          color: getRandomColor(),
        ),
      ),
    );
  }
  ///代码清单 6-45 按钮区域 组合多个基本动画
  ///lib/code/code6/example_629_AnimatedSwitcher.dart

  SlideTransition buildMultAnimation(
      Animation<double> animation, Widget child) {
    //Text移进的平移动画
    Offset startOffset = Offset(0.0, -1.2);
    Offset endOffset = Offset(0.0, 0.0);
    if (animation.status == AnimationStatus.completed) {
      //Text移出的平移动画
      startOffset = Offset(0.0, 1.2);
      endOffset = Offset(0.0, 0.0);
    }
    print("animation.status ${animation.status}");
    //这里的核心内容是 动画的相互嵌套使用
    //执行平移动画
    return SlideTransition(
      // 位置移动区分移动进入的Text 与 移动出去的Text
      position: Tween(begin: startOffset, end: endOffset).animate(
        CurvedAnimation(
          parent: animation,
          //跳动的动画曲线
          curve: Curves.bounceOut,
        ),
      ),
      //透明度渐变动画
      child: FadeTransition(
        // 透明度从 0.0-1.0
        opacity: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
        ),
        //绽放动画
        child: ScaleTransition(
          scale: Tween(begin: 0.6, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
  ///代码清单 6-43 生成随机颜色
  ///lib/code/code6/example_629_AnimatedSwitcher.dart
  Color getRandomColor() {
    return Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  }

  ///代码清单 6-44 按钮区域
  ///lib/code/code6/example_629_AnimatedSwitcher.dart
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
              startTimer();
            },
          ),
          SizedBox(
            width: 22,
          ),
          ElevatedButton(
            child: Text("停止"),
            onPressed: () {
              stopTimer();
            },
          ),
        ],
      ),
    );
  }
}
