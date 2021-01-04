import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_goods_categore.dart';
import 'package:flutter_shop/src/net/dio_utils.dart';
import 'package:flutter_shop/src/page/common/common_nodata_widget.dart';

import 'home_item_tabbar_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class HomeItmeScrollPage extends StatefulWidget {
  final StreamController streamController;

  HomeItmeScrollPage(this.streamController);

  @override
  _HomeItmeScrollPageState createState() => _HomeItmeScrollPageState();
}

class _HomeItmeScrollPageState extends State<HomeItmeScrollPage>
    with SingleTickerProviderStateMixin {
  ///商品分类
  List<GoodsCategoryBean> _categoryList = [];
  TabController _tabController;
  List<Tab> _tabList;
  List<Widget> _tabBarViewList;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      widget.streamController.add(_scrollController.offset);
    });

    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: buildBody(),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 34,),
                TabBar(
                  isScrollable: true,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  controller: _tabController,
                  tabs: _tabList,
                )
              ],
            ),
          ),
        ];
      },
    );
  }

  Widget buildBody() {
    if (_tabController == null) {
      return Center(
        child: NoDataWidget(
          clickCallBack: () {
            loadingData();
          },
        ),
      );
    } else {
      return TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _tabBarViewList,
      );
    }
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
      //加载成功无数据时的处理

      //加载成功有数据时的 JSON 数据解析转换
      List<GoodsCategoryBean> itemList = [];
      data.forEach((element) {
        GoodsCategoryBean bean = GoodsCategoryBean.fromJson(element);
        itemList.add(bean);
      });

      _categoryList = itemList;
      _tabController =
          new TabController(vsync: this, length: _categoryList.length);
      _tabList = [];
      _tabBarViewList = [];
      _categoryList.forEach((element) {
        _tabList.add(Tab(
          text: element.title,
        ));
        _tabBarViewList.add(HomeItemTabbarPage(categoryId: element.id));
      });
      //添加到队列中刷新
      Future.delayed(Duration.zero, () {
        setState(() {});
      });
    }
    return true;
  }
}
