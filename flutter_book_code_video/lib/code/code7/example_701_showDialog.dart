import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
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
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example701(),
  ));
}

/// 代码清单

class Example701 extends StatefulWidget {
  @override
  _Example701State createState() => _Example701State();
}

class _Example701State extends State<Example701> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              child: Text("showDialog 功能"),
              onPressed: () {
                showDialogFunction();
              },
            ),
            ElevatedButton(
              child: Text("showSimpleDialog 功能"),
              onPressed: () {
                showSimpleDialogFunction();
              },
            ),
            ElevatedButton(
              child: Text("CupertinoDialog 功能"),
              onPressed: () {
                showCupertinoDialogFunction(context);
              },
            ),
            ElevatedButton(
              child: Text("GeneralDialog 功能"),
              onPressed: () {
                showGeneralDialogFunction(context);
              },
            ),
            ElevatedButton(
              child: Text("GeneralDialog 缩放 功能"),
              onPressed: () {
                showGeneralDialogFunction2(context);
              },
            ),
            ElevatedButton(
              child: Text("GeneralDialog 矩阵 功能"),
              onPressed: () {
                showGeneralDialogFunction3(context);
              },
            ),
            ElevatedButton(
              child: Text("AboutDialog "),
              onPressed: () {
                showAboutDialogFunction(context);
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  child: Text("BottomSheet "),
                  onPressed: () {
                    showBottomSheetFunction(context);
                  },
                );
              },
            ),
            ElevatedButton(
              child: Text("ModalBottomSheet "),
              onPressed: () {
                showModalBottomSheetFunction(context);
              },
            ),
            ElevatedButton(
              child: Text("CupertinoModal "),
              onPressed: () {
                showCupertinoModalFunction(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  ///代码清单 7-1 Dialog 的基本使用 showDialog
  ///lib/code/code7/example_701_showDialog.dart
  /// 运行效果如图7-1所示
  void showDialogFunction() async {
    bool isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("温馨提示"),
          //title 的内边距，默认 left: 24.0,top: 24.0, right 24.0
          //默认底部边距 如果 content 不为null 则底部内边距为0
          //            如果 content 为 null 则底部内边距为20
          titlePadding: EdgeInsets.all(10),
          //标题文本样式
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
          //中间显示的内容
          content: Text("您确定要删除吗?"),
          //中间显示的内容边距
          //默认 EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0)
          contentPadding: EdgeInsets.all(10),
          //中间显示内容的文本样式
          contentTextStyle: TextStyle(color: Colors.black54, fontSize: 14),
          //底部按钮区域
          actions: <Widget>[
            TextButton(
              child: Text("再考虑一下"),
              onPressed: () {
                ////关闭 返回 false
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text("考虑好了"),
              onPressed: () {
                //关闭 返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    print("弹框关闭 $isSelect");
  }

  ///代码清单 7-2 SimpleDialog 的基本使用 showDialog
  ///lib/code/code7/example_701_showDialog.dart
  /// 运行效果如图7-2所示
  void showSimpleDialogFunction() async {
    bool isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("温馨提示"),
          //title 的内边距
          titlePadding: EdgeInsets.all(10),
          //标题文本样式
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
          children: [
            TextButton(
              child: Text("选择一"),
              onPressed: () {
                ////关闭 返回 false
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text("选择一"),
              onPressed: () {
                ////关闭 返回 false
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    print("弹框关闭 $isSelect");
  }

  ///代码清单 7-3 showCupertinoDialog 的基本使用 showCupertinoDialog
  ///lib/code/code7/example_701_showDialog.dart
  /// 运行效果如图7-3所示
  void showCupertinoDialogFunction(BuildContext context) async {
    bool isSelect = await showCupertinoDialog(
      //点击背景弹框是否消失
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('温馨提示'),
          //中间显示的内容
          content: Text("您确定要删除吗?"),
          //底部按钮区域
          actions: [
            CupertinoDialogAction(
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ///代码清单 7-4 showGeneralDialog 的基本使用
  ///lib/code/code7/example_701_showDialog.dart
  void showGeneralDialogFunction(BuildContext context) async {
    showGeneralDialog(
      context: context,
      //阴影背景颜色
      barrierColor: Colors.black.withOpacity(0.5),
      //点击阴影消失
      barrierDismissible: true,
      //语义标签
      barrierLabel: "",
      //显示与关闭动画时长
      transitionDuration: const Duration(milliseconds: 1000),
      //弹框显示UI构建
      pageBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondaryAnimation,
      ) {
        return Center(
          child: Material(
            child: Container(
              child: Text("弹框内容区域"),
            ),
          ),
        );
      },
      //自定义弹框动画
      transitionBuilder: (ctx, animation, _, child) {
        //根据Offset平移组件，如设置Offset的dx为0.50，
        // 那么在水平方向上平移组件1/2的宽度
        return FractionalTranslation(
          //从左向右滑出 Offset(animation.value - 1, 0)
          //从右向左滑出 Offset(1 - animation.value, 0)
          //从顶部滑出 Offset(0, animation.value - 1)
          //从底部滑出 Offset(0, 1 - animation.value)
          translation: Offset(animation.value - 1, 0),
          child: child,
        );
      },
    );
  }

  ///代码清单 7-5 showGeneralDialog 缩放动画
  ///lib/code/code7/example_701_showDialog.dart
  void showGeneralDialogFunction2(BuildContext context) async {
    showGeneralDialog(
      context: context,
      //阴影背景颜色
      barrierColor: Colors.black.withOpacity(0.5),
      //点击阴影消失
      barrierDismissible: true,
      //语义标签
      barrierLabel: "",
      //显示与关闭动画时长
      transitionDuration: const Duration(milliseconds: 1000),
      //弹框显示UI构建
      pageBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondaryAnimation,
      ) {
        return Center(
          child: Material(
            child: Container(
              child: Text("弹框内容区域"),
            ),
          ),
        );
      },
      //自定义弹框动画
      transitionBuilder: (ctx, animation, _, child) {
        //缩放动画
        return ScaleTransition(
          //从视图底部中间弹出
          alignment: Alignment.bottomCenter,
          scale: animation,
          child: child,
        );
      },
    );
  }

  ///代码清单 7-6 showGeneralDialog 旋转缩放动画
  ///lib/code/code7/example_701_showDialog.dart
  void showGeneralDialogFunction3(BuildContext context) async {
    showGeneralDialog(
      context: context,
      //阴影背景颜色
      barrierColor: Colors.black.withOpacity(0.5),
      //点击阴影消失
      barrierDismissible: true,
      //语义标签
      barrierLabel: "",
      //显示与关闭动画时长
      transitionDuration: const Duration(milliseconds: 1000),
      //弹框显示UI构建
      pageBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondaryAnimation,
      ) {
        return Center(
          child: Material(
            child: Container(
              child: Text("弹框内容区域"),
            ),
          ),
        );
      },
      //自定义弹框动画
      transitionBuilder: (ctx, animation, _, child) {
        //旋转角度计算
        double radians = 2 * pi * animation.value;
        //旋转矩阵
        Matrix4 matrix = Matrix4.rotationY(radians);
        return Transform(
          //变换中心设置
          alignment: Alignment.bottomCenter,
          //再结合一个缩放动画
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
          transform: matrix,
        );
      },
    );
  }

  ///代码清单 7-7 showAboutDialogFunction
  ///lib/code/code7/example_701_showDialog.dart
  void showAboutDialogFunction(BuildContext context) async {
    showAboutDialog(
      context: context,
      applicationIcon: Icon(Icons.handyman),
      applicationName: "测试Demo",
      applicationVersion: "V 1.0.0",
      //著作权（copyright）的提示。
      applicationLegalese: '早起的年轻人',
      useRootNavigator: false,
      children: [
        Text('关于我们'),
        Text(
          '优美的应用体验 来自于细节的处理，更源自于码农的自我要求与努力，当然也需要码农年轻灵活的思维，不局限于思维，不局限语言限制，才是编程的最高境界。',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  ///代码清单 7-8 showBottomSheet
  ///lib/code/code7/example_701_showDialog.dart
  void showBottomSheetFunction(BuildContext context) async {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return buildContainer(context);
      },
    );
  }

  ///代码清单 7-9 showBottomSheet 自定义底部弹框
  ///lib/code/code7/example_701_showDialog.dart
  Container buildContainer(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 240,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 44,
            child: Text(
              "温馨提示",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text("这里是内容区域"),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          Container(
            height: 64,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("再考虑一下"),
                    onPressed: () {
                      ////关闭 返回 false
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.grey[200],
                ),
                Expanded(
                  child: FlatButton(
                    child: Text("考虑好了"),
                    onPressed: () {
                      //关闭 返回true
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///代码清单 7-10 showModalBottomSheet
  ///lib/code/code7/example_701_showDialog.dart
  void showModalBottomSheetFunction(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      //背景颜色
      backgroundColor: Colors.grey,
      //阴影颜色
      barrierColor: Color(0x30000000),
      //点击背景消失
      isDismissible: true,
      //下滑消失
      enableDrag: true,
      builder: (BuildContext context) {
        //代码清单 7-9 中定义的视图布局
        return buildContainer(context);
      },
    );
  }

  ///代码清单 7-11 showCupertinoModalPopup
  ///lib/code/code7/example_701_showDialog.dart
  void showCupertinoModalFunction(BuildContext context) async {
    showCupertinoModalPopup<int>(
      context: context,
      builder: (cxt) {
        CupertinoActionSheet dialog = CupertinoActionSheet(
          title: Text("温馨提示"),
          message: Text('请选择分享的平台'),
          //取消按钮
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {},
            child: Text("取消"),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 1);
                },
                child: Text('QQ')),
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 2);
                },
                child: Text('微信')),
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 3);
                },
                child: Text('系统分享')),
          ],
        );
        return dialog;
      },
    );
  }
}
