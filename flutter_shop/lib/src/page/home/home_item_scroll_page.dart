import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_goods_categore.dart';
import 'package:flutter_shop/src/net/dio_utils.dart';
import 'package:flutter_shop/src/page/common/common_loading_dialog.dart';
import 'home_custom_appbar.dart';
import 'home_item_tabbar_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 13-6
///lib/src/page/home/home_item_scroll_page.dart
///首页面
class HomeItmeScrollPage extends StatefulWidget {
  @override
  _HomeItmeScrollPageState createState() => _HomeItmeScrollPageState();
}

class _HomeItmeScrollPageState extends State<HomeItmeScrollPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  ///商品分类
  List<GoodsCategoryBean> _categoryList = [];
  TabController _tabController;
  List<Tab> _tabList;
  List<Widget> _tabBarViewList;

  //滑动监听
  ScrollController _scrollController = new ScrollController();

  ///首页面 搜索框 在向上滑动过程中，向水平方向缩短 然后再向上平移
  ///首页面 搜索框 水平方向缩短的控制值 0.0 ~1.0
  double _value = 0.0;

  ///首页面 搜索框 竖直方向平移到顶部的控制值 0.0 ~ 1.0
  double _value2 = 0.0;

  ///用于控制这个过程的 Stream 控制器
  ///局部更新
  StreamController<double> _headStreamController =
      new StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    //添加一个消息监听
    _scrollController.addListener(() {
      //获取当前滑动布局的滑动距离
      double pixels = _scrollController.offset;
      if (pixels <= 44) {
        //竖直方向不动
        _value2 = 0.0;
        //根据滑动距离来计算水平缩短值
        _value = pixels / 44.0;
        //发送消息
        _headStreamController.add(1.0);
      } else if (pixels > 44 && pixels <= 88) {
        _value2 = (pixels - 44) / 44.0;
        _headStreamController.add(1.0);
      } else {
        if (_value2 != 1.0) {
          _value = 1.0;
          _value2 = 1.0;
          _headStreamController.add(1.0);
        }
      }
    });
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //初次进入显示加载中
    //加载失败时 可考虑使用占位UI
    if (_tabController == null) {
      return Center(
        child: LoadingWidget(),
      );
    }
    //页面的主内容
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //第一层的背景
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: buildHeaderBg(),
          ),
          //第二层的内容主体
          Positioned.fill(
            child: buildBody(),
          )
        ],
      ),
    );
  }

  StreamBuilder<double> buildHeaderBg() {
    return StreamBuilder<double>(
      stream: _headStreamController.stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ClipPath(
          clipper: HomeHeaderClipper(
            value: _value,
            value2: _value2,
          ),
          child: Container(
            height: 290,
            color: Colors.red,
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        //顶部随着手势滑动的更新操作
        StreamBuilder<double>(
          //绑定控制器
          stream: _headStreamController.stream,
          //设置初始值
          initialData: 0.0,
          //需要根新的子Widget
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
            return Container(
              //宽度
              width: MediaQuery.of(context).size.width,
              //高度
              height: 188 - 56 * _value2,
              //内容区域
              child: HomeCustomAppBar(
                value: _value,
                value2: _value2,
                tabController: _tabController,
                tabList: _tabList,
              ),
            );
          },
        ),
        //主页面
        Expanded(
          child: TabBarView(
            //禁止滑动
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: _tabBarViewList,
          ),
        )
      ],
    );
  }

  Future<bool> loadingData() async {
    //通过网络请求接口
    // ResponseInfo responseInfo = await DioUtils.instance
    //     .getRequest(url: HttpHelper.Video_LIST_URL, queryParameters: {
    //   "pageIndex": pageIndex,
    //   "pageSize": 30,
    // });
    //本地模拟测试数据
    ResponseInfo responseInfo =
        await Future.delayed(Duration(milliseconds: 1000), () {
      //构建模拟数据
      List _list = [];
      for (int i = 0; i < 30; i++) {
        Map<String, dynamic> map = new Map();
        map['id'] = i;
        map['title'] = "数码$i";
        _list.add(map);
      }

      return ResponseInfo(success: true, data: _list);
    });
    //加载成功
    if (responseInfo.success) {
      List data = responseInfo.data;
      //加载成功有数据时的 JSON 数据解析转换
      successFunction(data);
      //添加到队列中刷新
      Future.delayed(Duration.zero, () {
        setState(() {});
      });
    }
    return true;
  }

  ///[data]分类标签数据 根据分类来添加页面数据
  void successFunction(List data) {
    //加载成功有数据时的 JSON 数据解析转换
    List<GoodsCategoryBean> itemList = [];
    data.forEach((element) {
      GoodsCategoryBean bean = GoodsCategoryBean.fromJson(element);
      itemList.add(bean);
    });
    //保存数据
    _categoryList = itemList;
    //构建控制器
    _tabController = new TabController(
      vsync: this,
      length: _categoryList.length,
    );
    _tabList = [];
    _tabBarViewList = [];
    //构建 Tab 与 TabBarView使用的数据
    _categoryList.forEach((element) {
      //构建Tab
      _tabList.add(Tab(
        text: element.title,
      ));
      //构建TabBarView中使用到的页面
      _tabBarViewList.add(HomeItemTabbarPage(
        categoryId: element.id,
        scrollController: _scrollController,
      ));
    });
  }

  @override
  void dispose() {
    //销毁控制器
    _headStreamController.close();
    super.dispose();
  }
}

class HomeHeaderClipper extends CustomClipper<Path> {
  double value;
  double value2;

  HomeHeaderClipper({this.value = 0.0, this.value2 = 0.0});

  @override
  Path getClip(Size size) {
    Path path = new Path();

    double width = size.width;
    double height = size.height;

    double unitHeight = height / 4;

    path.moveTo(0, 0);
    path.lineTo(0, unitHeight * 3);
    path.quadraticBezierTo(
        width / 2,
        height - value * unitHeight - value2 * unitHeight,
        width,
        unitHeight * 3);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
