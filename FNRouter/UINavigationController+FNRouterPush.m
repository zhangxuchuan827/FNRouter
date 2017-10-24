//
//  UINavigationController+FNRouterPush.m
//  financialNews
//
//  Created by 张绪川 on 2017/10/20.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "UINavigationController+FNRouterPush.h"

@implementation UINavigationController (FNRouterPush)


-(void)pushVC:(NSString *)name animation:(BOOL)animation{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] init];
    
    [self pushViewController:vc animated:animation];
    
}

-(void)pushVC:(NSString *)name{
    
    [self pushVC:name animation:YES];
}

-(void)pushVC:(NSString *)name ParamDictionary:(NSDictionary *)param animation:(BOOL)animation{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] initWithParamDictionary:param];
    
    [self pushViewController:vc animated:animation];
    
}

-(void)pushVC:(NSString *)name ParamDictionary:(NSDictionary*)param{
    
    [self pushVC:name ParamDictionary:param animation:YES];
}

-(void)pushVC:(NSString *)name Param:(id)param animation:(BOOL)animation{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] initWithParam:param];
    
    [self pushViewController:vc animated:animation];
    
}

-(void)pushVC:(NSString *)name Param:(id)param{
    
    [self pushVC:name Param:param];
}

-(void)pushVC:(NSString *)name Para1:(id)param1 Param:(id)param2 animation:(BOOL)animation{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] initWithParam1:param1 Param2:param2];
    
    [self pushViewController:vc animated:animation];
}

-(void)pushVC:(NSString *)name Para1:(id)param1 Param:(id)param2{
    
    [self pushVC:name Para1:param1 Param:param2 animation:YES];
    
}

-(void)pushVC:(NSString *)name url:(NSString*)url animation:(BOOL)animation{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] initWithURLString:url];
    
    [self pushViewController:vc animated:animation];
    
}

-(void)pushVC:(NSString *)name url:(NSString*)url{
    
    [self pushVC:name url:url animation:YES];
}

@end
