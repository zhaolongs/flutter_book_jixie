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

///代码清单 13-47
///首页面 计时分类
///lib/src/page/home/home_good_seckill_widget.dart

class GoodsSeckillWidget extends StatefulWidget {
  @override
  _GoodsSeckillWidgetState createState() => _GoodsSeckillWidgetState();
}

class _GoodsSeckillWidgetState extends State<GoodsSeckillWidget> {
  //计时器
  Timer _timer;

  @override
  void initState() {
    super.initState();
    //间隔1秒循环执行
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //销毁计时器
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      margin: EdgeInsets.all(10),
      //圆角背景
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      //竖直方向排列的内容区域
      child: buildColumn(),
    );
  }

  ///代码清单 13-41首页面 计时分类 [GoodsSeckillWidget]中定义
  ///lib/src/page/home/home_good_seckill_widget.dart
  Column buildColumn() {
    return Column(
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
            //倒计时
            buildTimeWidget(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        //水平排开商品
        Row(
          children: [
            SeckillGoodsWidget(),
            SeckillGoodsWidget(),
            SeckillGoodsWidget(),
            SeckillGoodsWidget(),
          ],
        ),
      ],
    );
  }

  ///代码清单 13-42首页面 计时分类 [GoodsSeckillWidget]中定义
  ///lib/src/page/home/home_good_seckill_widget.dart
  Widget buildTimeWidget() {
    //倒计时截止时间
    String endTimeString = "2021-03-06 20:00:00";
    //将String类型的日期转为 DateTime
    DateTime endDateTime = DateUtils.getDateTime(endTimeString);
    //获取当前时间
    DateTime now = DateTime.now();
    //计算时间差
    Duration flagDuration = endDateTime.difference(now);

    //距离的 天 、小时、分钟、秒 (总数)
    //如 1天 、24小时、24*60秒
    int inDays = flagDuration.inDays;
    int inHours = flagDuration.inHours;
    int inMinutes = flagDuration.inMinutes;
    int inSeconds = flagDuration.inSeconds;

    //计算时间间隔 如 01天12小时33分钟45秒
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

  //转双位输出
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  ///代码清单 13-43 分类圆角背景 计时分类 [GoodsSeckillWidget]中定义
  ///lib/src/page/home/home_good_seckill_widget.dart
  Widget timeCellWiedget(String title) {
    return Container(
      width: 18,
      height: 18,
      alignment: Alignment.center,
      //圆角背景
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
