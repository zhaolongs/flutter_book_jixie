package com.studyyoun.flutter_native_message_app;

import android.content.Context;

import java.util.Map;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugin.platform.PlatformViewRegistry;

/*
 * 创建人： Created by  on 2020/9/16.
 * 创建时间：Created by  on 2020/9/16.
 * 页面说明：
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

/**
 * Flutter 调用 android 原生view
 * Flutter 中嵌入 Native View 的交互方式；Android 端采用 AndroidView iOS 端采用 UiKitView
 * <p>
 * 简单来说就是原生控件的内容被绘制到内存里，然后 Flutter Engine 通过相对应的 textureId 就可以获取到控件的渲染数据并显示出来。
 * <p>
 * 通过从 VirtualDisplay 输出中获取纹理，并将其和 Flutter 原有的 UI 渲染树混合，
 * 使得 Flutter 可以在自己的 Flutter Widget tree 中以图形方式插入 Android 原生控件
 * <p>
 * AndroidView 是无法获取到文本输入，因为 VirtualDisplay 所在的位置会始终被认为是 unfocused 的状态。
 * <p>
 * PlatformView 主要适用于flutter中不太容易实现的widget（Native中已经很成熟，并且很有优势的View），如官方的WebView
 * <p>
 * 假如我们要发送拍照的图片和录像的视频数据到flutter那边，是否可以走这个方式呢，
 * 理论上是没啥问题的，但是，如果我们采用消息通道将录像时摄像头采集的每一帧图片都要从原生传递到Flutter中，
 * 这样做代价将会非常大，因为<u>将图像或视频数据通过消息通道实时传输必然会引起内存和CPU的巨大消耗</u>！
 * 为此，Flutter提供了一种基于Texture的图片数据共享机制
 * <p>
 * PlatformView其实也是使用外接纹理的方式实现的
 * <p>
 * PlatformViewFactory的主要任务是，在create()方法中创建一个View并把它传给Flutter
 * <p>
 * 程序启动之后，会有两个MainActivity的实例，一个包含FlutterView，一个包含PlatformView#getView()返回的那个TextView
 * 包含FlutterView的Activity是真正在屏幕显示的，这个称为主屏。
 * 另外一个是通过VirtualDisplay，代表一个虚拟显示器，可以称为副屏。
 * Native侧会把这个副屏的内容渲染到Surface上，这些数据对应一个textureId，Native侧会把这个textureId传递给Flutter，Flutter通过这个ID可以直接在GPU中找到相应的绘图数据并使用显示在主屏上
 * 原生层 Flutter 通过 Presentation 副屏显示的原理，利用 VirtualDisplay 的方式，让 Android 控件在内存中绘制到 Surface 层。 VirtualDisplay 绘制在 Surface 的 textureId ，
 * 之后会通知到 Dart 层，在 Dart 层利用 AndroidView 定义好的 Widget 并带上 textureId ，那么 Engine 在渲染时，就会在内存中将 textureId 对应的数据渲染到 AndroidView 上。
 * <p>
 * 而AndroidView则使用的是其中的TextureLayer
 * <p>
 * TextureLayer在被遍历到时，会调用一个engine层的方法SceneBuilder::addTexture() 将textureId作为参数传入。最终在绘制的时候，skia会直接在GPU中根据textureId找到相应的绘制数据，并将其绘制到屏幕上
 * <p>
 * AndroidView的绘图数据是Native层所提供的，那么当Native中渲染的View的实际像素大小大于AndroidView的大小时，会发生什么呢？通常情况下，这种情况的处理思路无非就两种选择，一种是裁切，另一种是缩放。Flutter保持了其一贯的做法，所有out of the bounds的Widget统一使用裁切的方式进行展示，上面所描述的情况就被当作是一种out of the bounds。
 * 当这个View的实际像素大小小于AndroidView的时候，会发现View并不会相应地变小（Container的背景色并没有显露出来），没有内容的地方会被白色填充。这其中的原因是SingleViewPresentation::onCreate中，会使用一个FrameLayout作为rootView。
 */

//代码清单9-22
//app/src/main/java/com/studyyoun/flutter_native_message_app/TestViewFactory.java
public class TestViewFactory extends PlatformViewFactory {
	
	
	public TestViewFactory() {
		super(StandardMessageCodec.INSTANCE);
	}
	
	/**
	 * @param args args是由Flutter传过来的自定义参数
	 */
	@SuppressWarnings("unchecked")
	@Override
	public PlatformView create(Context context, int id, Object args) {
		//flutter 传递过来的参数
		Map<String, Object> params = (Map<String, Object>) args;
		//创建 自定义的TestTextView
		return new TestTextView(context, id, params);
		
	}
	
	///需要在MainActivity的onCreate方法中调用
	public static void registerWith(FlutterEngine flutterEngine) {
		//通过 platformViewsController 来获取 Registry
		PlatformViewRegistry registry = flutterEngine.getPlatformViewsController().getRegistry();
		
		//通过工厂类 PlatformViewRegistry 注册Android原生View
		//参数一就是 设置标识
		//参数二就是 自定义的Android原生View
		registry.registerViewFactory("com.flutter_to_native_test_textview", new TestViewFactory());
	}
}