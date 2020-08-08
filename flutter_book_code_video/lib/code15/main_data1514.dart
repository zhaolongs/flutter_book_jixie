import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/global_key_utils.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1513.dart
///常见滑动布局的实现 SingleScrollView + GridView + ListView
class ScrollBaseUsePage7 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {

  ///GridView的主键
  GlobalKey gridViewGlobalKey = GlobalKey();

  ///ScrollView使用的控制器
  ScrollController singleScrollController = new ScrollController();

  ScrollController listViewScrollController = new ScrollController();

  ScrollPhysics singleScrollPhysics = BouncingScrollPhysics();
  ScrollPhysics listViewScrollPhysics = NeverScrollableScrollPhysics();


  @override
  void initState() {
    super.initState();

    singleScrollController.addListener(() {
      ///实时获取ScrollView滑动的距离
      double scrollOffset = singleScrollController.offset;

      ///获取ListView的位置信息
      Offset widgetOffset = GlobalKeyUtils.getWidgetOffset(gridViewGlobalKey);

      double dy = widgetOffset.dy - kToolbarHeight;

      if(dy<30){
        ///禁用ScrollView的滑动 开启ListView的滑动
        singleScrollPhysics = ClampingScrollPhysics();
        listViewScrollPhysics = BouncingScrollPhysics();
        setState(() {

        });

      }
      print("scrollOffset $scrollOffset   widgetOffset $widgetOffset  dy $dy");
    });

    listViewScrollController.addListener(() {
      ///ListView的滑动距离
      double scrollOffset =listViewScrollController.offset;
      if(scrollOffset<=0){
        ///禁用ScrollView的滑动 开启ListView的滑动
        listViewScrollPhysics= NeverScrollableScrollPhysics();
        singleScrollPhysics = BouncingScrollPhysics();
        setState(() {

        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: new AppBar(
        title: Text("详情"),
      ),

      ///使用滑动布局包裹页面主体内容
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          controller: singleScrollController,
          physics: singleScrollPhysics,
          padding: EdgeInsets.zero,
          ///使用线性布局组合
          child: Column(
            children: [
              ///固定的布局 + GridView + ListView
              buildImageWidget(),
              buildGridView(),
              buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  ///lib/code15/main_data1513.dart
  ///构建一个固定高度的Image
  Widget buildImageWidget() {
    return Container(
      child: Image.asset(
        "assets/images/2.0x/banner4.webp",
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: 200,
      ),
    );
  }

  ///lib/code15/main_data1513.dart
  ///构建含有8个Item的GridView
  Widget buildGridView() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: GridView.count(
        ///每行有4列
        crossAxisCount: 4,
        ///每行之间的间隔
        mainAxisSpacing: 10.0,
        ///每列之间的间隔
        crossAxisSpacing: 10.0,
        ///GridView尺寸包裹Item
        shrinkWrap: true,
        ///每个Item的宽高比为1.0
        childAspectRatio: 1.0,
        ///所有的Item
        children: [...buildGridItemList()],
      ),
    );
  }
  ///GridView的子条目构建
  List<Widget> buildGridItemList() {
    List<Widget> list = [];
    for (var i = 0; i < 8; i++) {
      list.add(
        ///裁剪成微圆角矩形样式
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Image.asset(
            "assets/images/2.0x/banner4.webp",
            fit: BoxFit.fill,
          ),
        ),
      );
    }
    return list;
  }
  ///lib/code15/main_data1513.dart
  ///构建ListView的列表数据
  Widget buildListView() {
    return Container(
      key: gridViewGlobalKey,
      ///动态计算了用来限制ListView高度
      height:MediaQuery.of(context).size.height,
      child: ListView.builder(
        controller: listViewScrollController,
        ///禁止ListView的滚动
        physics: listViewScrollPhysics,
        itemBuilder: (BuildContext context, int index) {
          return buildListViewItem(index);
        },
        ///ListView的子条目个数
        itemCount: 100,
      ),
    );
  }

  ///构建ListView的列表的子条目
  ///Item的布局
  Widget buildListViewItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
        color: Colors.white,
        height: 60,
        child: Text("列表数据 $index"));
  }
}
