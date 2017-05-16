//
//  WebViewController.h
//  云图互联
//
//  Created by JIng on 2016/11/5.
//  Copyright © 2016年 com.yuntumind. All rights reserved.
//

#import "BaseViewController.h"

@interface WebViewController : BaseViewController



@property(nonatomic,copy)NSString  *url;

@property(nonatomic,copy)NSString  *titleName;
@property (nonatomic, strong) UIWebView *WebView;




@end
