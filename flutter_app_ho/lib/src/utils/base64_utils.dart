import 'dart:convert' as convert;

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/22.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
class Base64Util {
  ///Base64加密
  static String base64Encode(String str) {
    ///
    var content = convert.utf8.encode(str);
    var digest = convert.base64Encode(content);
    return digest;
  }

  ///Base64解码
  static String base64Decode(String data) {
    ///获取解码后的字节数组
    List<int> bytes = convert.base64Decode(data);
    //获取解码的字条串
    String result = convert.utf8.decode(bytes);
    return result;
  }
}
