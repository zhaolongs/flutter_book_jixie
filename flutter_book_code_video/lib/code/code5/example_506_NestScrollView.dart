import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/base/banner.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey[200]),
    home: Example506(),
  ));
}

///代码清单 5-17 SliverAppBar 综合案例
///lib/code/code5/example_506_NestScrollView.dart
class Example506 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example506State();
  }
}

class _Example506State extends State<Example506>
    with SingleTickerProviderStateMixin {
  //在这里标签页面使用的是TabView所以需要创建一个控制器
  TabController _tabController;

  //页面初始化方法
  @override
  void initState() {
    super.initState();
    //初始化
    _tabController = new TabController(length: 3, vsync: this);
  }

  //页面销毁回调生命周期
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //构建页面的主体
    return Scaffold(
      //下拉刷新
      body: RefreshIndicator(
        //可滚动组件在滚动时会发送ScrollNotification类型的通知
        notificationPredicate: (ScrollNotification notifation) {
          //该属性包含当前ViewPort及滚动位置等信息
          ScrollMetrics scrollMetrics = notifation.metrics;
          if (scrollMetrics.minScrollExtent == 0) {
            return true;
          } else {
            return false;
          }
        },
        //下拉刷新回调方法
        onRefresh: () async {
          //模拟网络刷新 等待2秒
          await Future.delayed(Duration(milliseconds: 2000));
          //返回值以结束刷新
          return Future.value(true);
        },
        child: buildNestedScrollView(),
      ),
    );
  }

  Widget buildNestedScrollView() {
    //滑动视图
    return NestedScrollView(
      //配置可折叠的头布局
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar()];
      },
      //页面的主体内容
      body: buidChildWidget(),
    );
  }

  //通常在用到 PageView + BottomNavigationBar 或者 TabBarView + TabBar 的时候
  //大家会发现当切换到另一页面的时候, 前一个页面就会被销毁, 再返回前一页时, 页面会被重建,
  //随之数据会重新加载, 控件会重新渲染 带来了极不好的用户体验.
  //由于TabBarView内部也是用的是PageView, 因此两者的解决方式相同
  //页面的主体内容
  Widget buidChildWidget() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        ItemPage(1),
        ItemPage(2),
        ItemPage(3),
      ],
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      //第一部分 标题 这里是搜索框
      title: buildHeader(),
      //标题居中
      centerTitle: true,
      //5.1.2小节中有对这一块的属性配置说明
      pinned: true,
      floating: false,
      snap: false,
      //阴影高度
      elevation: 0.0,
      //展开的高度
      expandedHeight: 360,
      //第二部分 AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        //背景
        //配置的是一个widget也就是说在这里可以使用任意的
        //Widget组合 在这里直接使用的是一个图片
        background: buildFlexibleSpaceWidget(),
      ),
      //第三部分
      bottom: buildFlexibleTooBarWidget(),
    );
  }
  Widget buildHeader() {
    return Container(
      //宽度填充
      width: double.infinity,
      //左边距
      padding: EdgeInsets.only(left: 10),
      //高度限制
      height: 38,
      //圆角边框背景装饰
      decoration: BoxDecoration(
        //背景颜色
        color: Colors.white,
        //边框颜色
        border: Border.all(color: Colors.white),
        //边框圆角
        borderRadius: BorderRadius.circular(30),
      ),
      //左右排列的线性布局
      child: Row(
        //子Widget居中对齐
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //一个搜索图片
          Icon(
            Icons.search_rounded,
            size: 18,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "搜索",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
 Widget buildFlexibleSpaceWidget() {
    //上下排列的线性布局
    return Column(
      children: [
        //第一部分是一个 轮播图
        Container(
          height: 240,
          child: BannerWidget(),
        ),
        //第二部分是左右排列的两个图标
        buildRightClassWidget(),
      ],
    );
  }
  Widget buildRightClassWidget(){
    return Container(
      height: 120,
      child: Row(
        children: [
          //两个等比排开
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Icon(Icons.android_rounded),
                )
              ],
            ),
          ),
          //两个等比排开
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Icon(Icons.phone_android_rounded),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFlexibleTooBarWidget() {
    //[PreferredSize]用于配置在AppBar或者是SliverAppBar
    //的bottom中 实现 PreferredSizeWidget
    return PreferredSize(
      //定义大小
      preferredSize: Size(MediaQuery.of(context).size.width, 44),
      //配置任意的子Widget
      child: Container(
        alignment: Alignment.center,
        child: Container(
          color: Colors.white,
          //随着向上滑动，TabBar的宽度逐渐增大
          //父布局Container约束为 center对齐
          //所以程现出来的是中间x轴放大的效果
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            //指示线的宽度与文本宽度一致
            indicatorSize: TabBarIndicatorSize.label,
            //指示线的颜色
            indicatorColor: Colors.redAccent,
            //未选中文本的颜色
            unselectedLabelColor: Colors.grey,
            //选中文本的颜色
            labelColor: Colors.redAccent,
            controller: _tabController,
            tabs: <Widget>[
              new Tab(
                text: "全部",
              ),
              new Tab(
                text: "热门",
              ),
              new Tab(
                text: "推荐",
              ),
            ],
          ),
        ),
      ),
    );
  }


}
class ItemPage extends StatefulWidget{
  final int pageFlag;
  ItemPage(this.pageFlag);
  @override
  State<StatefulWidget> createState() {
    return _ItemPageState();
  }
}
class _ItemPageState extends State<ItemPage>
    with AutomaticKeepAliveClientMixin {

  //标签页面保活 或者称保持状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("页面创建 ${widget.pageFlag}");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //一个列表 切记不要再使用 Scaffold
    //否则会拦截事件 失去滑动联动效果
    return ListView.builder(
      //去除内边距
      padding: EdgeInsets.all(0),
      //列表子Item个数
      itemCount: 200,
      //每个子Item的布局构建
      itemBuilder: (BuildContext context, int index) {
        return buildBodyWidget(index);
      },
    );
  }
  //每个子Item的布局构建
  Widget buildBodyWidget(int index) {
    //水波纹点击事件监听
    return InkWell(
      //手指点击抬起时的回调
      onTap: () {
        //打开新的页面
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        //线性布局左右排列
        child: Row(
          //主轴方向开始对齐 在这里是左对齐
          mainAxisAlignment: MainAxisAlignment.start,
          //交叉轴上开始对齐 在这里是顶部对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //左侧的图片
            buildLeftImage(),
            //右侧的文本区域
            buildRightTextArea(index)
          ],
        ),
      ),
    );
  }

  ///左侧的图片区域
  Container buildLeftImage() {
    double radius = 10;
    if (widget.pageFlag == 1) {
      radius = 20;
    } else if (widget.pageFlag == 2) {
      radius = 50;
    }

    return Container(
      margin: EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Image.asset(
          "assets/images/2.0x/banner3.webp",
          width: 96,
          fit: BoxFit.fill,
          height: 96,
        ),
      ),
    );
  }

  ///右侧的文本区域
  Expanded buildRightTextArea(int index) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$index 优美的应用",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "优美的应用体验 来自于细节的处理，更源自于码农的自我要求与努力，当然也需要码农年轻灵活的思维。",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(fontSize: 14, color: Colors.black38),
          )
        ],
      ),
    );
  }
}
