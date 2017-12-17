//
//  ViewController.m
//  FNRouterDemo
//
//  Created by 张绪川 on 2017/10/26.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"rootVC";
    
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [btn setTitle:@"模块1" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goMd1) forControlEvents:UIControlEventTouchUpInside];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    
    UIButton * btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [btn2 setTitle:@"模块2" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(goMd2) forControlEvents:UIControlEventTouchUpInside];
    btn2.center = CGPointMake(btn.center.x, btn.center.y+60);
    [self.view addSubview:btn2];
    
    UIButton * btn3=  [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [btn3 setTitle:@"打开网页[模块跳转]" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(goWebMd) forControlEvents:UIControlEventTouchUpInside];
    btn3.center = CGPointMake(btn2.center.x, btn2.center.y + 60);
    [self.view addSubview:btn3];
    
    UIButton * btn4= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [btn4 setTitle:@"打开网页[url跳转]" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(goWeb2) forControlEvents:UIControlEventTouchUpInside];
    btn4.center = CGPointMake(btn3.center.x, btn3.center.y + 60);
    [self.view addSubview:btn4];
    
    UIButton * btn5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [btn5 setTitle:@"url方式打开模块2" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(goWeb3) forControlEvents:UIControlEventTouchUpInside];
    btn5.center = CGPointMake(btn4.center.x, btn4.center.y + 60);
    [self.view addSubview:btn5];
    
}


-(void)goMd1{
    
    [self.navigationController pushVC:FN_M1VC];
    
}

-(void)goMd2{
    
    [self.navigationController pushVC:FN_M2VC ParamDictionary:@{FNTitleKey:@"模块2-来自rootVC"}];
    
}

-(void)goWebMd{
    
    [self.navigationController pushVC:FN_DefaultWebController url:@"http://m.baidu.com"];
}

-(void)goWeb2{
    
    [[FNURLRouter shared] openUrl:@"http://m.baidu.com" withNavigationController:self.navigationController];
    
}

-(void)goWeb3{
    
    [[FNURLRouter shared] openUrl:@"fnr://M2?title=模块2-来自url模式" withNavigationController:self.navigationController];
    
}

@end
