import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/28.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/item/item_page1.dart
class ItemPage1 extends StatefulWidget {
  int pageIndex;
  ItemPage1(this.pageIndex);
  @override
  _TestPageState createState() => _TestPageState();
}


class _TestPageState extends State<ItemPage1>  with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text("这是第${widget.pageIndex}个页面"),
          height: 1000,
        ),
    );
  }
}