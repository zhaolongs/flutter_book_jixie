import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echart/flutter_echart.dart';

//lib/src/page/home/home_item_page.dart
//首页面显示的视频列表播放页面
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemState();
  }
}

//当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class _HomeItemState extends State with AutomaticKeepAliveClientMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //设置状态栏的颜色 有AppBar时，会被覆盖
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: buildScafflod(),
      value: SystemUiOverlayStyle(
          //状态栏的背景
          statusBarColor: Colors.white,
          //状态栏文字颜色为黑色
          statusBarIconBrightness: Brightness.dark,
          //底部navigationBar背景颜色
          systemNavigationBarColor: Colors.white),
    );
  }

  ///第二部分
  ///是否显示饼状图
  bool _isShow = true;

  Widget buildScafflod() {
    return Scaffold(
      backgroundColor: Colors.white,
      //页面的主内容 先来个居中
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              //来个高度
              height: 260,
              //宽度填充
              width: MediaQuery.of(context).size.width,
              //设置一下背景
              // color: mainColor,
              //封装一个方法构建左右排列的
              child: _isShow ? buildPieChatWidget() : Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _isShow = !_isShow;
          });
        },
      ),
    );
  }

  //第三部分 饼状图构建
  List<EChartPieBean> _dataList = [
    EChartPieBean(title: "生活费", number: 200, color: Colors.lightBlueAccent),
    EChartPieBean(title: "游玩费", number: 200, color: Colors.deepOrangeAccent),
    EChartPieBean(title: "交通费", number: 400, color: Colors.green),
    EChartPieBean(title: "贷款费", number: 300, color: Colors.amber),
    EChartPieBean(title: "电话费", number: 200, color: Colors.orange),
  ];
  //详细使用读者可查看文档
  PieChatWidget buildPieChatWidget() {
    return PieChatWidget(
      dataList: _dataList,
      //是否输出日志
      isLog: false,
      //是否需要背景
      isBackground: true,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Colors.white,
      //是否显示最前面的内容
      isFrontgText: true,
      //默认选择放大的块
      initSelect: 2,
      //初次显示以动画方式展开
      openType: OpenType.ANI,
      //旋转类型
      loopType: LoopType.MOVE,
      //点击回调
      clickCallBack: (int value) {
        print("当前点击显示 $value");
      },
    );
  }
}
