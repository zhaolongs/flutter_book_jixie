import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code16/refresh_listView.dart';


/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1610.dart
///RefreshListView组件的使用
class ListViewUsePage10 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}
class ScrollHomePageState extends State {
  ///列表使用到的数据
  List<ListDataBean> mDatalist = [];
  @override
  void initState() {
    super.initState();
  }
  ///lib/code15/main_data1610.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("下拉刷新与上拉加载更多"),
      ),
      body: buildRefresh(),
    );
  }

  ///构建下拉刷新组件
  Widget buildRefresh() {
    ///使用封装的下拉刷新列表组件
    return RefreshListView(
      ///条目构建
      itemBuider: (BuildContext context, int index) {
        ///构建显示使用的子条目
        return buildItemWidget(index);
      },
      ///下拉刷新回调方法
      refreshCallback: (pageIndex,pageSize){
        return getData(pageIndex,pageSize,isRefresh:true);
      },
      ///上拉加载更多回调方法
      loadMoreCallback: (pageIndex,pageSize){
        return getData(pageIndex,pageSize,isRefresh:false);
      },
      ///ListView的条目数
      itemCount: mDatalist.length,
    );
  }

  ///lib/code15/main_data1610.dart
  ///异步加载数据的方法
  ///[isRefresh]是否是下拉刷新
  Future<RefreshStatus> getData(int pageIndex, int pageSize,{bool isRefresh}) async {


    print("加载数据  pageIndex $pageIndex pageSize $pageSize");
    ///这里通过延时来模拟实际项目开发中的网络请求
    ///延时2秒
    await Future.delayed(Duration(milliseconds: 2000), () {

        ///当加载有数据时
        List<ListDataBean> list = [];

        ///模拟网络请求回来的数据
        for (int i = 0; i < 20; i++) {
          ListDataBean bean = new ListDataBean();
          bean.title = "测试数据$i";
          bean.subTitle = "执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天,";
          bean.createTime = "2020-06-06";
          bean.imageUrl = "assets/images/2.0x/banner${i % 4 + 1}.webp";
          list.add(bean);
        }
        if (isRefresh) {
          ///下拉刷新
          ///清除数据
          mDatalist.clear();
          ///更新数据
          mDatalist = list;
        } else {
          ///上拉加载更多
          ///将加载更多的数据添加到现有的集合中去
          mDatalist.addAll(list);
        }

    });
    ///当前页面可见时刷新页面
    if (mounted) {
      setState(() {});
    }

    return Future.value(RefreshStatus.normal);
  }

  ///构建ListView中的条目 Widget
  ///[index] 每个条目对应的角标
  Widget buildItemWidget(int index) {
    ///获取对应的数据
    ListDataBean bean = mDatalist[index];

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
