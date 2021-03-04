//
//  FlutterIosTextLabelFactory.h
//  Runner
//
//  Created by  androidlongs on 2020/9/16.
//

//代码清单9-27
//ios/Runner/FlutterIosTextLabelFactory.h
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface FlutterIosTextLabelFactory : NSObject<FlutterPlatformViewFactory>

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messager;

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar ;
@end

NS_ASSUME_NONNULL_END

