//
//  BaseViewController.m
//  LogiinDemo
//
//  Created by JIng on 2016/10/29.
//  Copyright © 2016年 JIng. All rights reserved.
//

#import "BaseViewController.h"
#import "MyNavigationController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.view insertSubview:[UIView new] atIndex:0];
    
    self.view.backgroundColor = kColorBackground;
    
    _topNavView = [[TopNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 64)];
    [self.view addSubview:_topNavView];
    
    [_topNavView.leftNavBtn addTarget:self action:@selector(leftEvent) forControlEvents:UIControlEventTouchUpInside];
    [_topNavView.rightNavBtn addTarget:self action:@selector(rightEvent) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.navigationController.navigationBar setBarTintColor:COLOR_RGB(84, 194, 82)];      // 导航栏及状态栏颜色
    self.navigationController.navigationBar.tintColor = kColorStyle;       // 返回按钮那里的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18]}];     // 改变标题字体
    
    
    bShowTip = YES;
    
    
    //改变状态栏的颜色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
  
    _isNetworkLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, (KScreenHeight-14)/2, KScreenWidth, 14)];
    _isNetworkLabel.text=@"网络好像出现了问题,请检测网络设置";
    _isNetworkLabel.textAlignment=NSTextAlignmentCenter;
    _isNetworkLabel.font=[UIFont systemFontOfSize:12.f];
   
    [self.view addSubview:_isNetworkLabel];
    
    if (![self isNetworkReachable]) {
        
        
        [self showProgress:@"网络好像出现了问题"];
        
        
    }
    else{
        
        [_isNetworkLabel removeFromSuperview];
        
        
        
    }
}



//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleDefault;
//}

/**导航按钮事件
 */
- (void)leftEvent {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightEvent {
    
}

- (void)configLeftBtn:(BOOL)show textNormal:(NSString *)textNormal textHighlighted:(NSString *)textHighlighted {
    _topNavView.leftNavBtn.hidden = !show;
    if (textNormal && textNormal.length > 0) {
        [_topNavView.leftNavBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_topNavView.leftNavBtn setTitle:textNormal forState:UIControlStateNormal];
        [_topNavView.leftNavBtn setTitle:textNormal forState:UIControlStateDisabled];
    }
    if (textHighlighted && textHighlighted.length > 0) {
        [_topNavView.leftNavBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        [_topNavView.leftNavBtn setTitle:textNormal forState:UIControlStateHighlighted];
    }
    _topNavView.constantLeftBtnLeftMargin.constant = -10;
}

- (void)configLeftBtn:(BOOL)show imageNormal:(NSString *)imageNormal imageHighlighted:(NSString *)imageHighlighted {
    _topNavView.leftNavBtn.hidden = !show;
    if (imageNormal && imageNormal.length > 0) {
        [_topNavView.leftNavBtn setImage:[UIImage imageNamed:imageNormal] forState:UIControlStateNormal];
        [_topNavView.leftNavBtn setTitle:@"" forState:UIControlStateNormal];
    }
    if (imageHighlighted && imageHighlighted.length > 0) {
        [_topNavView.leftNavBtn setImage:[UIImage imageNamed:imageHighlighted] forState:UIControlStateSelected];
        [_topNavView.leftNavBtn setTitle:@"" forState:UIControlStateHighlighted];
    }
    _topNavView.constantLeftBtnLeftMargin.constant = -10;
}

- (void)configRightBtn:(BOOL)show textNormal:(NSString *)textNormal textHighlighted:(NSString *)textHighlighted {
    _topNavView.rightNavBtn.hidden = !show;
    if (textNormal && textNormal.length > 0) {
        [_topNavView.rightNavBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_topNavView.rightNavBtn setTitle:textNormal forState:UIControlStateNormal];
        [_topNavView.rightNavBtn setTitle:textNormal forState:UIControlStateDisabled];
    }
    if (textHighlighted && textHighlighted.length > 0) {
        [_topNavView.rightNavBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        [_topNavView.rightNavBtn setTitle:textNormal forState:UIControlStateHighlighted];
    }
    
    _topNavView.constantRightBtnRightMargin.constant = -10;
}
- (void)configRightBtn:(BOOL)show imageNormal:(NSString *)imageNormal imageHighlighted:(NSString *)imageHighlighted {
    _topNavView.rightNavBtn.hidden = !show;
    if (imageNormal && imageNormal.length > 0) {
        [_topNavView.rightNavBtn setImage:[UIImage imageNamed:imageNormal] forState:UIControlStateNormal];
        [_topNavView.rightNavBtn setTitle:@"" forState:UIControlStateNormal];
    }
    if (imageHighlighted && imageHighlighted.length > 0) {
        [_topNavView.rightNavBtn setImage:[UIImage imageNamed:imageHighlighted] forState:UIControlStateSelected];
        [_topNavView.rightNavBtn setTitle:@"" forState:UIControlStateHighlighted];
    }
    _topNavView.constantRightBtnRightMargin.constant = -10;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    bShowTip = YES;
     
    // 若为1级页面，不出现返回按钮
    if (self.navigationController.viewControllers.count == 1) {
        [self configLeftBtn:NO textNormal:nil textHighlighted:nil];
        
        
    }
    
   
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    bShowTip = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    bShowTip = NO;
    
    
}

/***
 * 此函数用来判断是否网络连接服务器正常
 * 需要导入Reachability类
 */
- (BOOL)isNetworkReachable {
    BOOL isExistenceNetwork = NO;
    Reachability *reachability = [Reachability reachabilityWithHostname:HostName];  // 测试服务器状态
    switch([reachability currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
        default:
            break;
    }
    return  isExistenceNetwork;
}






/** 中间显示提示
 */
- (void)showCenterTip:(NSString *)tip{
    if (bShowTip) {
        [Toast showWithText:tip duration:2];
    }
}

/** 显示提示
 */
- (void)showBottomTip:(NSString *)tip{
    if (bShowTip) {
        [Toast showWithText:tip bottomOffset:80 duration:2];
    }
}

- (void)tapHideProgress:(UITapGestureRecognizer *)tap{
    if (tap.state == UIGestureRecognizerStateEnded) {
        [self hideProgress];
    }
}

/** 显示loading
 */
- (void)showProgress{
    NSLog(@"showProgress");
    if (!_progressHUD) {
        _progressHUD = [[MBProgressHUD alloc] initWithView:self.view];
    }
    _progressHUD.labelText = @"加载中...";
    [self.view addSubview:_progressHUD];
    [_progressHUD show:YES];
//    [_progressHUD hide:YES afterDelay:5];
    
    
}




/** 显示loading
 */
- (void)showProgress:(NSString *)text{
   
    
    if (!_progressHUD) {
        _progressHUD = [[MBProgressHUD alloc] initWithView:self.view];
        
    }
    _progressHUD.labelText = (text == nil || [@"" isEqualToString:text]) ? @"加载中..." : text;
    [self.view addSubview:_progressHUD];
    [_progressHUD show:YES];
    [_progressHUD hide:YES afterDelay:5];
    
    
}

- (void)showProgress:(NSString *)text exit:(BOOL)exit{
    if (!_progressHUD) {
        _progressHUD = [[MBProgressHUD alloc] initWithView:self.view];
    }
    
    _progressHUD.labelText = (text == nil || [@"" isEqualToString:text]) ? @"加载中..." : text;
    [self.view addSubview:_progressHUD];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showProgress)];
    [_progressHUD addGestureRecognizer:tap];
    
    [_progressHUD show:YES];
    if (exit) {
            [_progressHUD hide:YES afterDelay:5];
    }
}

/** 隐藏loading
 */
- (void)hideProgress{
    
    NSLog(@"hideProgress");
    
   
    
    if (_progressHUD) {
        [_progressHUD hide:YES];
        [_progressHUD removeFromSuperview];
    }
    
}

/** 隐藏loading
 */
- (void)hideProgressWithNotify{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotifyHUDProgressHide object:nil];
    if (_progressHUD) {
        [_progressHUD hide:YES];
        [_progressHUD removeFromSuperview];
    }
}





- (void)showTip:(BOOL)show{
    bShowTip = show;
}


- (void)checkRetCode:(NSInteger)headRetCode
                 str:(NSString *)msg{
    
    [self hideProgress];
    switch (headRetCode) {
            
        case 101:
            [self toLogin];
            
            [self  showCenterTip:msg];
            break;
            
        default:
            
            [self  showCenterTip:msg];
            break;
            
            
            
    }
    
}

- (void)toLogin{
    
   
    LoginViewController  *ctrl = [[LoginViewController alloc] init];
    MyNavigationController *nav = [[MyNavigationController alloc] initWithRootViewController:ctrl];
    nav.navigationBarHidden = YES;
    nav.interactivePopGestureRecognizer.enabled = NO;
    
     [self releaseRootVC];
   
    
  
    ((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController = nav;
     
}

- (void)setNavGestureEnable:(BOOL)enable {
    MyNavigationController *nav = (MyNavigationController *)self.navigationController;
    if ([nav isKindOfClass:[MyNavigationController class]]) {
        nav.canDragBack = enable;
    }
}




- (void)releaseRootVC{
    // 释放内存
    MyNavigationController *navCurrent = (MyNavigationController *)((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController;
    if ([navCurrent isKindOfClass:[MyNavigationController class]]) {
        for (NSInteger i=0; i<navCurrent.viewControllers.count; i++) {
            UIViewController *c = navCurrent.viewControllers[i];
            c = nil;
        }
        navCurrent = nil;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
