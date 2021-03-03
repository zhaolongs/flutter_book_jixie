import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/6.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 13-27 首页面的瀑布流
///lib/src/page/home/home_staggered_list_widget.dart
class HomeStaggeredWidget extends StatefulWidget {
  @override
  _HomeStaggeredWidgetState createState() => _HomeStaggeredWidgetState();
}

class _HomeStaggeredWidgetState extends State<HomeStaggeredWidget> {
  @override
  Widget build(BuildContext context) {
    //通过指定数量来构建
    return new StaggeredGridView.countBuilder(
      physics: ClampingScrollPhysics(),
      //内边距
      padding: const EdgeInsets.all(8.0),
      //列数 一般与 staggeredTileBuilder 中参数一 成倍数
      crossAxisCount: 4,
      //商品个数 这里使用的模拟数据
      itemCount: 100,
      itemBuilder: (context, i) {
        return itemWidget(i);
      },
      staggeredTileBuilder: (int index) {
        //参数一 crossAxisCellCount:次轴的单元数 这里指水平方向
        //参数二 mainAxisCellCount:主轴占用的单元数。
        return new StaggeredTile.count(2, index == 0 ? 2.5 : 3);
      },
      //行间距
      mainAxisSpacing: 8.0,
      //列间距
      crossAxisSpacing: 8.0,
    );
  }

  ///代码清单 13-28
  ///瀑布流子Item布局 点击事件 阴影  [HomeStaggeredWidget]中的方法
  ///lib/src/page/home/home_staggered_list_widget.dart
  Widget itemWidget(int index) {
    return new Material(
      //阴影
      elevation: 8.0,
      //圆角
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0),
      ),
      child: new InkWell(
        //点击事件水波纹圆角
        borderRadius: new BorderRadius.all(
          new Radius.circular(8.0),
        ),
        onTap: () {
          //响应事件 如查看详情
        },
        child: buildContainer(index),
      ),
    );
  }

  ///代码清单 13-29
  ///瀑布流子Item 内容布局 [HomeStaggeredWidget]中的方法
  ///lib/src/page/home/home_staggered_list_widget.dart
  Container buildContainer(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //图片填充
          Expanded(
            child: new Hero(
              tag: "$index",
              child: Material(
                color: Colors.transparent,
                child: Image.asset(
                  "assets/images/2.0x/s01.jpeg",
                  width: MediaQuery.of(context).size.width - 20,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: buildShopTitle(),
          ),
          SizedBox(
            height: 4,
          ),
          //底部的价格
          buildPirceRow()
        ],
      ),
    );
  }

  ///代码清单 13-30瀑布流子Item 标题 [HomeStaggeredWidget]中的方法
  ///lib/src/page/home/home_staggered_list_widget.dart
  Stack buildShopTitle() {
    return Stack(
      children: [
        //底部的标题文字 开始部分使用空格占位
        Text(
          "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t 极品运动服装 挑战冬日的严寒 1折处理 大家快来抢购吧",
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey,
          ),
          //最多显示2行
          maxLines: 2,
          //超出后省略号
          overflow: TextOverflow.ellipsis,
        ),
        //第二层的标签
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 26, height: 16,
              child: Text(
                "商品",
                style: TextStyle(color: Colors.white, fontSize: 9),
              ),
              //背景
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
      ],
    );
  }

  ///代码清单 13-31 瀑布流子Item 价格 [HomeStaggeredWidget]中的方法
  ///lib/src/page/home/home_staggered_list_widget.dart
  Row buildPirceRow() {
    return Row(
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
    );
  }
}
