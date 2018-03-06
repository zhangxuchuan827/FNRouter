# FNRoute

这是一个简单高效的路由插件


备注：本插件遵循面向协议编程思想，增强各模块之间的独立性，高效解耦合。
推荐以基础数据类型传递参数，但从实际出发具体业务中不使用Model将有可能降低开发效率和项目稳定性。所以建议将工程中所有的Model归类，统一做全局引用。传递参数时可传递模型数据



## 解决什么问题


1.Native模块动态调用

2.URL调用Native模块


## 适用场景


1.滚动展示图，一些调用Web页面一些调用内部模块

2.动态的菜单列表

3.Hybrid应用，H5调用Native模块

4.模块间的跳转

![](./img/taobao.png)


## 文件介绍


```
FNRouter
  |-FNRouter.h
  |-NSObject+FNRouterVCObject.h/m
  |-UINavigationController+FNRouterPush.h/m
  |-UIViewController+FNRouterInit.h/m
  |-FNURLRouter.h/m
  |-FNRModuleList.plist

```
```
>>> FNRouter.h
第一部分是相关引用。若工程中有很多跨模块引用的模型，可以在这里添加引用声明
第二部分是控制器别名声明。主要是防止调用期间写错，所以在这里用变量给控制器起别名。建议加前缀和原控制器名区别开。


>>> FNURLRouter.h/m
URL调用Native相关解析和跳转逻辑


>>> NSObject+FNRouterVCObject.h/m
通过名称获取控制器实例相关方法

>>> UINavigationController+FNRouterPush.h/m
push操作相关方法

>>> UIViewController+FNRouterInit.h/m
UIViewController相关初始化方法，有些方法需要重写，具体看文件注释


>>> FNRModuleList.plist
这个很重要，这里是别名和真实VC类名的对应表。通过URL调起Native模块必须在这里边做声明。URL中的模块名也是这里声明的别名

```


## 使用方法




## 初始化

```
引入头文件

->   #import "FNRouter.h"

    //若不使用URL解析则可忽略下边步骤
    
->   #import "FNURLRouter.h"

///若使用FNURLRouter则需在APPDelegate中注册一个全局默认的WebController

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FNURLRouter shared] registerWebViewController:@"FNWebViewController"];
}


///修改协议名，默认fnr
[FNURLRouter shared].protocolPrefix = @"XXXXX";


```

###  1.URL解析跳转


注意：

<1>协议名。先要在FNURLRouter.h中约定好链接的协议名 默认：fnr

<2>链接格式。对于调用内部的链接有严格的格式要求 

<3>白名单。(FNRModuleList.plist)  url模式跳转必须将别名和VC名对应写到白名单中,否则将调用失败

![](./img/url.jpg)


```
-(void)openUrl:(NSString *)url withNavigationController:(UINavigationController *)navController;
-(void)openUrl:(NSString *)url withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController;
-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withNavigationController:(UINavigationController *)navController;
-(void)openUrl:(NSString *)url paramDictionary:(NSDictionary *)param withVCName:(NSString *)vcName withNavigationController:(UINavigationController *)navController;

e.p.

[[FNURLRouter shared] openUrl:@"http://m.baidu.com" withNavigationController:self.navigationController];
[[FNURLRouter shared] openUrl:@"fnr://NewsDetail?pno=0&psize=1" withNavigationController:self.navigationController];

```

###  2.页面跳转


```
-(void)pushVC:(NSString *)name ;
-(void)pushVC:(NSString *)name Param:(id)param;
-(void)pushVC:(NSString *)name Para1:(id)param1 Param:(id)param2;
-(void)pushVC:(NSString *)name url:(NSString*)url;


e.p.
[self.navigationController pushVC:FNR_FNNewsDetailViewController ParamDictionary:@{@"contentId":@10001} ];

```

###  3.获取一个控制器实例

```
-(UIViewController*)getInstanceByViewControllerName:(NSString *)name;
-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParamDictionary:(NSDictionary *)param;

-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam:(id)param;
-(UIViewController*)getInstanceByViewControllerName:(NSString *)name withParam1:(id)param1 Param2:(id)param2;

e.p.

UIViewController * vc = [self getInstanceByViewControllerName:FNR_FNNewsListViewController];
```



## 注意

在业务逻辑中必须重写相关的初始化方法。具体参照代码标注。

```
使用时需要重写的方法：
UIViewController+FNRouterInit.m

-(instancetype)initWithParam:(id)param;
-(instancetype)initWithParam1:(id)param1 Param2:(id)param2;


```




## Apache License 2.0




