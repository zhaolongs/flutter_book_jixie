import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/utils/date_utils.dart';

import 'home_good_seckill_item_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class GoodsSeckillWidget extends StatefulWidget {
  @override
  _GoodsSeckillWidgetState createState() => _GoodsSeckillWidgetState();
}

class _GoodsSeckillWidgetState extends State<GoodsSeckillWidget> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {

    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "商品秒杀",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              buildTimeWidget(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SeckillGoodsWidget(),
              SeckillGoodsWidget(),
              SeckillGoodsWidget(),
              SeckillGoodsWidget(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTimeWidget() {
    String endTimeString = "2021-03-06 20:00:00";
    DateTime endDateTime = DateUtils.getDateTime(endTimeString);
    DateTime now = DateTime.now();
    Duration flagDuration = endDateTime.difference(now);

    int inDays = flagDuration.inDays;
    int inHours = flagDuration.inHours;
    int inMinutes = flagDuration.inMinutes;
    int inSeconds = flagDuration.inSeconds;

    String twoDigitDyays = twoDigits(inDays.remainder(365) as int);
    String twoDigitHours = twoDigits(inHours.remainder(24) as int);
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60) as int);
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60) as int);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        timeCellWiedget("$twoDigitDyays"),
        Text(":"),
        timeCellWiedget("$twoDigitHours"),
        Text(":"),
        timeCellWiedget("$twoDigitMinutes"),
        Text(":"),
        timeCellWiedget("$twoDigitSeconds"),
      ],
    );
  }

  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  Widget timeCellWiedget(String title) {
    return Container(
      width: 18,
      height: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Text(
        "$title",
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
