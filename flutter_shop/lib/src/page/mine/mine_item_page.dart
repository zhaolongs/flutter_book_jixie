import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_article.dart';
import 'package:flutter_shop/src/net/dio_utils.dart';
import 'package:flutter_shop/src/net/loading_statues.dart';
import 'package:flutter_shop/src/page/common/common_err_loading_widget.dart';
import 'package:flutter_shop/src/page/common/common_loading_dialog.dart';
import 'package:flutter_shop/src/page/common/common_nodata_widget.dart';
import 'package:flutter_shop/src/page/common/webview_page.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 
class MineItemPage extends StatefulWidget {
  //页面标识
  final int pageIndex;

  //构造函数
  MineItemPage(this.pageIndex, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState();
  }
}

class ScffoldHomeItemState extends State<MineItemPage>
    with AutomaticKeepAliveClientMixin {
  //页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
    loadingNetData();
  }

  List<ArticleBean> _list = [];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_list == null || _list.length == 0) {
      if (_loadingStatues == LoadingStatues.none ||
          _loadingStatues == LoadingStatues.loading) {
        return LoadingWidget();
      } else if (_loadingStatues == LoadingStatues.faile) {
        return ErrorReLoading(
          clickCallBack: () {
            _loadingStatues = LoadingStatues.loading;
            setState(() {});
            loadingNetData();
          },
        );
      } else {
        return NoDataWidget(
          clickCallBack: () {
            _loadingStatues = LoadingStatues.loading;
            setState(() {});
            loadingNetData();
          },
        );
      }
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        return buildListItemWidget(context, index);
      },
    );
  }

  //页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }

  Widget buildListItemWidget(BuildContext context, int index) {
    ArticleBean articleBean = _list[index];

    return InkWell(
      onTap: () {
        showWebViewPage(
            showController: false,
            context: context,
            pageUrl: articleBean.url,
            pageTitle: articleBean.title);
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 14, right: 14, left: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    articleBean.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                    child: Image.network(
                      articleBean.image,
                      height: 80,
                      width: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "${articleBean.readCount > 10000 ? '9999+' : articleBean.readCount}阅读",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff666666),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${articleBean.pariseCount}评论",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff666666),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "前天",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: Color(0xff666666),
                  ),
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  //当前加载的状态
  LoadingStatues _loadingStatues = LoadingStatues.none;

  void loadingNetData({int pageIndex = 1, int pageSize = 20}) async {
    _loadingStatues = LoadingStatues.loading;
    ResponseInfo responseInfo = await DioUtils.instance
        .getRequest(url: HttpHelper.ARTICLE_LIST_URL, queryParameters: {
      "flag": widget.pageIndex,
      "pageIndex": pageIndex,
      "pageSize": pageSize,
    });

    if (responseInfo.success) {
      List data = responseInfo.data;
      if (data.length == 0) {
        _loadingStatues = LoadingStatues.noData;
        setState(() {});
      } else {
        _loadingStatues = LoadingStatues.success;
        List<ArticleBean> itemList = [];
        data.forEach((element) {
          ArticleBean bean = ArticleBean.fromMap(element);
          itemList.add(bean);
        });

        if (pageIndex == 1) {
          _list = itemList;
        } else {
          _list.addAll(itemList);
        }
        setState(() {});
      }
    } else {
      setState(() {
        _loadingStatues = LoadingStatues.faile;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}