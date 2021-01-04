import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/2.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

/// lib/image_utils.dart
/// 图片操作工具类
class ImageUtils {
  //单例模式创建
  static final ImageUtils imageUtils = ImageUtils._();

  ///用来将普通图片路径下的
  Dio _dio;

  //私有化构造
  ImageUtils._() {
    ///创建DIO
    _dio = new Dio();
  }

  /// lib/image_utils.dart
  ///将指定的文件保存到目录空间中。
  ///[picNetUrl] 网络地址，这里用的是图片
  ///[picName] 保存到本地的文件（图片）文件名，如test_image
  ///[endFormat]保存到本地的文件（图片）文件格式，如png，
  ///[isReplace]当本地存在同名的文件（图片）时，true就是替换
  ///[isEncode]对保存的文件（图片）进行编码
  ///  最终保存到本地的文件 （图片）的名称为 picName.endFormat
  void saveImageByUrl(String picNetUrl,
      {String picName,
      String endFormat = "png",
      bool isReplace = true,
      bool isEncode = true}) async {
    //安全校验
    if (picNetUrl == null || picNetUrl.trim().length == 0) {
      return;
    }

    ///获取本地磁盘路径
    /*
     * 在Android平台中获取的是/data/user/0/com.studyyoun.flutter_shop/src_flutter
     * 此方法在在iOS平台获取的是Documents路径
     */
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    ///拼接目录
    if (picName == null || picName.trim().length == 0) {
      ///当用户没有指定picName时，取当前的时间命名
      picName = "${DateTime.now().millisecond.toString()}.$endFormat";
    } else {
      picName = "$picName.$endFormat";
    }

    if (isEncode) {
      ///对保存的图片名字加密
      picName = md5.convert(utf8.encode(picName)).toString();
    }

    appDocPath = "$appDocPath/$picName";

    ///校验图片是否存在
    var file = File(appDocPath);
    bool exist = await file.exists();
    if (exist) {
      if (isReplace) {
        ///如果图片存在就进行删除替换
        ///如果新的图片加载失败，那么旧的图片也被删除了
        await file.delete();
      } else {
        ///如果图片存在就不进行下载
        return;
      }
    }

    ///参数一 图片的网络路径
    Response response = await _dio.get(picNetUrl,
        options: Options(responseType: ResponseType.bytes));

    ///读取图片信息
    final Uint8List bytes = Uint8List.fromList(response.data);

    ///将Uint8List的数据格式保存
    await File(appDocPath).writeAsBytes(bytes);
  }

  /// lib/image_utils.dart
  ///将指定的文件保存到目录空间中。
  ///[image] 这里是使用的ui包下的Image
  ///[picName] 保存到本地的文件（图片）文件名，如test_image
  ///[endFormat]保存到本地的文件（图片）文件格式，如png，
  ///[isReplace]当本地存在同名的文件（图片）时，true就是替换
  ///[isEncode]对保存的文件（图片）进行编码
  ///  最终保存到本地的文件 （图片）的名称为 picName.endFormat
  Future<String> saveImageByUIImage(ui.Image image,
      {String picName,
      String endFormat = "png",
      bool isReplace = true,
      bool isEncode = true}) async {
    ///获取本地磁盘路径
    /*
     * 在Android平台中获取的是/data/user/0/com.studyyoun.flutter_shop/src_flutter
     * 此方法在在iOS平台获取的是Documents路径
     */
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    ///拼接目录
    if (picName == null || picName.trim().length == 0) {
      ///当用户没有指定picName时，取当前的时间命名
      picName = "${DateTime.now().millisecond.toString()}.$endFormat";
    } else {
      picName = "$picName.$endFormat";
    }

    if (isEncode) {
      ///对保存的图片名字加密
      picName = md5.convert(utf8.encode(picName)).toString();
    }

    appDocPath = "$appDocPath/$picName";

    ///校验图片是否存在
    var file = File(appDocPath);
    bool exist = await file.exists();
    if (exist) {
      if (isReplace) {
        ///如果图片存在就进行删除替换
        ///如果新的图片加载失败，那么旧的图片也被删除了
        await file.delete();
      } else {
        ///如果图片存在就不进行下载
        return null;
      }
    }
    ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print("保存的图片路径 $appDocPath");

    ///将Uint8List的数据格式保存
    await File(appDocPath).writeAsBytes(pngBytes);

    return appDocPath;
  }

  ///从本地获取Uint8List格式的文件（图片）
  ///[isEncode]对保存的文件（图片）进行编码
  ///[picName] 文件（图片）名称
  ///[endFormat]文件（图片）对应的格式
  Future<Uint8List> getImageUint8ListByPath(String picName,
      {String endFormat = "png", bool isEncode = true}) async {
    ///先获取文件
    var file = await getImageFileByPath(picName,
        endFormat: endFormat, isEncode: isEncode);
    if (file == null) {
      return null;
    } else {
      bool exist = await file.exists();
      if (!exist) {
        return null;
      } else {
        return await file.readAsBytes();
      }
    }
  }

  ///从本地存储目录中加载文件（图片）
  ///[isEncode]对保存的文件（图片）进行编码
  ///[picName] 文件（图片）名称
  ///[endFormat]文件（图片）对应的格式
  /// return File
  Future<File> getImageFileByPath(String picName,
      {String endFormat = "png", bool isEncode = true}) async {
    //安全校验
    if (picName == null || picName.trim().length == 0) {
      return null;
    }

    ///获取本地磁盘路径
    /*
     * 在Android平台中获取的是/data/user/0/com.studyyoun.flutter_shop/src_flutter
     * 此方法在在iOS平台获取的是Documents路径
     */
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    ///拼接目录
    if (picName == null || picName.trim().length == 0) {
      ///当用户没有指定picName时，取当前的时间命名
      picName = "${DateTime.now().millisecond.toString()}.$endFormat";
    } else {
      picName = "$picName.$endFormat";
    }
    if (isEncode) {
      ///对保存的图片名字加密
      picName = md5.convert(utf8.encode(picName)).toString();
    }
    appDocPath = "$appDocPath/$picName";

    ///校验图片是否存在
    var file = File(appDocPath);
    bool exist = await file.exists();
    if (!exist) {
      return null;
    } else {
      return file;
    }
  }
}
