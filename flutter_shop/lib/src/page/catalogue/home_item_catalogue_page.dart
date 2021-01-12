import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/src/bean/bean_shop_class.dart';
import 'package:flutter_shop/src/page/catalogue/right_class_widget.dart';
import 'package:flutter_shop/src/page/common/search_widget.dart';

///代码清单 13-54
///分类选择页面
///lib/src/page/home/home_good_class_widget.dart
class HomeItemCataloguePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemState();
  }
}

///当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class _HomeItemState extends State with AutomaticKeepAliveClientMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  //左侧分类
  List<ShopClassBean> _leftClassList = [];
  //当前选中的左侧分类
  ShopClassBean _currentLeftBean;

  @override
  void initState() {
    super.initState();
    //模拟左侧分类数据
    for (int i = 0; i < 20; i++) {
      _leftClassList.add(
        ShopClassBean(
          classId: i,
          classTitle: "分类$i",
          isSelect: i == 0 ? true : false,
        ),
      );
    }
    //默认选中第一个分类
    _currentLeftBean = _leftClassList[0];
  }

  ///代码清单 13-55
  ///分类选择页面 状态栏相关设置
  ///lib/src/page/home/home_good_class_widget.dart
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

  ///代码清单 13-56
  ///分类选择页面 页面主体
  ///lib/src/page/home/home_good_class_widget.dart
  buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          //标题部分
          Container(
            padding: EdgeInsets.only(top: 12),
            color: Colors.deepPurple,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).viewPadding.top + 64,
            child: Row(
              children: [
                //左侧图标
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.scanner_outlined,
                    color: Colors.white,
                  ),
                ),
                //搜索框
                Expanded(
                  child: SearchWidget(),
                ),
                //消息图标
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.messenger,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          //分类列表部分
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12),
              child: buildClassListRow(),
            ),
          )
        ],
      ),
    );
  }
  ///代码清单 13-57
  ///分类选择页面 左右列表 1:3 比例适配
  ///lib/src/page/home/home_good_class_widget.dart
  Row buildClassListRow() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: 8,
            ),
            //左侧列表
            child: buildLeftListView(),
          ),
        ),
        Expanded(
          flex: 3,
          //圆角
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            //右侧列表
            child: RightClassWidget(
              currentLeftBean: _currentLeftBean,
              key: ValueKey("${_currentLeftBean.classId}"),
            ),
          ),
        )
      ],
    );
  }


  ///代码清单 13-58
  ///分类选择页面 左侧分类列表
  ///lib/src/page/home/home_good_class_widget.dart
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
