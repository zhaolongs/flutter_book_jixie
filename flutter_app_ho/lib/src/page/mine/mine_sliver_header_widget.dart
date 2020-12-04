import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ho/src/page/mine/settings_page.dart';
import 'package:flutter_app_ho/src/utils/navigator_utils.dart';

import 'image_show_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class MineSliverHeaderWidget extends StatefulWidget {
  //Stream 控制器用来这里的局部刷新功能
  final StreamController<double> streamController;

  //logo 使用的
  final StreamController<double> logoStreamController;

  //图片填充类型（刚开始滑动时是以宽度填充，拉开之后以高度填充）
  final BoxFit fitType;
  final TabController tabController;

  MineSliverHeaderWidget({this.streamController,this.tabController, this.logoStreamController,this.fitType=BoxFit.fitWidth});

  @override
  _MineSliverHeaderWidgetState createState() => _MineSliverHeaderWidgetState();
}

class _MineSliverHeaderWidgetState extends State<MineSliverHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      //绑定流
      stream: widget.streamController.stream,
      //初始化的数据 这里用作图片放大的高度
      initialData: 0.0,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        //构建需要更新的 Widget
        return buildSliverAppBar(snapshot.data);
      },
    );
  }

  //SliverAppBar展开的高度
  double _defaultExpandHeight = 278;

  List<Tab> tabWidgetlist = [
    Tab(
      text: "最新",
    ),
    Tab(
      text: "最热",
    ),
    Tab(
      text: "全部",
    ),
  ];



  Widget buildSliverAppBar(double extraHeight) {
    return SliverAppBar(
      actions: [
        InkWell(
          onTap: () {
            NavigatorUtils.pushPage(
              context,
              SettingsPage(),
            );
          },
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings),
          ),
        ),
      ],
      title: StreamBuilder(
        stream: widget.logoStreamController.stream,
        initialData: pi / 2,
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateX(snapshot.data),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/2.0x/app_icon.png",
                    width: 33,
                    height: 33,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "早起的年轻人",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFffffff),
                  ),
                )
              ],
            ),
          );
        },
      ),
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
                  height: 180 + extraHeight, fit: widget.fitType),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 178,
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
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 16,
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
                  Positioned(
                    top: 46,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 110,
                          height: 28,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                          child: Text(
                            "编辑资料",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 16),
                          alignment: Alignment.center,
                          width: 110,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                          child: Text(
                            "申请认证",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 86,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            "早起的年轻人",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF444444),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: 6,
                            right: 6,
                            bottom: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/2.0x/my_man_icon.png",
                                width: 10,
                                height: 10,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "男",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF444444),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 44),
        child: Material(
          color: Colors.white,
          child: TabBar(
            //下划线与文本宽度相等
            indicatorSize: TabBarIndicatorSize.label,
            //选中的 Tab 图标与文字的颜色
            labelColor: Colors.redAccent,
            //其他未选中的Tab 图标与文字的颜色
            unselectedLabelColor: Colors.blueGrey,
            //所有的Tab
            tabs: tabWidgetlist,
            //联动控制器
            controller: widget.tabController,
            //下划线的颜色
            indicatorColor: Colors.redAccent,
            //下划线的高度
            indicatorWeight: 2.0,
          ),
        ),
      ),
    );
  }
}
