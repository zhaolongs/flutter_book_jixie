import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageLoadingFilePage extends StatefulWidget {
  @override
  _ImageFileUsePageState createState() => _ImageFileUsePageState();
}

//lib/code/main_data9009.dart
//通过ImageFile来加载图片
class _ImageFileUsePageState extends State {
  @override
  void initState() {
    super.initState();
    ///异步加载本地缓存目录下的图片
    loadingCocumentPicFunction();
  }
  ///保存图片数据的File
  File _file;
  Uint8List _fileUintlist;
  ///加载本地磁盘上的图片
  void loadingCocumentPicFunction() async {
    /*
   * 在Android平台中获取的是/data/user/0/com.studyyoun.flutterbookcode/app_flutter
   * 此方法在在iOS平台获取的是Documents路径
   */
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    ///本地磁盘上的图片
    String pathAndPicName = "$appDocPath/banner_mang.png";
    ///通过path来创建File来加载图片
    _file = new File(pathAndPicName);
    if(_file!=null){
      ///获取文件图片对应的 Uint8List 数据
      _fileUintlist= await _file.readAsBytes();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    getImagePath();
    return Scaffold(
      appBar: AppBar(
        title: Text("加载缓存目录下的图片"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: buildImageWidgetFunction(),
    );
  }


  ///构建页面显示UI
  Widget buildImageWidgetFunction() {
    if (_file == null) {
      ///过渡
      return Container(child:Text("加载中..."),);
    } else {
      ///显示图片
      return Image(
        ///通过FileImage来加载SDH图片
        image: FileImage(_file),
      );
    }
  }

  //lib/code/main_data9009.dart
  ///网络图片地址
  String netImageUrl = "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";

  ///通过FadeInImage来加载网络图片
  Widget buildFadeInImageByMemory() {
    ///从asset中取获取占位图
    return FadeInImage.memoryNetwork(
      ///本地资源路径下的一个占位图
      placeholder: _fileUintlist ,
      //网络图片地址
      image: netImageUrl,
      fadeOutDuration: Duration(milliseconds: 200),
      fadeInCurve: Curves.easeIn,
    );
  }


  /*
   * 获取图片的路径
   */
  getImagePath() async {
    /* 在Android平台中获取的是/data/user/0/com.studyyoun.flutterbookcode/cache路径
     * 此方法在在iOS平台获取的是Library/Caches路径
     */
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    print("tempPath:$tempPath");

    /*
     * 在Android平台中获取的是/data/user/0/com.studyyoun.flutterbookcode/app_flutter
     * 此方法在在iOS平台获取的是Documents路径
     */
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("appDocPath:$appDocPath");

    /*
     * 仅在Android平台上可使用，用来获取外部存储空间
     *     获取的路径是/storage/emulated/0/Android/data/com.studyyoun.flutterbookcode/files
     * 在iOS平台是不可使用的，因为沙盒机制的限制
     * 如果在iOS平台使用了这个方法，那么它将会抛出一个UnsupportedError异常信息
     */
    if (Platform.isAndroid) {
      String storageDir = (await getExternalStorageDirectory()).path;
      print("storageDir:$storageDir");
    }
  }
}
