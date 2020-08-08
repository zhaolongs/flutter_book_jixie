
///lib/app/bean/bean_video.dart
///视频数据模型
class VideoModel {
  ///视频名称
  String videoName ='';
  ///视频链接
  String videoUrl ='';
  ///视频截图
  String videoImag ='';
  ///是否关注
  bool isAttention =false;
  ///关注的个数
  num attentCount =0;
  ///是否喜欢
  bool isLike = false;
  ///点赞的个数
  num pariseCount = 0;
  ///分享的次数
  num shareCount=0;

  ///空构造函数
  VideoModel();

  ///常用用于解析JSON数据
  VideoModel.fromMap(Map<String,dynamic> map){
    this.videoName = map["videoName"];
    this.videoUrl = map["videoUrl"];
    this.videoImag = map["videoImag"];
    this.isAttention = map["isAttention"];

    this.attentCount = map["attentCount"];
    this.isLike = map["isLike"];
    this.pariseCount = map["pariseCount"];
    this.shareCount = map["shareCount"];
  }
}
