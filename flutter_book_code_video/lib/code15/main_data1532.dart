import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'drag/drag_container.dart';
import 'drag/drag_controller.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1532.dart
///上拉抽屉效果
class BottomDragWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomDragWidgetState();
  }
}

class BottomDragWidgetState extends State with TickerProviderStateMixin {
  ///抽屉控制器
  DragController dragController = new DragController();
  ///TabBar与TabBarView使用的控制器
  TabController tabController;

  @override
  void initState() {
    super.initState();
    ///初始化控制器
    tabController =TabController(length: 3,initialIndex: 0,vsync: this);
    ///添加切换监听
    tabController.addListener(() {
      ///当点击标签栏切换页面时 回调
      ///当滑动TabBarView时 回调
      if(tabController.index.toDouble() == tabController.animation.value){
        print("切换 ${tabController.index}");
        ///打开页面
        dragController.open();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("抽屉效果2"),
      ),
      backgroundColor: Colors.grey,
      ///页面主体使用层叠布局
      body: Stack(
        children: <Widget>[
          /// ... ... 页面中其他的视图
          ///抽屉视图
          buildDragWidget(),

        ],
      ),
    );
  }

  ///lib/code15/main_data1532.dart
  ///构建底部对齐的抽屉效果视图
  Widget buildDragWidget(){
    ///层叠布局中的底部对齐
    return Align(
      alignment: Alignment.bottomCenter,
      child: DragContainer(
        ///抽屉关闭时的高度 默认0.1
        initChildRate: 0.1,
        ///抽屉打开时的高度 默认0.4
        maxChildRate: 0.8,
        ///是否显示默认的标题
        isShowHeader: true,
        ///背景颜色
        backGroundColor: Colors.white,
        ///背景圆角大小
        cornerRadius: 12,
        ///自动上滑动或者是下滑的分界值
        maxOffsetDistance:1.5,
        ///抽屉控制器
        controller: dragController,
        ///是否启动滑动到边界后 自动打开或者关闭抽屉
        useAtEdge: true,
        ///自动滑动的时间
        duration: Duration(milliseconds: 400),
        ///抽屉的子Widget
        dragWidget: buildDragContentView(),
        ///抽屉标题点击事件回调
        dragCallBack: (isOpen){ },
      ),
    );
  }


  ///lib/code15/main_data1532.dart
  ///构建抽屉使用的主体Widget
  Widget buildDragContentView() {
    ///通过线性布局组合
    return Column(children: [
      ///标签栏
      TabBar(
        //选中标签的文本颜色
        labelColor: Colors.red,
        ///未选中的标签的颜色
        unselectedLabelColor: Colors.grey,
        ///控制器
        controller: tabController,
        ///标签
        tabs: [
          Tab(text: "评价",),
          Tab(text: "推荐",),
          Tab(text: "其他",),
      ],),
      ///分隔线
      Container(color: Colors.grey[200],height: 1.0,),
      ///与标签栏关联的可滑动切换的视图
      Expanded(
        child: TabBarView(

          controller: tabController,
          children: [
            ItemPage(1),
            ItemPage(2),
            ItemPage(3),
          ],
        ),
      )
    ],);
  }
}


///lib/code15/main_data1532.dart
///子条目数据
class ItemPage extends StatefulWidget {
  int pageIndex;
  ItemPage(this.pageIndex);
  @override
  _TestPageState createState() => _TestPageState();
}


class _TestPageState extends State<ItemPage>  with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("页面 ${widget.pageIndex}测试数据$index"),
        );
      },
      itemCount: 100,
    );
  }

}