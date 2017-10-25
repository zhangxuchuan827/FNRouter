//
//  UIViewController+FNRouterInit.m
//  financialNews
//
//  Created by 张绪川 on 2017/10/20.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import "UIViewController+FNRouterInit.h"
#import <objc/objc.h>

const char * FNPageParameterKey = "FNPageParameterKey";
const char * FNUrlStirngKey = "FNUrlStirngKey";

@implementation UIViewController (FNRouterInit)


-(instancetype)initWithParamDictionary:(NSDictionary *)param{
    
    self = [self init];
    if (self) {
        
        self.FNPageParameter = param;

    }
    return self;
}

-(instancetype)initWithParam:(id)param{
    
#if DEBUG
    NSAssert(0, @"必须重写该方法");
#endif
    
    return [self init];
}

-(instancetype)initWithParam1:(id)param1 Param2:(id)param2{
    
#if DEBUG
    NSAssert(0, @"必须重写该方法");
#endif
    
    return [self init];
}



-(instancetype)initWithURLString:(NSString*)url paramDictionary:(NSDictionary *)param{
    
    self = [self init];
    
    if (self) {
        
        self.FNUrlString = url;
        self.FNPageParameter = param;
    }
    
    return self;
}


-(NSDictionary *)FNPageParameter{
    
    return objc_getAssociatedObject(self, FNPageParameterKey);
}

-(void)setFNPageParameter:(NSDictionary *)FNPageParameter{
    
    objc_setAssociatedObject(self, FNPageParameterKey, FNPageParameter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)FNUrlString{
    
    return objc_getAssociatedObject(self, FNUrlStirngKey);
}

-(void)setFNUrlString:(NSString *)FNUrlString{
    
    objc_setAssociatedObject(self, FNUrlStirngKey, FNUrlString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}




@end
