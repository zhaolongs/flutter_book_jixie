import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/5.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class SeckillGoodsWidget extends StatefulWidget {
  @override
  _SeckillGoodsWidgetState createState() => _SeckillGoodsWidgetState();
}

class _SeckillGoodsWidgetState extends State<SeckillGoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Image.asset("assets/images/2.0x/s02.jpeg"),
            width: 80,
            height: 120,
          )
        ],
      ),
    );
  }
}
