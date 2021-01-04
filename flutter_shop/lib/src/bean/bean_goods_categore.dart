

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


class GoodsCategoryBean{
  int id;
  String title;

  GoodsCategoryBean(this.title, this.id,);

  GoodsCategoryBean.fromJson(Map<String, dynamic> map) {
   this.title = map["title"];
   this.id = map["id"];
  }

}
