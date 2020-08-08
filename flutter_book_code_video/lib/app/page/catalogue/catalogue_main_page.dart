import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_catalog.dart';
import 'package:flutterbookcode/app/page/catalogue/read_book_page.dart';
import 'package:flutterbookcode/code1/main_materiapp.dart';
import 'package:flutterbookcode/code10/main_data_ui_layout.dart';
import 'package:flutterbookcode/code11/main_data_check_box.dart';
import 'package:flutterbookcode/code12/main_data_radio.dart';
import 'package:flutterbookcode/code13/main_data_gesture.dart';
import 'package:flutterbookcode/code14/main_data_switch.dart';
import 'package:flutterbookcode/code15/drag/drag_container.dart';
import 'package:flutterbookcode/code15/drag/drag_controller.dart';
import 'package:flutterbookcode/code15/main_data_scrollview.dart';
import 'package:flutterbookcode/code16/main_data_listview.dart';
import 'package:flutterbookcode/code17/main_data_girdview.dart';
import 'package:flutterbookcode/code18/main_data_clip.dart';
import 'package:flutterbookcode/code20/main_data_other_transform.dart';
import 'package:flutterbookcode/code21/main_data_canvas.dart';
import 'package:flutterbookcode/code22/main_data_other.dart';
import 'package:flutterbookcode/code23/main_data_animation.dart';
import 'package:flutterbookcode/code3/main_data_appbar.dart';
import 'package:flutterbookcode/code3/main_data_scffold.dart';
import 'package:flutterbookcode/code4/main_data_text.dart';
import 'package:flutterbookcode/code5/main_data75.dart';
import 'package:flutterbookcode/code6/main_data_conainer.dart';
import 'package:flutterbookcode/code7/main_data_button.dart';
import 'package:flutterbookcode/code9/image_main_page.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
import 'package:flutterbookcode/utils/color_utils.dart';
import 'package:flutterbookcode/utils/log_util.dart';

import 'catalogue_drag_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

///lib/app/page/catalogue/catalogue_main_page.dart
///目录主页面
class CatalogueMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogueMainPageState();
  }
}

class _CatalogueMainPageState extends State<CatalogueMainPage>  with AutomaticKeepAliveClientMixin{
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;
  ///抽屉控制器
  DragController dragController = new DragController();
  ///初始化目录页面
  List<CatalogBean> list = [
    new CatalogBean("第1章综述", MaterialAppMainPage(), ""),
    new CatalogBean("第2章MaterialApp组件", MaterialAppMainPage(), "浅谈Provider进行状态管理 引用数据并实现数据的修改,MultiProvider 、ChangeNotifierProvider 的使用，路由routes配置，路由观察者，样式ThemData精讲，多主题适配，多语言环境配制，StatefulWidget 、Context 、State，Widget的分析"),
    new CatalogBean("第3章Scaffold组件", ScaffoldWidgetMainPage(),
        "常用作包裹其他Widget，类似html中的div，内容涉及BottomAppBar与悬浮按钮结合使用，与PageView、TabbarView结合使用实现标签页面，底部标签栏bottomSheet"),
    new CatalogBean(
        "第4章AppBar组件", MainAppBarPage(), "Row 在 AppBar中实现的标签栏切换效果"),
    new CatalogBean("第5章文本Text组件", TextMainPage(), "详细分析文本显示组件 Text，详细讲解 Text 的使用、宽高度适配、文本样式的配置、自定义字体、富文本 TextRich 以及 流式布局的文本标签等"),
    new CatalogBean("第6章输入框Textfield", TextFieldMainPage(),
        "细讲解文本输入框 TextField 组件，内容小腹TextField 的输入格式限制、边框样式InputDecoration、提示文本、文本控制器 TextEditingController 、焦点控制、光标样式配置、键盘配置以及一个搜索框的实现等"),

    new CatalogBean(
        "第7章容器Container", ContainerMainPage(), "综述容器Container组件的使用场景、宽高设定、内外边距设定、背景图片、背景阴影、圆角边框、演变样式、AnimatedContainer动画组件、自定义打洞效果与手撕优惠券的效果、ConstrainedBox等 "),

    new CatalogBean("第8章按钮Button", ButtonMainPage(), "MaterialButton的使用分析，FloatingActionButton，IconButton系列，8.4 自定义动画效果按钮AnimatedButton，8.5 自定义进度交互的动画按钮"),
    new CatalogBean("第9章UI布局", UilayoutWidgetMainPage(), "线性布局Column、Row、弹性布局Flex，流式布局Wrap，基于Wrap实现的tag标签使用， 流式布局Flow，层叠布局Stack"),
    new CatalogBean(
        "第10章图片Image组件", ImageMainPage(), "图片组件Image，内容涉及到 Image组件的基本使用、Image组件多种创建方式、加载网络图片、加载本地图片、图像混合模式BlendMode分析、圆角图片的加载、 CachedNetworkImage组件的使用分析、加载圆角图片、高斯模糊效果、将Widget保存为图片、图片添加水印、缩放图片、拖动图片等"),
    new CatalogBean(
        "第11章复选框CheckBox组件", CheckBoxMainPage(), " 复选框CheckBox组件 ，内容涉及 CheckBox基本创建使用以及常用属性配置、CheckboxListTile 组件使用分析、自定义美化复选框效果等"),
    new CatalogBean("第12章单选框Radio组件", RadioMainPage(), " 单选框 Radio 组件，内容涉及 Radio 组件的基本使用、自定义Radio单选框效果、RadioListTitle基本使用、优惠券选择弹框"),
    new CatalogBean(
        "第14章手势处理", GestureDetectorMainPage(), "手势处理系列的组件，内容涉及GestureDetector组件、Ink与InkWell组件的使用分析、InkResponse 组件使用分析等"),
    new CatalogBean("第13 章开关", SwitchWidgetMainPage(), "开关 Switch 组件， Switch的基本使用以及SwitchListTile组件的使用"),
    new CatalogBean("第15章 滑动视图ScrollView", ScrollViewMainPage(), "滑动视图 ScrollView系列组件，涉及 SingleChildScrollView 、NestedScrollView组件与SliverAppBar组件使用分析、CustomScrollView组件 、滑动折叠效果的AppBar案例、NotificationListener、轮子滚动ListWheelScrollView、自定义抽屉效果DragContainer组件等。"),
    new CatalogBean("第16章 列表ListView", ListViewMainPage(), "列表ListView组件，内容涉及 ListView组件的基本使用、控制器ScrollController的分析、ListView结合RefreshIndicator实现下拉刷新、SmartRefresher组件实现下拉刷新与上拉加载更多效果等"),
    new CatalogBean("第17章 GridView九宫格组件", GridViewMainPage(), "宫格组件 GridView，内容 GridView 组件的使用场景以及常用的构建方式等"),
    new CatalogBean("第18章 Clip裁剪组件系列", ClipViewMainPage(), "Clip裁剪组件系列组件，涉及到矩形裁剪ClipRect、圆角矩形裁剪ClipRRect、椭圆形裁剪ClipOval、路径裁剪ClipPath、以及自定义五角形评分组件等。"),
    new CatalogBean(
        "第19章矩阵变换t", OtherTransformWidgetMainPage(), "Matrix4矩阵，涉及Matrix4矩阵简述、Transform组件的综合使用、通过Matrix4实现的平移、旋转、缩放等"),
    new CatalogBean("第20章绘图", CanvasWidgetMainPage(), "绘图专题，涉及基本图形的绘制、Path构建各种自定义图形、贝塞尔曲线绘制绘制、绘制文本、绘制图片以及绘制动画的实现等。"),
    new CatalogBean("第21章动画", AnimationWidgetMainPage(), "动画专题，内容涉及Animated系列的动画组件、Tween系列的动画、自定义抖动动画组件ShakeAnimationWidget、自定义闪光过渡动画、 Hero切换过渡动画、Material motion 规范的预构建动画等"),
    new CatalogBean("第22章其他Widget", OtherWidgetMainPage(), "其他常用Widget，本章为其他常用组件的补充描述章节，内容涉及WidgetsBindingObserver、FittedBox、FutureBuilder、刷新圆圈组件等"),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      for (var i = 0; i < list.length; i++) {
        widgetList.add(buildCurrentWidget(i));
      }
      setState(() {});
    });
  }
  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///构建翻书效果的子Item
  buildCurrentWidget(int index) {
    CatalogBean bean = list[index];
    ///获取随机字体颜色
    Color textColor = getRandomColor();
    ///每一页的背景颜色
    Color backgroundColor = Colors.blueGrey;
    if(index%2==0){
      backgroundColor = Colors.white;
    }
    return Container(
      ///设置子Item的宽度
      width: MediaQuery.of(context).size.width - 44,
      ///设置子Item的高度
      height: 250,
      ///左右外边距
      margin: EdgeInsets.only(left: 20, right: 20),
      ///圆角边框样式
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Stack(
        children: [
          ///显示的内容主区域
          buildCataloguePositioned(bean, textColor),
          ///显示的右下角的页码
          buildPagePositioned(index),
        ],
      ),
    );
  }

  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///右下角的圆形页码
  Positioned buildPagePositioned(int index) {
    return Positioned(
      ///右下角对齐
      bottom: 8, right: 8,
      child: Container(
        ///容器大小
        width: 24, height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.indigoAccent[100],
            ///边框圆角
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Text("${index + 1}"),
      ),
    );
  }

  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///显示的内容主区域
  Positioned buildCataloguePositioned(CatalogBean bean, Color textColor) {
    return Positioned(
      left: 0, right: 0, top: 0, bottom: 0,
      child: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          ///包裹
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(bean.pageTitle,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
            Divider(),
            Expanded(
              child: Text(bean.pageMessage,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("目录"),
      ),
      body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              ///翻书效果
              buildReadBookPositioned(context),
              ///抽屉视图
              buildDragWidget(),
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  ///lib/app/page/catalogue/catalogue_main_page.dart
  ///每一页对应的Widget
  List<Widget> widgetList = [];
  ///翻书效果
  Positioned buildReadBookPositioned(BuildContext context) {
    return Positioned(
      top: 22,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: widgetList.length == 0
            ? Container()
            : ReadBookPage(
                ///翻书的时间长
                loopDuration: Duration(milliseconds: 5000),
                ///翻书的下一页的间隔时长
                intervalDuration: Duration(milliseconds: 1000),
                ///翻书的内容Widget
                list: widgetList,
                ///每当翻页时的回调
                onChangeCallBack: (value) {
                  LogUtil.e(" onChangeCallBack 回调 $value");
                },
                ///点击当前页的回调
                onClickCallBack: (int value) {
                  LogUtil.e("onClickCallBack 回调 $value");
                  ///获取对应的数据
                  CatalogBean catalogBean = list[value + 1];
                  ///打开对应的页面
                  NavigatorUtils.openPageByFade(context, catalogBean.page,
                      dismissCallBack: (value) {});
                },
              ),
      ),
    );
  }





  ///构建底部对齐的抽屉效果视图
  Widget buildDragWidget() {
    ///层叠布局中的底部对齐
    return Align(
      alignment: Alignment.bottomCenter,
      child: DragContainer(
        ///抽屉关闭时的高度 默认0.4
        initChildRate: 0.4,

        ///抽屉打开时的高度 默认0.4
        maxChildRate: 0.6,

        ///是否显示默认的标题
        isShowHeader: true,

        ///背景颜色
        backGroundColor: Colors.white,

        ///背景圆角大小
        cornerRadius: 12,

        ///自动上滑动或者是下滑的分界值
        maxOffsetDistance: 1.5,

        ///抽屉控制器
        controller: dragController,

        ///自动滑动的时间
        duration: Duration(milliseconds: 800),

        ///抽屉的子Widget
        dragWidget: CatalogueDragPage(list),

        ///抽屉标题点击事件回调
        dragCallBack: (isOpen) {},
      ),
    );
  }
}
