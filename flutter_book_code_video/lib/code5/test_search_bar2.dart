import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tag_layout/flutter_tag_layout.dart';
import 'package:flutterbookcode/demo/search_static_bar.dart';
import 'package:flutterbookcode/demo/search_textfield_bar.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';
/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/25.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code5/test_search_bar2.dart
class TestSearchBarPage2 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestSearchBarPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索框"),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              ///这里只是用于显示的搜索框不用做输入
              ///参数[heroTag]用于页面过渡动画tag
              ///参数clickCallBack为当前搜索框点击事件回调
              child: SearchStaticBar(
                heroTag: "searchStatidBar",
                clickCallBack: () {
                  ///以透明过渡的方式打开新的页面
                  NavigatorUtils.openPageByFade(context, TestPage2());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



//lib/code5/test_search_bar2.dart

///最近搜索
List<String> searchKeyWords = ["你好", "测试", "一本好书","早餐","夜很静来看下","我的大前端生涯"];

///页面2
class TestPage2 extends StatefulWidget {
  @override
  _TestPageState2 createState() => _TestPageState2();
}

class _TestPageState2 extends State<TestPage2>
    with SingleTickerProviderStateMixin {
  ///动画控制器
  AnimationController animationController;

  ///页面标识 0 为显示最近搜索
  ///        1 为搜索中
  ///        2 为搜索完成有数据
  ///        3 为搜索完成无数据
  int pageIndex = 0;
  ///搜索结果
  List<String> dataList = [];
  ///搜索关键词
  String searchKeyWord;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    animationController.addListener(() {
      setState(() {});
    });
    Future.delayed(Duration(milliseconds: 200), () {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        ///线性布局
        child: Column(
          ///左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///搜索框
            buildToolBarSearchBar(),
            ///加载中
            ///加载无数据
            ///加载数据列表显示
            buildIndexWidget(),
          ],
        ),
      ),
    );
  }

  ///搜索框背景装饰
  buildToolBarSearchBar() {
    return Container(
      ///蓝色背景用来构建类似于AppBar样式
      color: Colors.blue,
      ///左对齐
      alignment: Alignment.centerLeft,
      ///可以理解为是AppBar的高度
      padding: EdgeInsets.only(top: kMinInteractiveDimension),
      ///构建搜索框
      child: buildAppBarSearchWidget(),
    );
  }

  ///构建搜索框过渡动画Hero
  buildAppBarSearchWidget() {
    ///页面过渡的Hero动画
    return Hero(
      tag: "searchStatidBar",
      child: buildAppBarSearchRow(),
    );
  }
  //lib/code5/test_search_bar2.dart
  ///构建搜索框 线性布局
  Row buildAppBarSearchRow() {
    return Row(children: [
      Container(
        child: Material(
          color: Colors.transparent,
          child: Container(
            ///可输入的搜索框
            child: SearchTextFieldBar(
                ///动态改变宽度
                width: MediaQuery.of(context).size.width -
                    160 +
                    100 * animationController.value,
                ///搜索框上显示的文本
                hint: "请输入内容搜索",
                clearCallback: () {
                  dataList.clear();
                  pageIndex = 0;
                  setState(() {});
                },
                ///点击键盘上的搜索按钮的回调事件
                onSubmitted: (text) {
                  onSearchSubmit(text);
                },

                ///显示搜索框左侧的返回键按钮
                isShowBackButton: true),
          ),
        ),
      ),
    ]);
  }

  ///处理搜索逻辑
  void onSearchSubmit(String text) {
    if (text.length > 0) {
      ///保存搜索关键词
      searchKeyWord = text;
      searchKeyWords.add(text);

      ///更新页面标识为加载中
      pageIndex = 1;

      ///刷新页面
      setState(() {});

      ///模拟搜索成功有数据
      Future.delayed(Duration(milliseconds: 3000), () {
        for (int i = 0; i < 4; i++) {
          dataList.add("$i这里是搜索结果$searchKeyWord");
        }
        for (int i = 0; i < 10; i++) {
          dataList.add("$i这里是$searchKeyWord搜索结果");
        }

        ///更新页面显示为搜索结果页面
        pageIndex = 2;
        setState(() {});
      });
    }
  }
  ///构建页面主体显示内容
  buildIndexWidget() {
    if (pageIndex == 0) {
      ///显示搜索历史
      ///流式布局文本标签
      return buildSearchKeyLayout2();
    } else if (pageIndex == 1) {
      ///显示加载中
      return buildLoadingWidget();
    } else if (pageIndex == 2) {
      ///显示搜索结果列表数据
      return buildListWidget();
    } else if (pageIndex == 3) {
      ///显示无数据页面
      return buildNodataWidget();
    }
  }

  ///构建加载中的Widget
  buildLoadingWidget() {
    ///设置个内边距
    return Padding(
      padding: EdgeInsets.only(top: 12),
      ///线性布局
      child: Row(
        ///居中显示
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///小圆圈
          SizedBox(
            width: 22, height: 22,
            child: CircularProgressIndicator(),
          ),
          ///间隔占位
          SizedBox(
            width: 10,
          ),
          ///文本
          Text("搜索中...")
        ],
      ),
    );
  }

  ///构建搜索结果列表Widget
  buildListWidget() {
    ///填充页面主体
    return Expanded(
      ///构建列表
      child: ListView.builder(
          ///条目个数
          itemCount: dataList.length,
          ///构建每个条目的Widget
          itemBuilder: (BuildContext context, int index) {
            String currentText = dataList[index];
            ///构建富文本显示内容
            ///文本中有与搜索关键词一至的内容
            ///高亮显示
            return buildKeyWordRichText(currentText, searchKeyWord);
          }),
    );
  }

  ///包含关键词的内容高亮显示
  ///[title] 内容体
  ///[keyWord] 关键词
  buildKeyWordRichText(String title, String keyWord) {
    List<TextSpan> spans = [];
    spans.addAll(_keyWordSpan(title, keyWord));
    return RichText(text: TextSpan(children: spans));
  }

  _keyWordSpan(String word, String keyWord) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    ///按关键词分隔
    List<String> strings = word.split(keyWord);
    for (int i = 0; i < strings.length; i++) {
      ///关键词部分
      if ((i + 1) % 2 == 0) {
        spans
            .add(TextSpan(text: keyWord, style: TextStyle(color: Colors.blue)));
      }
      ///普通部分
      String value = strings[i];
      if (value != null && value.length > 0) {
        spans.add(TextSpan(text: value, style: TextStyle(color: Colors.grey)));
      }
    }
    return spans;
  }

  ///构建数据数据显示Widget
  buildNodataWidget() {
    return Row(
      ///居中
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.not_interested),
        SizedBox(
          width: 10,
        ),
        Text("无结果")
      ],
    );
  }

  ///构建显示最近搜索结果的
  ///流式布局文本标签
  buildSearchKeyLayout2() {
    List<Widget> itemWidgetList = [];
    ///根据搜索关键词记录构建文本标签
    for (int i = 0; i < searchKeyWords.length; i++) {
      String itmeStr = searchKeyWords[i];
      print("tag $itmeStr");

      itemWidgetList.add(
        InkWell(
          onTap: () {
            textTagClick(itmeStr);
          },
          child: TextTagWidget(itmeStr),
        ),
      );
    }
    ///流式布局
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: itemWidgetList,
    );
  }

  ///构建文本标签的点击事件
  ///根据文本标签的内容来重新发起请求
  void textTagClick(String tagValue) {
    ///记录搜索关键词
    ///当点击流式布局的标签时触发搜索事件
    searchKeyWord = tagValue;
    ///更新页面标识为加载中
    pageIndex = 1;
    ///刷新页面
    setState(() {});
    ///模拟搜索成功有数据
    Future.delayed(Duration(milliseconds: 3000), () {
      dataList.clear();
      for (int i = 0; i < 4; i++) {
        dataList.add("$i这里是搜索结果$searchKeyWord");
      }
      for (int i = 0; i < 10; i++) {
        dataList.add("$i这里是$searchKeyWord搜索结果");
      }
      ///更新页面显示为搜索结果页面
      pageIndex = 2;
      setState(() {});
    });
  }

  ///
}
