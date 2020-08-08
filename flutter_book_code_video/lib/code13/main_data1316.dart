import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data1316.dart
//手势识别  双击放大、双指缩放、拖动图片
//结合pageView来使用
class PageViewAndScaleImagePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<PageViewAndScaleImagePage> {
  //lib/code/main_data1316.dart
  //手势识别  双击放大、双指缩放、拖动图片 依赖库使用
  bool _isBorder = true;
  ///PageView当前显示的角标
  int currentIndex =0;
  ///PageView的总页数
  int imageTotal = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pageview中缩放、拖动图片"),
      ),
      body: Stack(
        ///设置子Widget默认剧中对齐
        alignment: Alignment.center,
        children: [
          ///构建PageView
          buildPageView(),
          ///页面指示器
          buildPositioneIindicator()
        ],
      ),
    );
  }
  //lib/code/main_data1316.dart
  ///页面指示器
  Positioned buildPositioneIindicator() {
    return Positioned(
      ///底部对齐
      bottom: 20,
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 2),
        ///设置圆角边框
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          "$currentIndex/$imageTotal",
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
  //lib/code/main_data1316.dart
  ///页面主体的PageView
  Positioned buildPageView() {
    return Positioned(top: 0,bottom: 0,left: 0,right: 0,child: PageView.builder(
        ///页面切换时的回调
        ///[pageIndex]页面的角标
        onPageChanged: (int pageIndex){
          currentIndex=pageIndex;
          setState(() {
          });
        },
        ///配置滑动
        ///BouncingScrollPhysics 有回弹效果的滑动
        ///NeverScrollableScrollPhysics 不可滑动
        physics: _isBorder
            ? BouncingScrollPhysics()
            : NeverScrollableScrollPhysics(),
        ///pageView的构建子Item的构建器
        itemBuilder: (BuildContext context, int index) {
          return buildItemImageWidget(index);
        },
        ///子Item的个数
        itemCount: imageTotal,
      ),);
  }
  //lib/code/main_data1316.dart
  ///pageView的子Item
  Widget buildItemImageWidget(int index) {
    return Center(
      ///缩放拖动组件
      child: TouchableContainer(
        ///双击放大
        doubleTapStillScale: true,
        ///当缩放拖动图片时会裡回调此方法
        scaleChanged:buildSlideAndScaleChangeFunction,
        ///需要放大拖动的子组件
        child: Image.asset(
          "assets/images/2.0x/s03.jpeg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
  //lib/code/main_data1316.dart
  ///当缩放拖动图片时会裡回调此方法
  buildSlideAndScaleChangeFunction (ScaleChangedModel model) {
    ///向左滑动
    if(model.currentHorizontalSlideDirectionType==SlideDirectionType.toLeft){
      ///当前放大的图片是否拖动到了左边界
      if(model.isLeftBorder){
        _isBorder = true;
      }else{
        _isBorder = false;
      }
    }else{
      ///向右滑动
      /// 当前放大的图片是否拖动到了右边界
      if(model.isRightBorder){
        _isBorder = true;
      }else{
        _isBorder = false;
      }
    }
    setState(() {
    });
  }
}
