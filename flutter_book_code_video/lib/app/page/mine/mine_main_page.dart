import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_life_state/flutter_life_state.dart';
import 'package:flutterbookcode/code/code2/example_217_appbar_page.dart';
import 'package:flutterbookcode/code/code5/example_507_NestScrollView.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///

/// lib/app/page/mine/mine_main_page.dart
/// 我的页面
class MineMainPage extends StatefulWidget {
  @override
  MinePageState createState() => MinePageState();
}

///[BaseLifeState]生命周期封装组件
class MinePageState extends BaseLifeState<MineMainPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;

  //SliverAppBar展开的高度
  double _defaultExpandHeight = 260;

  //初始化要加载到图片上的高度
  double _extraPicHeight = 0;

  //图片填充类型（刚开始滑动时是以宽度填充，拉开之后以高度填充）
  BoxFit _fitType = BoxFit.fitWidth;

  //前一次手指所在处的y值
  double _prePointDy = 0;

  //动画控制器
  AnimationController _ationController;

  //Stream 控制器用来这里的局部刷新功能
  StreamController<double> _streamController = new StreamController();

  //页面初始化方法
  @override
  void initState() {
    super.initState();
    //初始化 回弹执行时间为 400毫秒
    _ationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    //添加一个动画执行过程实时监听
    _ationController.addListener(() {
      //_ationController.value 的值是从 0.0~1.0
      _streamController.add(_extraPicHeight * (1.0 - _ationController.value));
    });

    //添加一个动画执行状态监听
    _ationController.addStatusListener((status) {
      //获取动画状态
      AnimationStatus animationStatus = _ationController.status;
      //动画执行完成
      if (animationStatus == AnimationStatus.completed) {
        //更新图片展开添加的高度为0
        _extraPicHeight = 0;
        //修改图片的填充方式
        _fitType = BoxFit.fitWidth;
      }
    });
  }

  //页面销毁回调生命周期
  @override
  void dispose() {
    super.dispose();
    //关闭通道
    _streamController.close();
    //释放动画控制器
    _ationController.dispose();
  }

  ///代码清单 5-29 下拉放大顶部图片Demo build函数
  ///lib/code/code5/example_507_NestScrollView.dart
  @override
  Widget build(BuildContext context) {
    super.build(context);
    //手势监听
    return Listener(
      child: Scaffold(
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          //配置可折叠的头布局
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [buildStreamBuilder()];
          },
          //页面的主体内容
          body: ItemPage(1),
        ),
      ),
      onPointerMove: (result) {
        //手指的移动时
        updatePicHeight(result.position.dy); //自定义方法，图片的放大由它完成。
      },
      onPointerUp: (result) {
        //当手指抬起离开屏幕时
        resetSetPicHeight();
      },
    );
  }

  ///代码清单 5-30 下拉放大顶部图片Demo build函数
  ///lib/code/code5/example_507_NestScrollView.dart
  StreamBuilder<double> buildStreamBuilder() {
    return StreamBuilder<double>(
      //绑定流
      stream: _streamController.stream,
      //初始化的数据 这里用作图片放大的高度
      initialData: 0.0,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        //构建需要更新的 Widget
        return buildSliverAppBar(snapshot.data);
      },
    );
  }

  ///代码清单 5-31 下拉放大顶部图片Demo SliverAppBar 的创建
  ///lib/code/code5/example_507_NestScrollView.dart
  Widget buildSliverAppBar(double extraHeight) {
    return SliverAppBar(
      title: Text("详情"),
      //标题居中
      centerTitle: true,
      //5.1.2小节中有对这一块的属性配置说明
      floating: false,
      pinned: true,
      snap: false,
      elevation: 0.0,
      //展开的高度
      expandedHeight: _defaultExpandHeight + extraHeight,
      //第二部分 AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        //背景
        //配置的是一个widget也就是说在这里可以使用任意的
        //Widget组合 在这里直接使用的是一个图片
        background: Stack(
          children: [
            Container(
              //缩放的图片
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/3.0x/bg_header.png",
                  height: 180 + extraHeight, fit: _fitType),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 160,
              child: Stack(
                children: [
                  Positioned(
                    top: 32,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        NavigatorUtils.openPageByFade(
                            context, HeaderImagePage(),
                            opaque: false);
                      },
                      child: Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              color: Colors.black12,
                              blurRadius: 2,
                            ),
                            BoxShadow(
                              offset: Offset(-2, 2),
                              color: Colors.black12,
                              blurRadius: 2,
                            )
                          ],
                        ),
                        child: Hero(
                          tag: "test",
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/2.0x/app_icon.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///代码清单 5-32
  ///lib/code/code5/example_507_NestScrollView.dart
  updatePicHeight(changed) {
    print("extraPicHeight $_extraPicHeight prev_dy $_prePointDy");
    //安全判断  qwer 77890
    if (_prePointDy == 0.0) {
      _prePointDy = changed;
    }
    //向下滑动时 会大于0
    if (_extraPicHeight >= 0) {
      //改变图片的填充方式，让它由以宽度填充变为以高度填充，从而实现了图片视角上的放大。
      _fitType = BoxFit.fill;
    } else {
      //向上滑动时折叠隐藏
      _fitType = BoxFit.fitWidth;
    }
    //每次滑动的距离 加载到图片上的高度。
    _extraPicHeight += (changed - _prePointDy) / 10;
    //更新手指位点坐标
    _prePointDy = changed;
    //只有向下滑动时图片放大的情况再更新放大的效果
    if (_extraPicHeight >= 0) {
      //更新图片的高度
      _streamController.add(_extraPicHeight);
    } else {
      //如果是向上折叠的过程不记录手指点位
      _prePointDy = 0.0;
    }
  }

  ///代码清单 5-33
  ///lib/code/code5/example_507_NestScrollView.dart
  resetSetPicHeight() {
    if (_prePointDy >= 0) {
      _prePointDy = 0;
      //设置动画让extraPicHeight的值从当前的值渐渐回到 0
      _ationController.reset();
      _ationController.forward();
    }
  }
}

class HeaderImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: buildHero(context),
        ),
      ),
    );
  }

  ///图片区域
  Hero buildHero(BuildContext context) {
    return Hero(
      tag: "test",
      child: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            "assets/images/2.0x/app_icon.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
