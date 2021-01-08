import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_shop_class.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class TitleAndGridWidget extends StatefulWidget {
  final String title;
  final List<RightClassBean> gridImageList;

  TitleAndGridWidget({@required this.title, @required this.gridImageList});

  @override
  _TitleAndGridWidgetState createState() => _TitleAndGridWidgetState();
}

class _TitleAndGridWidgetState extends State<TitleAndGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            "${widget.title}",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            //缓存区域
            cacheExtent: 00,
            //内边距
            padding: EdgeInsets.all(8),
            //条目个数
            itemCount: widget.gridImageList.length,
            //子Item排列规则
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //纵轴间距
              mainAxisSpacing: 10.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 0.9,
              //每行5个
              crossAxisCount: 3,
            ),
            //懒加载构建子条目
            itemBuilder: (BuildContext context, int index) {
              RightClassBean bean = widget.gridImageList[index];
              return Container(
                padding: EdgeInsets.all(4),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(child: Image.asset(bean.imagePath)),
                      Text(
                        "${bean.classTitle}",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
