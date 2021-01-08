import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 
///代码清单
class SearchWidget extends StatefulWidget {
  final double value;
  SearchWidget({this.value=0.0});
  @override
  State<StatefulWidget> createState() {
    return _SearchWidgetState();
  }
}

class _SearchWidgetState extends State<SearchWidget>{

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(right: 20 * widget.value),
          height: 34,
          width: MediaQuery.of(context).size.width - 20 - 120 * widget.value,
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
        )
      ],
    );
  }
}