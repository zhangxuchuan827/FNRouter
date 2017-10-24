//
//  NSObject+FNRouterVCObject.m
//  financialNews
//
//  Created by 张绪川 on 2017/10/20.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "NSObject+FNRouterVCObject.h"

@implementation NSObject (FNRouterVCObject)

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] init];
    
    return vc;
    
}


-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParamDictionary:(NSDictionary *)param{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] initWithParamDictionary:param];
    
    return vc;
}

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam:(id)param{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] initWithParam:param];
    
    return vc;
}

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam1:(id)param1 Param2:(id)param2{
    
    NSAssert(name, @"控制器名称不能为nil");
    
    Class vcClass = NSClassFromString(name);
    
    NSAssert(vcClass, @"无法链接到该控制器");
    
    UIViewController * vc = [[vcClass alloc] initWithParam1:param1 Param2:param2];
    
    return vc;
}


@end
