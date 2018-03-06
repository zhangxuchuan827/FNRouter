//
//  FNRouter.h
//  financialNews
//
//  Created by 张绪川 on 2017/10/20.
//  Copyright © 2017年 NewsCenter. All rights reserved.
//

/**

 推荐文件结构：
|-ProjectDemo
    |-APPDelegate.h/m
    |-Modules(所有的业务模块)
    |-Resources、Tools、Libs(其他的资源插件静态库等)
    |-Models(存放工程中全部的模型文件)
        |-Models.h(将全部的模型文件在该头文件中添加引用)
    |-FNRouter
        |-FNRouter.h （在本文件中添加Models.h引用）
 
 备注：
     本插件遵循面向协议编程思想，增强各模块之间的独立性，高效解耦合。
     推荐以基础数据类型传递参数，但从实际出发具体业务中不使用Model将有可能降低开发效率和项目稳定性。
     所以建议将工程中所有的Model归类，统一做全局引用。传递参数时可传递模型数据
 
 注意：在业务逻辑中必须重写相关的初始化方法。具体参照代码标注。
 
*/


#ifndef FNRouter_h
#define FNRouter_h


#import <UIKit/UIKit.h>
#import "NSObject+FNRouterVCObject.h"
#import "UINavigationController+FNRouterPush.h"
#import "UIViewController+FNRouterInit.h"


#pragma mark - 下面部分写入控制器名称，建议加前缀或者后缀『 例如：FNR_XXXXXXXXXViewController 』
#pragma mark - 这部分也可以单独使用头文件，在本处添加引用即可

///
static NSString * FN_RootVC = @"ViewController";
///默认的web浏览页面
static NSString * FN_DefaultWebController = @"DefaultWebViewController";
///模块1
static NSString * FN_M1VC = @"M1ViewController";
///模块2
static NSString * FN_M2VC = @"M2ViewController";
///模块3
static NSString * FN_M3VC = @"M3ViewController";
///模块4
static NSString * FN_M4VC = @"M4ViewController";



#endif /* FNRouter_h */
