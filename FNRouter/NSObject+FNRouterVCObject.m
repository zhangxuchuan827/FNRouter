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
#endif
    
    if(vcClass){
        
        return [[vcClass alloc] init];
        
    }else{
        
        return [UIViewController new];
    }

    
}


-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParamDictionary:(NSDictionary *)param{
    
    Class vcClass = NSClassFromString(name);
    
#if DEBUG
    NSAssert(vcClass, @"无法链接到该控制器");
#endif
    
    if(vcClass){
        
        return  [[vcClass alloc] initWithParamDictionary:param];
        
    }else{
        
        return [UIViewController new];
    }
}

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam:(id)param{
    
    Class vcClass = NSClassFromString(name);
    
#if DEBUG
    NSAssert(vcClass, @"无法链接到该控制器");
#endif
    
    if(vcClass){
        
        return [[vcClass alloc] initWithParam:param];
        
    }else{
        
        return [UIViewController new];
    }

}

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam1:(id)param1 Param2:(id)param2{
    
    
    Class vcClass = NSClassFromString(name);
    
#if DEBUG
    NSAssert(vcClass, @"无法链接到该控制器");
#endif
    
    if (vcClass) {
        
        return [[vcClass alloc] initWithParam1:param1 Param2:param2];
    }else{
        
        return [UIViewController new];
    }

}


@end
