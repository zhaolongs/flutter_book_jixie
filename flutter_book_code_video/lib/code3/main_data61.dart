
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

///4.9 /lib/code3/main_data60.dart
///FlexibleSpaceBar使用分析
///SliverAppBar 配置可折叠的布局
///经内内容布局效果
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{


  List<Widget> girdChildrend=[];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 8; i++) {
      Widget itemWidget = Container(
        padding: EdgeInsets.all(12), child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)), child: Image(
        image: AssetImage("assets/images/2.0x/app_icon.png"),
        fit: BoxFit.fill,),),);
      girdChildrend.add(itemWidget);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool b) {
          return [
            SliverAppBar(
              //固定在顶部
              pinned: true,
              //隐藏标题部分 leading、title、actions等
              //这里没有配置bottom，所以配置的leading还是显示的
              floating: true,
              //可折叠的高度
              expandedHeight: 448,
              ///标题
              title: Text("配制"),
              ///左侧图标
              leading: Icon(Icons.home),
              ///右侧图标
              actions: <Widget>[
                Icon(Icons.share),
              ],
              ///用于折叠的布局
              flexibleSpace: FlexibleSpaceBar(
                  background:  buildBackgroundFunction(),
              ),
            )
            ,
          ];
        },

        ///主体部分
        body: buildFirsteBody(),
      ),
    );
  }

  buildBackgroundFunction(){
    return Container(
      color: Colors.blue,
      //一张图片
      child: Column(children: [
        ///这里的Container设置为100正好是顶部刘海的高度与toolbar的高度
        Container(height: 100),
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue[300],
          //一张图片
          child: Image(image: AssetImage("assets/images/2.0x/head1.png"),
            fit: BoxFit.fill,),
        ),
        Expanded(child:
        GridView.count(
          //去除gridView的内边距
          padding: EdgeInsets.zero,
          ///禁止滑动
          physics: NeverScrollableScrollPhysics(),
          ///水平4个widget
          crossAxisCount: 4,
          ///竖直方向 两个widget间距10
          mainAxisSpacing: 10,
          ///水平方向 两个widget间距10
          crossAxisSpacing: 10,
          //                        childAspectRatio: 1,
          children: girdChildrend,),)
      ],),
    );
  }
//页面的ListView列表内容部分
  buildFirsteBody() {
    return ListView.builder(
      ///清除内边距
        padding: EdgeInsets.zero,
        ///构建条目
        itemBuilder: (BuildContext context, int index) {
          ///上下两个条目之间间距
          return Container(margin: EdgeInsets.only(bottom: 6),
            ///每个条目的背景颜色为白色
            color: Colors.white,
            //一般页面的上下左右与内容之间都有一定的间距的
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 6),
            ///配置每个条目的高度
            height: 80,
            ///用来配置每个条目的左右主体部分
            child: Row(
              children: [
                //左边的图片
                Image(image: AssetImage("assets/images/2.0x/app_icon.png")),
                //与文字中间的间距
                SizedBox(width: 12,),
                ///竖直方向的排列
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("这里是标题了", style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text(
                      "这里是描述了,山高水长，小编与你奋斗每一天", style: TextStyle(fontSize: 14),),
                  ],)
              ],
            ),);
        });
  }
}