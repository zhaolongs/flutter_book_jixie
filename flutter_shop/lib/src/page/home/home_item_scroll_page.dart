import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_goods_categore.dart';
import 'package:flutter_shop/src/common/banner.dart';
import 'package:flutter_shop/src/net/dio_utils.dart';
import 'package:flutter_shop/src/page/common/common_nodata_widget.dart';
import 'package:flutter_shop/src/utils/log_util.dart';

import 'home_custom_appbar.dart';
import 'home_good_class_widget.dart';
import 'home_good_seckill_widget.dart';
import 'home_item_tabbar_page.dart';
import 'image_text_widget.dart';

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
    with SingleTickerProviderStateMixin {
  ///商品分类
  List<GoodsCategoryBean> _categoryList = [];
  TabController _tabController;
  List<Tab> _tabList;
  List<Widget> _tabBarViewList;

  //滑动监听
  ScrollController _scrollController = new ScrollController();

  double _value = 0.0;
  double _value2 = 0.0;

  //局部更新
  StreamController<double> _headStreamController = new StreamController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double pixels = _scrollController.offset;
      if (pixels <= 44) {
        _value2 = 0.0;
        _value = pixels / 44.0;
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
    if (_tabController == null) {
      return Center(
        child: NoDataWidget(
          clickCallBack: () {
            loadingData();
          },
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.red,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        StreamBuilder<double>(
          stream: _headStreamController.stream,
          initialData: 0.0,
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 160 - 50 * _value2,
              child: HomeCustomAppBar(
                value: _value,
                value2: _value2,
                tabController: _tabController,
                tabList: _tabList,
              ),
            );
          },
        ),
        Expanded(
          child: TabBarView(
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
        _tabBarViewList.add(HomeItemTabbarPage(
          categoryId: element.id,
          scrollController: _scrollController,
        ));
      });
      //添加到队列中刷新
      Future.delayed(Duration.zero, () {
        setState(() {});
      });
    }
    return true;
  }

  @override
  void dispose() {
    _headStreamController.close();
    super.dispose();
  }
}
