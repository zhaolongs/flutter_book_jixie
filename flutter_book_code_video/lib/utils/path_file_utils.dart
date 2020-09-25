
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/6/2.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class PathFileUtils {
  //私有化构造
  PathFileUtils._();
  //单例模式创建
  static final PathFileUtils imageLoader = PathFileUtils._();


  ///获取保存文件目录空间
  static Future<String> getSaveFilePath() async{
  /*
   * 在Android平台中获取的是/data/user/0/com.studyyoun.flutterbookcode/app_flutter
   * 此方法在在iOS平台获取的是Documents路径
   */
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("appDocPath:$appDocPath");
    return appDocPath;

  }

  ///
  static Future<Uint8List> loadFileByPath(String path) async{
    var list = await File(path).readAsBytes();
    return list;
  }
  ///然后将指定的文件保存到目录空间中。
  static void savePicByPath({String picName}) async{
    ///创建DIO
    Dio dio = new Dio();

    String apkUrl ="https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path =appDocDir.path;
    ///参数一 文件的网络储存URL
    ///参数二 下载的本地目录文件
    ///参数三 下载监听
    Response response = await dio.get(apkUrl,options: Options(responseType: ResponseType.bytes));
    final Uint8List bytes = Uint8List.fromList(response.data);
//    ImageUtils.imageLoader.saveToImage(bytes, "test.png");
  }
}