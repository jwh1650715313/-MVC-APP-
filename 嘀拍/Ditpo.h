//
//  Ditpo.h
//  嘀拍
//
//  Created by JIng on 2017/5/8.
//  Copyright © 2017年 JIng. All rights reserved.
//

#ifndef Ditpo_h
#define Ditpo_h



#import <UIKit/UIKit.h>
//#import "NSObject+Json.h"
//#import "NSString+Json.h"
#import "UIView+Additions.h"
#import "UIView+LayoutHelper.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "NSMutableDictionary+JSON.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "Date.h"
#import "MD5.h"
#import "NSData+AES.h"
#import "NSUserDefaultTools.h"
#import "CommonUtils.h"
//基类
#import "BaseViewController.h"
#import "AppDelegate.h"
#import "TabViewController.h"
#import "MyNavigationController.h"
#import "LoginViewController.h"



//接口网络请求



/**
 *  开发模式/生产模式打日志控制
 *
 *  @param fmt
 *  @param ...
 *
 *  @return
 */
#ifndef __OPTIMIZE__

#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define NSLog(...) {}

#endif



#pragma mark - Device
// iPhone4,4s：320*480，iPhone5,5s：320*568，iPhone6：375*667，iPhone6plus：414*736
// 获取设备的物理高度
#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)
// 获取设备的物理宽度
#define KScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define kScreen_Frame       (CGRectMake(0, 0 ,ScreenWidth,ScreenHeight))



// 主页面 Tab 高度
#define kTabBarHeight 49

#pragma mark - Color
// 从16进制得到颜色值 0x222222
#define kCyColorFromHexA(hex, a) [UIColor colorWithRed:(((hex & 0xff0000) >> 16) / 255.0f) green:(((hex & 0x00ff00) >> 8) / 255.0f) blue:((hex & 0x0000ff) / 255.0f) alpha:(a)]
#define kCyColorFromHex(hex) [UIColor colorWithRed:(((hex & 0xff0000) >> 16) / 255.0f) green:(((hex & 0x00ff00) >> 8) / 255.0f) blue:((hex & 0x0000ff) / 255.0f) alpha:(1.0f)]


#define kColorStyle kCyColorFromHex(0x3290e8)       // 主题颜色
#define kColorHintBackground kCyColorFromHex(0xff7c7c)       // 提示颜色
#define kColorBackground kCyColorFromHex(0xf7f7f7)       // 默认背景颜色

//颜色
#define COLOR_RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define COLOR_RGB(R, G, B) [UIColor colorWithRed:(R/255.0f) green:(G/255.0f) blue:(B/255.0f) alpha:1]
#define COLOR_N(INT) [UIColor colorWithRed:(INT/255.0f) green:(INT/255.0f) blue:(INT/255.0f) alpha:1]
#define COLOR_F(Float) [UIColor colorWithRed:(Float) green:(Float) blue:(Float) alpha:1]

#define ClearColor [UIColor clearColor]              //透明色
#define WhiteColor [UIColor whiteColor]              //白色
#define BlackColor [UIColor blackColor]              //黑色
#define GrayColor [UIColor grayColor]                //灰色
#define LightGrayColor [UIColor lightGrayColor]      //浅灰色
#define DarkGrayColor [UIColor darkGrayColor]        //深灰色
#define RedColor [UIColor redColor]
#define GreenColor [UIColor greenColor]              //绿色
#define TextColor [UIColor colorWithRed:(32/255.0f) green:(32/255.0f) blue:(32/255.0f) alpha:1]   //字体颜色

//当前版本
#define CURRENT_VERSION       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]//正式1.1.3


/***
 
 各种测试环境
 
 ***/
#define HostName  @"http://192.168.1.102:8081/gangwuapp" //张华






#define WEAKSELF typeof(self) __weak weakSelf = self;



//网络请求异常
#define HttpRequst_Error  @"请求异常，请重试!"
#define Requst_Error  [Toast showWithText:@"请求异常，请重试!" duration:2];
#define NetWord_Disconnect_View [Toast showWithText:@"网络不给力!" duration:2];
#define NetWord_Error_View [Toast showWithText:@"网络繁忙，请重试!" duration:2];

//网络请求常用到
#define checkRetCode_self  [self heckRetCode:[resultDic[@"code"] integerValue] str:error];
#define checkRetCode_view  [(BaseViewController *)[self viewController] checkRetCode:[resultDic[@"code"] integerValue] str:error];

#define defaultPageSize 10

//各种loading
#define showProgress_self [self showProgress];
#define showProgress_view [(BaseViewController *)[self viewController] showProgress];
#define hideProgress_self [self hideProgress];
#define hideProgress_view [(BaseViewController *)[self viewController] hideProgress];




//各种通知
#define kNotifyHUDProgressHide       @"kNotifyHUDProgressHide"



#endif /* Ditpo_h */
