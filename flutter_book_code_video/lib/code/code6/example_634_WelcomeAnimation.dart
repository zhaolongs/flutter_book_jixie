import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    home: Example634(),
  ));
}

///代码清单 6-54
///lib/code/code6/example_634_WelcomeAnimation.dart
class Example634 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //内边距设置
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 80),
        child: Stack(
          children: [
            //中间显示的卡片
            buildCenterCardWidget(context),
            //底部显示的按钮
            buildBottomAreaWidget()
          ],
        ),
      ),
    );
  }
  ///代码清单 6-56
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  Column buildBottomAreaWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //登录按钮
        buildLoginButton(),
        SizedBox(
          height: 20,
        ),
        //注册按钮
        buildRegister(),
      ],
    );
  }
  ///代码清单 6-58 注册按钮定义
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  CusFadeInAnimationWidget buildRegister() {
    //自定义组件平移渐变动画
    return CusFadeInAnimationWidget(
      delay: 0.1,
      child: Container(
        //内边距
        padding: EdgeInsets.only(top: 4, left: 4),
        //边框装饰
        decoration: BoxDecoration(
          //边框圆角
          borderRadius: BorderRadius.circular(50),
          //
          border: Border.all(),
        ),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {},
          color: Colors.yellow,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "注册",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }
  ///代码清单 6-57 登录按钮定义
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  CusFadeInAnimationWidget buildLoginButton() {
    return CusFadeInAnimationWidget(
      //延迟  animationMilli * delay 执行
      delay: 0.6,
      //动画执行时间
      animationMilli: 1000,
      //执行动画的Widget
      child: MaterialButton(
        //宽度填充
        minWidth: double.infinity,
        //高度
        height: 60,
        //点击事件
        onPressed: () {},
        //圆角边框
        shape: RoundedRectangleBorder(
          //边框颜色
          side: BorderSide(color: Colors.blue),
          //边框圆角
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "登录",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }

  ///代码清单 6-55
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  ///中间显示的卡片
  Center buildCenterCardWidget(BuildContext context) {
    return Center(
      //自定义动画
      child: CusFadeInAnimationWidget(
        delay: 0.6,
        slide: 0.2,
        animationMilli: 1600,
        //卡片
        child: Card(
          elevation: 8.0,
          //线性排列的文本与图片
          child: Column(
            //内容包裹
            mainAxisSize: MainAxisSize.min,
            children: [
              //定义卡片中内容图片的大小
              Container(
                padding: EdgeInsets.all(8),
                width: 140 * 2.0,
                height: 140 * 2.0,
                //构建Hero
                child: Image.asset(
                  "assets/images/2.0x/banner5.webp",
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                "清楚的定义",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              //占位
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

///代码清单 6-56
///lib/code/code6/example_634_WelcomeAnimation.dart
///自定义 平移动画、透明度动画组合
///在这里实现的是透明度由 0.0 ~ 1.0 的过渡
///       平移是在垂直方向由下向上的平移
class CusFadeInAnimationWidget extends StatefulWidget {
  //执行动画的Widget
  final Widget child;
  //开始执行的时间度控制
  final double delay;
  //动画执行时间
  final int animationMilli;
  //平移比例
  final double slide;

  CusFadeInAnimationWidget(
      {@required this.child,
      this.delay = 0.0,
      this.slide = 1.0,
      this.animationMilli = 1400});

  @override
  State<StatefulWidget> createState() {
    return _CusFadeInAnimationWidgetState();
  }
}

class _CusFadeInAnimationWidgetState extends State<CusFadeInAnimationWidget>
    with TickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;

  //渐变动画
  Animation<double> _opacityAnimation;

  //平移动画
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    //创建动画控制器
    _animationController = new AnimationController(
        duration: Duration(milliseconds: widget.animationMilli), vsync: this);

    //创建透明度动画 Interval 为延迟执行的比例
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(widget.delay, 1.0, curve: Curves.easeIn),
      ),
    );
    //创建平移动画 Interval 为延迟执行的比例
    _slideAnimation = Tween<Offset>(
      //定义在 Y 轴方向的移动
      begin: Offset(0, widget.slide),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(widget.delay, 1.0, curve: Curves.ease),
      ),
    );
    //开启动画
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    //平移动画
    return SlideTransition(
      //位置绑定
      position: _slideAnimation,
      //渐变动画
      child: FadeTransition(
        //透明度绑定
        opacity: _opacityAnimation,
        //执行动画的 Widget
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    //同步销毁
    _animationController.dispose();
    super.dispose();
  }
}
