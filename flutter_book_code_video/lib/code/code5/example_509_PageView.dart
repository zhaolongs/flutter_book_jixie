
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey[200]),
    home: Example509(),
  ));
}

///代码清单 5-36 PageView 的切换动画
///lib/code/code5/example_509_PageView.dart
class Example509 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example509> {
  /// 初始化控制器
  PageController pageController;

  //PageView当前显示页面索引
  double currentPage = 0;

  //图片数据
  List<String> imageList = [
    "assets/images/2.0x/banner1.webp",
    "assets/images/2.0x/banner2.webp",
    "assets/images/2.0x/banner3.webp",
    "assets/images/2.0x/banner4.webp",
    "assets/images/2.0x/banner5.webp",
  ];

  @override
  void initState() {
    super.initState();

    //创建控制器的实例
    pageController = new PageController(
      //用来配置PageView中默认显示的页面 从0开始
      initialPage: 0,
      //为true是保持加载的每个页面的状态
      keepPage: true,
    );

    ///PageView设置滑动监听
    pageController.addListener(() {
      //PageView滑动的距离
      setState(() {
        currentPage = pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("PageView "),
      ),
      body:buildPageView(),
    );
  }

  buildPageView() {
    return Container(
      height: 200,
      child: PageView.custom(
        //控制器
        controller: pageController,
        //子Item的构建器 当前显示的 即将显示的子Item 都会回调
        childrenDelegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
          //计算
          if (index == currentPage.floor()) {
            //出去的item
            return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(currentPage - index)
                  ..scale(0.98, 0.98),
                child: buildItem(index));
          } else if (index == currentPage.floor() + 1) {
            //进来的item
            return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(currentPage - index)
                  ..scale(0.9, 0.9),
                child: buildItem(index));
          } else {
            print("当前显示 $index");
            return buildItem(index);
          }
        }, childCount: imageList.length),
      ),
    );
  }

  ///PageView中Item显示使用Widget
  ///可以是一个Widget如这里的图片
  ///也可以是单独的一个 StatefulWidget
  buildItem(int index) {
    print("index $index");
    return Container(
      child: Image.asset(
        "${imageList[index]}",
        fit: BoxFit.fill,
      ),
    );
  }
}
