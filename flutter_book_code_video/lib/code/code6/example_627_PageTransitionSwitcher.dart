
import 'package:animations/animations.dart';
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
    home: Example627(),
  ));
}


class Example627 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("谈入动画 "),
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



  /// 代码清单 6-29 淡入动画
  /// lib/code/code6/example_627_PageTransitionSwitcher.dart
  /// 切换页面显示标识
  bool isSelect = false;
  Widget buildClipContainer(BuildContext context) {
    return PageTransitionSwitcher(
      //动画执行切换时间
      duration: const Duration(milliseconds: 1200),
      //动画构建器 构建指定动画类型
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        //构建切换使用动画
        return FadeThroughTransition(
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
        );
      },
      //执行动画的子 Widget
      //只有子 Widget 被切换时才会触发动画
      child: isSelect
          ? Container(
              key: UniqueKey(),
              width: 200,
              height: 100,
              color: Colors.lightGreenAccent,
              child: Text("这时什么情况!!!！！"),
            )
          : Container(
              key: UniqueKey(),
              width: 200,
              height: 100,
              color: Colors.orange,
              child: Text("哈哈哈哈!!!"),
            ),
    );
  }


  Container buildContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        //子Widget居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("切换"),
            onPressed: () {
              isSelect = !isSelect;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
