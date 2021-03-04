

//代码清单9-1-4
//app/src/main/java/com/studyyoun/flutter_native_message_app/MainActivity.java
package com.studyyoun.flutter_native_message_app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.BatteryManager;
import android.os.Bundle;
import android.os.Handler;
import android.widget.Toast;

import androidx.annotation.Nullable;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;

//代码清单9-2-43
/**
 * 如果条件允许可以修改主项目的 MainActivity 对象，
 * 将继承的 FlutterActivity 从 io.flutter.app.FlutterActivity
 * 替换为 io.flutter.embedding.android.FlutterActivity，之后 插件就可以自动注册；
 * 如果条件不允许不继承 FlutterActivity 的需要自己手动调用
 */
public class MainActivity extends FlutterActivity {
	//消息通道
	private MethodChannel mMethodChannel;
	//上下文对象
	private Context mContext;
	private Handler mHandler = new Handler();
	private BroadcastReceiver mChargingStateChangeReceiver;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		mContext = this;
		//注册监听 MethodChannel
		registerChannelFunction();
		//注册监听 BasicMessageChannel
		registerMessageChannelFunction();
		
		//测试byteBuffer
		byteBufferFunction();
		//EventChannel 通信
		registerEventChannerl();
		
		
		
		//这是我们新创建的插件
		TestViewFactory.registerWith(getFlutterEngine());
	}
	
	
	//代码清单9-18
	// Android 中 EventChannel 向 Flutter 发送消息
	//EventChannel 通信
	private  EventChannel.EventSink mEventSink;
	
	///需要在 MainActivity的OnCreate方法中调用
	private void registerEventChannerl() {
		///获取当前默认的 BinaryMessenger
		BinaryMessenger lBinaryMessenger = getFlutterEngine()
				.getDartExecutor()
				.getBinaryMessenger();
		//消息通道名称
		String channelName = "flutter_and_native_103";
		//创建 EventChannel 通道
		EventChannel lEventChannel = new EventChannel(lBinaryMessenger, channelName);
		//设置 StreamHandler
		lEventChannel.setStreamHandler(new EventChannel.StreamHandler() {
			// onListen 回调则代表通道已经建好，可以发送数据了
			@Override
			public void onListen(Object o, EventChannel.EventSink eventSink) {
				//注意是通过 EventSink 发送消息
				mEventSink = eventSink;
				startTimer();
//				eventSendMessageFunction();
//
//				mChargingStateChangeReceiver = createChargingStateChangeReceiver(mEventSink);
//				registerReceiver(
//						mChargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
			}
			/// onCancel 表示 Flutter 端已取消接收消息
			@Override
			public void onCancel(Object o) {
				mEventSink = null;
				stopTimer();
//				unregisterReceiver(mChargingStateChangeReceiver);
//				mChargingStateChangeReceiver = null;
			}
		});
	}
	//代码清单9-1-19
	//使用 EventChannel 通道向 Flutter发送消息
	//这里发送的消息为 String 类型
	//可以根据实际项目开发中发送 其他数据类型
	private void eventSendMessageFunction(String messsage){
		if (mEventSink != null) {
			mEventSink.success(messsage);
		}else{
			Log.e("ERROR","EventSink is null");
		}
	}
	
	//代码清单9-1-40
	//定时器
	private Timer mTimer;
	
	//开始计时
	private void startTimer(){
		mTimer= new Timer();
		//异步任务
		//W/System.err: java.lang.RuntimeException: Methods marked with @UiThread must be executed on the main thread. Current thread: Timer-0
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				try {
					//主线程回调
					mHandler.post(new Runnable() {
						@Override
						public void run() {
							eventSendMessageFunction(System.currentTimeMillis()+"");
						}
					});
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
		//启动任务 延时 1.2秒，每1秒执行一次
		mTimer.schedule(task,1200,1000);
	}
	///取消定时任务
	private void stopTimer(){
		mTimer.cancel();;
	}
	
	
	
	
	
	///测试使用
	private BroadcastReceiver createChargingStateChangeReceiver(final EventChannel.EventSink events) {
		return new BroadcastReceiver() {
			@Override
			public void onReceive(Context context, Intent intent) {
				int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
				
				if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
					events.error("UNAVAILABLE", "电池不可使用", null);
				} else {
					boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
							status == BatteryManager.BATTERY_STATUS_FULL;
					int batteryLevel = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, 0);
					String str = "电池电量 "+batteryLevel+"%" +"  刷新时间  "+System.currentTimeMillis();
					
					events.success(str);
				}
			}
		};
	}
	
	//代码清单 9-1-26
	private void byteBufferFunction(){
		///获取当前默认的 BinaryMessenger
		BinaryMessenger lBinaryMessenger = getFlutterEngine()
				.getDartExecutor()
				.getBinaryMessenger();
		/// ByteBuffer(这里的参数 message ) 是最常用的缓冲区
		/// 这里使用Java8 lambda表达式
		lBinaryMessenger.setMessageHandler("test", (message, reply) -> {
			///字节序可以用order方法来取得和设置
			//ByteOrder BIG_ENDIAN       代表大字节序的ByteOrder。
			//ByteOrder LITTLE_ENDIAN       代表小字节序的ByteOrder。
			//ByteOrder nativeOrder()       返回当前硬件平台的字节序。
			message.order(ByteOrder.nativeOrder());
			//获取数据
			double lDouble = message.getDouble();
			int lInt = message.getInt();
			
			Log.e("Buffer","lDouble  "+lDouble);
			Log.e("Buffer","lInt  "+lInt);
			reply.reply(null);
		});
	}
	
	//代码清单9-1-29
	// 从 Android 端发送一个二进制消息
	private void sendByteBufferFunction() {
		///获取当前默认的 BinaryMessenger
		BinaryMessenger lBinaryMessenger = getFlutterEngine()
				.getDartExecutor()
				.getBinaryMessenger();
		
		// 从 Android 端发送一个二进制消息
		ByteBuffer message = ByteBuffer.allocateDirect(12);
		message.putDouble(1.215);
		message.putInt(4563);
		
		lBinaryMessenger.send("test", message, new BinaryMessenger.BinaryReply() {
			@Override
			public void reply(@Nullable ByteBuffer reply) {
				///回执消息
			}
		});
		
	}
	
	//代码清单9-5 MethodChannel 设置监听
	//记着要在 onCreat方法中调用
	private void registerChannelFunction() {
		//A single Flutter execution environment
		//Flutter运行环境参数封装类
		FlutterEngine lFlutterEngine = getFlutterEngine();
		if (lFlutterEngine == null) {
			Log.e("ERROR", "注册消息通道失败 FlutterEngine = null");
			return;
		}
		//获取Dart缓存编译对象
		DartExecutor lDartExecutor = lFlutterEngine.getDartExecutor();
		//获取默认的 BinaryMessenger
		BinaryMessenger lBinaryMessenger = lDartExecutor.getBinaryMessenger();
		//消息通道名称
		String channelName = "flutter_and_native_101";
		//构建消息通道
		mMethodChannel = new MethodChannel(lBinaryMessenger, channelName);
		//设置监听 这里使用的是匿名内部类的方式
		mMethodChannel.setMethodCallHandler(
				getMethodCallHandler()
		);
	}
	
	//代码清单9-6 MethodCallHandler 中获取数据
	private MethodChannel.MethodCallHandler getMethodCallHandler() {
		return new MethodChannel.MethodCallHandler() {
			@Override
			public void onMethodCall(MethodCall call, MethodChannel.Result result) {
				//获取方法名称
				String lMethod = call.method;
				//获取参数
				Object lArguments = call.arguments;
				Map<String, Object> arguments = null;
				if (lArguments != null) {
					arguments = (Map<String, Object>) lArguments;
				}
				//处理消息
				methodCallFunction(result, lMethod, arguments);
			}
		};
	}
	
	/**
	 * 代码清单9-7
	 * 处理 Flutter 发送过来的消息
	 *
	 * @param result    回调 Flutter 的对象
	 * @param method    Flutter 传递的方法名称
	 * @param arguments Flutter 传递的参数
	 */
	private void methodCallFunction(MethodChannel.Result result,
									String method,
									Map<String, Object> arguments) {
		if (method.equals("test")) {
			String name = "";
			
			if (arguments != null) {
				name = arguments.get("name").toString();
			}
			
			Toast.makeText(mContext, "flutter 调用到了 android test name is " + name, Toast.LENGTH_SHORT).show();
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("message", "result.success 返回给flutter的数据");
			resultMap.put("code", 200);
			//发消息至 Flutter
			//此方法只能使用一次
			result.success(resultMap);
			
		} else if (method.equals("test2")) {
			//代码块9-9
			Toast.makeText(mContext, "flutter 调用到了 android test2", Toast.LENGTH_SHORT).show();
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("message", "android 主动调用 flutter test 方法");
			resultMap.put("code", 200);
			//主动向Flutter 中发送消息
			mMethodChannel.invokeMethod("test", resultMap);
			//延迟2秒再主动向 Flutter 中发送消息
			mHandler.postDelayed(new Runnable() {
				@Override
				public void run() {
					Map<String, Object> resultMap2 = new HashMap<>();
					resultMap2.put("message", "android 主动调用 flutter test 方法");
					resultMap2.put("code", 200);
					mMethodChannel.invokeMethod("test2", resultMap2);
				}
			}, 2000);
			
			
		} else if (method.equals("test3")) {
			//测试通过Flutter打开Android Activity
			Toast.makeText(mContext, "flutter 调用到了 android test3", Toast.LENGTH_SHORT).show();
//							Intent lIntent = new Intent(MainActivity.this, TestMethodChannelActivity.class);
//							MainActivity.this.startActivity(lIntent);
		} else {
			result.notImplemented();
		}
	}
	
	///代码清单9-1-13
	///代码清单9-13 Android 原生中通过 BasicMessageChannel 处理消息
	///BasicMessageChannel实际对象
	private BasicMessageChannel<Object> mMessageChannel;
	///这个方法需要在 onCreate 方法中调用
	private void registerMessageChannelFunction() {
		
		///获取 BinaryMessenger
		BinaryMessenger lBinaryMessenger = getFlutterEngine()
				.getDartExecutor()
				.getBinaryMessenger();
		//消息接收监听
		//BasicMessageChannel （主要是传递字符串和一些半结构体的数据）
		//创建通
		mMessageChannel = new BasicMessageChannel<Object>(
				lBinaryMessenger,
				"flutter_and_native_100",
				StandardMessageCodec.INSTANCE);
		// 接收消息监听
		// 监听参数 handlerArgument 就是 Flutter中传过来的消息
		// 参数 reply就是BasicMessageChannel.Reply<Object> 类型
		mMessageChannel.setMessageHandler((handlerArgument, reply) -> {
			///获取传递的参数
			Map<String, Object> arguments = (Map<String, Object>) handlerArgument;
			///消息处理
			try {
				baseMessageChannelCallFunction(reply, arguments);
			} catch (Exception e) {
				e.printStackTrace();
				///异常回调
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("message", "操作异常 "+e.getMessage());
				resultMap.put("code", 500);
				//回调 此方法只能使用一次
				reply.reply(resultMap);
			}
			
		});
		
	}
	///处理参数
	private void baseMessageChannelCallFunction(
			BasicMessageChannel.Reply<Object> reply,
			Map<String, Object> arguments) {
		//处理参数
		//方法名标识
		String lMethod = (String) arguments.get("method");
		
		//测试 reply.reply()方法 发消息给Flutter
		if (lMethod.equals("test")) {
			Toast.makeText(mContext, "flutter 调用到了 android test", Toast.LENGTH_SHORT).show();
			//回调Flutter
			Map<String, Object> resultMap = new HashMap<>();
			resultMap.put("message", "reply.reply 返回给flutter的数据");
			resultMap.put("code", 200);
			
			//回调 此方法只能使用一次
			reply.reply(resultMap);
			
		} else if (lMethod.equals("test2")) {
			messageChannelSendFunction();
		} else if (lMethod.equals("test3")) {
			//测试通过Flutter打开Android Activity
			
		}
	}
	///代码清单9-14 Android中 BasicMessageChannel 向Flutter中主动发送消息
	private void messageChannelSendFunction() {
	
		//构建参数
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "ABCSD");
		resultMap.put("code", 200);
		
		//向 Flutter 中发送消息
		//参数 二可以再次接收到 Flutter 中的回调
		//也可以直接使用 mMessageChannel.send(resultMap）
		mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
			@Override
			public void reply(Object o) {
				///再次接收到的回执消息
				Log.d("mMessageChannel", "mMessageChannel send 回调 " + o);
			}
		});
	}
	
	
}
