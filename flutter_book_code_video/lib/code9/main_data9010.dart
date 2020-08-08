import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/image_utils.dart';

class ImageCachePage extends StatefulWidget {
  @override
  _ImageFileUsePageState createState() => _ImageFileUsePageState();
}

//lib/code/main_data9010.dart
//保存网络图片与加载保存好的图片
class _ImageFileUsePageState extends State {
  
  ///网络图片地址
  String netImageUrl =
      "https://images.gitee.com/uploads/images/2020/0602/203000_9fa3ddaa_568055.png";
  ///本地存储目录的图片名称
  String localPathPicName ="test_image";
  ///用来加载本地的文件图片
  File localImageFile;

  ///加载本地图片
  void loadingLocalImage() async{
    ///使用工具类加载本地缓存目录下的图片
    localImageFile = await ImageUtils.imageUtils.getImageFileByPath(localPathPicName);

    if (localImageFile != null) {
      setState(() {

      });
    }
  }
  //lib/code/main_data9010.dart
  //将本地手机存储空间的图片加载为Uint8List格式
  ///localPathName为本地存储目录的图片名称
  void loadingLocalU8ListImage(String localPathName) async {
    ///使用工具类加载本地缓存目录下的图片
    Uint8List uint8list = await ImageUtils.imageUtils.getImageUint8ListByPath(localPathName);
  }
    //lib/code/main_data9010.dart
  void saveImage() {
    ///使用工具类将网络图片保存到手机本地缓存目录下
    ImageUtils.imageUtils.saveImageByUrl(netImageUrl,picName: localPathPicName,isEncode: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("加载缓存目录下的图片"),
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              RaisedButton(child: Text("保存图片"),onPressed: (){
                saveImage();
              },),
            
              RaisedButton(child: Text("加载图片"),onPressed: (){
                loadingLocalImage();
              },),
              SizedBox(height: 60,),
              ///构建显示本地缓存目录中的图片
              buildFileImage(),
            ],
          )),
    );
  }

  buildFileImage() {
    if(localImageFile==null){
      return Text("加载中");
    }
    return Image(image:FileImage(localImageFile),);
  }

}
