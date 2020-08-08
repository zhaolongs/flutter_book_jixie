import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'main_data1607.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */



///lib/code15/main_data1611.dart
class ListViewUsePage11 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  ///ListView使用的数据
  List<ListDataBean> list = [];

  @override
  void initState() {
    super.initState();
    ///构建模拟数据
    ///模拟网络请求回来的数据
    for (int i = 0; i < 20; i++) {
      ListDataBean bean = new ListDataBean();
      bean.title = "测试数据$i";
      bean.subTitle = "执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天,";
      bean.createTime = "2020-06-06";
      bean.imageUrl = "assets/images/2.0x/banner${i % 4 + 1}.webp";
      list.add(bean);
    }
  }
  ///lib/code15/main_data1611.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("详情"),
      ),
      ///列表
      body: buildSmartRefresher(),
    );
  }

  ///下拉刷新组件使用的控制器
  ///用来控制下拉刷新的开启与关闭
  ///用来控制上拉加载功能的样式
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ///构建刷新组件
  Widget buildSmartRefresher() {
    ///下拉刷新组件
    return SmartRefresher(
      ///开启下拉刷新功能
      enablePullDown: true,
      ///开启上拉加载功能
      enablePullUp: true,
      ///控制器
      controller: _refreshController,
      ///下拉刷新功能
      onRefresh:(){
        onRefresh();
      },
      ///上拉加载功能
      onLoading: (){
        _onLoading();
      },
      child: buildListView(),
      footer: CustomFooter(
        builder: (BuildContext context,LoadStatus mode){
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  Text("上拉加载");
          }
          else if(mode==LoadStatus.loading){
            body =  CupertinoActivityIndicator();
          }
          else if(mode == LoadStatus.failed){
            body = Text("加载失败！点击重试！");
          }
          else if(mode == LoadStatus.canLoading){
            body = Text("松手,加载更多!");
          }
          else{
            body = Text("没有更多数据了!");
          }
          return Container(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
    );
  }

  ///通过builder来构建ListView
  Widget buildListView() {
    return ListView.builder(
      ///子条目个数
      itemCount: list.length,
      ///构建每个条目
      itemBuilder: (BuildContext context, int index) {
        ///构建每个Item显示的数据
        return buildItemWidget(index);
      },
    );
  }
  ///lib/code15/main_data1611.dart
  //下拉刷新
  void onRefresh() async{
    try { // 模拟网络请求数据
      // 延时一秒加载成功
      await Future.delayed(Duration(seconds: 1));
      _refreshController.refreshCompleted(); // 刷新成功
      setState(() {});
    } catch (e) {
      _refreshController.refreshFailed(); // 刷新失败
    }
  }

  // 上拉加载
  void _onLoading() async{
    try {
      await Future.delayed(Duration(seconds: 1));
      _refreshController.loadComplete(); // 刷新成功
      setState(() {});
    } catch (e) {
      _refreshController.loadComplete(); // 刷新失败
    }
  }

  ///构建ListView中的条目 Widget
  ///[index] 每个条目对应的角标
  Widget buildItemWidget(int index) {
    ///获取对应的数据
    ListDataBean bean = list[index];

    ///外部容器 用来设置灰色的间隔
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.only(bottom: 10),

      ///内部容器 用来设置白色的底色
      child: Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        color: Colors.white,

        ///线性布局 设置图片与文字的左右排列
        child: Row(
          ///顶部对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///图片
            Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(bean.imageUrl, height: 55, width: 55)),

            ///右侧的文字区域
            Expanded(
              ///线性布局 文字区域上下排开
              child: Column(

                ///左对齐
                  crossAxisAlignment: CrossAxisAlignment.start,

                  ///高度包裹子Widget
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(bean.title),
                    Padding(
                        padding: EdgeInsets.only(top: 6, bottom: 6),
                        child: Text(bean.subTitle,
                            style: TextStyle(
                                color: Color(0xff666666), fontSize: 12.0))),
                    Text(bean.createTime,
                        style: TextStyle(
                            color: Color(0xff666666), fontSize: 12.0)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
