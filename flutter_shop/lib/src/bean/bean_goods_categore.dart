

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423

///代码清单 13-28
///商品分类数据模型
///lib/src/bean/bean_goods_categore.dart
class GoodsCategoryBean{
  int id;
  String title;

  GoodsCategoryBean(this.title, this.id,);

  GoodsCategoryBean.fromJson(Map<String, dynamic> map) {
   this.title = map["title"];
   this.id = map["id"];
  }
}
