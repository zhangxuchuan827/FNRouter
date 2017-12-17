//
//  M2ViewController.m
//  FNRouterDemo
//
//  Created by 张绪川 on 2017/12/17.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "M2ViewController.h"

@interface M2ViewController ()

@end

@implementation M2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.FNPageParameter[FNTitleKey];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
