import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/common/banner.dart';

import 'home_good_seckill_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class HomeItemTabbarPage extends StatefulWidget {
  final int categoryId;

  HomeItemTabbarPage({this.categoryId});

  @override
  _HomeItemTabbarPageState createState() => _HomeItemTabbarPageState();
}

class _HomeItemTabbarPageState extends State<HomeItemTabbarPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
          width: double.infinity,
          color: Color(0xfff2f2f2),
          child: Column(
            children: [
              BannerWidget(),
              Container(height: 170, child: buildGridView()),
              GoodsSeckillWidget(),
              Container(
                height: 300,
              )
            ],
          )),
    );
  }

  List _classList = [
    "小超市",
    "数码电器",
    "服饰",
    "免费水果",
    "小店到家",
    "充值缴费",
    "签到",
    "领卷",
    "领补贴",
    "会员"
  ];

  List _classImageList = [
    "小超市",
    "数码电器",
    "服饰",
    "免费水果",
    "小店到家",
    "充值缴费",
    "签到",
    "领卷",
    "领补贴",
    "会员"
  ];

  Widget buildGridView() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      //缓存区域
      cacheExtent: 00,
      //内边距
      padding: EdgeInsets.all(8),
      //条目个数
      itemCount: _classList.length,
      //子Item排列规则
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //纵轴间距
        mainAxisSpacing: 10.0,
        //横轴间距
        crossAxisSpacing: 10.0,
        //子组件宽高长度比例
        childAspectRatio: 0.9,
        //每行5个
        crossAxisCount: 5,
      ),
      //懒加载构建子条目
      itemBuilder: (BuildContext context, int index) {
        return buildListViewItemWidget(index);
      },
    );
  }

  Widget buildListViewItemWidget(int index) {
    String title = _classList[index];
    return new Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/2.0x/app_icon.png",
            width: 44,
            height: 44,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 12, color: Color(0xff333333)),
          )
        ],
      ),
    );
  }
}
