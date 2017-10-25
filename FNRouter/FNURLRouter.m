//
//  FNUrlRouter.m
//  financialNews
//
//  Created by 张绪川 on 2017/10/23.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "FNURLRouter.h"
#import "UIViewController+FNRouterInit.h"

@implementation FNURLRouter

static FNURLRouter * sharedObj = nil;

+(instancetype)shared{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObj = [[FNURLRouter alloc] init];
        
    });
    return sharedObj;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadModuleList];
    }
    return self;
}

-(void)registerDefaultWebViewController:(NSString *)clsName{
    
    NSAssert(clsName, @"不能为空");
    _defaultWebViewControllerClassName = clsName;
}

///
-(void)openUrl:(NSString *)url withNavigationController:(UINavigationController *)navController{
    
    [self openUrl:url paramDictionary:nil withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:YES];
}

-(void)openUrl:(NSString *)url withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    [self openUrl:url paramDictionary:nil withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:animation];
    
}


///

-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withNavigationController:(UINavigationController *)navController{
    
    [self openUrl:url paramDictionary:param withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:YES];
}

-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    [self openUrl:url paramDictionary:param withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:animation];
    
}


///
-(void)openUrl:(NSString *)url withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController{
    
    [self openUrl:url paramDictionary:nil withVCName:vcName withNavigationController:navController animation:YES];
}

-(void)openUrl:(NSString *)url withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    [self openUrl:url paramDictionary:nil withVCName:vcName withNavigationController:navController animation:animation];
}



///
-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController{
    
    [self openUrl:url paramDictionary:param withVCName:vcName withNavigationController:navController animation:YES];
}


-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    if (url == nil ) {
        
        NSLog(@"ERROR:传入的URL不能为空");
        return;
    }
    
    if ([url rangeOfString:@"[a-zA-z]+://[^\\s]*" options:NSRegularExpressionSearch].location == NSNotFound) {
        
        NSLog(@"ERROR：URL格式不正确");
        return;
    }
    
    NSURL * targetURL = [[NSURL alloc] initWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    if ([targetURL.scheme.lowercaseString isEqualToString:@"http"] || [targetURL.scheme.lowercaseString isEqualToString:@"https"]) {
        
        if (vcName) {
            
            [navController pushVC:vcName url:url paramDict:param animation:YES];
            
            return;
        }
        
        if ([[UIApplication sharedApplication]canOpenURL:targetURL]) {
            
            [[UIApplication sharedApplication]openURL:targetURL];
            
            return;
        }
        
        NSLog(@"ERROR:这里是系统浏览器也调用不起来URL-%@",url);
        return;
    }
    
    //判断是否是模块调用的连接
    NSString * realVCName = _moduleList[targetURL.host];
    
    if ([targetURL.scheme.lowercaseString isEqualToString:self.protocolPrefix] &&
        realVCName != nil) {
        
        NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithDictionary:param];
        
        [dict setValuesForKeysWithDictionary:[self parsedLinkParameters:targetURL.absoluteString] ];
        
        
        [navController pushVC:realVCName ParamDictionary:dict animation:YES];
        
        return;
    }
    
#if DEBUG
    
    UIAlertController * alt = [UIAlertController alertControllerWithTitle:@"跳转失败" message:[NSString stringWithFormat:@"无法跳转：%@",url] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * okAct = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];
    
    [alt addAction:okAct];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alt animated:YES completion:nil];
    
#endif
    
    NSLog(@"ERROR:无法调用该URL-%@",url);
}



-(void)openURLWithSystem:(NSString *)url{
    
    if (url == nil || [url isEqualToString:@""]) {
        NSLog(@"ERROR:传入连接不能为空");
        return;
    }
    
    NSURL * targetURL = [[NSURL alloc] initWithString:url];
    
    if ([[UIApplication sharedApplication]canOpenURL:targetURL]) {
        
        [[UIApplication sharedApplication]openURL:targetURL];
    }
    
}

#pragma mark - 解析参数

-(NSDictionary *)parsedLinkParameters:(NSString*)paramStr{
    
    NSURLComponents* comp =  [NSURLComponents componentsWithString:paramStr];
    
    NSMutableDictionary* queryItemDict = [NSMutableDictionary dictionary];
    
    for (NSURLQueryItem* item in comp.queryItems) {
        
        [queryItemDict setObject:item.value forKey:item.name];
    }
    
    return queryItemDict;
}

#pragma mark - 加载模块列表

/**
 构思：
 默认加载Bundle中的plist。若在联网的情况下，请求网络，下载新的plist。启动时若新的plist存在则加载新的plist
 */
-(void)loadModuleList{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"FNRModuleList" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    _moduleList = dict;
}



#pragma mark - 懒加载

-(NSString *)protocolPrefix{
    
    if (!_protocolPrefix) {
        
        _protocolPrefix = @"fnr";
        
    }
    
    return _protocolPrefix;
    
}

@end
