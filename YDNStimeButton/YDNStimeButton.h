//
//  YDNStimeButton.h
//  YDNStimeButton
//
//  Created by 黄亚栋 on 2017/9/22.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDNStimeButton : UIButton

/*
 倒计时总时长
 */
@property (nonatomic,assign)int time;

/*
 倒计时结束之后的文字
 */
@property (nonatomic,copy)NSString *title;


/*
 构造方法   time:倒计时总时长  title:倒计时结束之后的文字
 */
-(instancetype)initWithFrame:(CGRect)frame andTime:(int)time andTitle:(NSString *)title;

//开始计时
-(void)startTime;

//停止计时
-(void)endTime;

@end
