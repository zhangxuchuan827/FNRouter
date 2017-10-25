//
//  UINavigationController+FNRouterPush.h
//  financialNews
//
//  Created by 张绪川 on 2017/10/20.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+FNRouterInit.h"

@interface UINavigationController (FNRouterPush)

/**
 弹出视图控制器-0
 
 @param name 视图控制器名称
 @param animation 动画
 */
-(void)pushVC:(NSString *)name animation:(BOOL)animation;

-(void)pushVC:(NSString *)name ;

/**
 弹出视图控制器-1

 @param name 视图控制器名称
 @param param 参数字典
 @param animation 动画
 */
-(void)pushVC:(NSString *)name ParamDictionary:(NSDictionary*)param animation:(BOOL)animation;

-(void)pushVC:(NSString *)name ParamDictionary:(NSDictionary*)param;


/**
 弹出视图控制器-2

 @param name 视图控制器名称
 @param param 参数1
 @param animation 动画
 */
-(void)pushVC:(NSString *)name
        Param:(id)param
    animation:(BOOL)animation;

-(void)pushVC:(NSString *)name
        Param:(id)param;


/**
 弹出视图控制器-3

 @param name 视图控制器名称
 @param param1 参数1
 @param param2 参数2
 @param animation 动画
 */
-(void)pushVC:(NSString *)name
       Param1:(id)param1
       Param2:(id)param2
    animation:(BOOL)animation;

-(void)pushVC:(NSString *)name
        Param1:(id)param1
        Param2:(id)param2;


/**
 弹出视图控制器-4
 
 @param name 视图控制器名称
 @param url 连接
 @param param 参数
 @param animation 动画
 */
-(void)pushVC:(NSString *)name
          url:(NSString*)url
    paramDict:(NSDictionary*)param
    animation:(BOOL)animation;

-(void)pushVC:(NSString *)name
          url:(NSString*)url
    paramDict:(NSDictionary*)param ;

-(void)pushVC:(NSString *)name
          url:(NSString*)url
    animation:(BOOL)animation;

-(void)pushVC:(NSString *)name
          url:(NSString*)url;

@end
