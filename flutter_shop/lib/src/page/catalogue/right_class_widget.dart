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
/// 代码清单
///代码清单
class RightClassWidget extends StatefulWidget {
  final ShopClassBean currentLeftBean;

  RightClassWidget({@required this.currentLeftBean,Key key}):super(key: key);

  @override
  _RightClassWidgetState createState() => _RightClassWidgetState();
}

class _RightClassWidgetState extends State<RightClassWidget> {
  List<RightListBean> _list = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      RightListBean rightListBean = new RightListBean();

      List<RightClassBean> itemList = [];
      for (int j = 0; j < 6; j++) {
        itemList.add(RightClassBean(
            imagePath: "assets/images/2.0x/s02.jpeg", classTitle: "运动$j"));
      }

      rightListBean.title = "运动品类$i-${widget.currentLeftBean.classTitle}";
      rightListBean.classList = itemList;
      _list.add(rightListBean);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: _list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(height: 120, child: BannerWidget());
          } else {
            RightListBean rightListBean = _list[index - 1];
            List<RightClassBean> classList = rightListBean.classList;
            return Container(
              height: classList.length /
                  3 *
                  (MediaQuery.of(context).size.width / 3),
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
