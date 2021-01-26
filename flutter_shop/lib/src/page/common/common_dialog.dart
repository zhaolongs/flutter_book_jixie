import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/utils/navigator_utils.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
/// lib/app/page/common/common_dialog.dart
///便捷显示通用弹框的方法
void showCommonAlertDialog({
  @required BuildContext context,
  String contentMessag = "！！！",//中间显示的文本内容
  Widget contentWidget,//中间显示内容的widget
  Function cancleCallBack,//左侧取消按钮的回调
  Function selectCallBack,//右侧选择确认按钮的回调
  bool isCancleColose = true,//点击左侧按钮后弹框是否消失
  bool isSelectColose = true,//点击右侧按钮后弹框是否消失
  Function(dynamic value) dismisCallBack,//弹框消失的回调
  String headerTitle,//标题
  String selectText,//右侧选择按钮的文本
  String cancleText,//左侧取消按钮的文本
  bool isBackgroundDimiss = false,
}) {
  //通过透明的方式来打开弹框
  NavigatorUtils.openPageByFade(
      context,
      CommonDialogPage(
        contentWidget: contentWidget,
        contentMessag: contentMessag,
        cancleCallBack: cancleCallBack,
        selectCallBack: selectCallBack,
        cancleText: cancleText,
        selectText: selectText,
        title: headerTitle,
        isCancleColose: isCancleColose,
        isSelectColose: isSelectColose,
        isBackgroundDimiss: isBackgroundDimiss,
      ),
      dismissCallBack: dismisCallBack,
      opaque: false);
}

/// lib/app/page/common/common_dialog.dart
///通用苹果风格显示弹框
class CommonDialogPage extends StatefulWidget {
  //显示的标题
  final String title;
  //显示的内容
  final String contentMessag;
  //取消按钮显示的文字
  final String cancleText;
  //确定按钮显示的文字
  final String selectText;
  //取消按钮的回调
  final Function cancleCallBack;
  //选择按钮的点击事件回调
  final Function selectCallBack;
  //点击背景是否消失
  //是否拦截Android设备的后退物理按钮的事件
  // true 是消失  是不拦截后退按钮
  final bool isBackgroundDimiss;
  final bool isCancleColose;
  final bool isSelectColose;
  //弹框中间显示内容
  final Widget contentWidget;

  CommonDialogPage(
      {Key key,
      this.contentMessag = "",
      this.contentWidget,
      this.title,
      this.cancleCallBack,
      this.selectCallBack,
      this.isBackgroundDimiss = false,
      this.selectText,
      this.isCancleColose = true,
      this.isSelectColose = true,
      this.cancleText})
      : super(key: key);

  @override
  _CommonDialogPageState createState() => _CommonDialogPageState();
}

/// lib/app/page/common/common_dialog.dart
class _CommonDialogPageState extends State<CommonDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 54 透明度的黑色 0~255 0完全透明 255 不透明
      backgroundColor: Colors.black54,
      body: new Material(
        type: MaterialType.transparency,
        //监听Android设备上的返回键盘物理按钮
        child: WillPopScope(
          onWillPop: () async {
            //这里返回true表示不拦截
            //返回false拦截事件的向上传递
            return Future.value(widget.isBackgroundDimiss);
          },
          //填充布局的容器
          child: GestureDetector(
            //点击背景消失
            onTap: () {
              if (widget.isBackgroundDimiss) {
                Navigator.of(context).pop();
              }
            },
            //内容区域
            child: buildBodyContainer(context),
          ),
        ),
      ),
    );
  }

  /// lib/app/page/common/common_dialog.dart
  Container buildBodyContainer(BuildContext context) {
    //充满屏幕的透明容器
    return Container(
      width: double.infinity,
      height: double.infinity,
      //线性布局的隔离
      child: Column(
        //子Widget水平方向居中
        crossAxisAlignment: CrossAxisAlignment.center,
        //子Widget垂直方向居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //限制弹框的大小
          ConstrainedBox(
            constraints: BoxConstraints(
                //最大高度
                maxHeight: 320,
                //最小高度
                minHeight: 150,
                //最大宽度
                maxWidth: 280,
                //最小宽度
                minWidth: 280),
            child: buildContainer(context),
          )
        ],
      ),
    );
  }

  ///lib/app/page/common/common_dialog.dart
  ///构建白色区域的弹框
  Container buildContainer(BuildContext context) {
    return Container(
      //圆角边框设置
      decoration: BoxDecoration(
        //弹框背景
        color: Colors.white,
        //四个角的圆角
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      //弹框标题、内容、按钮 线性排列
      child: Column(
        //包裹子Widget
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12,),
          //显示标题
          Text(
            widget.title??"温馨提示",
            style: TextStyle(fontSize: 18,color: Colors.blue),
          ),
          SizedBox(height: 12,),
          //显示内容
          buildCenterContentArae(),
          SizedBox(height: 12,),
          //底部按钮
          buildBottomButtonArea(),
          SizedBox(height: 2,),
        ],
      ),
    );
  }

  // lib/app/page/common/common_dialog.dart
  //构建中间显示部分
  buildCenterContentArae() {
    //显示外部的 Widget
    if (widget.contentWidget != null) {
      return widget.contentWidget;
    } else {
      //默认显示文本
      return Padding(
        //文本内边距
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Center(
          //限定内容的最小高度
          child:  ConstrainedBox(
            constraints: BoxConstraints(
                //最小高度为50像素
                minHeight: 50.0),
            child: Container(
              //居中
              alignment: Alignment.center,
              child: Text(
                "${widget.contentMessag}",
                //文本居中
                textAlign: TextAlign.center,
                //文本颜色
                style:Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
      );
    }
  }
  // lib/app/page/common/common_dialog.dart
  //底部按钮
  buildBottomButtonArea() {
    //线性布局用来组合分割线与按钮
    if (widget.cancleText == null && widget.selectText == null) {
      //没有设置按钮时直接构建一个占位
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: 0,
          color: Colors.grey,
          thickness: 1,
        ),
        Row(
          children: [
            //左边按钮
            buildLeftExpanded(),
            //中间分割线
            buildCenterDivi(),
            //右侧按钮
            buildRightExpanded()
          ],
        ),
      ],
    );
  }
  // lib/app/page/common/common_dialog.dart
  //构建左侧的按钮
  Widget buildLeftExpanded() {
    if (widget.cancleText == null) {
      //没有设置按钮时直接构建一个占位
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
    return Expanded(
      child: InkWell(
        onTap: () {
          if (widget.isCancleColose) {
            Navigator.of(context).pop();
          }
          if (widget.cancleCallBack != null) {
            widget.cancleCallBack();
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            widget.cancleText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  //按钮中间的分隔线
  Widget buildCenterDivi() {
    if (widget.selectText == null || widget.selectText == null) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    } else {
      return Container(
        height: 40,
        width: 1.0,
        color:  Colors.grey,
      );
    }
  }

  //构建右侧的按钮
  Widget buildRightExpanded() {
    if (widget.selectText == null) {
      //没有设置按钮时直接构建一个占位
      return SizedBox(
        width: 0,
        height: 0,
      );
    }
    return Expanded(
      child: InkWell(
        onTap: () {
          if (widget.isSelectColose) {
            Navigator.of(context).pop();
          }
          if (widget.selectCallBack != null) {
            widget.selectCallBack();
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            widget.selectText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
