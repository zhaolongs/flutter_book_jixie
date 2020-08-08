import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data104.dart
///  Container 内外边距配置说明
class ContainerWarpPaddingPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///7 /lib/code6/main_data104.dart
/// Container 内外边距配置说明
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "示例",
        ),
      ),
      ///一般在内容详情描述中，内容比较多，所以从适配角度来讲，
      ///页面是可以上下滑动的，使用SingleChildScrollView来实现滑动视图
      ///类似Android中的ScrollView与iOS中的UIScrollView
      body: SingleChildScrollView(
        ///一般内容详情中的主体内容是线性排列的
        ///这里使用Column实现竖直方向的Widget线性排列
        child: Column(
          children: [
            //使用Container来装饰
            Container(
              //外边距
              margin: EdgeInsets.all(14),
              //内边距
              padding:  EdgeInsets.all(24),
              //圆角边框
              decoration: BoxDecoration(color: Color(0xFFE0E0E0),borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "商品名称",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ///使用流式布局自适应随内容变化而变化的高度
                  ///与Android中说的线性布局中的weight权重布局一致
                  ///与iOS中说的根据文本动态设置UILabel的高度一致
                  Expanded(
                    child: Text(
                      "多数的错失，是因为不坚持，不努力，不挽留，然后催眠自己说一切都是命运。分手不是一种罪过，而是一种经历，就像一场蓄谋已久的远行，唯一不同的是，有的是你主动选择，有的则是被动接受;时过境迁，你留给过去的不过是一抹淡淡的微笑和浅浅的回忆",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
