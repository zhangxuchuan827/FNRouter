//
//  DefaultWebViewController.m
//  FNRouterDemo
//
//  Created by 张绪川 on 2017/12/17.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "DefaultWebViewController.h"
#import <WebKit/WebKit.h>

@interface DefaultWebViewController ()


@property (nonatomic,strong) WKWebView * webView;

@end

@implementation DefaultWebViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * url = self.FNUrlString;
    
    //建议在这里处理空url
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:_webView];
    
}



@end
