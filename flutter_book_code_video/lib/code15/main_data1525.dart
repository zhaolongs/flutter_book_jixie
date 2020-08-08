import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1525.dart
/// NotificationListener 的基本使用
class NotificationListenerUsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("详情"),
      ),

      ///使用滑动监听来包裹子Widget
      ///以获取滑动相关信息而进行页面特效的操作
      body: NotificationListener(

          onNotification: (ScrollNotification notification) {

            ScrollMetrics metrics = notification.metrics;
            ///当前位置
            double pixels = metrics.pixels;
            print("当前位置 $pixels");

            ///是否在顶部或底部
            bool atEdge = metrics.atEdge;
            print("是否在顶部或底部 $atEdge");


            ///滚动方向 垂直或水平滚动
            Axis axis = metrics.axis;
            print("滚动方向  $axis");


            ///滚动方向是down还是up
            AxisDirection axisDirection = metrics.axisDirection;
            print("滚动方向 $axisDirection");


            ///视口底部距离列表底部有多大
            double extentAfter = metrics.extentAfter;
            print("视口底部距离列表底部 $extentAfter");


            ///视口顶部距离列表顶部有多大
            double extentBefore = metrics.extentBefore;
            print("视口顶部距离列表顶部有多大 $extentBefore");

            ///视口范围内的列表长度
            double extentInside = metrics.extentInside;
            print("视口范围内的列表长度 $extentBefore");

            ///最大滚动距离，列表长度-视口长度
            double maxScrollExtent = metrics.maxScrollExtent;
            print("最大滚动距离 $maxScrollExtent");

            ///最小滚动距离
            double minScrollExtent = metrics.minScrollExtent;
            print("最小滚动距离 $minScrollExtent");

            ///视口长度
            double viewportDimension = metrics.viewportDimension;
            print("视口长度 $viewportDimension");

            ///是否越过边界
            bool outOfRange = metrics.outOfRange;
            print("是否越过边界 $outOfRange");

            ///滚动类型
            Type  runtimeType = notification.runtimeType;

            switch (runtimeType) {
              case ScrollStartNotification:
                print("开始滚动");
                break;
              case ScrollUpdateNotification:
                print("正在滚动");
                break;
              case ScrollEndNotification:
                print("滚动停止");
                break;
              case OverscrollNotification:
                print("滚动到边界");
                break;
            }

            ///可滚动组件在滚动过程中会发出ScrollNotification之外，还有一些其它的通知，
            ///如SizeChangedLayoutNotification、KeepAliveNotification 、LayoutChangedNotification等
            ///返回值类型为布尔值，当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；当返回值为false 时继续向上冒泡通知。
            return true;
          },
          child: buildSingleScrollView()),
    );
  }

  ///构建一个ListView
  Widget buildSingleScrollView() {
    ///滑动视图
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          height: 44,
          alignment: Alignment.center,
          ///根据角标来动态计算生成不同的背景颜色
          color: Colors.cyan[100 * ((index + 1) % 9)],
          child: new Text(' item $index'),
        );
      },
      itemCount: 100,
    );
  }
}