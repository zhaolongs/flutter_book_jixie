//
//  FlutterIosTextLabel.h
//  Runner
//
//  Created by  androidlongs on 2020/9/16.
//


//代码清单9-25 iOS中 创建UILabel
#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

//实现协议FlutterPlatformView
@interface FlutterIosTextLabel :  NSObject<FlutterPlatformView>

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                 binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END
