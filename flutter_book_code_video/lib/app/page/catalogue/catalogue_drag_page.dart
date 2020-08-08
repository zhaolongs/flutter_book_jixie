import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_catalog.dart';
import 'package:flutterbookcode/code6/shape/oval_hole_shape_boder.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

class CatalogueDragPage extends StatefulWidget {
  final List<CatalogBean> list;
  CatalogueDragPage(this.list);
  @override
  State<StatefulWidget> createState() {
    return _CatalogueMainPageState();
  }
}

class _CatalogueMainPageState extends State<CatalogueDragPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(12.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return buildItemWidget(context, index);
          },
          itemCount: widget.list.length,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget buildItemWidget(BuildContext context, int index) {
    CatalogBean catalogModel = widget.list[index];
    return  Container(
      margin: EdgeInsets.only(top: 12.0),
        child: InkWell(
          onTap: () {
            NavigatorUtils.pushPage(context, catalogModel.page);
          },
          child: Material(
            shape: OvalHoleShapeBoder(),
            child: Container(
              padding: EdgeInsets.all(22.0),
              margin: EdgeInsets.only(top: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            catalogModel.pageTitle,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0),
                          ),
                        ),
                        Container(
                          child: Text(
                            catalogModel.pageMessage,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
      ),
    );
  }
}
