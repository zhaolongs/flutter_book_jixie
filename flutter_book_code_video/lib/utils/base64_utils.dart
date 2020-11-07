
import 'dart:convert' as convert;
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/22.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
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