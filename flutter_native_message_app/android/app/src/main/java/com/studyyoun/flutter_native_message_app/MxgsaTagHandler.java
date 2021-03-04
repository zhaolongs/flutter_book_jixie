package com.studyyoun.flutter_native_message_app;

/*
 * 创建人： Created by  on 2020/9/16.
 * 创建时间：Created by  on 2020/9/16.
 * 页面说明：
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */


import org.xml.sax.XMLReader;

import android.content.Context;
import android.text.Editable;
import android.text.Html.TagHandler;
import android.text.Spanned;
import android.text.style.ClickableSpan;
import android.view.View;
import android.view.View.OnClickListener;

public class MxgsaTagHandler implements TagHandler{
	private int sIndex = 0;
	private  int eIndex=0;
	private final Context mContext;
	
	public MxgsaTagHandler(Context context){
		mContext=context;
	}
	
	public void handleTag(boolean opening, String tag, Editable output, XMLReader xmlReader) {
		// 解析标签
		//然后为固定的标签设置点击事件
		if (tag.toLowerCase().equals("mxgsa")) {
			if (opening) {
				sIndex=output.length();
			}else {
				eIndex=output.length();
				output.setSpan(new MxgsaSpan(), sIndex, eIndex, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
			}
		}
	}
	///标签的点击事件
	private class MxgsaSpan extends ClickableSpan implements OnClickListener{
		@Override
		public void onClick(View widget) {
			// TODO Auto-generated method stub
			//具体代码，可以是跳转页面，可以是弹出对话框，下面是跳转页面
//			mContext.startActivity(new Intent(mContext,MainActivity.class));
		}
	}
	
}