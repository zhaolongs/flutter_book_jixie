import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/src/bean/bean_shop_class.dart';
import 'package:flutter_shop/src/page/catalogue/right_class_widget.dart';
import 'package:flutter_shop/src/page/common/search_widget.dart';

///代码清单 12-19
///首页面视频播放页面
///lib/src/page/home/home_item_catalogue_page.dart
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemState();
  }
}

///使用到[TabBar] 所以要绑定一个Ticker
///当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class _HomeItemState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  List<ShopClassBean> _leftClassList = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 20; i++) {
      _leftClassList.add(
        ShopClassBean(
          classId: i,
          classTitle: "分类$i",
          isSelect: i == 0 ? true : false,
        ),
      );
    }

    _currentLeftBean = _leftClassList[0];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //状态文字设置为魄
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    //设置状态栏的颜色 有AppBar时，会被覆盖
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: buildScaffold(),
      value: SystemUiOverlayStyle(
          //状态栏的背景红色 Android 8.0 以上手机设置方法
          statusBarColor: Colors.deepPurple,
          //状态栏文字颜色为白色 Android 6.0 以上手机起作用
          //iOS 状态栏文字 Brightness.dark 为白色 Brightness.light 为黑色
          statusBarBrightness: Brightness.dark,
          //底部navigationBar背景颜色 Android 6.0 以上手机起作用
          systemNavigationBarColor: Colors.white),
    );
  }

  buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 12),
            color: Colors.deepPurple,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).viewPadding.top + 64,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.scanner_outlined,
                    color: Colors.white,
                  ),
                ),
                SearchWidget(
                  value: 0.7,
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.messenger,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                      ),
                      child: buildLeftListView(),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: RightClassWidget(
                        currentLeftBean: _currentLeftBean,
                        key: ValueKey("${_currentLeftBean.classId}"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ShopClassBean _currentLeftBean;

  buildLeftListView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _leftClassList.length,
      itemBuilder: (BuildContext context, int index) {
        //获取当前选中的分类
        ShopClassBean classBean = _leftClassList[index];
        //选中的分类使用白色底色
        BoxDecoration boxDecoration = BoxDecoration(color: Colors.white);
        //如果当前未选中
        if (!classBean.isSelect) {
          if (index > 0) {
            //如果不是第一个
            ShopClassBean preClassBean = _leftClassList[index - 1];
            if (preClassBean.isSelect) {
              boxDecoration = BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(12)));
            } else {
              boxDecoration = BoxDecoration(
                color: Colors.grey[200],
              );
            }
          } else {
            boxDecoration = BoxDecoration(color: Colors.grey[200]);
          }
          //如果不是最后一个 获取当前的下一个
          if (index < _leftClassList.length - 1) {
            ShopClassBean lastClassBean = _leftClassList[index + 1];
            if (lastClassBean.isSelect) {
              boxDecoration = BoxDecoration(
                color: Colors.grey[200],
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(12)),
              );
            }
          }
        }
        return InkWell(
          onTap: () {
            //如果当前点击的类目为选中状态
            //就不做任何操作
            if (classBean.isSelect) {
              return;
            }
            //设置其他的状态为未选中
            _leftClassList.forEach((element) {
              element.isSelect = false;
            });
            //设置当前类目为选中
            classBean.isSelect = true;
            //更新
            _currentLeftBean = classBean;
            //刷新状态
            setState(() {});
          },
          child: Container(
            color: Colors.white,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              decoration: boxDecoration,
              child: Text("${classBean.classTitle}"),
            ),
          ),
        );
      },
    );
  }
}
