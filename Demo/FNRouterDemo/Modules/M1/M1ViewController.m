//
//  M1ViewController.m
//  FNRouterDemo
//
//  Created by 张绪川 on 2017/12/17.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "M1ViewController.h"


@interface M1ViewController ()

@end

@implementation M1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"模块1";
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 60)];
    button.center = self.view.center;
    [button setTitle:@"打开模块2" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

-(void)buttonClicked:(UIButton *)btn{
    
    //直接弹出新页面
    [self.navigationController pushVC:FN_M2VC];
    
}

@end
