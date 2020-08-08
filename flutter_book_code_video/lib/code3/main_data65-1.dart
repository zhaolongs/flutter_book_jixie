
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';



///4.1.5  /lib/code3/main_data65-1.dart
/// MediaQuery解析
class MediaQueryFirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<MediaQueryFirstPage>{



  @override
  Widget build(BuildContext context) {

    //创建MediaQuery实例
    MediaQueryData mediaQueryData = MediaQuery.of(context);


    ///获取屏幕的宽width与高heigh
    Size size = mediaQueryData.size;
    double width =size.width;
    double height = size.height;
    ///devicePixelRatio 单位逻辑像素的物理像素数量，即设备像素比。
    ///实际物理像素宽 = size.width*devicePixelRatio
    ///实际物理像素高 = size.height*devicePixelRatio
    double devicePixelRatio = mediaQueryData.devicePixelRatio;

    ///textScaleFactor 单位逻辑像素字体像素数，如果值小于1，则表示在实际显示中字体被设备缩小，如果值大于1，则表示实际显示中字体被设置放大，如1.5表示字体在原来的基础上被放大50%
    double textScaleFactor = mediaQueryData.textScaleFactor;
    ///platformBrightness 当前设备的亮度模式，比如在Android Pie手机上进入省电模式，所有的App将会使用深色（dark）模式绘制。
    ///4.1.5  /lib/code3/main_data65-1.dart
    /// MediaQuery解析
    /// viewInsets 被系统遮挡的部分，通常指键盘，
    /// 弹出键盘，viewInsets.bottom表示键盘的高度
    EdgeInsets viewInsets = mediaQueryData.viewInsets;
    double viewInsetsLeft = viewInsets.left;
    double viewInsetsTop = viewInsets.top;
    double viewInsetsBottom = viewInsets.bottom;
    double viewInsetsRight = viewInsets.right;
    print("viewInsetsLeft $viewInsetsLeft viewInsetsTop $viewInsetsTop viewInsetsBottom $viewInsetsBottom  viewInsetsRight $viewInsetsRight");

    /// padding 被系统遮挡的部分，通常指“刘海屏”或者系统状态栏的边框内容。
    EdgeInsets padding = mediaQueryData.padding;

    double paddingLeft = padding.left;
    double paddingTop = padding.top;
    double paddingBottom = padding.bottom;
    double paddingRight = padding.right;
    print("paddingLeft $paddingLeft paddingTop $paddingTop paddingBottom $paddingBottom  paddingRight $paddingRight");

    /// viewPadding 被系统遮挡的部分,综合padding和viewInsets。
    EdgeInsets viewPadding = mediaQueryData.viewPadding;

    double viewPaddingLeft = viewPadding.left;
    double viewPaddingTop = viewPadding.top;
    double viewPaddingBottom = viewPadding.bottom;
    double viewPaddingRight = viewPadding.right;
    print("viewPaddingLeft $viewPaddingLeft viewPaddingTop $viewPaddingTop viewPaddingBottom $viewPaddingBottom  viewPaddingRight $viewPaddingRight");

    /// systemGestureInsets 显示屏边缘上系统“消耗”的区域输入事件，并阻止将这些事件传递给应用。比如在Android Q手势滑动用于页面导航（ios也一样），比如左滑退出当前页面。
    /// physicalDepth 设备的最大深度，类似于三维空间的Z轴。
    /// alwaysUse24HourFormat 是否是24小时制。
    /// accessibleNavigation 用户是否使用诸如TalkBack或VoiceOver之类的辅助功能与应用程序进行交互，用于帮助视力有障碍的人进行使用。
    /// invertColors 是否支持颜色反转。
    /// highContrast 用户是否要求前景与背景之间的对比度高， i
    /// OS上，方法是通过“设置”->“辅助功能”->“增加对比度”。 此标志仅在运行iOS 13的iOS设备上更新或以上。
    /// disableAnimations 平台是否要求尽可能禁用或减少动画。
    /// boldText 平台是否要求使用粗体。
    /// orientation 是横屏还是竖屏。
    return buildBodyFunction();
  }

 ///4.1.5  /lib/code3/main_data65-1.dart

  Widget buildBodyFunction() {
      return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "示例",
              ),
            ),
            body: Container(
              margin: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //输入文本框
                  Text("请输入文本内容"),
                  buildTextFieldFunction1(),
                ],
              ),
            )),
      );
    }

    ///6 /lib/code3/main_data96.dart
    /// 文字对齐方式
    buildTextFieldFunction1() {
      return SizedBox(height: 80,child:
      new TextField(
        textAlignVertical: TextAlignVertical(y: 0.5),
        decoration: InputDecoration(
          fillColor: Colors.grey,
//          filled: true,
          focusColor: Colors.deepPurple,
        ),
      ),);
    }


}