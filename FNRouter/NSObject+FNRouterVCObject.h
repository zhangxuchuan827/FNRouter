//
//  NSObject+FNRouterVCObject.h
//  financialNews
//
//  Created by 张绪川 on 2017/10/20.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+FNRouterInit.h"

@interface NSObject (FNRouterVCObject)


/**
 通过控制器名称获取实例对象

 @param name 控制器名称
 @return 实例
 */
-(UIViewController*)getInstanceByViewControllerName:(NSString *)name;

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParamDictionary:(NSDictionary *)param;

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam:(id)param;

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam1:(id)param1 Param2:(id)param2;



@end
