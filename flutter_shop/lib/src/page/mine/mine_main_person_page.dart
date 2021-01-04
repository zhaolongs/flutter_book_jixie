import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_life_state/flutter_life_state.dart';
import 'package:flutter_shop/src/utils/log_util.dart';

import 'mine_item_page.dart';
import 'mine_sliver_header_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 

class MineMainPersonPage extends StatefulWidget {
  @override
  _MinePersonPageState createState() => _MinePersonPageState();
}
///[BaseLifeState]生命周期封装组件
class _MinePersonPageState extends BaseLifeState<MineMainPersonPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;

  //SliverAppBar展开的高度
  double _defaultExpandHeight = 278;

  //初始化要加载到图片上的高度
  double _extraPicHeight = 0;

  //图片填充类型（刚开始滑动时是以宽度填充，拉开之后以高度填充）
  BoxFit _fitType = BoxFit.fitWidth;

  //前一次手指所在处的y值
  double _prePointDy = 0;

  //动画控制器
  AnimationController _ationController;

  //Stream 控制器用来这里的局部刷新功能
  StreamController<double> _heightStreamController = new StreamController();

  //logo 使用的数据流更新
  StreamController<double> _logoStreamController = new StreamController();

  //ScrollView使用的滑动控制器
  ScrollController _scrollController = new ScrollController();

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
      _heightStreamController
          .add(_extraPicHeight * (1.0 - _ationController.value));
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

    ///创建控制器
    _tabController = new TabController(
      //初始化显示的页面
        initialIndex: 0,
        //页面个数
        length: bodyWidgetList.length,
        vsync: this);

  }

  //页面销毁回调生命周期
  @override
  void dispose() {
    super.dispose();
    //关闭通道
    _heightStreamController.close();
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
          controller: _scrollController,
          //配置可折叠的头布局
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              MineSliverHeaderWidget(
                logoStreamController: _logoStreamController,
                streamController: _heightStreamController,
                fitType: _fitType,
                tabController: _tabController,
              ),
            ];
          },
          //页面的主体内容
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: bodyWidgetList,
          ),
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

  ///子页面
  List<Widget> bodyWidgetList = [
    MineItemPage(0),
    MineItemPage(1),
    MineItemPage(2),
  ];

  //创建控制器
  TabController _tabController;

  //旋转角度
  double _roateRadian = pi / 2;

  ///代码清单 5-32
  ///lib/code/code5/example_507_NestScrollView.dart
  updatePicHeight(changed) {
    //当前ScrollView滑动距离
    double offset = _scrollController.offset;
    //开始旋转的距离
    double roateOffset = _defaultExpandHeight / 2;
    if (offset >= roateOffset && offset <= _defaultExpandHeight) {
      //计算旋转的角度
      _roateRadian = pi / 2 - (offset - roateOffset) / (roateOffset) * pi / 2;
      _logoStreamController.add(_roateRadian);
      LogUtil.e("滑动距离 offset $offset  roateFlag $_roateRadian");
    } else if (offset >= _defaultExpandHeight) {
      if (_roateRadian != 0.0) {
        _roateRadian = 0.0;
        _logoStreamController.add(0.0);
      }
    } else {
      if (_roateRadian != pi / 2) {
        _roateRadian = pi / 2;
        _logoStreamController.add(pi / 2);
      }
    }
    print(
        "_defaultExpandHeight $_defaultExpandHeight  extraPicHeight $_extraPicHeight prev_dy $_prePointDy");
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
      _heightStreamController.add(_extraPicHeight);
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
