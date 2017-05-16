//
//  WebViewController.m
//  云图互联
//
//  Created by JIng on 2016/11/5.
//  Copyright © 2016年 com.yuntumind. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.topNavView.titleLabel.text=_titleName;
    [self loadingLaoLuoWeiBoWebView:_url];
}


/** 初始化webview */
- (void)initWebView
{
    self.WebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64)];
    self.WebView.delegate = self;
    self.WebView.scrollView.delegate = self;
    self.WebView.backgroundColor = WhiteColor;
    self.WebView.scalesPageToFit = YES;
    
    
    [self.view addSubview:self.WebView];
    
    
}

/** 初始化 webView */
- (void)loadingLaoLuoWeiBoWebView:(NSString *)Strurl
{
    
    if (!self.WebView) {
        [self initWebView];
    }
   
    NSURL *url = [NSURL URLWithString:Strurl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.WebView loadRequest:request];
    
}


#pragma mark -webViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
   
    
      [self hideProgress];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  
    
    [self showProgress];
    
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self hideProgress];
    [self showCenterTip:@"加载错误"];
}


-(BOOL)hidesBottomBarWhenPushed {
    return YES;
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
