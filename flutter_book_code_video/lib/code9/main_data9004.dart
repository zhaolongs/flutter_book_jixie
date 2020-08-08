import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class ImageUse2Page extends StatefulWidget {
  @override
  _ImageAssetsBaseUsePageState createState() => _ImageAssetsBaseUsePageState();
}

//lib/code/main_data9004.dart
//
class _ImageAssetsBaseUsePageState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载图片"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              buildErrormage(),
            ],
          )),
    );
  }
//lib/code/main_data9004.dart
//配置透明渐变过渡
  Image buildOpacityImage(){
    return  Image.asset(
      "assets/images/banner_mang.png",
      ///设置透明过渡的方式来加载图片
      ///参数 frame 参数指定当前图像帧的索引,
      ///   在第一个图像帧准备好之前，值为null，对于单帧图像，
      ///   值是一直为0的，对于多帧图像(例如动态gif)，值会增加
      ///参数wasSynchronouslyLoaded指定是否指定可被同步加载使用
      ///   如果第一个图像帧立即可用，那么这个参数对于所有图像帧都是true。
      frameBuilder: (BuildContext context, Widget child, int frame,
          bool wasSynchronouslyLoaded) {
        ///用来实现透明动画
        return AnimatedOpacity(
          child: child,
          opacity: frame == null ? 0 : 1,
          ///过渡时间控制
          duration: const Duration(milliseconds: 300),
          ///透明度变化速率曲线
          curve: Curves.easeOut,
        );
      },
    );
  }

  //lib/code/main_data9004.dart
  //配置加载出错图片
  Image buildErrormage() {
    return Image.asset(
      "assets/images/banner_mangss.png",
      ///加载失败的回调
      ///参数二 object 是返回的加载异常信息的一个FlutterError
      ///参数三 所有堆栈跟踪对象实现的接口，通过它可以查看到是在哪一步加载图片时出错了
      errorBuilder: (context, object,StackTrace stacktrace) {
        print("${object.toString()}");
        ///一般图片加载失败会使用默认的占位图
        return Image.asset("assets/images/default_pic.gif");
      },
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }
}
