import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1608.dart
///ListView的下拉刷新与上拉加载更多 分页加载
class ListViewUsePage8 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {

  ///分页加载数据的页数
  int pageIndex = 1;
  ///分页加载数据每页的大小
  int pageSize = 20;
  ///总页数 在实际项目开发中一般从接口中获取
  int totalPage = 2;
  ///列表使用到的数据
  List<ListDataBean> mDatalist = [];

  ///列表滑动控制器
  ScrollController scrollController = new ScrollController();

  ///当前上拉加载的状态
  RefreshStatus currentRefreshStatus =RefreshStatus.loading;

  @override
  void initState() {
    super.initState();

    ///页面初始化时 异步加载数据
    getData(true);

    ///为ListView添加滑动监听功能
    ///当列表滑动到页面底部时触发加载更多功能
    scrollController.addListener(() {
      ///获取滑动的距离
      double scrollOffset = scrollController.offset;
      ///当前不在加载中时再触发加载数据功能
      if(currentRefreshStatus !=RefreshStatus.loading) {
        ///滑动到底部时触发加载更多
        if (scrollOffset >= scrollController.position.maxScrollExtent) {
          print("加载更多");
          pageIndex++;
          ///加载数据
          getData(false);
        }
      }
    });
  }

  ///lib/code15/main_data1608.dart
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
  Widget buildRefresh(){
    return  RefreshIndicator(
        ///下拉刷新回调方法
        onRefresh: () async {
          ///更新页面标识
          pageIndex =1;
          ///构建数据
          return getData(true);
        },
        ///页面的列表
        child: buildListView()
    );
  }

  ///lib/code15/main_data1608.dart
  ///通过custom来构建 列表 ListView
  Widget buildListView() {
    return ListView.custom(
      ///清除缓存区域
      cacheExtent: 1.0,
      ///自定义代理
      childrenDelegate: CustomBuilderDelegate(
          (BuildContext context, int index) {
            ///子Item单独封装成了一个StatefulWidget
            if (index < mDatalist.length) {
              ///正常显示的列表Item
              return buildItemWidget(index);
            } else {
              ///如果是最后一个条目 构建加载更多的内容
              return buildFooterWidget();
            }
          },

          ///子条目个数
          childCount: mDatalist.length + 1,
          ///子条目绘制完成后的回调
          /// 当前页面显示的第一个条目的角标 firstIndex
          /// 当前页面显示的最后一个条目的角标lastIndex
          layoutCallBack: (int firstIndex, int lastIndex) {
            print(" firstIndex $firstIndex  lastIndex $lastIndex");
          }),
    );
  }

  ///lib/code15/main_data1608.dart
  ///异步加载数据的方法
  ///[isRefresh]是否是下拉刷新
  Future<bool> getData(bool isRefresh) async {
    print("加载数据  isRefresh $isRefresh pageIndex $pageIndex");
    ///刷新页面标识
    setState(() {
      ///列表尾部显示加载中
      currentRefreshStatus = RefreshStatus.loading;
    });
    ///这里通过延时来模拟实际项目开发中的网络请求
    ///延时2秒
    await Future.delayed(Duration(milliseconds: 2000), () {
      ///当前加载的分页数据已是最后一页时
      ///或者是加载数据时
      if(pageIndex >totalPage){
        ///暂无更多数据
        currentRefreshStatus = RefreshStatus.loadMoreNoData;
      }else {
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
        ///加载完成正常情况下显示的加载更多
        currentRefreshStatus = RefreshStatus.normal;
      }
      ///加载完成后更新状态
      if(mDatalist.length==0){
        ///无数据时显示暂无数据
        currentRefreshStatus = RefreshStatus.noData;
      }else if(mDatalist.length<pageSize){
        ///当前的列表数据大于一页时才显示加载更多
        currentRefreshStatus = RefreshStatus.none;
      }
      ///currentRefreshStatus = RefreshStatus.loadMoreError;
      ///当前页面可见时刷新页面
      if (mounted) {
        setState(() {});
      }
    });
    return Future.value(true);
  }

  ///构建ListView中的条目 Widget
  ///[index] 每个条目对应的角标
  Widget buildItemWidget(int index) {
    ///获取对应的数据
    ListDataBean bean = mDatalist[index];
    ///外部容器 用来设置灰色的间隔
    return Container(
        color: Colors.grey[300],
        padding:EdgeInsets.only(bottom: 10),
        ///内部容器 用来设置白色的底色
        child: Container(
          padding: EdgeInsets.only(bottom:10,top: 10),
          color:Colors.white,
          ///线性布局 设置图片与文字的左右排列
          child:Row(
            ///顶部对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///图片
            Padding(padding: EdgeInsets.all(10),child: Image.asset(bean.imageUrl,height:55,width:55)),
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
          ],),
        ),);
  }

  ///lib/code15/main_data1608.dart
  ///构建底部显示加载更多的样式
  Widget buildFooterWidget() {
    String  title = "上拉加载更多";
    ///默认一个空的视图
    Widget loadingWidget =Container();
    ///根据不同的加载数据状态来构建不同的页面显示
    switch (currentRefreshStatus) {
      case RefreshStatus.normal:
        title = "上拉加载更多";
        loadingWidget=Icon(Icons.center_focus_weak);
        break;
      case RefreshStatus.loading:
        title = "加载中";
        loadingWidget=CircularProgressIndicator();
        break;
      case RefreshStatus.loadMoreNoData:
        title = "暂无更多数据";
        loadingWidget=Icon(Icons.do_not_disturb);
        break;
      case RefreshStatus.loadMoreError:
        title = "加载错误";
        loadingWidget=Icon(Icons.error);
        break;
      case RefreshStatus.none:
        loadingWidget =Container();
        title = "";
        break;
      case RefreshStatus.noData:
        loadingWidget =Icon(Icons.computer);
        title = "暂无数据 点击刷新";
        break;
    }

    return InkWell(
      onTap: (){
        ///当加载无数据时点击刷新
        ///当加载出错时 点击刷新
        ///加载的都是当前页的数据
        if (currentRefreshStatus==RefreshStatus.loadMoreNoData
            ||currentRefreshStatus==RefreshStatus.loadMoreError
        ||currentRefreshStatus==RefreshStatus.noData){
          ///加载数据
          getData(false);
        }
      },
      child: Container(
        height: 66,
        ///线性布局 左右排列
        ///居中
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ///图标显示
          Container(
              height: 22,
              width: 22,
              child: loadingWidget,
              margin: EdgeInsets.only(right: 12)),

          ///显示的加载文案
          Text(title),
        ]),
      ),
    );
  }


  ///lib/code15/main_data1608.dart
  ///ListView 中使用下拉刷新
  Widget buildBodyWidge(){
    return RefreshIndicator(
      ///下拉刷新回调方法
        onRefresh: () async {
          ///更新页面标识
          pageIndex =1;
          ///构建数据 如网络请求数据
          return getData(true);
        },
        ///页面的主体内容
        child: ListView.builder()
    );
  }
}

///List使用到的数据模型
///lib/code15/main_data1608.dart
class ListDataBean{
  String  title;
  String subTitle;
  String imageUrl;
  String createTime;
}
///lib/code15/main_data1608.dart
///页面加载状态
enum RefreshStatus{
  none,///不显示上拉加载更多
  normal,///正常显示状态
  noData,///暂无数据
  loading,///上拉加载更多状态
  loadMoreNoData,///上拉加载无数据状态
  loadMoreError,///上拉加载出错状态
}


///lib/code15/main_data1608.dart
///自定义代理
class CustomBuilderDelegate extends SliverChildBuilderDelegate {
  ///ListView的条目加载完成后的回调
  Function(int firstIndex, int lastIndex) layoutCallBack;
  
  CustomBuilderDelegate(
      Widget Function(BuildContext, int) builder, {
        int childCount,
        bool addAutomaticKeepAlives = true,
        bool addRepaintBoundaries = true,
        this.layoutCallBack,
      }) : super(builder,
      childCount: childCount,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries);


  ///当条目绘制完成时回调此方法
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
   if(layoutCallBack!=null){
     layoutCallBack(firstIndex, lastIndex);
   }
  }
}
