
import 'dart:convert' as convert;
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/22.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class Base64Util {
  ///Base64加密
  static String base64Encode(String str){
    ///
    var content = convert.utf8.encode(str);
    var digest = convert.base64Encode(content);
    return digest;
  }

  ///Base64解码
  static String base64Decode(String data){
    ///获取解码后的字节数组
    List<int> bytes = convert.base64Decode(data);
    //获取解码的字条串
    String result = convert.utf8.decode(bytes);
    return result;
  }
}