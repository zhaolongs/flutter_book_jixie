//
//  FlutterIosTextLabel.m
//  Runner
//
//  Created by  androidlongs on 2020/9/16.
//

//代码清单9-25 创建 UILabel
//ios/Runner/FlutterIosTextLabel.h

#import "FlutterIosTextLabel.h"

@implementation FlutterIosTextLabel{
    //FlutterIosTextLabel 创建后的标识
    int64_t _viewId;
    UILabel * _uiLabel;
    //消息回调
    FlutterMethodChannel* _channel;
}

//在这里只是创建了一个UILabel
-(instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        if (frame.size.width==0) {
            frame=CGRectMake(frame.origin.x, frame.origin.y, [UIScreen mainScreen].bounds.size.width, 22);
        }
        _uiLabel =[[UILabel alloc] initWithFrame:frame];
        _uiLabel.textColor=[UIColor redColor];
        _uiLabel.text=@"ios 原生 uilabel ";
        _uiLabel.font=[UIFont systemFontOfSize:14];
        _uiLabel.textAlignment=NSTextAlignmentCenter;
        _uiLabel.backgroundColor=[UIColor grayColor];
        
        //返回的HTML文本 <font color = 'red'></font>
        NSString *str = @"正确的追求犹如永远指向光明的<font color = 'red'>指南针</font>，帮助我们加大马力，驶向前方;正确的追求就像我们额上熏黑的矿灯，照亮我们前行的道路;正确的追求就是我们成功的入场卷，<font color = 'red'>越早的订票，就有越好座位</font>。都说我们是花样年华，充满生机和活力，那就赶快行动起来，找到自己人生的追求，共同打开成功的大门吧!";
        NSString *HTMLString = [NSString stringWithFormat:@"<html><body>%@</body></html>", str ];
        

        NSDictionary *options = @{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                                  NSCharacterEncodingDocumentAttribute : @(NSUTF8StringEncoding)
                                  };
        NSData *data = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];   // 调整行间距
        paragraphStyle.lineSpacing = 8.0;
        paragraphStyle.alignment = NSTextAlignmentJustified;
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString.length)];
        
      
        _uiLabel.backgroundColor = [UIColor cyanColor];
        _uiLabel.numberOfLines = 0;
        _uiLabel.attributedText = attributedString;
        [_uiLabel sizeToFit];
      

        
        _viewId = viewId;
    
    }
    return self;
    
}



- (nonnull UIView *)view {
    return _uiLabel;
}

@end
