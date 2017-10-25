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

    Class vcClass = NSClassFromString(name);
    
#if DEBUG
    NSAssert(vcClass, @"无法链接到该控制器");
#else
    return [[UIViewController alloc] init];;
    
#endif
    
    UIViewController * vc = [[vcClass alloc] init];
    
    return vc;
    
}


-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParamDictionary:(NSDictionary *)param{
    
    Class vcClass = NSClassFromString(name);
    
#if DEBUG
    NSAssert(vcClass, @"无法链接到该控制器");
#else
    return [[UIViewController alloc] init];;
    
#endif
    
    UIViewController * vc = [[vcClass alloc] initWithParamDictionary:param];
    
    return vc;
}

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam:(id)param{
    
    Class vcClass = NSClassFromString(name);
    
#if DEBUG
    NSAssert(vcClass, @"无法链接到该控制器");
#else
    return [[UIViewController alloc] init];;
    
#endif
    
    UIViewController * vc = [[vcClass alloc] initWithParam:param];
    
    return vc;
}

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam1:(id)param1 Param2:(id)param2{
    
    
    Class vcClass = NSClassFromString(name);
    
#if DEBUG
    NSAssert(vcClass, @"无法链接到该控制器");
#else
    return [[UIViewController alloc] init];
    
#endif
    
    UIViewController * vc = [[vcClass alloc] initWithParam1:param1 Param2:param2];
    
    return vc;
}


@end
