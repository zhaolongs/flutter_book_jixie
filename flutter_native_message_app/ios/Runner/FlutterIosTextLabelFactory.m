//
//  FlutterIosTextLabelFactory.m
//  Runner
//
//  Created by  androidlongs on 2020/9/16.
//

//代码清单9-28
//ios/Runner/FlutterIosTextLabelFactory.m

#import "FlutterIosTextLabelFactory.h"
#import "FlutterIosTextLabel.h"

@implementation FlutterIosTextLabelFactory{
     NSObject<FlutterBinaryMessenger>*_messenger;
}

//设置参数的编码方式
-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

//用来创建 ios 原生view
- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    //args 为flutter 传过来的参数
    FlutterIosTextLabel *textLagel = [[FlutterIosTextLabel alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return textLagel;
}

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    //注册插件
    //注册 FlutterIosTextLabelFactory
    //com.flutter_to_native_test_textview 为flutter 调用此  textLabel 的标识
    [registrar registerViewFactory:[[FlutterIosTextLabelFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.flutter_to_native_test_textview"];
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}


@end

