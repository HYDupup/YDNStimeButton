//
//  YDNStimeButton.m
//  YDNStimeButton
//
//  Created by 黄亚栋 on 2017/9/22.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import "YDNStimeButton.h"

@interface YDNStimeButton()

@property (nonatomic , strong)dispatch_source_t timer;



@end

@implementation YDNStimeButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        //默认时长
        self.time = 60;
        //默认倒计时结束之后的文字
        self.title = @"";
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame andTime:(int)time andTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        
        //默认时长
        self.time = time;
        //默认倒计时结束之后的文字
        self.title = title;
    }
    return self;
}


//开始计时
-(void)startTime
{
    
    if (self.time > 0) {
        __block int timeout = self.time-1; //倒计时时间
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
        dispatch_source_set_event_handler(_timer, ^{
            if(timeout <= 0){ //倒计时结束，关闭
                dispatch_source_cancel(_timer);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.userInteractionEnabled = YES;
                    [self setTitle:self.title forState:UIControlStateNormal];
                });
            }else{
                int seconds = timeout % self.time;
                __block NSString *strTime = [NSString stringWithFormat:@"%ds", seconds];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.userInteractionEnabled = NO;
                    [self setTitle:strTime forState:UIControlStateNormal];
                });
                timeout--;
            }
        });
        dispatch_resume(_timer);
    }
}

//停止计时
-(void)endTime{
    dispatch_source_cancel(_timer);
    self.userInteractionEnabled = YES;
    [self setTitle:self.title forState:UIControlStateNormal];
    self.titleLabel.alpha = 1;
}



@end
