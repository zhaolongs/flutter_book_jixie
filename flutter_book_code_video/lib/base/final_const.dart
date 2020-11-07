import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/31.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
class TestPage {
  final test1 = 3;

  /// final 修饰的常量是在运行时赋值
  final test2 = DateTime.now();

  ///修饰的常量值在编译时可计算出结果
  static const test = 3;

/// DateTime.now() 需要在运行时才能 获取值
/// 所以这里会出错
//  static const test3 = DateTime.now();
}



///全局常量 声明
const String name = "张三";

class TestPage2 {
  ///类常量
  static const String name = "张三";

  void test() {
    ///方法块常量
    const String name = "张三";
  }

  /// list变量 指向的这个 List对象不可变
  List<String> list = const ["test1", "test2"];

  /// list2 变量的指向不可变 
  static const List<String> list2 = ["test1", "test2"];
}


class TestPage3 {

  final String  name = "张三";

  final List<String>  list = const ["张三","李四"];
  void test() {
    list.add("g王五");

  }
}
class Person {

  static final Person person = const Person("张三");

  const Person(this.firstName);

  final String firstName;
}

class Point {
  static final Point ORIGIN = const Point(0, 0);
  final int x;
  final int y;
  const Point(this.x, this.y);
  Point.clone(Point other): x = other.x, y = other.y; //[2]
}



/// 代码清单 1-2-1
///订单类型
class OrderStatus {

  static const OrderStatus notDeliver = const OrderStatus("待发货",1);
  static const OrderStatus hasBeenShipped = const OrderStatus("已发货",2);
  static const OrderStatus haveTheGoods = const OrderStatus("已收货",2);

  const OrderStatus(this.statusName,this.statusNumber);

  final String statusName;
  final int statusNumber;
}


///  代码清单 1-2-2
class TestClass5{

  ///判断订单类型
  void test(OrderStatus orderStatus){

    switch (orderStatus) {
      case OrderStatus.notDeliver:
        break;
      case OrderStatus.hasBeenShipped:
        break;
      case OrderStatus.haveTheGoods:
        break;
      default:
        break;
    }
  }
}

class LeftPageViewPage extends StatefulWidget {

  final title;

  LeftPageViewPage({this.title});

  @override
  State<StatefulWidget> createState() {
    return new LeftPageViewPageState();
  }
}

class LeftPageViewPageState extends State<LeftPageViewPage> {


  ///控制器
  final PageController _controller = new PageController();
 
  ///可滑动的页面 使用到的图片
  final List<String> _pages = <String>[
    "http://b-ssl.duitang.com/uploads/item/201311/02/20131102150044_YGB5u.jpeg",
    "http://b-ssl.duitang.com/uploads/item/201311/02/20131102150044_YGB5u.jpeg",
    "http://b-ssl.duitang.com/uploads/item/201311/02/20131102150044_YGB5u.jpeg",
  ];

  
  @override
  Widget build(BuildContext context) {
    ///层叠布局
    return new Stack(
      children: <Widget>[
        //底层的PageView 
        buildPageView(),
        //表层的圆点指示器
        buildPositioned(),
      ],
    );
  }

  ///构建 PageView 
  PageView buildPageView() {
    ///懒加载模式构建
    return PageView.builder(
      ///设置滑动模式
      physics: new AlwaysScrollableScrollPhysics(),
      ///添加控制器
      controller: _controller,
      ///构建每一屏的视图 UI 
      itemBuilder: (BuildContext context, int index) {
        return buildItemWidget(index);
      },
      ///条目个数
      itemCount: _pages.length,
    );
  }
  ///构建每一页的Item UI效果
  Widget buildItemWidget(int index){
    return new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      ///网络图片
      child: Image.network(
        ///图片地址
        _pages[index],
        ///加载中的占位
        loadingBuilder: (BuildContext context,
            Widget child,
            ImageChunkEvent loadingProgress) {
          ///这里使用了一个进度圆圈
          return new SizedBox(
            width: 24.0,
            height: 24.0,
            child: new CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          );
        },),
    );
  }
  
  ///表层的圆点指示器
  Positioned buildPositioned() {
    return new Positioned(
      ///底部对齐
        bottom: 0.0, left: 0.0,right: 0.0,
        child: new Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: new Center(
            ///自定义的圆点切换指示器
            child: buildDotsIndicator(),
          ),
        ),
      );
  }
  ///自定义的圆点切换指示器
  DotsIndicator buildDotsIndicator() {
    return new DotsIndicator(
      ///与PageView联动的控制器
        controller: _controller,
        ///小圆点的个数
        itemCount: _pages.length,
        ///点击小圆点的回调
        onPageSelected: (int pageIndex) {
          ///主动切换页面
          _controller.animateToPage(
            pageIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
  }
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.red,
  }) : super(listenable: controller);

  final PageController controller;

  final int itemCount;

  final ValueChanged<int> onPageSelected;

  final Color color;

  static const double _kDotSize = 8.0;

  static const double _kMaxZoom = 2.0;

  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

