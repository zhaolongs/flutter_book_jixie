import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/flash/child/list_placeholder.dart';
import 'package:flutterbookcode/demo/flash/flash_animation_controller.dart';
import 'package:flutterbookcode/demo/flash/flash_animation_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/14.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// lib/code23/main_data2301.dart
/// 闪光动画 FlashAnimation 的使用案例
class FlashAnimationPage extends StatefulWidget {
  @override
  _FlashAnimationPageState createState() => _FlashAnimationPageState();
}

class _FlashAnimationPageState extends State<FlashAnimationPage> {
  ///闪光动画控制器
  FlashAnimationController flashAnimationController =
      new FlashAnimationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("闪光动画"),
      ),
      backgroundColor: Colors.white,
      ///执行亮光动画过渡的Widget
      body: buildContentWidget(),
      ///按钮控制动画的开始与结束
      floatingActionButton: buildActionButton(),
    );
  }
  /// lib/code23/main_data2301.dart
  /// 页面的主体
  buildContentWidget() {
    return Container(
      ///填充父布局
      width: double.infinity,
      ///内边距设置
      padding: EdgeInsets.all( 16.0),
      ///通过静态函数来构建 FlashAnimation
      child: FlashAnimation.fromColors(
        ///动画控制器
        flashAnimationController: flashAnimationController,
        ///循环次数 默认为 0 无限循环
        animationLoopCount: 0,
        ///底色
        normalColor: Colors.grey[400],
        ///亮色
        highlightColor:Colors.grey[200],
        ///开启动画
        animationStart: true,
        ///执行动画的子Widget
        ///这里是一个Widget类型，也就是可以使用任意的Widget
        ///[ListPlacholderWidget]
        child: ListPlacholderWidget(),
      ),
    );
  }

  /// lib/code23/main_data2301.dart
  ///默认动画是打开状态
  bool isOpen = true;
  ///右下角的按钮
  ///按钮控制动画的开始与结束
  buildActionButton() {
    return FloatingActionButton(
      ///根据不同的状态设置不同的图标
      child: Icon(isOpen?Icons.close:Icons.open_in_browser),
      onPressed: () {
        isOpen = !isOpen;
        if(isOpen){
          ///打开动画
          flashAnimationController.start();
        }else{
          ///关闭动画
          flashAnimationController.stop();
        }
        ///刷新
        setState(() {

        });
      },
    );
  }
}
