import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1529.dart
/// 滚轮ListWheelScrollView 属性分析
class ListWheelScrollViewPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  ///创建滚轮所需要的控制器
  FixedExtentScrollController fixedExtentScrollController =
  new FixedExtentScrollController();

  ///圆筒直径
  double diameterRatio = 2.0;
  ///圆柱投影透视图
  double perspective = 0.003;
  ///车轮水平偏离中心的程度
  double offAxisFraction =0.0;
  ///放大倍率
  double magnification = 1.0;
  ///子Item密集程度
  double squeeze =1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: Text("详情"),
      ),

      ///构建列表显示数据
      ///滚轮效果的
      body: Column(
        children: [
          ///构建显示文字
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              buildShowText(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          ///构建滚轮
          Expanded(
            child: buildWheelScrollView(),
          ),
          SizedBox(height: 22,),
          ///构建滑块
          buildSlider(
              title: "圆筒直径",
              ratio: diameterRatio,
              min: 0.1,
              max: 3,
              calback: (value) => diameterRatio = value),
          buildSlider(
              title: "圆柱投影",
              ratio: perspective,
              min: 0.0001,
              max: 0.01,
              calback: (value) => perspective = value),
          buildSlider(
              title: "水平偏离中心",
              ratio: offAxisFraction,
              min: -10,
              max: 10,
              calback: (value) => offAxisFraction = value),
          buildSlider(
              title: "放大倍率",
              ratio: magnification,
              min: 0.1,
              max: 2,
              calback: (value) => magnification = value),
          buildSlider(
              title: "密集程度",
              ratio: squeeze,
              min: 0.1,
              max: 3,
              calback: (value) => squeeze = value),
        ],
      ),
    );
  }
  ///lib/code15/main_data1529.dart
  ///构建滑块封装方法
  ///[title] 左侧显示的标题
  ///[ratio] 文字中指示的标识
  ///[min]滑块[Slider]的最小值
  ///[max]滑块[Slider]的最大值
  ///[calback】滑块滑动的回调
  Row buildSlider({String title,double ratio,double min,double max,calback}){
    ///线性布局左右排开
    return Row(children: [
      Text("$title  ${ratio.toStringAsFixed(4)} "),
      Slider(
        min: min,
        max: max,
        value: ratio, onChanged: (double value) {
        setState(() {
          calback(value);
        });
      },),
    ],);
  }

  ///lib/code15/main_data1529.dart
  ///组合页面说明
  String buildShowText() {
    return
      "绘制滚轮区域 圆筒直径 ${diameterRatio.toStringAsFixed(2)} \n "
        "圆柱投影 ${perspective.toStringAsFixed(4)} \n "
        "水平偏离中心 ${offAxisFraction.toStringAsFixed(2)} \n "
        "放大倍率 ${magnification.toStringAsFixed(2)} \n "
        "密集程度 ${squeeze.toStringAsFixed(2)}";
  }



  ///lib/code15/main_data1529.dart
  ///通过Delegate方式来创建
  Widget buildWheelScrollView(){
    return Container(
      ///宽度
      width: MediaQuery.of(context).size.width,
      ///外边距
      margin: EdgeInsets.all(10),
      ///ListWheelScrollView的边界
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white)
      ),
      child: ListWheelScrollView.useDelegate(
        ///控制器
        controller: fixedExtentScrollController,
        ///圆筒直径和主轴渲染窗口的尺寸的比，默认值是2,
        ///如果是垂直方向，主轴渲染窗口的尺寸是ListWheelScrollView的高。
        ///diameterRatio越小表示圆筒越圆。
        diameterRatio: diameterRatio,
        ///表示圆柱投影透视图，
        ///圆柱的距离，为0时表示从无限远处看，1表示从无限近处看，值的范围(0,0.01]，
        ///注意是左开右闭区间，默认值是0.003，值越大，渲染效果越圆
        perspective: perspective,
        ///属性表示车轮水平偏离中心的程度
        offAxisFraction: offAxisFraction,
        ///通过useMagnifier和magnification属性实现放大镜效果，
        useMagnifier: false,
        ///useMagnifier是否启用放大镜，magnification属性是放大倍率
        magnification: magnification,
        ///squeeze属性表示车轮上的子控件数量与在同等大小的平面列表上的子控件数量之比，
        squeeze: squeeze,
        ///值为true时裁剪超出显示视图的子Item部分
        clipToSize:false,
        ///配置为true时绘制窗口外的视图
        renderChildrenOutsideViewport: true,
        ///每个条目的宽度
        itemExtent: 55,
        ///滑动到中间的子Item的回调
        onSelectedItemChanged: (value){
          print("onSelectedItemChanged $value");
        },
        ///子条目的构建代理
        childDelegate: ListWheelChildBuilderDelegate(
          ///子条目的个数
            childCount: 10000,
            ///子条目的构建函数
            builder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                padding: EdgeInsets.all(8),
                color: Colors.primaries[index % 10],
                alignment: Alignment.center,
                child: Text('$index'),
              );
            },
            ),
      ),
    );
  }

}