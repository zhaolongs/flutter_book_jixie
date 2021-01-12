import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_shop_class.dart';
import 'package:flutter_shop/src/common/banner.dart';
import 'package:flutter_shop/src/page/catalogue/title_grid_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 13-59
///分类选择页面 右侧分类列表
///lib/src/page/catalogue/right_class_widget.dart
class RightClassWidget extends StatefulWidget {
  //一级分类数据模型
  final ShopClassBean currentLeftBean;

  RightClassWidget({@required this.currentLeftBean,Key key}):super(key: key);

  @override
  _RightClassWidgetState createState() => _RightClassWidgetState();
}

class _RightClassWidgetState extends State<RightClassWidget> {
  //二级分类对应的数据
  List<RightListBean> _list = [];

  @override
  void initState() {
    super.initState();

    //模拟二级分类数据
    for (int i = 0; i < 10; i++) {
      RightListBean rightListBean = new RightListBean();

      //三级分类数据
      List<RightClassBean> itemList = [];
      for (int j = 0; j < 6; j++) {
        itemList.add(RightClassBean(
            imagePath: "assets/images/2.0x/s02.jpeg", classTitle: "运动$j"));
      }
      //三级分类标题
      rightListBean.title = "运动品类$i-${widget.currentLeftBean.classTitle}";
      rightListBean.classList = itemList;
      _list.add(rightListBean);
    }
  }

  ///代码清单 13-60
  ///分类选择页面 右侧分类列表
  ///lib/src/page/catalogue/right_class_widget.dart
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //列表
      child: ListView.builder(
        //内边距设置
        padding: EdgeInsets.only(top: 8),
        //列表数量 +1 第一个用于显示轮播
        itemCount: _list.length + 1,
        //每个子Item构建
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            //第一个子Item构建为轮播图
            return Container(height: 120, child: BannerWidget());
          } else {
            //获取二级分类数据
            RightListBean rightListBean = _list[index - 1];
            //获取二级分类中对应的三级分类
            List<RightClassBean> classList = rightListBean.classList;
            //宽度计算
            return Container(
              height: classList.length /
                  3 *
                  (MediaQuery.of(context).size.width / 3),
              //子Item构建
              child: TitleAndGridWidget(
                gridImageList: classList,
                title: rightListBean.title,
              ),
            );
          }
        },
      ),
    );
  }
}
