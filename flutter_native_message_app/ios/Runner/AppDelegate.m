
///代码清单9-8
#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "TestViewController.h"

#import "FlutterIosTextLabelFactory.h"

@implementation AppDelegate{
    FlutterMethodChannel* methodChannel;
    FlutterBasicMessageChannel* messageChannel;
    FlutterEventSink mEventSink;
    NSTimer* nsTime;
}


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 默认 需要保留
    [GeneratedPluginRegistrant registerWithRegistry:self];
    //FlutterMethodChannel 与 Flutter 之间的双向通信
    [self  methodChannelFunction];
    //FlutterBasicMessageChannel 与Flutter 之间的双向通信
    [self basicMessageChannelFunction];
    
    [self byteBufferFunctio];
    
    [self registerEventChannerl];
    
    [self registerUILable];
   
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
-(void) registerUILable{
    [FlutterIosTextLabelFactory registerWithRegistrar:[self registrarForPlugin:@"FlutterIosTextLabelPlugin"]];
       
}
-(void) methodChannelFunction{
    //获取当前的 ViewControlle
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    //创建 FlutterMethodChannel
    // flutter_and_native_101 是通信标识
    methodChannel = [FlutterMethodChannel
                     methodChannelWithName:@"flutter_and_native_101"
                     binaryMessenger:controller.binaryMessenger];
    
    __weak typeof(self) weakSelf = self;
    
    //设置监听
    [methodChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // Flutter传过来的方法名称
        NSString *method=call.method;
        // Flutter传过来的参数
        NSDictionary * arguments = call.arguments;
        
        [weakSelf methodCallMethod:method andWithArguments:arguments andWithResult:result];
    }];
    
}
//消息方法处理
-(void)methodCallMethod: (NSString*) method andWithArguments:(NSDictionary * ) arguments andWithResult: (FlutterResult) result{
    
    if ([method isEqualToString:@"test"]) {
        
        NSLog(@"flutter 调用到了 ios test");
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:@"result.success 返回给flutter的数据" forKey:@"message"];
        [dic setObject: [NSNumber numberWithInt:200] forKey:@"code"];
        //FlutterResult回调 发消息至 Flutter 中
        //此方法只能调用一次
        result(dic);
        
    }else  if ([method isEqualToString:@"test2"]) {
        //代码块9-10
        NSLog(@"flutter 调用到了 ios test2");
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:@" methodChannel  返回给flutter的数据" forKey:@"message"];
        [dic setObject: [NSNumber numberWithInt:200] forKey:@"code"];
        //通过此方法 可以主动向Flutter中发送消息
        //可以多次调用
        [methodChannel invokeMethod:@"test" arguments:dic];
    }else  if ([method isEqualToString:@"test3"]) {
        NSLog(@"flutter 调用到了 ios test3 打开一个新的页面 ");
        
    }
    
    
}
-(void) basicMessageChannelFunction{
    //获取当前的 controller
    FlutterViewController * controller
    = (FlutterViewController*)self.window.rootViewController;
    // 初始化定义
    // flutter_and_native_100 j
    messageChannel = [FlutterBasicMessageChannel
                      messageChannelWithName:@"flutter_and_native_100"
                      binaryMessenger:controller.binaryMessenger];
    
    __weak typeof(self) weakSelf = self;
    // 接收消息监听
    [messageChannel setMessageHandler:^(id message, FlutterReply callback) {
        [weakSelf basicMessageChannelCall:message andWithReply:callback];
    }];
}
//消息处理
-(void) basicMessageChannelCall:(id) message andWithReply:(FlutterReply )callback{
    NSString *method=message[@"method"];
    
    
    if ([method isEqualToString:@"test"]) {
        
        NSLog(@"flutter 调用到了 ios test");
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        [dic setObject:@"[messageChannel setMessageHandler:^(id message, FlutterReply callback)  返回给flutter的数据" forKey:@"message"];
        [dic setObject: [NSNumber numberWithInt:200] forKey:@"code"];
        
        
        callback(dic);
        
    }else  if ([method isEqualToString:@"test2"]) {
        NSLog(@"flutter 调用到了 ios test2");
        [self baseMessageSendFunction];
        
    }else  if ([method isEqualToString:@"test3"]) {
        FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
        NSLog(@"flutter 调用到了 ios test3 打开一个新的页面 ");
        TestViewController *testController = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
        [controller presentViewController:testController animated:YES completion:nil];
    }
}
///代码清单 9-16
///iOS中通过 BasicMessageChannel 通道向Flutter中发送消息
-(void)baseMessageSendFunction{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"这里是数据" forKey:@"message"];
    [dic setObject: [NSNumber numberWithInt:200] forKey:@"code"];
    
    //通过这个方法 iOS可以主动多次 向 Flutter 发送消息
    [messageChannel sendMessage:dic];
    
}



//代码清单 9-1-27
-(void) byteBufferFunctio{
    //获取当前的 controller
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    // 接受并解析来自Flutter端的消息
    [controller.binaryMessenger setMessageHandlerOnChannel:@"test" binaryMessageHandler:[self messageChannelBlock]];
}
//处理消息
- (void (^)(NSData * _Nullable, FlutterBinaryReply _Nonnull))messageChannelBlock {
    return ^(NSData * _Nullable message, FlutterBinaryReply  _Nonnull reply) {
        Float64 x;
        NSData *data8 = [message subdataWithRange:NSMakeRange(0, 8)];
        [data8 getBytes:&x length:sizeof(x)];
        
        int32_t n;
        NSData *data4 = [message subdataWithRange:NSMakeRange(8, 4)];
        [data4 getBytes:&n length:sizeof(n)];
        
        //输出 Received 1.141500 and 2341
        NSLog(@"Received %f and %d", x, n);
        reply(nil);
    };
}

//代码清单9-1-30
// 从 iOS 平台发送一个二进制消息
-(void) sendBufferFunctio{
    //获取当前的 controller
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    // 从 iOS端发送一个二进制消息
    NSMutableData *message = [NSMutableData dataWithCapacity:12];
    Float64 x = 1.09985;
    int32_t n = 23345;
    [message appendBytes:&x length:sizeof(x)];
    [message appendBytes:&n length:sizeof(n)];
    
    [controller.binaryMessenger sendOnChannel:@"foo"
                                      message:message
                                  binaryReply:^(NSData * _Nullable reply) {
        NSLog(@"Message sent, reply ignored");
    }];
}

//代码清单9-21 iOS中EventChannel基本使用
//EventChannel 通信
-(void)registerEventChannerl{
    //获取当前的 controller
    FlutterViewController* controller =
            (FlutterViewController*)self.window.rootViewController;
    //创建 EventChannel 通信
    FlutterEventChannel * eventChannel=[FlutterEventChannel
                                        eventChannelWithName:@"flutter_and_native_103"
                                        binaryMessenger:controller.binaryMessenger];
    //添加监听
    [eventChannel setStreamHandler:self];
}
//代码块9-1-36
//EventChannel 注册成功回调方法
#pragma mark - FlutterStreamHandler
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)eventSink{
    mEventSink = eventSink;
     NSLog(@"EventChannle 注册");
    //开启定时
    [self startTimer];
    return nil;
}
//EventChannel 取消回调方法
 #pragma mark - FlutterStreamHandler
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    NSLog(@"EventChannle 取消");
    mEventSink= nil;
    [self stopTimer];
    return nil;
}

//代码块9-1-37
// 启动定时器
-(void)startTimer{
    //NSTime的类方法创建一个定时器并且启动这个定时器
    //p1:每个多长时间调用定时器函数，以秒为单位
    //p2:表示实现这个定时器函数的对象
    //p3:定时器函数对象
    //p4:可以传入定时器函数中一个参数，无参数传入nil
    //p5:定时器是否重复操作YES表示重复，NO表示只完成一次函数调用
    nsTime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

-(void)updateTime:(NSTimer*) timer{
    NSLog(@"参数为：%@",timer.userInfo);
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

       NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];

    if(mEventSink!=nil){
        mEventSink([NSString stringWithFormat:@"定时执行 %@",timeSp]);
    }
}

// 停止定时器
-(void)stopTimer{
    [nsTime invalidate];
}
@end
