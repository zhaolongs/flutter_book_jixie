

//lib/utils/image_loader_utils.dart.dart
//通过ImageProvider读取Image
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


/// lib/utils/image_loader_utils.dart
/// 图片加载工具类
class ImageLoaderUtils {
  ///私有化构造
  ImageLoaderUtils._();
  ///单例模式创建
  static final ImageLoaderUtils imageLoader = ImageLoaderUtils._();

  ///通过资源路径加载 ui.Image包下的图片
  Future<ui.Image> loadUIImageByAsset(String asset) async {
    //通过rootBundle来加载资源目录asset下的图片
    ByteData data = await rootBundle.load(asset);
    //将 ByteData的数据类型转化为Uint8List类型
    Uint8List uint8list = data.buffer.asUint8List();
    //通过instantiateImageCodec 初始化一个图像编解码器Codec对象
    ui.Codec codec = await ui.instantiateImageCodec(uint8list);
    //通过图像编解码器Codec对象来获取第一帧图像信息
    ui.FrameInfo fi = await codec.getNextFrame();
    //获取最终的ui.Image
    return fi.image;
  }



  ///加载网络图片的图片
  Future<ui.Image> loadImageByNet(String imageUrl,
      {ImageConfiguration config = ImageConfiguration.empty}) {
    //通过NetworkImage来构建ImageProvider
    return loadImageByProvider(NetworkImage(imageUrl));
  }
  ///加载手机磁盘存储上的图片
  Future<ui.Image> loadImageByFile(String filePath,
      {ImageConfiguration config = ImageConfiguration.empty}) {
    //通过FileImage来构建ImageProvider
    return loadImageByProvider(FileImage(new File(filePath)));
  }
  ///加载Asset资源目录下的图片
  Future<ui.Image> loadImageByAsset(String assetPath,
      {ImageConfiguration config = ImageConfiguration.empty}) {
    //通过AssetImage来构建ImageProvider
    return loadImageByProvider(AssetImage(assetPath));
  }

  ///通过ImageProvider读取Image
  //参数[provider] 可以是 [AssetImage]、[FileImage]、[NetworkImage]
  Future<ui.Image> loadImageByProvider(
    ImageProvider provider, {
    ImageConfiguration config = ImageConfiguration.empty,
  }) async {
    //完成的回调
    Completer<ui.Image> completer = Completer<ui.Image>();
    //加载图片流监听
    ImageStreamListener listener;
    //获取图片流
    ImageStream stream = provider.resolve(config);
    //创建一个图片流监听
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //图片加载完获取这一帧图片
      final ui.Image image = frame.image;
      //触发回调方法
      completer.complete(image);
      //移除监听
      stream.removeListener(listener);
    });
    //为图片流添加监听
    stream.addListener(listener);
    //返回Future
    return completer.future;
  }


  //获取网络图片的缩略图
  // 主要通过PictureRecorder对Canvas进行录制，使用Canvas对图片进行重定尺寸。
  //对图片重定义宽高尺寸[dstWidth],[dstHeight]
  Future<ui.Image> _resize(ui.Image image, int dstWidth,int dstHeight) {
    //使用PictureRecorder对图片进行录制
    var recorder = ui.PictureRecorder();
    Paint paint = Paint();
    Canvas canvas = Canvas(recorder);
    double srcWidth = image.width.toDouble();
    double srcHeight = image.height.toDouble();
    canvas.drawImageRect(image, //使用drawImageRect对图片进行定尺寸填充
        Rect.fromLTWH(0, 0, srcWidth, srcHeight),
        Rect.fromLTWH(0, 0, dstWidth.toDouble() ,
            dstHeight.toDouble()), paint);
    return recorder.endRecording().toImage(dstWidth, dstHeight);//返回图片
  }
  //缩放加载[provider],缩放比例[scale]
  Future<ui.Image> scaleLoad(ImageProvider provider, double scale) async {
    var img = await loadImageByProvider(provider);
    return _resize(img, (img.width*scale).toInt(),(img.height*scale).toInt());
  }

  //缩放加载[provider],缩放比例[scale]
  Future<ui.Image> resizeLoad(ImageProvider provider, int dstWidth,int dstHeight) async {
    var img = await loadImageByProvider(provider);
    return _resize(img, dstWidth,dstHeight);
  }
  //保存一个Image
  Future<File> saveImage(ui.Image image,String path,{format=ui.ImageByteFormat.png}) async{
    var file= File(path);
    if(!await file.exists()){
      await file.create(recursive: true);
    }
    ByteData byteData = await image.toByteData(format:format);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    return file.writeAsBytes(pngBytes);
  }


  // 将一个Widget转为image.Image对象
  Future<ui.Image> getImageFromWidget(GlobalKey globalKey) async {
    // globalKey为需要图像化的widget的key
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    // 转换为图像
    ui.Image img = await boundary.toImage();
    return img;
  }

  // 将一个Widget转为image.Image对象
  Future<ui.Image> _getImageFromWidget2(GlobalKey globalKey) async {
    // globalKey为需要图像化的widget的key
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    // 转换为图像
    ui.Image img = await boundary.toImage();
    //
    ByteData byteData = await img.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    //通过instantiateImageCodec 初始化一个图像编解码器Codec对象
    ui.Codec codec = await ui.instantiateImageCodec(pngBytes);
    //通过图像编解码器Codec对象来获取第一帧图像信息
    ui.FrameInfo fi = await codec.getNextFrame();
    //获取最终的ui.Image
    return fi.image;
  }

}
