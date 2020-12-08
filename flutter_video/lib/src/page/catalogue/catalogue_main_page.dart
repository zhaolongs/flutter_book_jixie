import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/net/dio_utils.dart';

import 'list_item_video_widget.dart';

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

///lib/page/catalogue/catalogue_main_page.dart
///目录主页面
class CatalogueMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogueMainPageState();
  }
}

class _CatalogueMainPageState extends State<CatalogueMainPage>
    with AutomaticKeepAliveClientMixin {
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;

  //推荐模拟数据
  List<VideoModel> videoList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0XffCDDEEC),
      body: RefreshIndicator(
        onRefresh: () {
          pageIndex = 1;
          return loadingData();
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            VideoModel videoModel = videoList[index];
            return ListItemVideoWidget(videoModel);
          },
          itemCount: videoList.length,
        ),
      ),
    );
  }

  int pageIndex = 1;

  Future<bool> loadingData() async {
    ResponseInfo responseInfo = await DioUtils.instance
        .getRequest(url: HttpHelper.Video_LIST_URL, queryParameters: {
      "pageIndex": pageIndex,
      "pageSize": 30,
    });

    if (responseInfo.success) {
      List data = responseInfo.data;
      if (data.length == 0) {
        setState(() {});
      } else {
        List<VideoModel> itemList = [];
        data.forEach((element) {
          VideoModel bean = VideoModel.fromMap(element);
          itemList.add(bean);
        });

        if (pageIndex == 1) {
          videoList = itemList;
        } else {
          videoList.addAll(itemList);
        }
        setState(() {});
      }
    } else {
      setState(() {});
    }

    return true;
  }
}
