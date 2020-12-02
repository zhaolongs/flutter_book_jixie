import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/common/sp_key.dart';
import 'package:flutterbookcode/utils/date_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';
import 'package:flutterbookcode/utils/sp_utils.dart';

import 'page/home/home_main_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/20.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
/// lib/app/splash.dart
/// 第一次 新手引导页面
class SplashPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<SplashPage> {
  ///引导页面使用的图片资源
  List<String> splList = [
    "assets/images/3.0x/sp01.png",
    "assets/images/3.0x/sp02.png",
    "assets/images/3.0x/sp05.png",
    "assets/images/3.0x/sp03.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: buildStack(),
      ),
    );
  }

  ///构建页面显示的主要内容
  buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ///底部可滑动的图片
        buildPageView(),

        ///右上角显示的计数
        buildTopDate(),

        ///左下角显示的进入首页面按钮
        buildBottomButton(),
      ],
    );
  }

  /// lib/app/splash.dart
  /// 底部可滑动的图片
  buildPageView() {
    ///PageView用于整屏切换效果
    ///默认情况下是左右切换
    return PageView.builder(
      ///滑动视频滑动结束时回调
      ///参数 value PageView当前显示的页面索引
      onPageChanged: (value) {
        LogUtil.e("pageView on changed $value");
        buildTopText(value);
      },

      ///构建条目的总个数，如这里的4
      itemCount: splList.length,

      ///每一页的显示Widget
      itemBuilder: (BuildContext context, int postion) {
        ///这里直接使用的是本地资源目录下的图片
        return Image.asset(
          splList[postion],
          fit: BoxFit.fill,
        );
      },
    );
  }

  /// lib/app/splash.dart
  ///构建的右上角显示的计数
  buildTopDate() {
    return Positioned(
      top: 40, right: 20,

      ///动画过渡 圆形 ->矩形 ;  矩形 ->圆形
      child: AnimatedContainer(
        ///中心对齐
        alignment: Alignment.center,

        ///过渡结束后判断是否显示周信息
        onEnd: () {
          if (topWidth == 130) {
            isShowWeek = true;
          } else {
            isShowWeek = false;
          }
          setState(() {});
        },

        ///当前容器的尺寸信息
        width: topWidth,
        height: topHeight,

        ///动画过渡执行的时间为 200 毫秒
        duration: Duration(milliseconds: 400),

        ///动画插值器
        curve: Curves.easeIn,

        ///用来设置边框装饰
        decoration: BoxDecoration(

            ///边框圆角
            borderRadius: BorderRadius.all(Radius.circular(topRadius)),

            ///边框颜色与粗细
            border: Border.all(
              width: 3,
              color: Colors.redAccent,
            )),

        ///显示的文本
        child: buildTopTextColumn(),
      ),
    );
  }

  ///显示的文本
  Column buildTopTextColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///显示的页面角标
        Text(
          text1,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style:TextStyle(fontSize: 16, color: Colors.indigo),
        ),

        ///最后一页显示周信息
        isShowWeek
            ? Text(
                text2,
                style: TextStyle(fontSize: 22, color: Colors.indigo),
              )
            : Container()
      ],
    );
  }

  buildBottomButton() {
    if (isShowWeek) {
      return Positioned(
        bottom: 40,
        left: 20,
        child: InkWell(
          onTap: () {
            ///保存标识
            SPUtil.save(spUserIsFirstKey, true);

            ///跳转首页
            NavigatorUtils.openPageByFade(context, HomeMainPage(),
                isReplace: true);
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  width: 3,
                  color:  Colors.indigo,
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "去首页",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  /// lib/app/splash.dart
  ///构建的右上角显示的计数数据
  String text1 = "1";
  String text2 = "";

  ///右上角显示计数的容大小
  double topWidth = 40;
  double topHeight = 40;

  ///右上角显示计数的边框圆角
  ///默认容器的大小为40，这里设置的边框圆角为 20
  ///所以展示出来的是一个圆形
  double topRadius = 20;

  ///是否显示当前时间是第几周
  ///因为只有在最后一页才显示的
  bool isShowWeek = false;

  buildTopText(int value) {
    ///如果不是最后一页，右上角的计数始终是圆形
    if (value < splList.length - 1) {
      text1 = "${value + 1}";
      text2 = "";
      topWidth = 40;
      topHeight = 40;
      topRadius = 20;
      isShowWeek = false;
    } else {
      ///如果是最后一页
      ///修改显示的文本为当前的时间
      text1 = "${DateUtils.getNowDateStr()}";

      ///当前星期几
      text2 = "${DateUtils.getNowWeekDay()}";

      ///修改容器为矩形
      topWidth = 130;
      topHeight = 80;
      topRadius = 2;
    }
    setState(() {});
  }
}
