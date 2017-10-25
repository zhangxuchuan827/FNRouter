//
//  FNUrlRouter.h
//  financialNews
//
//  Created by 张绪川 on 2017/10/23.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//
//  这个模块主要是面相URL混合调用
//  本模块应当约定好连接格式
//  暂定约定格式为协议应当约定好，并且不和第三方APP-Schemes冲突,host部分是调用模块的别名，(?)后边是参数参数之间用(&)分割
//  例如:FNR://indexVC?psize=1&pno=2
//


#import <Foundation/Foundation.h>


@interface FNURLRouter : NSObject


+(instancetype)shared;


/**
 模块别名对应表
 */
@property (nonatomic, strong, readonly) NSDictionary * moduleList;



/**
 约定好的协议名 e.p. (fnr://indexVC) 协议名就是fnr  [default : fnr]
 */
@property (nonatomic, strong) NSString * protocolPrefix;


/**
 用于打开http连接的控制器类型
 */
@property (nonatomic, strong, readonly) NSString * defaultWebViewControllerClassName;

/**
 注册webVC的类型，将用于打开http(s)连接
 建议重写-initWithUrl方法，或者直接调用FNUrlString属性

 @param clsName WebVC类型
 */
-(void)registerDefaultWebViewController:(NSString*)clsName;



/**
 打开一个URL，将自动匹配打开类型，通过push方式弹出
 
 @param url 连接
 @param navController 当前导航栏控制器
 @param animation 动画
 */
-(void)openUrl:(NSString *)url withNavigationController:(UINavigationController *)navController animation:(BOOL)animation;

-(void)openUrl:(NSString *)url withNavigationController:(UINavigationController *)navController;


/**
 打开一个URL，将自动匹配打开类型，若是http(s)类型，将通过vcName控制器打开,若vcName为空则不会打开

 @param url 连接
 @param vcName 打开http链接的控制器
 @param navController 当前导航栏控制器
 @param animation 动画
 */
-(void)openUrl:(NSString *)url withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController animation:(BOOL)animation;

-(void)openUrl:(NSString *)url withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController;


/**
 打开一个URL，将自动匹配打开类型，通过push方式弹出
 
 @param url 连接
 @param param 字典型参数
 @param navController 当前导航栏控制器
 @param animation 动画
 */
-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withNavigationController:(UINavigationController *)navController animation:(BOOL)animation;

-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withNavigationController:(UINavigationController *)navController;


/**
 调用系统浏览器打开连接

 @param url 连接
 */
-(void)openURLWithSystem:(NSString *)url;


@end
