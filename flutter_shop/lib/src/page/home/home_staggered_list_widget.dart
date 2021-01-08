import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/utils/log_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/6.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///首页面的瀑布流
class HomeStaggeredWidget extends StatefulWidget {
  @override
  _HomeStaggeredWidgetState createState() => _HomeStaggeredWidgetState();
}

class _HomeStaggeredWidgetState extends State<HomeStaggeredWidget> {
  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 4,
      itemCount: 100,
      itemBuilder: (context, i) {
        return itemWidget(i);
      },
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index == 0 ? 2.5 : 3),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }

  Widget itemWidget(int index) {
    return new Material(
      elevation: 8.0,
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0),
      ),
      child: new InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: new Hero(
                  tag: "$index",
                  child: Image.asset(
                    "assets/images/2.0x/s01.jpeg",
                    width: MediaQuery.of(context).size.width - 20,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 26,
                          height: 16,
                          child: Text(
                            "商品",
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[700],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 26,
                          height: 16,
                          child: Text(
                            "精选",
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t 极品运动服装 挑战冬日的严寒 1折处理 大家快来抢购吧",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "￥135",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "￥145",
                    style: TextStyle(
                      //中间删除线 TextDecoration.lineThrough
                      //底部下划线TextDecoration.underline
                      //顶部上划线 TextDecoration.overline
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
