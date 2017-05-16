//
//  BaseViewController.h
//  LogiinDemo
//
//  Created by JIng on 2016/10/29.
//  Copyright © 2016年 JIng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Toast.h"
#import "TopNavView.h"
#import "MyNavigationController.h"
#import "ViewHint.h"
#import "MBProgressHUD.h"
#import "Reachability.h"
@interface BaseViewController : UIViewController
{
    
    MBProgressHUD *_progressHUD;
    
@protected
    BOOL bShowTip;
}


@property (nonatomic, retain) ViewHint *viewHintSystem;

@property (nonatomic, retain) TopNavView *topNavView;
@property (nonatomic, retain)  UILabel   *isNetworkLabel;

/*  顶部导航键
 */
- (void)leftEvent;
- (void)configLeftBtn:(BOOL)show textNormal:(NSString *)textNormal textHighlighted:(NSString *)textHighlighted;
- (void)configLeftBtn:(BOOL)show imageNormal:(NSString *)imageNormal imageHighlighted:(NSString *)imageHighlighted;

- (void)rightEvent;
- (void)configRightBtn:(BOOL)show textNormal:(NSString *)textNormal textHighlighted:(NSString *)textHighlighted;
- (void)configRightBtn:(BOOL)show imageNormal:(NSString *)imageNormal imageHighlighted:(NSString *)imageHighlighted;

- (BOOL)isNetworkReachable;

/** 显示loading
 */
- (void)showProgress;
- (void)showProgress:(NSString *)text;
- (void)showProgress:(NSString *)text exit:(BOOL)exit;  // 是否自动退出

/** 影藏loading
 */
- (void)hideProgress;

/** 底部显示提示
 */
- (void)showBottomTip:(NSString *)tip;

/** 中间显示提示
 */
- (void)showCenterTip:(NSString *)tip;

- (void)showTip:(BOOL)show;


- (void)checkRetCode:(NSInteger)headRetCode str:(NSString *)msg;


- (void)toLogin;

- (void)setNavGestureEnable:(BOOL)enable;



- (void)releaseRootVC;


@end
