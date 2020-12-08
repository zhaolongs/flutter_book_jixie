
/*
 * 创建人： Created by  on 2020/12/3.
 * 创建时间：Created by  on 2020/12/3.
 * 页面说明：
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class AppSettingBean {
	 int appThemFlag;
	 String servicePhone;
	 String welcomePicUrl;
	///常用用于解析JSON数据
  AppSettingBean.fromMap(Map<String,dynamic> map){
		this.welcomePicUrl = map["welcomePicUrl"];
		this.servicePhone = map["servicePhone"];
		this.appThemFlag = map["appThemFlag"];
	}
}
