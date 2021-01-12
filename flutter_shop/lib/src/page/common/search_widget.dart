import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

///代码清单 13-33
///搜索框
///src/page/common/search_widget.dart
class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //内边距
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 34,
      //圆角背景
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Image.asset(
            'assets/images/2.0x/search_icon2.png',
            width: 16,
            height: 16,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text("搜索"),
          ),
          Image.asset(
            'assets/images/2.0x/camera_icon2.png',
            width: 22,
            height: 22,
          ),
        ],
      ),
    );
  }
}
