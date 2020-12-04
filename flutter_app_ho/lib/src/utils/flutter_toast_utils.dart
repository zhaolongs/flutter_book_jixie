import 'package:flutter/material.dart';
import 'package:flutter_app_ho/src/common/global.dart';


///Flutter 实现的Toast
class FlutterToastUtils {
  //显示
  static void show({
    @required BuildContext context,
    @required String message,
  }) {
    LoadingToast.getInstance.toast(context, msg: message);
  }
  static void hide(BuildContext context) {
    LoadingToast.getInstance.hide();
  }
}

class LoadingToast {
  // 私有构造函数
  LoadingToast._() {
    // 具体初始化代码
  }


  //获取单例对象
  static LoadingToast getInstance = LoadingToast._();
  //提示框显示的时间 毫秒
  int time = 1000;
  //程序计数器
  num showLoadingIndex = 0;
  // toast靠它加到屏幕上
  OverlayEntry _overlayEntry;

  // 提示内容
  String _msg;

  //隐藏提示框
  void hide() {
    debugPrint("隐藏");
    showLoadingIndex = 0;
    if (_overlayEntry != null) {
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }

  //显示提示框
  void toast(
    BuildContext context, {
    //显示的文本
    String msg,
    //显示的时间 单位毫秒
    int showTime = 1000,
  }) async {
    _msg = msg;
    showLoadingIndex = 1;
    //如果已经显示出来就刷新显示文本
    if (showLoadingIndex >= 1 && _overlayEntry != null) {
      showLoadingIndex = 2;
      _overlayEntry.markNeedsBuild();
      return;
    }
    //获取OverlayState
    OverlayState overlayState;
    try {
      overlayState = Overlay.of(context);
    } catch (e) {
      debugPrint('出现异常${e.toString()}');
    }
    if (overlayState != null && _overlayEntry == null) {
      //OverlayEntry负责构建布局
      //通过OverlayEntry将构建的布局插入到整个布局的最上层
      _overlayEntry = OverlayEntry(
        builder: (BuildContext context) {
          return positioned(context);
        },
      );
      //插入到整个布局的最上层
      try {
        overlayState.insert(_overlayEntry);
      } catch (e) {
        debugPrint('出现异常${e.toString()}');
      }
    }

    //重复显示
    while (showLoadingIndex >= 1) {
      debugPrint("显示等待 $showLoadingIndex");
      // 等待时间
      await Future.delayed(Duration(milliseconds: time));
      showLoadingIndex--;
    }
    //隐藏
    hide();
  }

  //提示框UI构建
  Positioned positioned(BuildContext context) {
    return Positioned(
      //top值，可以改变这个值来改变toast在屏幕中的位置
      top: MediaQuery.of(context).size.height * 3 / 4,
      child: Container(
        //居中
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        //卡片
        child: Card(
          //半透明背景
          color: Color.fromARGB(180, 0, 0, 0),
          child: Padding(
            //文字水平方向的内边距
            //文字垂直方向的内边距
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Text(
              _msg,
              style: TextStyle(
                //显示的文字大小
                fontSize: 14.0,
                //显示的文本颜色
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
