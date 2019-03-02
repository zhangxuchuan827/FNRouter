//
//  FNUrlRouter.m
//  financialNews
//
//  Created by 张绪川 on 2017/10/23.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "FNURLRouter.h"
#import "UIViewController+FNRouterInit.h"
#import "UINavigationController+FNRouterPush.h"

#pragma mark - 注册模型
@interface RegistionAction : NSObject<NSCopying>

@property (nonatomic,strong) NSString * actionName;
@property (nonatomic,copy) void(^callBack)(NSDictionary * param);

@property (nonatomic, strong) NSString * target;

@end
@implementation RegistionAction

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    RegistionAction * act = [RegistionAction new];
    act.actionName = self.actionName;
    act.callBack = self.callBack;
    return act;
}

@end

#pragma mark - URLRouter

@implementation FNURLRouter{
    NSMutableDictionary * _registorDict;
}

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
        _registorDict = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void)registerDefaultWebViewController:(NSString *)clsName{
    
    NSAssert(clsName, @"不能为空");
    if (clsName == nil || clsName.length == 0) {
#if DEBUG
        NSLog(@"FNURLRouter Error: 注册默认web浏览器失败");
#endif
        return;
    }
    _defaultWebViewControllerClassName = clsName;
}

#pragma mark - 注册函数

-(void)registerPage:(NSObject *)currentVC functionName:(NSString *)name action:(void (^)(NSDictionary *))callBack{
    if (name == nil || callBack == nil || name.length == 0 || currentVC == nil) {
#if DEBUG
        NSLog(@"FNURLRouter Error: 注册函数失败");
#endif
        return;
    }
    __weak NSObject * vc = currentVC;
    RegistionAction * act = [RegistionAction new];
    act.actionName = [NSString stringWithFormat:@"%lu%@",vc.hash,name];
    act.callBack = callBack;
    act.target = [NSString stringWithFormat:@"%lu",vc.hash];
    [_registorDict setObject:name forKey:act];
    
}
-(void)registerGlobalFunction:(NSString *)name action:(void (^)(NSDictionary *))callBack{
    if (name == nil || callBack == nil || name.length == 0) {
#if DEBUG
        NSLog(@"FNURLRouter Error: 注册函数失败");
#endif
        return;
    }
    RegistionAction * act = [RegistionAction new];
    act.actionName = name;
    act.callBack = callBack;
    act.target = @"global";
    
    [_registorDict setObject:name forKey:act];
}


-(void)removeFunction:(NSString *)name{
    if (name == nil) {
        NSAssert(name, @"FNURLRouter Error: 移除注册时，传入了空");
        return;
    }
    if (_registorDict.count > 0) {
        [_registorDict removeObjectForKey:name];
    }
}
-(void)removeCurrentPageFunctions:(NSObject *)currentVC {
    if (currentVC == nil) {
        NSAssert(currentVC, @"FNURLRouter Error: 移除注册时，传入了空");
        return;
    }
    __weak NSObject * vc = currentVC;
    NSString * prefix = [NSString stringWithFormat:@"%lu",vc.hash];
    for (NSString * key in _registorDict.allKeys) {
        if ([key hasPrefix:prefix]) {
            [_registorDict removeObjectForKey:key];
        }
    }
    
}

#pragma mark - 打开链接

///
-(BOOL)openUrl:(NSString *)url withNavigationController:(UINavigationController *)navController{
    
    return [self openUrl:url paramDictionary:nil withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:YES];
}

-(BOOL)openUrl:(NSString *)url withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    return [self openUrl:url paramDictionary:nil withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:animation];
    
}


///

-(BOOL)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withNavigationController:(UINavigationController *)navController{
    
    return [self openUrl:url paramDictionary:param withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:YES];
}

-(BOOL)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    return [self openUrl:url paramDictionary:param withVCName:_defaultWebViewControllerClassName withNavigationController:navController animation:animation];
    
}


///
-(BOOL)openUrl:(NSString *)url withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController{
    
    return [self openUrl:url paramDictionary:nil withVCName:vcName withNavigationController:navController animation:YES];
}

-(BOOL)openUrl:(NSString *)url withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    return [self openUrl:url paramDictionary:nil withVCName:vcName withNavigationController:navController animation:animation];
}



///
-(BOOL)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController{
    
    return [self openUrl:url paramDictionary:param withVCName:vcName withNavigationController:navController animation:YES];
}


-(BOOL)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController animation:(BOOL)animation{
    
    NSAssert(url, @"FNURLRouter ERROR:传入的URL不能为空");
    
    if (url == nil ) {
        return NO;
    }
    
    if ([url rangeOfString:@"[a-zA-z]+://[^\\s]*" options:NSRegularExpressionSearch].location == NSNotFound) {
#if DEBUG
        NSLog(@"FNURLRouter ERROR:URL格式不正确");
#endif
        return NO;
    }
    
    NSURL * targetURL = [[NSURL alloc] initWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
#if DEBUG
    NSLog(@"%@\n%@\n%@",targetURL.host,targetURL.baseURL,targetURL.path);
#endif
    if ([targetURL.scheme.lowercaseString isEqualToString:@"http"] || [targetURL.scheme.lowercaseString isEqualToString:@"https"]) {
        
        if (vcName) {
            [navController pushVC:vcName url:url paramDict:param animation:YES];
            return YES;
        }
        
//        if ([[UIApplication sharedApplication]canOpenURL:targetURL]) {
//            [[UIApplication sharedApplication]openURL:targetURL];
//            return NO;
//        }
//        NSLog(@"FNURLRouter ERROR:这里是系统浏览器也调用不起来URL-%@",url);
        return NO;
    }
    
    //判断是否是模块调用的连接
    NSString * realVCName = _moduleList[targetURL.host];
    
    if ([targetURL.scheme.lowercaseString isEqualToString:self.protocolPrefix] &&
        realVCName != nil && realVCName.length > 0) {
        
        NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithDictionary:param];
        [dict setValuesForKeysWithDictionary:[self parsedLinkParameters:targetURL.absoluteString] ];
        [navController pushVC:realVCName ParamDictionary:dict animation:YES];
        
        return YES;
    }
    
#if DEBUG
    
    UIAlertController * alt = [UIAlertController alertControllerWithTitle:@"跳转失败" message:[NSString stringWithFormat:@"无法跳转：%@",url] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAct = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];
    [alt addAction:okAct];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alt animated:YES completion:nil];
    
    NSLog(@"FNURLRouter ERROR:无法调用该URL-%@",url);
 #endif
    return NO;
}



-(void)openURLWithSystem:(NSString *)url{
    
    if (url == nil || [url isEqualToString:@""]) {
#if DEBUG
        NSLog(@"FNURLRouter ERROR:传入连接不能为空");
#endif
        return;
    }
    
    NSURL * targetURL = [[NSURL alloc] initWithString:url];
    
    if ([[UIApplication sharedApplication]canOpenURL:targetURL]) {
        [[UIApplication sharedApplication]openURL:targetURL];
    }
    
}


-(BOOL)isProtocolUrl:(NSString *)url{
    NSAssert(url, @"FNURLRouter ERROR:传入的URL不能为空");
    if (url == nil ) {
        return NO;
    }
    
    NSString * volidateString = [NSString stringWithFormat:@"%@+://[^\\s]*",self.protocolPrefix.lowercaseString];
    
    if ([url.lowercaseString rangeOfString:volidateString options:NSRegularExpressionSearch].location == NSNotFound) {
#if DEBUG
        NSLog(@"EFNURLRouter RROR:不是协议好的协议类型");
#endif
        return NO;
    }

    return YES;
}
-(BOOL)canOpenModule:(NSString *)url{
    
    if (![self isProtocolUrl:url]) {
        
        return NO;
    }
    
    NSURL * targetURL = [[NSURL alloc] initWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    //判断白名单中有没有该项
    NSString * realVCName = _moduleList[targetURL.host];
    
    return realVCName != nil ;
    
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
