
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/

///通用加载进度
void showLoadingWidget(
    {@required BuildContext context, bool isBackShadow = false}) {
  //透明方式显示
  NavigatorUtils.openPageByFade(
    context,
    LoadingWidget(
      isShowShadow: true,
      isBackShadow: isBackShadow,
      isInner: false,
    ),
    opaque: false,
  );
}

class LoadingWidget extends StatefulWidget {
  //true 为显示阴影 flase 时不显示
  final bool isShowShadow;

  // true 显示背景阴影 false 时不显示
  final bool isBackShadow;

  // true 为内嵌模式
  final bool isInner;
  final Color textColor;

  LoadingWidget({this.isShowShadow = false,
    this.isBackShadow = false,this.isInner=true,this.textColor=Colors.black});

  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

///lib/app/page/common/common_loading_dialog.dart
class _LoadingState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;
  //要显示的文本
  String _loadingMessage = "加载中...";

  @override
  void initState() {
    super.initState();
    //创建动画控制器
    _animationController = new AnimationController(
      //执行时间40秒
      duration: Duration(milliseconds: 40000),
      //绑定Ticker
      vsync: this,
    );

    //添加动画执行监听
    _animationController.addListener(() {
      int value = (_animationController.value * 100).toInt();
      if (value % 4 == 0) {
        _loadingMessage = "加载中";
      } else if (value % 4 == 1) {
        _loadingMessage = "加载中 .";
      } else if (value % 4 == 2) {
        _loadingMessage = "加载中 ..";
      } else if (value % 4 == 3) {
        _loadingMessage = "加载中 ...";
      }
      setState(() {});
    });
    //重复执行
    _animationController.repeat();
  }

  @override
  void dispose() {
    //销毁
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!widget.isInner) {
          Navigator.of(context).pop();
        }
      },
      child: Material(
        color: widget.isBackShadow ? Colors.black54 : Colors.transparent,
        child: WillPopScope(
          onWillPop: () async {
            if(!widget.isInner) {
              Navigator.of(context).pop();
              return Future.value(false);
            }else{
              return Future.value(true);
            }
          },
          child: buildContainer(),
        ),
      ),
    );
  }

  ///加载的主体
  Container buildContainer() {
    return Container(
      //层叠布局
      child: Stack(
        alignment: Alignment.center,
        children: [
          //圆角背景
          Container(
            //大小
            width: widget.isShowShadow ? 140 : 120,
            //内边距
            padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
            //圆角阴影配置
            decoration: buildDecoration(),
            child: Row(
              // 包裹子Widget
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: widget.isShowShadow ? 22 : 14,
                  height: widget.isShowShadow ? 22 : 14,
                  //苹果风格的一个小进度圆圈
                  child: CupertinoActivityIndicator(),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '$_loadingMessage',
                  style: TextStyle(fontSize: widget.isShowShadow ? 18 : 14,color: widget.textColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildDecoration() {
    if (!widget.isShowShadow) {
      return null;
    }
    return BoxDecoration(
      //背景
      color: Colors.white,
      //背景的四个角的圆角
      borderRadius: BorderRadius.all(
        Radius.circular(2),
      ),
      //阴影
      boxShadow: [
        //向左右下角的黑色阴影
        BoxShadow(
          //阴影颜色
          color: Colors.black,
          //偏移量
          offset: Offset(2, 2),
          //模糊度
          blurRadius: 2.0,
        ),
      ],
    );
  }
}
