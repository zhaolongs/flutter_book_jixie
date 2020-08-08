import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data107.dart
///  Container在ListView中的使用
class ContainerListViewPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///7 /lib/code6/main_data107.dart
/// Container在ListView中的使用
class _PageState extends State {
  ///用于ListView的模拟列表数据
  List<String> _list = [
    "过于沉静的外表,恰恰诠释着他内心的沉重",
    "这世上原来就没有什么神话。所谓的神话，不过是常人的思维所不易理解的平常事",
    "这就是圆融世故，不显山不露水，各得其所。可品行这个东西今天缺个角，明天裂个缝，也就离坍陷不远了",
    "认识这个人就是开了一扇窗户，就能看到不一样的东西，听到不一样的声音，能让你思考、觉悟，这已经够了。其它还有很多，比如机会、帮助，我不确定。这个在一般人看来可能不重要，但我知道这个人很重要",
    "投石击水，不起浪花，也泛涟漪",
    "从心理学角度分析，越是头脑简单的人越需要点缀和填充，而头脑复杂的人，则对简洁有着特殊的心理需求"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "示例",
        ),
      ),
      body: ListView.builder(
        ///通过builder方法来构建每个子条目的布局Widget
        ///参数一 context 上下文对象
        ///参数二 index 当前条目的角标索引
        itemBuilder: (BuildContext context, int index) {
          ///获取对应条目的数据
          String itemModel = _list[index];
          ///构建单独条目的item布局
          return buildItemWidget(context, itemModel);
        },
        ///ListView条目的个数
        itemCount: _list.length,
      ),
    );
  }

  Widget buildItemWidget(BuildContext context, String itemModel) {
    ///外层Container用来设置ListView的item与item的间距
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 0, left: 12, right: 12),
      color: Colors.grey,
      ///内层用来装饰每个item的样式
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        ///线性布局使Widget在水平方向线性排开
        child: Row(
          //子Widget在次方向开始位置对齐
          ///在这里就是靠顶部对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage("assets/images/2.0x/my_question_icon.png"),
              height: 60,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
            ),
            ///流式布局根据内容的多少来动态渲染高度
            Expanded(
              ///线性布局使Widget在竖直方向线性排开
              child: Column(
                ///子Widget在次方向开始位置对齐
                ///在这里就是水平靠左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "这里一般是标题",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    itemModel,
                    style: TextStyle(fontSize: 16.0),
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
