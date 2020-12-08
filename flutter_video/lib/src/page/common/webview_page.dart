import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fai_webview/flutter_fai_webview.dart';
import 'package:flutter_video/src/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///

///lib/app/page/common/webview_page.dart
///便捷打开Html页面的方法
showWebViewPage(
    {@required BuildContext context,
    //加载H5对应的链接
    @required String pageUrl,
    //标题
    String pageTitle = "详情",
    bool showController = false,
    //页面关闭回调
    Function(dynamic value) dismissCallback}) {
  //打开用WebView页面
  NavigatorUtils.openPageByFade(
    context,
    WebViewPage(
      pageTitle: pageTitle,
      pageUrl: pageUrl,
      showController: showController,
    ),
    dismissCallBack: dismissCallback,
  );
}

///lib/app/page/common/webview_page.dart
///通用根据 Url来加载 H5页面功能的WebView
class WebViewPage extends StatefulWidget {
  //标题
  final String pageTitle;

  //页面URL
  final String pageUrl;
  final bool showController;

  WebViewPage({this.pageTitle, this.pageUrl, this.showController = true});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

///lib/app/page/common/webview_page.dart
class _WebViewPageState extends State<WebViewPage> {
  //[FaiWebViewWidget]控制器
  FaiWebViewController _faiWebViewController = new FaiWebViewController();

  //浏览器是否可向前
  bool isForward = false;

  //浏览器是否可向后
  bool isBack = false;

  //控制栏的透明度
  double opacity = 1.0;

  //控制栏的透明度是否执行完毕
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.pageTitle}"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //第一层加载Html页面
            buildWebViewWidget(),
            //第二层操作栏
            buildControllerPositioned(context)
          ],
        ),
      ),
    );
  }

  //第一层加载Html页面
  Widget buildWebViewWidget() {
    return Positioned.fill(
      child: FaiWebViewWidget(
        webViewHeight: MediaQuery.of(context).size.height,
        //webview控制器
        controller: _faiWebViewController,
        //webview 加载网页链接
        url: widget.pageUrl,
        //webview 加载信息回调
        callback: callBack,
        //输出日志
        isLog: true,
      ),
    );
  }

  //lib/app/page/common/webview_page.dart
  //第二层操作栏
  buildControllerPositioned(BuildContext context) {
    if(!widget.showController){
      return Container();
    }
    return Positioned(
      bottom: 24,
      //操作栏的透明度动画过渡
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: opacity,
        onEnd: () {
          isOpacity = false;
        },
        child: Container(
          alignment: Alignment.center,
          //操作栏的灰色圆角背景
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          //操作栏区域的大小
          height: 40,
          width: 120,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //左侧的后退按钮
              buildIconLeftBackButton(context),
              SizedBox(
                width: 10,
              ),
              //右侧的向前按钮
              buildIconRightButton()
            ],
          ),
        ),
      ),
    );
  }

  //lib/app/page/common/webview_page.dart
  //左侧的后退按钮
  buildIconRightButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: isForward ? Colors.blue : Colors.white,
      ),
      onPressed: () async {
        //判断一下是否有向前的浏览记录
        bool forword = await _faiWebViewController.canForword();
        if (forword) {
          //如果有就执行向前的操作
          _faiWebViewController.forword();
        }
      },
    );
  }

  //右侧的向前按钮
  buildIconLeftBackButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: isBack ? Colors.blue : Colors.white,
      ),
      onPressed: () async {
        //判断一下是否有可后退的浏览记录
        bool back = await _faiWebViewController.canBack();
        if (back) {
          //有就向后退浏览器
          _faiWebViewController.back();
        } else {
          //无就退出当前页面
          Navigator.pop(context);
        }
      },
    );
  }

  //lib/app/page/common/webview_page.dart
  //加载 Html 的回调
  //[code]消息类型标识
  //[msg] 消息内容
  //[content] 回传的参数
  void callBack(int code, String msg, content) async {
    if (code == 201) {
      //WebView中Html页面加载完毕的回调
      //页面加载完成后 测量的 WebView 高度
      double webViewHeight = content;
      print("webViewHeight " + webViewHeight.toString());
      isBack = await _faiWebViewController.canBack();
      isForward = await _faiWebViewController.canForword();
      setState(() {});
    } else if (code == 302) {
      //向下滑动的回调
      if (!isOpacity && opacity != 0.2) {
        isOpacity = !isOpacity;
        setState(() {
          opacity = 0.2;
        });
      }
    } else if (code == 303) {
      //向上滑动的回调
      if (!isOpacity && opacity != 0.8) {
        isOpacity = !isOpacity;
        setState(() {
          opacity = 0.8;
        });
      } else if (code == 404) {
        //页面加载出错
      }
    }
  }
}
