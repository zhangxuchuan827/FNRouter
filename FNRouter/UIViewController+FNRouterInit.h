//
//  UIViewController+FNRouterInit.h
//  financialNews
//
//  Created by 张绪川 on 2017/10/20.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FNRouterInit)


/**
 路由跳转传递的参数
 */
@property (nonatomic, strong) NSDictionary * FNPageParameter;

/**
 路由跳转传递的连接
 */
@property (nonatomic, copy) NSString * FNUrlString;




/**
 路由跳转初始化方法0【传输字典参数】
 
 @param param 参数字典
 @return self
 */
-(instancetype)initWithParamDictionary:(NSDictionary *)param;

/**
 路由跳转初始化方法1 【使用必须重写该方法】
 
 @param param 参数1
 @return self
 */
-(instancetype)initWithParam:(id)param;

/**
 路由跳转初始化方法2 【使用必须重写该方法】
 
 @param param1 参数1
 @param param2 参数2
 @return self
 */
-(instancetype)initWithParam1:(id)param1 Param2:(id)param2;


/**
 路由跳转网页控制器初始化方法【建议项目内WebController使用】
 
 @param url 网页url
 @return self
 */
-(instancetype)initWithURLString:(NSString*)url paramDictionary:(NSDictionary *)param;





@end
