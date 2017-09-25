//
//  ViewController.m
//  YDNStimeButton
//
//  Created by 黄亚栋 on 2017/9/22.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import "ViewController.h"
#import "YDNStimeButton.h"
#import "ViewController2.h"

@interface ViewController ()


@property (nonatomic,strong)YDNStimeButton *timeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.timeBtn = [[YDNStimeButton alloc]initWithFrame:CGRectMake(100, 100, 150, 150) andTime:15 andTitle:@"再次获取验证码"];
//    self.timeBtn.title = @"再次获取验证码";//倒计时结束后的按钮文字
    [self.timeBtn setBackgroundColor:[UIColor orangeColor]];
    [self.timeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.timeBtn.titleLabel setFont:[UIFont systemFontOfSize:18.0f]];
    [self.timeBtn addTarget:self action:@selector(clickTimeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.timeBtn];
    
}

-(void)clickTimeBtn:(YDNStimeButton *)sender{
    
    /*
    if (加入判断 ？ YES : NO) {
        //开始倒计时
        [sender startTime];
        //添加其他UI操作
    }else{
        //不开始倒计时
        //添加其他UI操作
    }
     */
    
    [sender startTime];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [self.timeBtn endTime];
//    ViewController2 *vc = [[ViewController2 alloc]init];
//    vc.str = @"lkl";
//    [self.navigationController pushViewController:vc animated:YES];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
