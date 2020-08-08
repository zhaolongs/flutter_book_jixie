import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/base/base_life_state.dart';
import 'package:flutterbookcode/app/page/mine/setting_page.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';

import 'mine_item_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
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

  ///在这里标签页面使用的是TabView所以需要创建一个控制器
  TabController tabController;

  ///当下拉放大时使用到的动画控制器
  AnimationController _animationController;
  ///页面初始化方法
  @override
  void initState() {
    super.initState();
    ///初始化动画控制器
    ///下拉放大显示顶部图片 松手后自动回弹控制
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    ///添加监听
    ///[defaultExpandHeight]是默认展开的高度
    ///[expandScrollHeithg] 默认展开高度之外下拉的距离
    _animationController.addListener(() {
      ///实现回弹效果的计算
      expandHeight = defaultExpandHeight +
          (1 - _animationController.value) * expandScrollHeithg;
      LogUtil.e("动画执行 $expandHeight");
      setState(() {});
    });

    ///ScrollController添加滚动监听
    ///scrollController.addListener(controllerListener);
    ///初始化
    tabController = new TabController(length: 3, vsync: this);
  }

  ///页面销毁回调生命周期
  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }




  ///页面构建方法
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ///构建页面的主体
    return Scaffold(
        body: Listener(
            ///手指移动的回调
            onPointerMove: moveListener,
            ///手指抬起时的回调
            onPointerUp: upListener,
            ///构建滑动布局主体结构
            child: buildNestedScrollView()));
  }




  /// lib/app/page/mine/mine_main_page.dart
  ///记录手指每次滑动时的偏移量
  double preDy = 0.0;
  ///默认展开的高度
  double defaultExpandHeight = 300;
  ///当前展开的高度
  double expandHeight = 300;
  ///展开的最大高度
  double expandMaxHeight = 420;
  ///临时记录下拉的展开的距离
  double expandScrollHeithg = 0;

  /// [Listener]的手指移动起事件回调
  void moveListener(PointerMoveEvent result) {
    ///获取在竖直方向的滑动偏移量
    double dy = result.position.dy;
    ///记录手指按下的距离
    if (preDy == 0) {
      preDy = dy;
    }

    ///当前展开的高度+滑动的偏移量
    expandHeight += dy - preDy;
    LogUtil.e("expandHeight $expandHeight");

    ///如果向下滑动的大于最大的可滑动距离时
    ///设置为最大的可滑动的距离
    if (expandHeight >= expandMaxHeight) {
      expandHeight = expandMaxHeight;
    } else if (expandHeight <= 0) {
      ///最小折叠距离为0
      expandHeight = 0;
    }

    ///计算标题的透明度
    ///只有展开的高度小于默认的高度时才开始计算
    if (expandHeight > 0 && expandHeight < defaultExpandHeight) {
      ///默认情况或者自动回弹后
      ///expandHeight与defaultExpandHeight的比值为1:1
      ///也就是展开时 透明度为0.0 标题不显示

      ///当滑动到顶部时 expandHeight的值为0
      ///透明度计算为 1.0 所以标题为显示
      slidRate = 1.0 - expandHeight / defaultExpandHeight;

      ///因为设置的有下拉回弹效果
      ///所以会出与负值 需要对边界限制
      if (slidRate <= 0.0) {
        slidRate = 0.0;
      } else if (slidRate > 1.0) {
        slidRate = 1.0;
      }
    }

    ///更新滑动标识
    preDy = dy;
    setState(() {});
  }
  /// [Listener]的手指抬起事件回调
  void upListener(PointerUpEvent event) {
    preDy = 0;
    ///手指抬起时 如果当前滑动的距离大于 默认展开的高度
    ///就开启动画控制器来动态回弹到默认的展开高度
    if (expandHeight > defaultExpandHeight) {
      ///记录滑动的值
      expandScrollHeithg = expandHeight - defaultExpandHeight;
      LogUtil.e("expandScrollHeithg $expandScrollHeithg");
      ///重置并开启动画
      _animationController.reset();
      _animationController.forward();
    }
  }
  /// lib/app/page/mine/mine_main_page.dart
  ///我的页面滑动主体构建
  Widget buildNestedScrollView() {
    ///滑动视图
    return NestedScrollView(
      physics: BouncingScrollPhysics(),
      ///配置可折叠的头布局
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar()];
      },
      ///页面的主体内容
      ///[TabBarView]实现的可左右滑动切换视图
      ///            可点击标签实现视图左右切换
      body: buidChildWidget(),
    );
  }
  ///lib/app/page/mine/mine_main_page.dart
  ///SliverAppBar
  ///flexibleSpace可折叠的内容区域
  buildSliverAppBar() {
    return SliverAppBar(
      /// 顶部中间显示的标题
      title: buildHeader(),
      ///标题居中
      centerTitle: true,
      ///当此值为true时 SliverAppBar 会固定在页面顶部
      ///当此值为fase时 SliverAppBar 会随着滑动向上滑动
      pinned: true,
      ///当值为true时 SliverAppBar设置的title会随着上滑动隐藏
      ///然后配置的bottom会显示在原AppBar的位置
      ///当值为false时 SliverAppBar设置的title会不会隐藏
      ///然后配置的bottom会显示在原AppBar设置的title下面
      floating: false,
      ///当snap配置为true时，向下滑动页面，SliverAppBar（以及其中配置的flexibleSpace内容）会立即显示出来，
      ///反之当snap配置为false时，向下滑动时，只有当ListView的数据滑动到顶部时，SliverAppBar才会下拉显示出来。
      snap: false,
      ///展开的高度
      expandedHeight: expandHeight,
      ///AppBar下的内容区域
      flexibleSpace: buildFlexibleSpaceBar(),
      ///对应的标签栏
      bottom: buildFlexibleTooBarWidget(),
    );
  }
  ///lib/app/page/mine/mine_main_page.dart
  FlexibleSpaceBar buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Container(
        color: Color(0xff212f38),
        child: Stack(
          children: [
            ///背景图片
            Positioned(left: 0, right: 0, bottom: 220, top: 0,
              child: Image.asset(
                "assets/images/3.0x/welcome.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            ///用户信息层
            Positioned(bottom: 60,
              child: buildUserContainer(),
            ),
          ],
        ),
      ),
    );
  }

  ///lib/app/page/mine/mine_main_page.dart
  ///顶部折叠区域的用户信息层
  Container buildUserContainer() {
    return Container(
      padding: EdgeInsets.only(left: 14,),
      child: Column(
        mainAxisSize: MainAxisSize.min,        //包裹
        crossAxisAlignment: CrossAxisAlignment.start,//左对齐
        children: [
          ///头像与编辑资料的区域
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width - 28,
            child: buildTopUserHeader(),
          ),
          SizedBox(height: 8,),//间隔占位
          Text(
            "早起的年起人",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 2,),
          Text(
            "个性号",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Divider(
            color: Colors.white,
            thickness: 1.0,
          ),
          Container(
            child: Text(
              "因为年轻，所以执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天。",
              style: TextStyle(fontSize: 14, color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }

  ///通常在用到 PageView + BottomNavigationBar 或者 TabBarView + TabBar 的时候
  ///大家会发现当切换到另一页面的时候, 前一个页面就会被销毁, 再返回前一页时, 页面会被重建,
  ///随之数据会重新加载, 控件会重新渲染 带来了极不好的用户体验.
  ///由于TabBarView内部也是用的是PageView, 因此两者的解决方式相同
  ///页面的主体内容
  Widget buidChildWidget() {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        MineItemPage(1),
        MineItemPage(2),
        MineItemPage(3),
      ],
    );
  }
  ///lib/app/page/mine/mine_main_page.dart
  ///透明组件的透明度比率 主要用于页面顶部标题
  ///0.0 到一 1.0
  double slidRate = 0.0;

  ///构建SliverAppBar的标题title
  ///根据滑动的距离以透明渐变的方式来实现
  ///显示与隐藏的过渡
  buildHeader() {
    ///透明组件
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            ///透明度
            opacity: slidRate,
            child:
                Text(StringLanguages.of(context).get(StringKey.settingCenter)),
          ),
          ///右侧的圆形菜单显示按钮
          Positioned(
            right: 1,
            child: InkWell(
              onTap: () {
                NavigatorUtils.pushPage(context, SettingPage());
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    color: Color(0x50eeeeee),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Icon(
                  Icons.menu,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///lib/app/page/mine/mine_main_page.dart
  ///[SliverAppBar]的bottom属性配制
  Widget buildFlexibleTooBarWidget() {
    ///[PreferredSize]用于配置在AppBar或者是SliverAppBar
    ///的bottom中 实现 PreferredSizeWidget
    return PreferredSize(
      ///定义大小
      preferredSize: Size(MediaQuery.of(context).size.width, 48),
      ///配置任意的子Widget
      child: Container(
        color: Color(0xff212f38),
        padding: EdgeInsets.only(bottom: 1),
        alignment: Alignment.center,
        child: TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(text: "作品",),
            new Tab(text: "动态",),
            new Tab(text: "喜欢",),
          ],
        ),
      ),
    );
  }

  buildTopUserHeader() {
    return Row(children: [
      Container(
        width: 76,
        height: 76,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Color(0xff212f38),
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: ClipOval(
          child: Image.asset(
            "assets/images/3.0x/welcome.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 22,
      ),
      Expanded(
        child: Container(
          height: 33,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
          decoration: BoxDecoration(
              color: Color(0x80999999),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                StringLanguages.of(context).get(StringKey.alertInformation),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "55%",
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Container(
        height: 33,
        padding: EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
        decoration: BoxDecoration(
            color: Color(0x80999999),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "+",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              StringLanguages.of(context).get(StringKey.friend),
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
      ),
    ]);
  }

  @override
  void onStart() {
    super.onStart();
    LogUtil.e("个人中心 onResumed");
  }

  @override
  void onStop() {
    super.onStop();
    LogUtil.e("个人中心 onPause");
  }
}
