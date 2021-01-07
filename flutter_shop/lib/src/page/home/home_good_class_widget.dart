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
class GoodsClassWidget extends StatefulWidget {
  @override
  _GoodsClassWidgetState createState() => _GoodsClassWidgetState();
}

class _GoodsClassWidgetState extends State<GoodsClassWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 144,
      child: Row(
        children: [
          classCellWiedget("3C数码","会员8折"),
          classCellWiedget("图书推荐","合并优惠"),
          classCellWiedget("运动户外","签到惊喜"),
          classCellWiedget("生活服务","刚刚上新"),
        ],
      ),
    );
  }

  Widget classCellWiedget(String title,String header) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Stack(
          children: [
            Positioned(
              top: 4,
              right: 4,
              left: 4,
              child: Container(
                padding: EdgeInsets.all(12),
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Image.asset("assets/images/2.0x/app_icon.png"),
              ),
            ),
            Positioned(
              top: 74,
              right: 8,
              left: 8,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Text(
                  "$header",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 2,
              right: 2,
              child: Text(
                "$title",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
